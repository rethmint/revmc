; ModuleID = 'factorial'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
define i8 @factorial(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef readnone align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef readonly align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) local_unnamed_addr #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %0 = add i64 %gas.remaining, -10
  %1 = icmp ult i64 %gas.remaining, 10
  store i64 %0, ptr %gas.remaining.addr, align 8
  br i1 %1, label %return, label %OP0.PUSH0.contd1, !prof !2, !annotation !3

OP0.PUSH0.contd1:                                 ; preds = %entry
  %2 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val = load ptr, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %arg.contract.addr.val124 = load i64, ptr %3, align 8
  %4 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(ptr %arg.contract.addr.val, i64 %arg.contract.addr.val124)
  store i256 %4, ptr %arg.stack.addr, align 16
  %sp6 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 1
  store i256 0, ptr %sp6, align 16
  %sp8 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 2
  %5 = add i64 %gas.remaining, -30
  %6 = icmp ult i64 %0, 20
  br i1 %6, label %return.loopexit, label %OP5.DUP3.lr.ph, !prof !4, !annotation !3

OP5.DUP3.lr.ph:                                   ; preds = %OP0.PUSH0.contd1
  %sp14 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 3
  %7 = trunc i256 %4 to i64
  %8 = mul i64 %7, 66
  %9 = sub i64 %5, %8
  %10 = sub i64 %0, %8
  br label %OP5.DUP3

OP5.DUP3:                                         ; preds = %OP5.DUP3.lr.ph, %OP9.SWAP1.contd24
  %swap.b = phi i256 [ 0, %OP5.DUP3.lr.ph ], [ %16, %OP9.SWAP1.contd24 ]
  %dup3132 = phi i256 [ %4, %OP5.DUP3.lr.ph ], [ %18, %OP9.SWAP1.contd24 ]
  %11 = phi i64 [ %5, %OP5.DUP3.lr.ph ], [ %19, %OP9.SWAP1.contd24 ]
  %swap.a77 = phi i256 [ 1, %OP5.DUP3.lr.ph ], [ %17, %OP9.SWAP1.contd24 ]
  %12 = phi i64 [ %0, %OP5.DUP3.lr.ph ], [ %14, %OP9.SWAP1.contd24 ]
  %13 = icmp eq i256 %dup3132, 0
  br i1 %13, label %OP22.JUMPDEST, label %OP9.SWAP1

OP9.SWAP1:                                        ; preds = %OP5.DUP3
  %14 = add i64 %12, -66
  %15 = icmp ult i64 %11, 46
  br i1 %15, label %OP9.SWAP1.return.loopexit_crit_edge, label %OP9.SWAP1.contd24, !prof !2, !annotation !3

OP9.SWAP1.contd24:                                ; preds = %OP9.SWAP1
  %16 = add i256 %swap.b, 1
  store i256 %16, ptr %sp6, align 16
  %17 = mul i256 %16, %swap.a77
  %18 = add i256 %dup3132, -1
  store i256 %18, ptr %arg.stack.addr, align 16
  %19 = add i64 %12, -86
  %20 = icmp ult i64 %14, 20
  br i1 %20, label %return.loopexit.sink.split, label %OP5.DUP3, !prof !5, !annotation !3

OP22.JUMPDEST:                                    ; preds = %OP5.DUP3
  %21 = zext i1 %13 to i256
  store i256 %21, ptr %sp14, align 16
  store i256 %swap.a77, ptr %sp8, align 16
  %22 = add i64 %10, -38
  %23 = icmp ult i64 %9, 18
  store i64 %22, ptr %gas.remaining.addr, align 8
  br i1 %23, label %return, label %OP23.SWAP2, !prof !2, !annotation !3

OP23.SWAP2:                                       ; preds = %OP22.JUMPDEST
  store i256 %swap.a77, ptr %arg.stack.addr, align 16
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp6, i8 0, i64 64, i1 false)
  %24 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %swap.a77, ptr %arg.ecx.addr)
  %.not = icmp eq i8 %24, 0
  br i1 %.not, label %OP28.PUSH1, label %return, !prof !6

OP28.PUSH1:                                       ; preds = %OP23.SWAP2
  store i256 32, ptr %arg.stack.addr, align 16
  store i256 0, ptr %sp6, align 16
  %25 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %arg.stack.addr, i8 2)
  %.not123 = icmp eq i8 %25, 0
  %spec.select = select i1 %.not123, i8 2, i8 %25, !prof !6
  br label %return

OP9.SWAP1.return.loopexit_crit_edge:              ; preds = %OP9.SWAP1
  %26 = zext i1 %13 to i256
  br label %return.loopexit.sink.split

