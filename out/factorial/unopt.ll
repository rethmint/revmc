; ModuleID = 'factorial'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define i8 @factorial(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %len.addr = alloca i64, align 8
  br label %entry.post

entry.post:                                       ; preds = %entry
  store i64 0, ptr %len.addr, align 8
  br label %OP0.PUSH0

resume:                                           ; No predecessors!
  unreachable

unreachable:                                      ; No predecessors!
  unreachable

OP0.PUSH0:                                        ; preds = %entry.post
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %0 = sub i64 %gas.remaining, 10
  %1 = icmp ult i64 %gas.remaining, 10
  store i64 %0, ptr %gas.remaining.addr, align 8
  br i1 %1, label %return, label %OP0.PUSH0.contd, !prof !2, !annotation !3

OP0.PUSH0.contd:                                  ; preds = %OP0.PUSH0
  %stack_len = load i64, ptr %len.addr, align 8
  %2 = icmp ugt i64 %stack_len, 1021
  br i1 %2, label %return, label %OP0.PUSH0.contd1, !prof !2, !annotation !4

OP0.PUSH0.contd1:                                 ; preds = %OP0.PUSH0.contd
  %3 = add i64 %stack_len, 1
  store i64 %3, ptr %len.addr, align 8
  %sp = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len
  store i256 0, ptr %sp, align 16
  br label %OP1.CALLDATALOAD, !annotation !5

OP1.CALLDATALOAD:                                 ; preds = %OP0.PUSH0.contd1
  %stack_len2 = load i64, ptr %len.addr, align 8
  %4 = add i64 %stack_len2, -1
  %sp3 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %4
  %a = load i256, ptr %sp3, align 16
  %5 = call i256 @__revmc_ir_builtin_calldataload(i256 %a, ptr %arg.contract.addr)
  %6 = add i64 %stack_len2, -1
  %sp4 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %6
  store i256 %5, ptr %sp4, align 16
  br label %OP2.PUSH0, !annotation !5

OP2.PUSH0:                                        ; preds = %OP1.CALLDATALOAD
  %stack_len5 = load i64, ptr %len.addr, align 8
  %7 = add i64 %stack_len5, 1
  store i64 %7, ptr %len.addr, align 8
  %sp6 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5
  store i256 0, ptr %sp6, align 16
  br label %OP3.PUSH1, !annotation !5

OP3.PUSH1:                                        ; preds = %OP2.PUSH0
  %stack_len7 = load i64, ptr %len.addr, align 8
  %8 = add i64 %stack_len7, 1
  store i64 %8, ptr %len.addr, align 8
  %sp8 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len7
  store i256 1, ptr %sp8, align 16
  br label %OP4.JUMPDEST, !annotation !5

OP4.JUMPDEST:                                     ; preds = %OP21.JUMP, %OP3.PUSH1
  %gas.remaining9 = load i64, ptr %gas.remaining.addr, align 8
  %9 = sub i64 %gas.remaining9, 20
  %10 = icmp ult i64 %gas.remaining9, 20
  store i64 %9, ptr %gas.remaining.addr, align 8
  br i1 %10, label %return, label %OP4.JUMPDEST.contd, !prof !2, !annotation !3

OP4.JUMPDEST.contd:                               ; preds = %OP4.JUMPDEST
  %stack_len10 = load i64, ptr %len.addr, align 8
  %11 = icmp ult i64 %stack_len10, 3
  %12 = icmp ugt i64 %stack_len10, 1022
  %13 = or i1 %11, %12
  %14 = select i1 %11, i8 91, i8 92
  br i1 %13, label %return, label %OP4.JUMPDEST.contd11, !prof !2

OP4.JUMPDEST.contd11:                             ; preds = %OP4.JUMPDEST.contd
  br label %OP5.DUP3, !annotation !5

OP5.DUP3:                                         ; preds = %OP4.JUMPDEST.contd11
  %stack_len12 = load i64, ptr %len.addr, align 8
  %15 = add i64 %stack_len12, 1
  store i64 %15, ptr %len.addr, align 8
  %16 = sub i64 %stack_len12, 3
  %sp13 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %16
  %dup3 = load i256, ptr %sp13, align 16
  %sp14 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len12
  store i256 %dup3, ptr %sp14, align 16
  br label %OP6.ISZERO, !annotation !5

OP6.ISZERO:                                       ; preds = %OP5.DUP3
  %stack_len15 = load i64, ptr %len.addr, align 8
  %17 = add i64 %stack_len15, -1
  %sp16 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %17
  %a17 = load i256, ptr %sp16, align 16
  %18 = icmp eq i256 %a17, 0
  %19 = zext i1 %18 to i256
  %20 = add i64 %stack_len15, -1
  %sp18 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %20
  store i256 %19, ptr %sp18, align 16
  br label %OP7.PUSH1, !annotation !5

OP7.PUSH1:                                        ; preds = %OP6.ISZERO
  br label %OP8.JUMPI, !annotation !6

OP8.JUMPI:                                        ; preds = %OP7.PUSH1
  %stack_len19 = load i64, ptr %len.addr, align 8
  %21 = add i64 %stack_len19, -1
  store i64 %21, ptr %len.addr, align 8
  %22 = add i64 %stack_len19, -1
  %sp20 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %22
  %a21 = load i256, ptr %sp20, align 16
  %23 = icmp ne i256 %a21, 0
  br i1 %23, label %OP22.JUMPDEST, label %OP9.SWAP1

OP9.SWAP1:                                        ; preds = %OP8.JUMPI
  %gas.remaining22 = load i64, ptr %gas.remaining.addr, align 8
  %24 = sub i64 %gas.remaining22, 46
  %25 = icmp ult i64 %gas.remaining22, 46
  store i64 %24, ptr %gas.remaining.addr, align 8
  br i1 %25, label %return, label %OP9.SWAP1.contd, !prof !2, !annotation !3

OP9.SWAP1.contd:                                  ; preds = %OP9.SWAP1
  %stack_len23 = load i64, ptr %len.addr, align 8
  %26 = icmp ult i64 %stack_len23, 3
  %27 = icmp ugt i64 %stack_len23, 1023
  %28 = or i1 %26, %27
  %29 = select i1 %26, i8 91, i8 92
  br i1 %28, label %return, label %OP9.SWAP1.contd24, !prof !2

OP9.SWAP1.contd24:                                ; preds = %OP9.SWAP1.contd
  %30 = sub i64 %stack_len23, 1
  %sp25 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %30
  %swap.a = load i256, ptr %sp25, align 16
  %31 = sub i64 %stack_len23, 2
  %sp26 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %31
  %swap.b = load i256, ptr %sp26, align 16
  store i256 %swap.a, ptr %sp26, align 16
  store i256 %swap.b, ptr %sp25, align 16
  br label %OP10.PUSH1, !annotation !5

OP10.PUSH1:                                       ; preds = %OP9.SWAP1.contd24
  %stack_len27 = load i64, ptr %len.addr, align 8
  %32 = add i64 %stack_len27, 1
  store i64 %32, ptr %len.addr, align 8
  %sp28 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len27
  store i256 1, ptr %sp28, align 16
  br label %OP11.ADD, !annotation !5

OP11.ADD:                                         ; preds = %OP10.PUSH1
  %stack_len29 = load i64, ptr %len.addr, align 8
  %33 = add i64 %stack_len29, -1
  store i64 %33, ptr %len.addr, align 8
  %34 = add i64 %stack_len29, -1
  %sp30 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %34
  %a31 = load i256, ptr %sp30, align 16
  %35 = add i64 %stack_len29, -2
  %sp32 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %35
  %b = load i256, ptr %sp32, align 16
  %36 = add i256 %a31, %b
  %37 = add i64 %stack_len29, -2
  %sp33 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %37
  store i256 %36, ptr %sp33, align 16
  br label %OP12.DUP1, !annotation !5

OP12.DUP1:                                        ; preds = %OP11.ADD
  %stack_len34 = load i64, ptr %len.addr, align 8
  %38 = add i64 %stack_len34, 1
  store i64 %38, ptr %len.addr, align 8
  %39 = sub i64 %stack_len34, 1
  %sp35 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %39
  %dup1 = load i256, ptr %sp35, align 16
  %sp36 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len34
  store i256 %dup1, ptr %sp36, align 16
  br label %OP13.SWAP2, !annotation !5

OP13.SWAP2:                                       ; preds = %OP12.DUP1
  %stack_len37 = load i64, ptr %len.addr, align 8
  %40 = sub i64 %stack_len37, 1
  %sp38 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %40
  %swap.a39 = load i256, ptr %sp38, align 16
  %41 = sub i64 %stack_len37, 3
  %sp40 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %41
  %swap.b41 = load i256, ptr %sp40, align 16
  store i256 %swap.a39, ptr %sp40, align 16
  store i256 %swap.b41, ptr %sp38, align 16
  br label %OP14.MUL, !annotation !5

OP14.MUL:                                         ; preds = %OP13.SWAP2
  %stack_len42 = load i64, ptr %len.addr, align 8
  %42 = add i64 %stack_len42, -1
  store i64 %42, ptr %len.addr, align 8
  %43 = add i64 %stack_len42, -1
  %sp43 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %43
  %a44 = load i256, ptr %sp43, align 16
  %44 = add i64 %stack_len42, -2
  %sp45 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %44
  %b46 = load i256, ptr %sp45, align 16
  %45 = mul i256 %a44, %b46
  %46 = add i64 %stack_len42, -2
  %sp47 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %46
  store i256 %45, ptr %sp47, align 16
  br label %OP15.SWAP2, !annotation !5

OP15.SWAP2:                                       ; preds = %OP14.MUL
  %stack_len48 = load i64, ptr %len.addr, align 8
  %47 = sub i64 %stack_len48, 1
  %sp49 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %47
  %swap.a50 = load i256, ptr %sp49, align 16
  %48 = sub i64 %stack_len48, 3
  %sp51 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %48
  %swap.b52 = load i256, ptr %sp51, align 16
  store i256 %swap.a50, ptr %sp51, align 16
  store i256 %swap.b52, ptr %sp49, align 16
  br label %OP16.PUSH1, !annotation !5

OP16.PUSH1:                                       ; preds = %OP15.SWAP2
  %stack_len53 = load i64, ptr %len.addr, align 8
  %49 = add i64 %stack_len53, 1
  store i64 %49, ptr %len.addr, align 8
  %sp54 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len53
  store i256 1, ptr %sp54, align 16
  br label %OP17.SWAP1, !annotation !5

OP17.SWAP1:                                       ; preds = %OP16.PUSH1
  %stack_len55 = load i64, ptr %len.addr, align 8
  %50 = sub i64 %stack_len55, 1
  %sp56 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %50
  %swap.a57 = load i256, ptr %sp56, align 16
  %51 = sub i64 %stack_len55, 2
  %sp58 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %51
  %swap.b59 = load i256, ptr %sp58, align 16
  store i256 %swap.a57, ptr %sp58, align 16
  store i256 %swap.b59, ptr %sp56, align 16
  br label %OP18.SUB, !annotation !5

OP18.SUB:                                         ; preds = %OP17.SWAP1
  %stack_len60 = load i64, ptr %len.addr, align 8
  %52 = add i64 %stack_len60, -1
  store i64 %52, ptr %len.addr, align 8
  %53 = add i64 %stack_len60, -1
  %sp61 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %53
  %a62 = load i256, ptr %sp61, align 16
  %54 = add i64 %stack_len60, -2
  %sp63 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %54
  %b64 = load i256, ptr %sp63, align 16
  %55 = sub i256 %a62, %b64
  %56 = add i64 %stack_len60, -2
  %sp65 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %56
  store i256 %55, ptr %sp65, align 16
  br label %OP19.SWAP2, !annotation !5

OP19.SWAP2:                                       ; preds = %OP18.SUB
  %stack_len66 = load i64, ptr %len.addr, align 8
  %57 = sub i64 %stack_len66, 1
  %sp67 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %57
  %swap.a68 = load i256, ptr %sp67, align 16
  %58 = sub i64 %stack_len66, 3
  %sp69 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %58
  %swap.b70 = load i256, ptr %sp69, align 16
  store i256 %swap.a68, ptr %sp69, align 16
  store i256 %swap.b70, ptr %sp67, align 16
  br label %OP20.PUSH1, !annotation !5

OP20.PUSH1:                                       ; preds = %OP19.SWAP2
  br label %OP21.JUMP, !annotation !6

OP21.JUMP:                                        ; preds = %OP20.PUSH1
  %stack_len71 = load i64, ptr %len.addr, align 8
  br label %OP4.JUMPDEST

OP22.JUMPDEST:                                    ; preds = %OP8.JUMPI
  %gas.remaining72 = load i64, ptr %gas.remaining.addr, align 8
  %59 = sub i64 %gas.remaining72, 18
  %60 = icmp ult i64 %gas.remaining72, 18
  store i64 %59, ptr %gas.remaining.addr, align 8
  br i1 %60, label %return, label %OP22.JUMPDEST.contd, !prof !2, !annotation !3

OP22.JUMPDEST.contd:                              ; preds = %OP22.JUMPDEST
  %stack_len73 = load i64, ptr %len.addr, align 8
  %61 = icmp ult i64 %stack_len73, 3
  br i1 %61, label %return, label %OP22.JUMPDEST.contd74, !prof !2, !annotation !7

OP22.JUMPDEST.contd74:                            ; preds = %OP22.JUMPDEST.contd
  br label %OP23.SWAP2, !annotation !5

OP23.SWAP2:                                       ; preds = %OP22.JUMPDEST.contd74
  %stack_len75 = load i64, ptr %len.addr, align 8
  %62 = sub i64 %stack_len75, 1
  %sp76 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %62
  %swap.a77 = load i256, ptr %sp76, align 16
  %63 = sub i64 %stack_len75, 3
  %sp78 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %63
  %swap.b79 = load i256, ptr %sp78, align 16
  store i256 %swap.a77, ptr %sp78, align 16
  store i256 %swap.b79, ptr %sp76, align 16
  br label %OP24.POP, !annotation !5

OP24.POP:                                         ; preds = %OP23.SWAP2
  %stack_len80 = load i64, ptr %len.addr, align 8
  %64 = add i64 %stack_len80, -1
  store i64 %64, ptr %len.addr, align 8
  br label %OP25.POP, !annotation !5

OP25.POP:                                         ; preds = %OP24.POP
  %stack_len81 = load i64, ptr %len.addr, align 8
  %65 = add i64 %stack_len81, -1
  store i64 %65, ptr %len.addr, align 8
  br label %OP26.PUSH0, !annotation !5

OP26.PUSH0:                                       ; preds = %OP25.POP
  %stack_len82 = load i64, ptr %len.addr, align 8
  %66 = add i64 %stack_len82, 1
  store i64 %66, ptr %len.addr, align 8
  %sp83 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len82
  store i256 0, ptr %sp83, align 16
  br label %OP27.MSTORE, !annotation !5

OP27.MSTORE:                                      ; preds = %OP26.PUSH0
  %stack_len84 = load i64, ptr %len.addr, align 8
  %67 = add i64 %stack_len84, -2
  store i64 %67, ptr %len.addr, align 8
  %68 = add i64 %stack_len84, -1
  %sp85 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %68
  %a86 = load i256, ptr %sp85, align 16
  %69 = add i64 %stack_len84, -2
  %sp87 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %69
  %b88 = load i256, ptr %sp87, align 16
  %70 = call i8 @__revmc_ir_builtin_mstore(i256 %a86, i256 %b88, ptr %arg.ecx.addr)
  %71 = icmp ne i8 %70, 0
  br i1 %71, label %return, label %OP27.MSTORE.contd, !prof !2

OP27.MSTORE.contd:                                ; preds = %OP27.MSTORE
  br label %OP28.PUSH1, !annotation !5

OP28.PUSH1:                                       ; preds = %OP27.MSTORE.contd
  %stack_len89 = load i64, ptr %len.addr, align 8
  %72 = add i64 %stack_len89, 1
  store i64 %72, ptr %len.addr, align 8
  %sp90 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len89
  store i256 32, ptr %sp90, align 16
  br label %OP29.PUSH0, !annotation !5

OP29.PUSH0:                                       ; preds = %OP28.PUSH1
  %stack_len91 = load i64, ptr %len.addr, align 8
  %73 = add i64 %stack_len91, 1
  store i64 %73, ptr %len.addr, align 8
  %sp92 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len91
  store i256 0, ptr %sp92, align 16
  br label %OP30.RETURN, !annotation !5

OP30.RETURN:                                      ; preds = %OP29.PUSH0
  %stack_len93 = load i64, ptr %len.addr, align 8
  %74 = add i64 %stack_len93, -2
  store i64 %74, ptr %len.addr, align 8
  %75 = sub i64 %stack_len93, 2
  %sp94 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %75
  %76 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp94, i8 2)
  %77 = icmp ne i8 %76, 0
  br i1 %77, label %return, label %OP30.RETURN.contd, !prof !2

