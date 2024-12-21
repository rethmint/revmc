use revm::db::EmptyDB;
use revm_primitives::{AccessList, AccessListItem, Address, Bytecode, Bytes, B256};

use crate::EXTCompileWorker;

fn setup_test_cache<DB>(ext_worker: &mut EXTCompileWorker<DB>, bytecode: Bytecode) {
    let code_hash = bytecode.hash_slow();

    ext_worker.work(revm_primitives::SpecId::OSAKA, code_hash, bytecode.bytes());
    std::thread::sleep(std::time::Duration::from_secs(5));

    assert_eq!(ext_worker.get_function(code_hash).unwrap().is_some(), true);
}

#[test]
fn test_compiler_cache_retrieval() {
    let mut ext_worker = EXTCompileWorker::<EmptyDB>::new(1, 3, 128);
    let bytecode = Bytecode::new_raw(Bytes::from_static(&[1, 2, 3]));

    setup_test_cache(&mut ext_worker, bytecode);
}

#[test]
fn test_compiler_cache_load_access_list() {
    let mut ext_worker = EXTCompileWorker::<EmptyDB>::new(1, 3, 128);
    let bytecode = Bytecode::new_raw(Bytes::from_static(&[1, 2, 3]));

    setup_test_cache(&mut ext_worker, bytecode);

    let list = AccessList(vec![
        AccessListItem { address: Address::ZERO, storage_keys: vec![B256::ZERO] },
        AccessListItem { address: Address::ZERO, storage_keys: vec![B256::ZERO] },
    ]);

    let _ = ext_worker.cache_load_access_list(list.to_vec(), EmptyDB::new());
}
