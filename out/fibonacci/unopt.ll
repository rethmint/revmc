; ModuleID = 'fibonacci'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define i8 @fibonacci(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %len.addr = alloca i64, align 8
  br label %entry.post

entry.post:                                       ; preds = %entry
  %stack_len77 = load i64, ptr %arg.stack_len.addr, align 8
  store i64 %stack_len77, ptr %len.addr, align 8
  br label %OP0.JUMPDEST

resume:                                           ; No predecessors!
  unreachable

unreachable:                                      ; No predecessors!
  unreachable

OP0.JUMPDEST:                                     ; preds = %entry.post
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %0 = sub i64 %gas.remaining, 9
  %1 = icmp ult i64 %gas.remaining, 9
  store i64 %0, ptr %gas.remaining.addr, align 8
  br i1 %1, label %return, label %OP0.JUMPDEST.contd, !prof !2, !annotation !3

OP0.JUMPDEST.contd:                               ; preds = %OP0.JUMPDEST
  %stack_len = load i64, ptr %len.addr, align 8
  %2 = icmp ugt i64 %stack_len, 1022
  br i1 %2, label %return, label %OP0.JUMPDEST.contd1, !prof !2, !annotation !4

OP0.JUMPDEST.contd1:                              ; preds = %OP0.JUMPDEST.contd
  br label %OP1.JUMPDEST, !annotation !5

OP1.JUMPDEST:                                     ; preds = %OP0.JUMPDEST.contd1
  %stack_len2 = load i64, ptr %len.addr, align 8
  br label %OP2.JUMPDEST, !annotation !5

OP2.JUMPDEST:                                     ; preds = %OP1.JUMPDEST
  %stack_len3 = load i64, ptr %len.addr, align 8
  br label %OP3.PUSH1, !annotation !5

OP3.PUSH1:                                        ; preds = %OP2.JUMPDEST
  %stack_len4 = load i64, ptr %len.addr, align 8
  %3 = add i64 %stack_len4, 1
  store i64 %3, ptr %len.addr, align 8
  %sp = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len4
  store i256 0, ptr %sp, align 16
  br label %OP4.PUSH1, !annotation !5

OP4.PUSH1:                                        ; preds = %OP3.PUSH1
  %stack_len5 = load i64, ptr %len.addr, align 8
  %4 = add i64 %stack_len5, 1
  store i64 %4, ptr %len.addr, align 8
  %sp6 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len5
  store i256 1, ptr %sp6, align 16
  br label %OP5.JUMPDEST, !annotation !5

OP5.JUMPDEST:                                     ; preds = %OP22.JUMP, %OP4.PUSH1
  %gas.remaining7 = load i64, ptr %gas.remaining.addr, align 8
  %5 = sub i64 %gas.remaining7, 20
  %6 = icmp ult i64 %gas.remaining7, 20
  store i64 %5, ptr %gas.remaining.addr, align 8
  br i1 %6, label %return, label %OP5.JUMPDEST.contd, !prof !2, !annotation !3

OP5.JUMPDEST.contd:                               ; preds = %OP5.JUMPDEST
  %stack_len8 = load i64, ptr %len.addr, align 8
  %7 = icmp ult i64 %stack_len8, 3
  %8 = icmp ugt i64 %stack_len8, 1022
  %9 = or i1 %7, %8
  %10 = select i1 %7, i8 91, i8 92
  br i1 %9, label %return, label %OP5.JUMPDEST.contd9, !prof !2

OP5.JUMPDEST.contd9:                              ; preds = %OP5.JUMPDEST.contd
  br label %OP6.DUP3, !annotation !5

OP6.DUP3:                                         ; preds = %OP5.JUMPDEST.contd9
  %stack_len10 = load i64, ptr %len.addr, align 8
  %11 = add i64 %stack_len10, 1
  store i64 %11, ptr %len.addr, align 8
  %12 = sub i64 %stack_len10, 3
  %sp11 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %12
  %dup3 = load i256, ptr %sp11, align 16
  %sp12 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len10
  store i256 %dup3, ptr %sp12, align 16
  br label %OP7.ISZERO, !annotation !5

OP7.ISZERO:                                       ; preds = %OP6.DUP3
  %stack_len13 = load i64, ptr %len.addr, align 8
  %13 = add i64 %stack_len13, -1
  %sp14 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %13
  %a = load i256, ptr %sp14, align 16
  %14 = icmp eq i256 %a, 0
  %15 = zext i1 %14 to i256
  %16 = add i64 %stack_len13, -1
  %sp15 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %16
  store i256 %15, ptr %sp15, align 16
  br label %OP8.PUSH1, !annotation !5

OP8.PUSH1:                                        ; preds = %OP7.ISZERO
  br label %OP9.JUMPI, !annotation !6

OP9.JUMPI:                                        ; preds = %OP8.PUSH1
  %stack_len16 = load i64, ptr %len.addr, align 8
  %17 = add i64 %stack_len16, -1
  store i64 %17, ptr %len.addr, align 8
  %18 = add i64 %stack_len16, -1
  %sp17 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %18
  %a18 = load i256, ptr %sp17, align 16
  %19 = icmp ne i256 %a18, 0
  br i1 %19, label %OP23.JUMPDEST, label %OP10.DUP2

OP10.DUP2:                                        ; preds = %OP9.JUMPI
  %gas.remaining19 = load i64, ptr %gas.remaining.addr, align 8
  %20 = sub i64 %gas.remaining19, 43
  %21 = icmp ult i64 %gas.remaining19, 43
  store i64 %20, ptr %gas.remaining.addr, align 8
  br i1 %21, label %return, label %OP10.DUP2.contd, !prof !2, !annotation !3

OP10.DUP2.contd:                                  ; preds = %OP10.DUP2
  %stack_len20 = load i64, ptr %len.addr, align 8
  %22 = icmp ult i64 %stack_len20, 3
  %23 = icmp ugt i64 %stack_len20, 1022
  %24 = or i1 %22, %23
  %25 = select i1 %22, i8 91, i8 92
  br i1 %24, label %return, label %OP10.DUP2.contd21, !prof !2

OP10.DUP2.contd21:                                ; preds = %OP10.DUP2.contd
  %26 = add i64 %stack_len20, 1
  store i64 %26, ptr %len.addr, align 8
  %27 = sub i64 %stack_len20, 2
  %sp22 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %27
  %dup2 = load i256, ptr %sp22, align 16
  %sp23 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len20
  store i256 %dup2, ptr %sp23, align 16
  br label %OP11.DUP2, !annotation !5

OP11.DUP2:                                        ; preds = %OP10.DUP2.contd21
  %stack_len24 = load i64, ptr %len.addr, align 8
  %28 = add i64 %stack_len24, 1
  store i64 %28, ptr %len.addr, align 8
  %29 = sub i64 %stack_len24, 2
  %sp25 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %29
  %dup226 = load i256, ptr %sp25, align 16
  %sp27 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len24
  store i256 %dup226, ptr %sp27, align 16
  br label %OP12.ADD, !annotation !5

OP12.ADD:                                         ; preds = %OP11.DUP2
  %stack_len28 = load i64, ptr %len.addr, align 8
  %30 = add i64 %stack_len28, -1
  store i64 %30, ptr %len.addr, align 8
  %31 = add i64 %stack_len28, -1
  %sp29 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %31
  %a30 = load i256, ptr %sp29, align 16
  %32 = add i64 %stack_len28, -2
  %sp31 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %32
  %b = load i256, ptr %sp31, align 16
  %33 = add i256 %a30, %b
  %34 = add i64 %stack_len28, -2
  %sp32 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %34
  store i256 %33, ptr %sp32, align 16
  br label %OP13.SWAP2, !annotation !5

OP13.SWAP2:                                       ; preds = %OP12.ADD
  %stack_len33 = load i64, ptr %len.addr, align 8
  %35 = sub i64 %stack_len33, 1
  %sp34 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %35
  %swap.a = load i256, ptr %sp34, align 16
  %36 = sub i64 %stack_len33, 3
  %sp35 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %36
  %swap.b = load i256, ptr %sp35, align 16
  store i256 %swap.a, ptr %sp35, align 16
  store i256 %swap.b, ptr %sp34, align 16
  br label %OP14.POP, !annotation !5

OP14.POP:                                         ; preds = %OP13.SWAP2
  %stack_len36 = load i64, ptr %len.addr, align 8
  %37 = add i64 %stack_len36, -1
  store i64 %37, ptr %len.addr, align 8
  br label %OP15.SWAP1, !annotation !5

OP15.SWAP1:                                       ; preds = %OP14.POP
  %stack_len37 = load i64, ptr %len.addr, align 8
  %38 = sub i64 %stack_len37, 1
  %sp38 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %38
  %swap.a39 = load i256, ptr %sp38, align 16
  %39 = sub i64 %stack_len37, 2
  %sp40 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %39
  %swap.b41 = load i256, ptr %sp40, align 16
  store i256 %swap.a39, ptr %sp40, align 16
  store i256 %swap.b41, ptr %sp38, align 16
  br label %OP16.SWAP2, !annotation !5

OP16.SWAP2:                                       ; preds = %OP15.SWAP1
  %stack_len42 = load i64, ptr %len.addr, align 8
  %40 = sub i64 %stack_len42, 1
  %sp43 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %40
  %swap.a44 = load i256, ptr %sp43, align 16
  %41 = sub i64 %stack_len42, 3
  %sp45 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %41
  %swap.b46 = load i256, ptr %sp45, align 16
  store i256 %swap.a44, ptr %sp45, align 16
  store i256 %swap.b46, ptr %sp43, align 16
  br label %OP17.PUSH1, !annotation !5

OP17.PUSH1:                                       ; preds = %OP16.SWAP2
  %stack_len47 = load i64, ptr %len.addr, align 8
  %42 = add i64 %stack_len47, 1
  store i64 %42, ptr %len.addr, align 8
  %sp48 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len47
  store i256 1, ptr %sp48, align 16
  br label %OP18.SWAP1, !annotation !5

OP18.SWAP1:                                       ; preds = %OP17.PUSH1
  %stack_len49 = load i64, ptr %len.addr, align 8
  %43 = sub i64 %stack_len49, 1
  %sp50 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %43
  %swap.a51 = load i256, ptr %sp50, align 16
  %44 = sub i64 %stack_len49, 2
  %sp52 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %44
  %swap.b53 = load i256, ptr %sp52, align 16
  store i256 %swap.a51, ptr %sp52, align 16
  store i256 %swap.b53, ptr %sp50, align 16
  br label %OP19.SUB, !annotation !5

OP19.SUB:                                         ; preds = %OP18.SWAP1
  %stack_len54 = load i64, ptr %len.addr, align 8
  %45 = add i64 %stack_len54, -1
  store i64 %45, ptr %len.addr, align 8
  %46 = add i64 %stack_len54, -1
  %sp55 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %46
  %a56 = load i256, ptr %sp55, align 16
  %47 = add i64 %stack_len54, -2
  %sp57 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %47
  %b58 = load i256, ptr %sp57, align 16
  %48 = sub i256 %a56, %b58
  %49 = add i64 %stack_len54, -2
  %sp59 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %49
  store i256 %48, ptr %sp59, align 16
  br label %OP20.SWAP2, !annotation !5

OP20.SWAP2:                                       ; preds = %OP19.SUB
  %stack_len60 = load i64, ptr %len.addr, align 8
  %50 = sub i64 %stack_len60, 1
  %sp61 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %50
  %swap.a62 = load i256, ptr %sp61, align 16
  %51 = sub i64 %stack_len60, 3
  %sp63 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %51
  %swap.b64 = load i256, ptr %sp63, align 16
  store i256 %swap.a62, ptr %sp63, align 16
  store i256 %swap.b64, ptr %sp61, align 16
  br label %OP21.PUSH1, !annotation !5

OP21.PUSH1:                                       ; preds = %OP20.SWAP2
  br label %OP22.JUMP, !annotation !6

OP22.JUMP:                                        ; preds = %OP21.PUSH1
  %stack_len65 = load i64, ptr %len.addr, align 8
  br label %OP5.JUMPDEST

OP23.JUMPDEST:                                    ; preds = %OP9.JUMPI
  %gas.remaining66 = load i64, ptr %gas.remaining.addr, align 8
  %52 = sub i64 %gas.remaining66, 8
  %53 = icmp ult i64 %gas.remaining66, 8
  store i64 %52, ptr %gas.remaining.addr, align 8
  br i1 %53, label %return, label %OP23.JUMPDEST.contd, !prof !2, !annotation !3

OP23.JUMPDEST.contd:                              ; preds = %OP23.JUMPDEST
  %stack_len67 = load i64, ptr %len.addr, align 8
  %54 = icmp ult i64 %stack_len67, 3
  br i1 %54, label %return, label %OP23.JUMPDEST.contd68, !prof !2, !annotation !7

OP23.JUMPDEST.contd68:                            ; preds = %OP23.JUMPDEST.contd
  br label %OP24.SWAP2, !annotation !5

OP24.SWAP2:                                       ; preds = %OP23.JUMPDEST.contd68
  %stack_len69 = load i64, ptr %len.addr, align 8
  %55 = sub i64 %stack_len69, 1
  %sp70 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %55
  %swap.a71 = load i256, ptr %sp70, align 16
  %56 = sub i64 %stack_len69, 3
  %sp72 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %56
  %swap.b73 = load i256, ptr %sp72, align 16
  store i256 %swap.a71, ptr %sp72, align 16
  store i256 %swap.b73, ptr %sp70, align 16
  br label %OP25.POP, !annotation !5

OP25.POP:                                         ; preds = %OP24.SWAP2
  %stack_len74 = load i64, ptr %len.addr, align 8
  %57 = add i64 %stack_len74, -1
  store i64 %57, ptr %len.addr, align 8
  br label %OP26.POP, !annotation !5

OP26.POP:                                         ; preds = %OP25.POP
  %stack_len75 = load i64, ptr %len.addr, align 8
  %58 = add i64 %stack_len75, -1
  store i64 %58, ptr %len.addr, align 8
  br label %OP27.STOP, !annotation !5

OP27.STOP:                                        ; preds = %OP26.POP
  %stack_len76 = load i64, ptr %len.addr, align 8
  br label %return, !annotation !8

dynamic_jump_table:                               ; No predecessors!
  unreachable

suspend:                                          ; No predecessors!
  unreachable

failure:                                          ; No predecessors!
  unreachable

return:                                           ; preds = %OP27.STOP, %OP23.JUMPDEST.contd, %OP23.JUMPDEST, %OP10.DUP2.contd, %OP10.DUP2, %OP5.JUMPDEST.contd, %OP5.JUMPDEST, %OP0.JUMPDEST.contd, %OP0.JUMPDEST
  %59 = phi i8 [ 80, %OP0.JUMPDEST ], [ 92, %OP0.JUMPDEST.contd ], [ 80, %OP5.JUMPDEST ], [ %10, %OP5.JUMPDEST.contd ], [ 80, %OP10.DUP2 ], [ %25, %OP10.DUP2.contd ], [ 80, %OP23.JUMPDEST ], [ 91, %OP23.JUMPDEST.contd ], [ 1, %OP27.STOP ]
  %stack_len78 = load i64, ptr %len.addr, align 8
  store i64 %stack_len78, ptr %arg.stack_len.addr, align 8
  ret i8 %59
}

attributes #0 = { norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="skylake" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!"check StackOverflow"}
!5 = !{!"normal exit"}
!6 = !{!"skipped"}
!7 = !{!"check StackUnderflow"}
!8 = !{!"return Stop"}