OP30.RETURN.contd:                                ; preds = %OP30.RETURN
  br label %return, !annotation !8

dynamic_jump_table:                               ; No predecessors!
  unreachable

suspend:                                          ; No predecessors!
  unreachable

failure:                                          ; No predecessors!
  unreachable

return:                                           ; preds = %OP30.RETURN.contd, %OP30.RETURN, %OP27.MSTORE, %OP22.JUMPDEST.contd, %OP22.JUMPDEST, %OP9.SWAP1.contd, %OP9.SWAP1, %OP4.JUMPDEST.contd, %OP4.JUMPDEST, %OP0.PUSH0.contd, %OP0.PUSH0
  %78 = phi i8 [ 80, %OP0.PUSH0 ], [ 92, %OP0.PUSH0.contd ], [ 80, %OP4.JUMPDEST ], [ %14, %OP4.JUMPDEST.contd ], [ 80, %OP9.SWAP1 ], [ %29, %OP9.SWAP1.contd ], [ 80, %OP22.JUMPDEST ], [ 91, %OP22.JUMPDEST.contd ], [ %70, %OP27.MSTORE ], [ %76, %OP30.RETURN ], [ 2, %OP30.RETURN.contd ]
  ret i8 %78
}

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define private i256 @__revmc_ir_builtin_calldataload(i256 noundef %0, ptr noundef %1) #1 {
entry:
  %contract.input.ptr.addr = getelementptr inbounds i8, ptr %1, i64 72
  %contract.input.ptr = load ptr, ptr %contract.input.ptr.addr, align 8
  %contract.input.len.addr = getelementptr inbounds i8, ptr %1, i64 80
  %contract.input.len = load i64, ptr %contract.input.len.addr, align 8
  %2 = zext i64 %contract.input.len to i256
  %3 = icmp ult i256 %0, %2
  br i1 %3, label %then, label %else

