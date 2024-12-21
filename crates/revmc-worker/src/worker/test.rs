use revm_primitives::{Bytecode, Bytes};

use crate::EXTCompileWorker;

#[test]
pub(crate) fn test_compiler_cache_retrieval() {
    let mut ext_worker = EXTCompileWorker::new(1, 3, 128);
    let bytecode = Bytecode::new_raw(Bytes::from_static(&[1, 2, 3]));
    let code_hash = bytecode.hash_slow();

    ext_worker.work(revm_primitives::SpecId::OSAKA, code_hash, bytecode.bytes());
    std::thread::sleep(std::time::Duration::from_secs(5));

    assert_eq!(ext_worker.get_function(code_hash).unwrap().is_some(), true);
}
