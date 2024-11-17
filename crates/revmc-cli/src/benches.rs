use revmc::{interpreter::opcode as op, primitives::hex, U256};
use std::hint::black_box;

macro_rules! include_code_str {
    ($path:literal) => {
        crate::read_code_string(
            include_bytes!($path),
            std::path::Path::new($path).extension().and_then(|s| s.to_str()),
        )
    };
}

#[derive(Clone, Debug, Default)]
pub struct Bench {
    pub name: &'static str,
    pub bytecode: Vec<u8>,
    pub calldata: Vec<u8>,
    pub stack_input: Vec<U256>,
    pub native: Option<fn()>,
}

pub fn get_bench(name: &str) -> Option<Bench> {
    get_benches().into_iter().find(|b| b.name == name)
}

pub fn get_benches() -> Vec<Bench> {
    vec![
        Bench {
            name: "fibonacci",
            bytecode: FIBONACCI.to_vec(),
            stack_input: vec![U256::from(69)],
            native: Some(|| {
                black_box(fibonacci_rust(black_box(U256::from(70))));
            }),
            ..Default::default()
        },
        // https://github.com/lambdaclass/evm_mlir/blob/b766d0bbc2093bbfa4feb3aa25baf82b512aee74/bench/revm_comparison/src/lib.rs#L12-L15
        // https://blog.lambdaclass.com/evm-performance-boosts-with-mlir/
        // > We chose 1000 as N
        Bench {
            name: "fibonacci-calldata",
            bytecode: hex!(
                "5f355f60015b8215601a578181019150909160019003916005565b9150505f5260205ff3"
            )
            .to_vec(),
            calldata: U256::from(1000).to_be_bytes_vec(),
            ..Default::default()
        },
        Bench {
            name: "test",
            bytecode: hex!(
                "60806040526004361061003e575f3560e01c806306661abd14610042578063ac7fde5f1461006c578063cfcc3abe146100a8578063e8927fbc146100d2575b5f80fd5b34801561004d575f80fd5b506100566100dc565b6040516100639190610173565b60405180910390f35b348015610077575f80fd5b50610092600480360381019061008d91906101cd565b6100e1565b60405161009f9190610210565b60405180910390f35b3480156100b3575f80fd5b506100bc6100f5565b6040516100c99190610268565b60405180910390f35b6100da6100fc565b005b5f5481565b5f8167ffffffffffffffff16409050919050565b5f33905090565b5f8081548092919061010d906102ae565b91905055507f61996fe196f72cb598c483e896a1221263a28bb630480aa89495f737d4a8e3df60015f5461014191906102f5565b5f54604051610151929190610328565b60405180910390a1565b5f819050919050565b61016d8161015b565b82525050565b5f6020820190506101865f830184610164565b92915050565b5f80fd5b5f67ffffffffffffffff82169050919050565b6101ac81610190565b81146101b6575f80fd5b50565b5f813590506101c7816101a3565b92915050565b5f602082840312156101e2576101e161018c565b5b5f6101ef848285016101b9565b91505092915050565b5f819050919050565b61020a816101f8565b82525050565b5f6020820190506102235f830184610201565b92915050565b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f61025282610229565b9050919050565b61026281610248565b82525050565b5f60208201905061027b5f830184610259565b92915050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52601160045260245ffd5b5f6102b88261015b565b91507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff82036102ea576102e9610281565b5b600182019050919050565b5f6102ff8261015b565b915061030a8361015b565b925082820390508181111561032257610321610281565b5b92915050565b5f60408201905061033b5f830185610164565b6103486020830184610164565b939250505056fea26469706673582212202ecea4fbe4d1125bfc7f2c1491ee058895544c456ae8484ec2db22fb78dc9d1e64736f6c63430008190033000000000000000000000000000000000000000000000000000000000000000000"
            )
            .to_vec(),
            ..Default::default()
        },
        Bench {
            name: "factorial",
            bytecode: hex!(
                "5f355f60015b8215601b57906001018091029160019003916005565b9150505f5260205ff3"
            )
            .to_vec(),
            calldata: U256::from(1000).to_be_bytes_vec(),
            ..Default::default()
        },
        Bench {
            name: "counter",
            bytecode: include_code_str!("../../../data/counter.rt.hex").unwrap(),
            // `increment()`
            calldata: hex!("d09de08a").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "counter-eof",
            bytecode: include_code_str!("../../../data/counter-eof.rt.hex").unwrap(),
            // `increment()`
            calldata: hex!("d09de08a").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "snailtracer",
            bytecode: include_code_str!("../../../data/snailtracer.rt.hex").unwrap(),
            // `Benchmark()`
            calldata: hex!("30627b7c").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "snailtracer-eof",
            bytecode: include_code_str!("../../../data/snailtracer-eof.rt.hex").unwrap(),
            // `Benchmark()`
            calldata: hex!("30627b7c").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "weth",
            bytecode: include_code_str!("../../../data/weth.rt.hex").unwrap(),
            ..Default::default()
        },
        Bench {
            name: "hash_10k",
            bytecode: include_code_str!("../../../data/hash_10k.rt.hex").unwrap(),
            // `Benchmark()`
            calldata: hex!("30627b7c").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "hash_10k-eof",
            bytecode: include_code_str!("../../../data/hash_10k-eof.rt.hex").unwrap(),
            // `Benchmark()`
            calldata: hex!("30627b7c").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "erc20_transfer",
            bytecode: include_code_str!("../../../data/erc20_transfer.rt.hex").unwrap(),
            // `Benchmark()`
            calldata: hex!("30627b7c").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "push0_proxy",
            bytecode: include_code_str!("../../../data/push0_proxy.rt.hex").unwrap(),
            ..Default::default()
        },
        Bench {
            name: "usdc_proxy",
            bytecode: include_code_str!("../../../data/usdc_proxy.rt.hex").unwrap(),
            ..Default::default()
        },
        Bench {
            name: "fiat_token",
            bytecode: include_code_str!("../../../data/fiat_token.rt.hex").unwrap(),
            ..Default::default()
        },
        Bench {
            name: "uniswap_v2_pair",
            bytecode: include_code_str!("../../../data/uniswap_v2_pair.rt.hex").unwrap(),
            ..Default::default()
        },
        Bench {
            name: "seaport",
            bytecode: include_code_str!("../../../data/seaport.rt.hex").unwrap(),
            ..Default::default()
        },
        Bench {
            name: "airdrop",
            bytecode: include_code_str!("../../../data/airdrop.rt.hex").unwrap(),
            // `paused()`
            calldata: hex!("5c975abb").to_vec(),
            ..Default::default()
        },
        Bench {
            name: "bswap64",
            bytecode: include_code_str!("../../../data/bswap64.rt.hex").unwrap(),
            // `to_little_endian_64(uint64 = 0x0102)` returns (bytes)
            calldata: hex!(
                "ff2f79f10000000000000000000000000000000000000000000000000000000000000102"
            )
            .to_vec(),
            ..Default::default()
        },
        Bench {
            name: "bswap64_opt",
            bytecode: include_code_str!("../../../data/bswap64_opt.rt.hex").unwrap(),
            // `to_little_endian_64(uint64 = 0x0102)` returns (bytes)
            calldata: hex!(
                "ff2f79f10000000000000000000000000000000000000000000000000000000000000102"
            )
            .to_vec(),
            ..Default::default()
        },
    ]
}