then:                                             ; preds = %entry
  %4 = trunc i256 %0 to i64
  %calldata.addr = getelementptr inbounds i8, ptr %contract.input.ptr, i64 %4
  %5 = sub i64 %contract.input.len, %4
  %6 = call i64 @llvm.umin.i64(i64 %5, i64 32)
  %calldata.addr1 = alloca i256, align 16
  store i256 0, ptr %calldata.addr1, align 16
  call void @llvm.memcpy.p0.p0.i64(ptr %calldata.addr1, ptr %calldata.addr, i64 %6, i1 false)
  %calldata.i256 = load i256, ptr %calldata.addr1, align 16
  %7 = call i256 @llvm.bswap.i256(i256 %calldata.i256)
  br label %contd

else:                                             ; preds = %entry
  br label %contd

contd:                                            ; preds = %else, %then
  %8 = phi i256 [ %7, %then ], [ 0, %else ]
  ret i256 %8
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.bswap.i256(i256) #2

; Function Attrs: noinline norecurse nosync nounwind speculatable willreturn
define private i8 @__revmc_ir_builtin_mstore(i256 noundef %0, i256 noundef %1, ptr noalias nocapture noundef nonnull %2) #4 {
entry:
  %ecx.memory.addr = getelementptr inbounds i8, ptr %2, i64 40
  %ecx.memory = load ptr, ptr %ecx.memory.addr, align 8
  %ecx.memory.len.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 16
  %ecx.memory.len = load i64, ptr %ecx.memory.len.addr, align 8
  %ecx.memory.last_checkpoint.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 48
  %ecx.memory.last_checkpoint = load i64, ptr %ecx.memory.last_checkpoint.addr, align 8
  %3 = sub i64 %ecx.memory.len, %ecx.memory.last_checkpoint
  %4 = icmp ugt i256 %0, 18446744073709551615
  %5 = trunc i256 %0 to i64
  %6 = add i64 %5, 32
  %7 = icmp ult i64 %6, 32
  %8 = or i1 %4, %7
  %9 = select i1 %8, i64 -1, i64 %6
  %10 = icmp ugt i64 %9, %3
  br i1 %10, label %resize, label %contd, !prof !2

