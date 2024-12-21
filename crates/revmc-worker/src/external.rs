use std::{
    fmt::Debug,
    num::NonZeroUsize,
    sync::{Arc, RwLock},
};

use crate::{
    error::ExtError,
    worker::{aot_store_path, CompileWorker, SledDB},
};
use alloy_primitives::B256;
use lru::LruCache;
use once_cell::sync::OnceCell;
use revm::Database;
use revm_primitives::{AccessListItem, SpecId};
use revmc::EvmCompilerFn;

pub(crate) static SLED_DB: OnceCell<Arc<RwLock<SledDB<B256>>>> = OnceCell::new();

#[derive(Debug)]
pub struct EXTCompileWorker<DB> {
    compile_worker: Box<CompileWorker>,
    pub cache: LruCache<String, (EvmCompilerFn, libloading::Library)>,
    _marker: std::marker::PhantomData<DB>,
}

impl<DB> EXTCompileWorker<DB> {
    pub fn new(threshold: u64, max_concurrent_tasks: usize, cache_size_words: usize) -> Self {
        let sled_db = SLED_DB.get_or_init(|| Arc::new(RwLock::new(SledDB::init())));
        let compiler = CompileWorker::new(threshold, Arc::clone(sled_db), max_concurrent_tasks);

        Self {
            compile_worker: Box::new(compiler),
            cache: LruCache::new(NonZeroUsize::new(cache_size_words).unwrap()),
            _marker: std::marker::PhantomData,
        }
    }

    pub fn get_function(&mut self, code_hash: B256) -> Result<Option<EvmCompilerFn>, ExtError> {
        if code_hash.is_zero() {
            return Ok(None);
        }

        let label = code_hash.to_string();
        if let Some((f, _)) = self.cache.get(&label) {
            return Ok(Some(*f));
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

                self.cache.put(label.to_string(), (f, lib));

                if let Some((f, _)) = self.cache.get(&label) {
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

    pub fn cache_initialize(
        &mut self,
        access_list: Vec<AccessListItem>,
        mut state_db: DB,
        spec_id: SpecId,
    ) where
        DB: Database,
        <DB as revm::Database>::Error: Debug,
    {
        for access_item in access_list.iter() {
            // TODO: Error handling
            let acc_info = state_db.basic(access_item.address).unwrap().unwrap();
            let code = state_db.code_by_hash(acc_info.code_hash()).unwrap();
            let code_hash = code.hash_slow();

            if let Some(f) = self.cache.get(&code_hash.to_string()) {
                // Already in cache
                continue;
            }

            self.work(spec_id, code_hash, code.bytecode().clone());
        }
    }
}
