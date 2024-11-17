; ModuleID = 'fibonacci-two'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(none)
define noundef i8 @fibonacci-two(ptr nocapture noundef readnone align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef readnone align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(88) %arg.ecx.addr) local_unnamed_addr #0 {
entry:
  ret i8 1
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "target-cpu"="skylake" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
