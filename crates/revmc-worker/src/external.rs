use std::{
    num::NonZeroUsize,
    sync::{Arc, LockResult, RwLock},
};

use crate::{
    error::ExtError,
    worker::{aot_store_path, CompileWorker, SledDB},
};
use alloy_primitives::B256;
use lru::LruCache;
use once_cell::sync::OnceCell;
use revm_primitives::SpecId;
use revmc::EvmCompilerFn;

pub(crate) static SLED_DB: OnceCell<Arc<RwLock<SledDB<B256>>>> = OnceCell::new();

#[derive(Debug)]
pub struct EXTCompileWorker {
    compile_worker: Box<CompileWorker>,

    pub cache: RwLock<LruCache<String, (EvmCompilerFn, libloading::Library)>>,
}

impl EXTCompileWorker {
    pub fn new(threshold: u64, max_concurrent_tasks: usize) -> Self {
        let sled_db = SLED_DB.get_or_init(|| Arc::new(RwLock::new(SledDB::init())));
        let compiler = CompileWorker::new(threshold, Arc::clone(sled_db), max_concurrent_tasks);
        Self {
            compile_worker: Box::new(compiler),
            cache: RwLock::new(LruCache::new(NonZeroUsize::new(128).unwrap())),
        }
    }

    pub fn get_function(&mut self, code_hash: B256) -> Result<Option<EvmCompilerFn>, ExtError> {
        if code_hash.is_zero() {
            return Ok(None);
        }

        let label = code_hash.to_string();
        {
            let mut cache_write = match self.cache.write() {
                LockResult::Ok(guard) => guard,
                LockResult::Err(err) => return Err(ExtError::RwLockError { err: err.to_string() }),
            };

            if let Some((f, _)) = cache_write.get(&label) {
                return Ok(Some(*f));
            }
        }

        let so_file = aot_store_path().join(&label).join("a.so");
        let exist: bool = so_file.try_exists().unwrap_or(false);
        if exist {
            {
                let lib = (unsafe { libloading::Library::new(&so_file) })
                    .map_err(|err| ExtError::LibLoadingError { err: err.to_string() })?;
                let f: EvmCompilerFn = unsafe {
                    *lib.get(code_hash.to_string().as_ref())
                        .map_err(|err| ExtError::GetSymbolError { err: err.to_string() })?
                };

                let mut cache_write = match self.cache.write() {
                    LockResult::Ok(guard) => guard,
                    LockResult::Err(err) => {
                        return Err(ExtError::RwLockError { err: err.to_string() })
                    }
                };

                cache_write.put(label.to_string(), (f, lib));

                if let Some((f, _)) = cache_write.get(&label) {
                    return Ok(Some(*f));
                } else {
                    return Err(ExtError::LruCacheGetError);
                };
            };
        }

        Ok(None)
    }

    pub fn work(&mut self, spec_id: SpecId, code_hash: B256, bytecode: revm::primitives::Bytes) {
        self.compile_worker.work(spec_id, code_hash, bytecode);
    }
}