return.loopexit.sink.split:                       ; preds = %OP9.SWAP1.contd24, %OP9.SWAP1.return.loopexit_crit_edge
  %.sink = phi i256 [ %26, %OP9.SWAP1.return.loopexit_crit_edge ], [ %dup3132, %OP9.SWAP1.contd24 ]
  %.ph = phi i64 [ %14, %OP9.SWAP1.return.loopexit_crit_edge ], [ %19, %OP9.SWAP1.contd24 ]
  %storemerge.lcssa.ph = phi i256 [ %swap.a77, %OP9.SWAP1.return.loopexit_crit_edge ], [ %17, %OP9.SWAP1.contd24 ]
  store i256 %.sink, ptr %sp14, align 16
  br label %return.loopexit

return.loopexit:                                  ; preds = %return.loopexit.sink.split, %OP0.PUSH0.contd1
  %27 = phi i64 [ %5, %OP0.PUSH0.contd1 ], [ %.ph, %return.loopexit.sink.split ]
  %storemerge.lcssa = phi i256 [ 1, %OP0.PUSH0.contd1 ], [ %storemerge.lcssa.ph, %return.loopexit.sink.split ]
  store i256 %storemerge.lcssa, ptr %sp8, align 16
  store i64 %27, ptr %gas.remaining.addr, align 8
  br label %return

return:                                           ; preds = %return.loopexit, %OP28.PUSH1, %OP23.SWAP2, %OP22.JUMPDEST, %entry
  %28 = phi i8 [ 80, %entry ], [ 80, %OP22.JUMPDEST ], [ %24, %OP23.SWAP2 ], [ %spec.select, %OP28.PUSH1 ], [ 80, %return.loopexit ]
  ret i8 %28
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite)
define private fastcc i256 @__revmc_ir_builtin_calldataload(ptr nocapture readonly %.72.val, i64 %.80.val) unnamed_addr #1 {
entry:
  %.not = icmp eq i64 %.80.val, 0
  br i1 %.not, label %contd, label %then

then:                                             ; preds = %entry
  %0 = tail call i64 @llvm.umin.i64(i64 %.80.val, i64 32)
  %calldata.addr1 = alloca i256, align 16
  store i256 0, ptr %calldata.addr1, align 16
  call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 16 %calldata.addr1, ptr align 1 %.72.val, i64 %0, i1 false)
  %calldata.i256 = load i256, ptr %calldata.addr1, align 16
  %1 = tail call i256 @llvm.bswap.i256(i256 %calldata.i256)
  br label %contd

contd:                                            ; preds = %entry, %then
  %2 = phi i256 [ %1, %then ], [ 0, %entry ]
  ret i256 %2
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.bswap.i256(i256) #2

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind speculatable willreturn
define private fastcc i8 @__revmc_ir_builtin_mstore(i256 noundef %0, ptr noalias nocapture noundef nonnull %1) unnamed_addr #4 {
entry:
  %ecx.memory.addr = getelementptr inbounds i8, ptr %1, i64 40
  %ecx.memory = load ptr, ptr %ecx.memory.addr, align 8
  %ecx.memory.len.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 16
  %ecx.memory.len = load i64, ptr %ecx.memory.len.addr, align 8
  %ecx.memory.last_checkpoint.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 48
  %ecx.memory.last_checkpoint = load i64, ptr %ecx.memory.last_checkpoint.addr, align 8
  %2 = sub i64 %ecx.memory.len, %ecx.memory.last_checkpoint
  %3 = icmp ult i64 %2, 32
  br i1 %3, label %resize, label %contd, !prof !2

resize:                                           ; preds = %entry
  %4 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %1, i64 32)
  %.not = icmp eq i8 %4, 0
  br i1 %.not, label %contd, label %common.ret, !prof !6

common.ret:                                       ; preds = %resize, %contd
  %common.ret.op = phi i8 [ 0, %contd ], [ %4, %resize ]
  ret i8 %common.ret.op

contd:                                            ; preds = %resize, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %5 = tail call i256 @llvm.bswap.i256(i256 %0)
  store i256 %5, ptr %ecx.memory.buffer.ptr, align 16
  br label %common.ret
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_resize_memory(ptr noalias nocapture noundef align 8 dereferenceable(88), i64 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_do_return(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) local_unnamed_addr #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="skylake" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite) "target-cpu"="skylake" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nofree noinline norecurse nosync nounwind speculatable willreturn "target-cpu"="skylake" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!"branch_weights", i32 1, i32 127}
!5 = !{!"branch_weights", i32 127, i32 2559873}
!6 = !{!"branch_weights", i32 20000, i32 1}