#[rustfmt::skip]
const FIBONACCI: &[u8] = &[
    // input to the program (which fib number we want)
    // op::PUSH2, input[0], input[1],
    op::JUMPDEST, op::JUMPDEST, op::JUMPDEST,

    // 1st/2nd fib number
    op::PUSH1, 0,
    op::PUSH1, 1,
    // 7

    // MAINLOOP:
    op::JUMPDEST,
    op::DUP3,
    op::ISZERO,
    op::PUSH1, 28, // cleanup
    op::JUMPI,

    // fib step
    op::DUP2,
    op::DUP2,
    op::ADD,
    op::SWAP2,
    op::POP,
    op::SWAP1,
    // 19

    // decrement fib step counter
    op::SWAP2,
    op::PUSH1, 1,
    op::SWAP1,
    op::SUB,
    op::SWAP2,
    op::PUSH1, 7, // goto MAINLOOP
    op::JUMP,
    // 28

    // CLEANUP:
    op::JUMPDEST,
    op::SWAP2,
    op::POP,
    op::POP,
    // done: requested fib number is the only element on the stack!
    op::STOP,
];

/// Literal translation of the `FIBONACCI` EVM bytecode to Rust.
pub fn fibonacci_rust(mut i: U256) -> U256 {
    let mut a = U256::from(0);
    let mut b = U256::from(1);
    while i != U256::ZERO {
        let tmp = a;
        a = b;
        b = b.wrapping_add(tmp);
        i -= U256::from(1);
    }
    a
}

#[test]
fn test_fibonacci_rust() {
    revm::primitives::uint! {
        assert_eq!(fibonacci_rust(0_U256), 0_U256);
        assert_eq!(fibonacci_rust(1_U256), 1_U256);
        assert_eq!(fibonacci_rust(2_U256), 1_U256);
        assert_eq!(fibonacci_rust(3_U256), 2_U256);
        assert_eq!(fibonacci_rust(4_U256), 3_U256);
        assert_eq!(fibonacci_rust(5_U256), 5_U256);
        assert_eq!(fibonacci_rust(6_U256), 8_U256);
        assert_eq!(fibonacci_rust(7_U256), 13_U256);
        assert_eq!(fibonacci_rust(8_U256), 21_U256);
        assert_eq!(fibonacci_rust(9_U256), 34_U256);
        assert_eq!(fibonacci_rust(10_U256), 55_U256);
        assert_eq!(fibonacci_rust(100_U256), 354224848179261915075_U256);
        assert_eq!(fibonacci_rust(1000_U256), 0x2e3510283c1d60b00930b7e8803c312b4c8e6d5286805fc70b594dc75cc0604b_U256);
    }
}
