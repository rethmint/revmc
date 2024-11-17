; ModuleID = 'fibonacci'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite)
define i8 @fibonacci(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef readnone align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(88) %arg.ecx.addr) local_unnamed_addr #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %stack_len77 = load i64, ptr %arg.stack_len.addr, align 8
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %0 = add i64 %gas.remaining, -9
  %1 = icmp ult i64 %gas.remaining, 9
  store i64 %0, ptr %gas.remaining.addr, align 8
  br i1 %1, label %return, label %OP0.JUMPDEST.contd, !prof !2, !annotation !3

OP0.JUMPDEST.contd:                               ; preds = %entry
  %2 = icmp ugt i64 %stack_len77, 1022
  br i1 %2, label %return, label %OP1.JUMPDEST, !prof !2, !annotation !4

OP1.JUMPDEST:                                     ; preds = %OP0.JUMPDEST.contd
  %sp = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len77
  store i256 0, ptr %sp, align 16
  %3 = add nuw nsw i64 %stack_len77, 2
  %sp6 = getelementptr i256, ptr %sp, i64 1
  %4 = add i64 %gas.remaining, -29
  %5 = icmp ult i64 %0, 20
  br i1 %5, label %return.loopexit.split.loop.exit, label %OP5.JUMPDEST.contd.lr.ph, !prof !5, !annotation !3

OP5.JUMPDEST.contd.lr.ph:                         ; preds = %OP1.JUMPDEST
  %6 = add nsw i64 %stack_len77, -1021
  %7 = icmp ult i64 %6, -1020
  %sp11 = getelementptr i256, ptr %sp, i64 -1
  %sp12 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %3
  %sp27 = getelementptr i256, ptr %sp, i64 3
  br i1 %7, label %return.loopexit.split.loop.exit107, label %OP5.JUMPDEST.contd.lr.ph.split, !prof !2

OP5.JUMPDEST.contd.lr.ph.split:                   ; preds = %OP5.JUMPDEST.contd.lr.ph
  %sp11.promoted = load i256, ptr %sp11, align 16
  %8 = trunc i256 %sp11.promoted to i64
  %9 = mul i64 %8, 63
  %10 = sub i64 %4, %9
  %11 = sub i64 %0, %9
  br label %OP5.JUMPDEST.contd

OP5.JUMPDEST.contd:                               ; preds = %OP5.JUMPDEST.contd.lr.ph.split, %OP10.DUP2.contd21
  %dup2 = phi i256 [ 0, %OP5.JUMPDEST.contd.lr.ph.split ], [ %swap.a71, %OP10.DUP2.contd21 ]
  %dup3121 = phi i256 [ %sp11.promoted, %OP5.JUMPDEST.contd.lr.ph.split ], [ %18, %OP10.DUP2.contd21 ]
  %12 = phi i64 [ %4, %OP5.JUMPDEST.contd.lr.ph.split ], [ %19, %OP10.DUP2.contd21 ]
  %swap.a71 = phi i256 [ 1, %OP5.JUMPDEST.contd.lr.ph.split ], [ %17, %OP10.DUP2.contd21 ]
  %13 = phi i64 [ %0, %OP5.JUMPDEST.contd.lr.ph.split ], [ %15, %OP10.DUP2.contd21 ]
  %14 = icmp eq i256 %dup3121, 0
  br i1 %14, label %OP23.JUMPDEST, label %OP10.DUP2

OP10.DUP2:                                        ; preds = %OP5.JUMPDEST.contd
  %15 = add i64 %13, -63
  %16 = icmp ult i64 %12, 43
  br i1 %16, label %return.loopexit.split.loop.exit109, label %OP10.DUP2.contd21, !prof !2, !annotation !3

