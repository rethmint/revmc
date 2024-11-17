; ModuleID = 'fibonacci-two'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define i8 @fibonacci-two(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %len.addr = alloca i64, align 8
  br label %entry.post

entry.post:                                       ; preds = %entry
  store i64 0, ptr %len.addr, align 8
  br label %OP0.STOP

resume:                                           ; No predecessors!
  unreachable

unreachable:                                      ; No predecessors!
  unreachable

OP0.STOP:                                         ; preds = %entry.post
  %stack_len = load i64, ptr %len.addr, align 8
  br label %return, !annotation !2

dynamic_jump_table:                               ; No predecessors!
  unreachable

suspend:                                          ; No predecessors!
  unreachable

failure:                                          ; No predecessors!
  unreachable

return:                                           ; preds = %OP0.STOP
  %0 = phi i8 [ 1, %OP0.STOP ]
  ret i8 %0
}

attributes #0 = { norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="skylake" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"return Stop"}