resize:                                           ; preds = %entry
  %11 = call i8 @__revmc_builtin_resize_memory(ptr %2, i64 %9)
  %12 = icmp ne i8 %11, 0
  br i1 %12, label %OP27.MSTORE.return, label %OP27.MSTORE.contd, !prof !2

OP27.MSTORE.contd:                                ; preds = %resize
  br label %contd

OP27.MSTORE.return:                               ; preds = %resize
  ret i8 %11

contd:                                            ; preds = %OP27.MSTORE.contd, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %13 = call i256 @llvm.bswap.i256(i256 %1)
  store i256 %13, ptr %slot, align 16
  ret i8 0
}

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_resize_memory(ptr noalias nocapture noundef align 8 dereferenceable(88), i64 noundef) #5

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_do_return(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) #5

attributes #0 = { norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="skylake" }
attributes #1 = { norecurse nosync nounwind speculatable willreturn "target-cpu"="skylake" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { noinline norecurse nosync nounwind speculatable willreturn "target-cpu"="skylake" }
attributes #5 = { nofree norecurse nosync nounwind speculatable willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!"check StackOverflow"}
!5 = !{!"normal exit"}
!6 = !{!"skipped"}
!7 = !{!"check StackUnderflow"}
!8 = !{!"return Return"}