OP10.DUP2.contd21:                                ; preds = %OP10.DUP2
  store i256 %swap.a71, ptr %sp27, align 16
  %17 = add i256 %swap.a71, %dup2
  store i256 %swap.a71, ptr %sp, align 16
  %18 = add i256 %dup3121, -1
  store i256 %18, ptr %sp11, align 16
  %19 = add i64 %13, -83
  %20 = icmp ult i64 %15, 20
  br i1 %20, label %OP5.JUMPDEST.return.loopexit.split.loop.exit_crit_edge, label %OP5.JUMPDEST.contd, !prof !6, !annotation !3

OP23.JUMPDEST:                                    ; preds = %OP5.JUMPDEST.contd
  store i256 1, ptr %sp12, align 16
  store i256 %swap.a71, ptr %sp6, align 16
  %21 = add i64 %11, -28
  %22 = icmp ult i64 %10, 8
  store i64 %21, ptr %gas.remaining.addr, align 8
  br i1 %22, label %return, label %OP24.SWAP2, !prof !2, !annotation !3

OP24.SWAP2:                                       ; preds = %OP23.JUMPDEST
  store i256 %swap.a71, ptr %sp11, align 16
  store i256 0, ptr %sp6, align 16
  br label %return, !annotation !7

OP5.JUMPDEST.return.loopexit.split.loop.exit_crit_edge: ; preds = %OP10.DUP2.contd21
  store i256 %dup3121, ptr %sp12, align 16
  br label %return.loopexit.split.loop.exit

return.loopexit.split.loop.exit:                  ; preds = %OP5.JUMPDEST.return.loopexit.split.loop.exit_crit_edge, %OP1.JUMPDEST
  %.lcssa = phi i64 [ %19, %OP5.JUMPDEST.return.loopexit.split.loop.exit_crit_edge ], [ %4, %OP1.JUMPDEST ]
  %storemerge.lcssa = phi i256 [ %17, %OP5.JUMPDEST.return.loopexit.split.loop.exit_crit_edge ], [ 1, %OP1.JUMPDEST ]
  store i256 %storemerge.lcssa, ptr %sp6, align 16
  store i64 %.lcssa, ptr %gas.remaining.addr, align 8
  br label %return

return.loopexit.split.loop.exit107:               ; preds = %OP5.JUMPDEST.contd.lr.ph
  store i256 1, ptr %sp6, align 16
  store i64 %4, ptr %gas.remaining.addr, align 8
  %23 = icmp eq i64 %stack_len77, 0
  %24 = select i1 %23, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit109:               ; preds = %OP10.DUP2
  store i256 0, ptr %sp12, align 16
  store i256 %swap.a71, ptr %sp6, align 16
  store i64 %15, ptr %gas.remaining.addr, align 8
  br label %return

return:                                           ; preds = %return.loopexit.split.loop.exit, %return.loopexit.split.loop.exit107, %return.loopexit.split.loop.exit109, %OP24.SWAP2, %OP23.JUMPDEST, %OP0.JUMPDEST.contd, %entry
  %len.addr.1 = phi i64 [ %stack_len77, %entry ], [ %stack_len77, %OP0.JUMPDEST.contd ], [ %3, %OP23.JUMPDEST ], [ %stack_len77, %OP24.SWAP2 ], [ %3, %return.loopexit.split.loop.exit109 ], [ %3, %return.loopexit.split.loop.exit107 ], [ %3, %return.loopexit.split.loop.exit ]
  %25 = phi i8 [ 80, %entry ], [ 92, %OP0.JUMPDEST.contd ], [ 80, %OP23.JUMPDEST ], [ 1, %OP24.SWAP2 ], [ 80, %return.loopexit.split.loop.exit109 ], [ %24, %return.loopexit.split.loop.exit107 ], [ 80, %return.loopexit.split.loop.exit ]
  store i64 %len.addr.1, ptr %arg.stack_len.addr, align 8
  ret i8 %25
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite) "frame-pointer"="all" "target-cpu"="skylake" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!"check StackOverflow"}
!5 = !{!"branch_weights", i32 1, i32 127}
!6 = !{!"branch_weights", i32 127, i32 2559873}
!7 = !{!"return Stop"}
