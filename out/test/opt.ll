; ModuleID = 'test'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
define i8 @test(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef readnone align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef readnone align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef readonly align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) local_unnamed_addr #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %0 = add i64 %gas.remaining, -30
  %1 = icmp ult i64 %gas.remaining, 30
  store i64 %0, ptr %gas.remaining.addr, align 8
  br i1 %1, label %return, label %OP0.PUSH1.contd1, !prof !2, !annotation !3

OP0.PUSH1.contd1:                                 ; preds = %entry
  store i256 128, ptr %arg.stack.addr, align 16
  %sp3 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 1
  store i256 64, ptr %sp3, align 16
  %2 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 64, i256 128, ptr %arg.ecx.addr)
  %.not = icmp eq i8 %2, 0
  br i1 %.not, label %OP3.PUSH1, label %return, !prof !4

OP3.PUSH1:                                        ; preds = %OP0.PUSH1.contd1
  %contract.input.len.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %contract.input.len = load i64, ptr %contract.input.len.addr, align 8
  %3 = zext i64 %contract.input.len to i256
  store i256 %3, ptr %sp3, align 16
  %4 = icmp ult i64 %contract.input.len, 4
  %5 = zext i1 %4 to i256
  store i256 %5, ptr %arg.stack.addr, align 16
  %gas.remaining101.pre2566 = load i64, ptr %gas.remaining.addr, align 8
  br i1 %4, label %OP32.JUMPDEST, label %OP8.PUSH0

OP8.PUSH0:                                        ; preds = %OP3.PUSH1
  %6 = add i64 %gas.remaining101.pre2566, -33
  %7 = icmp ult i64 %gas.remaining101.pre2566, 33
  store i64 %6, ptr %gas.remaining.addr, align 8
  br i1 %7, label %return, label %OP8.PUSH0.contd22, !prof !2, !annotation !3

OP8.PUSH0.contd22:                                ; preds = %OP8.PUSH0
  store i256 0, ptr %arg.stack.addr, align 16
  %8 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 72
  %arg.contract.addr.val2126 = load ptr, ptr %8, align 8
  %9 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 0, ptr %arg.contract.addr.val2126, i64 %contract.input.len)
  %10 = lshr i256 %9, 224
  store i256 %10, ptr %arg.stack.addr, align 16
  %sp40 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 2
  store i256 107354813, ptr %sp40, align 16
  %11 = icmp eq i256 %10, 107354813
  %12 = zext i1 %11 to i256
  store i256 %12, ptr %sp3, align 16
  br i1 %11, label %OP36.JUMPDEST, label %OP17.DUP1

OP17.DUP1:                                        ; preds = %OP8.PUSH0.contd22
  %13 = add i64 %gas.remaining101.pre2566, -55
  %14 = icmp ult i64 %6, 22
  store i64 %13, ptr %gas.remaining.addr, align 8
  br i1 %14, label %return, label %OP17.DUP1.contd52, !prof !2, !annotation !3

OP17.DUP1.contd52:                                ; preds = %OP17.DUP1
  store i256 2894061151, ptr %sp40, align 16
  %15 = icmp eq i256 %10, 2894061151
  %16 = zext i1 %15 to i256
  store i256 %16, ptr %sp3, align 16
  %17 = add i64 %gas.remaining101.pre2566, -77
  %18 = icmp ult i64 %13, 22
  store i64 %17, ptr %gas.remaining.addr, align 8
  br i1 %15, label %OP66.JUMPDEST.thread, label %OP22.DUP1

OP22.DUP1:                                        ; preds = %OP17.DUP1.contd52
  br i1 %18, label %return, label %OP22.DUP1.contd69, !prof !2, !annotation !3

OP22.DUP1.contd69:                                ; preds = %OP22.DUP1
  store i256 3486268094, ptr %sp40, align 16
  %19 = icmp eq i256 %10, 3486268094
  %20 = zext i1 %19 to i256
  store i256 %20, ptr %sp3, align 16
  %21 = add i64 %gas.remaining101.pre2566, -99
  %22 = icmp ult i64 %17, 22
  store i64 %21, ptr %gas.remaining.addr, align 8
  br i1 %19, label %OP109.JUMPDEST.thread, label %OP27.DUP1

OP27.DUP1:                                        ; preds = %OP22.DUP1.contd69
  br i1 %22, label %return, label %OP27.DUP1.contd86, !prof !2, !annotation !3

OP27.DUP1.contd86:                                ; preds = %OP27.DUP1
  store i256 3901915068, ptr %sp40, align 16
  %23 = icmp eq i256 %10, 3901915068
  %24 = zext i1 %23 to i256
  store i256 %24, ptr %sp3, align 16
  br i1 %23, label %OP139.JUMPDEST.thread, label %OP32.JUMPDEST

OP32.JUMPDEST.loopexit:                           ; preds = %dynamic_jump_table
  %gas.remaining101.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP32.JUMPDEST

OP32.JUMPDEST:                                    ; preds = %OP32.JUMPDEST.loopexit, %OP27.DUP1.contd86, %OP3.PUSH1
  %gas.remaining101 = phi i64 [ %gas.remaining101.pre2566, %OP3.PUSH1 ], [ %21, %OP27.DUP1.contd86 ], [ %gas.remaining101.pre, %OP32.JUMPDEST.loopexit ]
  %len.addr.0 = phi i64 [ 0, %OP3.PUSH1 ], [ 1, %OP27.DUP1.contd86 ], [ %len.addr.34, %OP32.JUMPDEST.loopexit ]
  %25 = add i64 %gas.remaining101, -6
  %26 = icmp ult i64 %gas.remaining101, 6
  store i64 %25, ptr %gas.remaining.addr, align 8
  br i1 %26, label %return, label %OP32.JUMPDEST.contd, !prof !2, !annotation !3

OP32.JUMPDEST.contd:                              ; preds = %OP32.JUMPDEST
  %27 = icmp ugt i64 %len.addr.0, 1022
  br i1 %27, label %return, label %OP33.PUSH0, !prof !2, !annotation !5

OP33.PUSH0:                                       ; preds = %OP32.JUMPDEST.contd
  %sp105 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.0
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp105, i8 0, i64 64, i1 false)
  %28 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp105, i8 16)
  %.not2124 = icmp eq i8 %28, 0
  %spec.select = select i1 %.not2124, i8 16, i8 %28, !prof !4
  br label %return

OP36.JUMPDEST.loopexit:                           ; preds = %dynamic_jump_table
  %gas.remaining112.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP36.JUMPDEST

OP36.JUMPDEST:                                    ; preds = %OP36.JUMPDEST.loopexit, %OP8.PUSH0.contd22
  %gas.remaining112 = phi i64 [ %6, %OP8.PUSH0.contd22 ], [ %gas.remaining112.pre, %OP36.JUMPDEST.loopexit ]
  %len.addr.1 = phi i64 [ 1, %OP8.PUSH0.contd22 ], [ %len.addr.34, %OP36.JUMPDEST.loopexit ]
  %29 = add i64 %gas.remaining112, -22
  %30 = icmp ult i64 %gas.remaining112, 22
  store i64 %29, ptr %gas.remaining.addr, align 8
  br i1 %30, label %return, label %OP36.JUMPDEST.contd, !prof !2, !annotation !3

OP36.JUMPDEST.contd:                              ; preds = %OP36.JUMPDEST
  %31 = icmp ugt i64 %len.addr.1, 1021
  br i1 %31, label %return, label %OP37.CALLVALUE, !prof !2, !annotation !5

OP37.CALLVALUE:                                   ; preds = %OP36.JUMPDEST.contd
  %32 = add nuw nsw i64 %len.addr.1, 1
  %contract.call_value.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value = load i256, ptr %contract.call_value.addr, align 16
  %sp116 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.1
  store i256 %contract.call_value, ptr %sp116, align 16
  %sp120 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %32
  %33 = icmp eq i256 %contract.call_value, 0
  %34 = zext i1 %33 to i256
  store i256 %34, ptr %sp120, align 16
  br i1 %33, label %OP45.JUMPDEST, label %OP42.PUSH0

OP42.PUSH0:                                       ; preds = %OP37.CALLVALUE
  %35 = add i64 %gas.remaining112, -27
  %36 = icmp ult i64 %29, 5
  store i64 %35, ptr %gas.remaining.addr, align 8
  br i1 %36, label %return, label %OP42.PUSH0.contd130, !prof !2, !annotation !3

OP42.PUSH0.contd130:                              ; preds = %OP42.PUSH0
  store i256 0, ptr %sp120, align 16
  %sp135 = getelementptr i256, ptr %sp116, i64 2
  store i256 0, ptr %sp135, align 16
  %37 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp120, i8 16)
  %.not2093 = icmp eq i8 %37, 0
  %spec.select1570 = select i1 %.not2093, i8 16, i8 %37, !prof !4
  br label %return

OP45.JUMPDEST.loopexit:                           ; preds = %dynamic_jump_table
  %gas.remaining138.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP45.JUMPDEST

OP45.JUMPDEST:                                    ; preds = %OP45.JUMPDEST.loopexit, %OP37.CALLVALUE
  %gas.remaining138 = phi i64 [ %29, %OP37.CALLVALUE ], [ %gas.remaining138.pre, %OP45.JUMPDEST.loopexit ]
  %len.addr.2 = phi i64 [ %32, %OP37.CALLVALUE ], [ %len.addr.34, %OP45.JUMPDEST.loopexit ]
  %38 = add i64 %gas.remaining138, -17
  %39 = icmp ult i64 %gas.remaining138, 17
  store i64 %38, ptr %gas.remaining.addr, align 8
  br i1 %39, label %return, label %OP45.JUMPDEST.contd, !prof !2, !annotation !3

OP45.JUMPDEST.contd:                              ; preds = %OP45.JUMPDEST
  %40 = icmp eq i64 %len.addr.2, 0
  %41 = add i64 %len.addr.2, -1024
  %42 = icmp ult i64 %41, -1023
  %43 = select i1 %40, i8 91, i8 92
  br i1 %42, label %return, label %OP46.POP, !prof !2

OP46.POP:                                         ; preds = %OP45.JUMPDEST.contd
  %44 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.2
  %sp143 = getelementptr i256, ptr %44, i64 -1
  store i256 86, ptr %sp143, align 16
  br label %OP145.JUMPDEST

OP50.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining145 = load i64, ptr %gas.remaining.addr, align 8
  %45 = add i64 %gas.remaining145, -27
  %46 = icmp ult i64 %gas.remaining145, 27
  store i64 %45, ptr %gas.remaining.addr, align 8
  br i1 %46, label %return, label %OP50.JUMPDEST.contd, !prof !2, !annotation !3

OP50.JUMPDEST.contd:                              ; preds = %OP50.JUMPDEST
  %47 = icmp eq i64 %len.addr.34, 0
  %48 = add i64 %len.addr.34, -1022
  %49 = icmp ult i64 %48, -1021
  %50 = select i1 %47, i8 91, i8 92
  br i1 %49, label %return, label %OP51.PUSH1, !prof !2

OP51.PUSH1:                                       ; preds = %OP50.JUMPDEST.contd
  %sp149 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 64, ptr %sp149, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  %ecx.memory.i = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !6, !noalias !9
  %ecx.memory.len.addr.i = getelementptr inbounds i8, ptr %ecx.memory.i, i64 16
  %ecx.memory.len.i = load i64, ptr %ecx.memory.len.addr.i, align 8, !noalias !11
  %ecx.memory.last_checkpoint.addr.i = getelementptr inbounds i8, ptr %ecx.memory.i, i64 48
  %ecx.memory.last_checkpoint.i = load i64, ptr %ecx.memory.last_checkpoint.addr.i, align 8, !noalias !11
  %51 = sub i64 %ecx.memory.len.i, %ecx.memory.last_checkpoint.i
  %52 = icmp ult i64 %51, 96
  br i1 %52, label %resize.i, label %OP52.MLOAD.contd, !prof !2

resize.i:                                         ; preds = %OP51.PUSH1
  %53 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !9
  %.not.i = icmp eq i8 %53, 0
  br i1 %.not.i, label %OP52.MLOAD.contd, label %return, !prof !4

OP52.MLOAD.contd:                                 ; preds = %OP51.PUSH1, %resize.i
  %ecx.memory.buffer.ptr.shared.addr.i = getelementptr inbounds i8, ptr %ecx.memory.i, i64 8
  %ecx.memory.buffer.ptr.shared.i = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i, align 8, !noalias !11
  %ecx.memory.buffer.ptr.i = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i, i64 %ecx.memory.last_checkpoint.i
  %slot.i = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i, i64 64
  %slot.value.i = load i256, ptr %slot.i, align 16, !noalias !11
  %54 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i)
  %55 = add nuw nsw i64 %len.addr.34, 2
  %sp155 = getelementptr i256, ptr %sp149, i64 1
  %sp158 = getelementptr i256, ptr %sp149, i64 -1
  %swap.b = load i256, ptr %sp158, align 16
  store i256 99, ptr %sp158, align 16
  store i256 %swap.b, ptr %sp149, align 16
  store i256 %54, ptr %sp155, align 16
  br label %OP237.JUMPDEST

OP58.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining165 = load i64, ptr %gas.remaining.addr, align 8
  %56 = add i64 %gas.remaining165, -19
  %57 = icmp ult i64 %gas.remaining165, 19
  store i64 %56, ptr %gas.remaining.addr, align 8
  br i1 %57, label %return, label %OP58.JUMPDEST.contd, !prof !2, !annotation !3

OP58.JUMPDEST.contd:                              ; preds = %OP58.JUMPDEST
  %58 = icmp eq i64 %len.addr.34, 0
  %59 = add i64 %len.addr.34, -1023
  %60 = icmp ult i64 %59, -1022
  %61 = select i1 %58, i8 91, i8 92
  br i1 %60, label %return, label %OP59.PUSH1, !prof !2

OP59.PUSH1:                                       ; preds = %OP58.JUMPDEST.contd
  %sp169 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 64, ptr %sp169, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !12)
  %ecx.memory.i2129 = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !12, !noalias !15
  %ecx.memory.len.addr.i2130 = getelementptr inbounds i8, ptr %ecx.memory.i2129, i64 16
  %ecx.memory.len.i2131 = load i64, ptr %ecx.memory.len.addr.i2130, align 8, !noalias !17
  %ecx.memory.last_checkpoint.addr.i2132 = getelementptr inbounds i8, ptr %ecx.memory.i2129, i64 48
  %ecx.memory.last_checkpoint.i2133 = load i64, ptr %ecx.memory.last_checkpoint.addr.i2132, align 8, !noalias !17
  %62 = sub i64 %ecx.memory.len.i2131, %ecx.memory.last_checkpoint.i2133
  %63 = icmp ult i64 %62, 96
  br i1 %63, label %resize.i2141, label %OP60.MLOAD.contd, !prof !2

resize.i2141:                                     ; preds = %OP59.PUSH1
  %64 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !15
  %.not.i2142 = icmp eq i8 %64, 0
  br i1 %.not.i2142, label %OP60.MLOAD.contd, label %return, !prof !4

OP60.MLOAD.contd:                                 ; preds = %OP59.PUSH1, %resize.i2141
  %ecx.memory.buffer.ptr.shared.addr.i2135 = getelementptr inbounds i8, ptr %ecx.memory.i2129, i64 8
  %ecx.memory.buffer.ptr.shared.i2136 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i2135, align 8, !noalias !17
  %ecx.memory.buffer.ptr.i2137 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i2136, i64 %ecx.memory.last_checkpoint.i2133
  %slot.i2138 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i2137, i64 64
  %slot.value.i2139 = load i256, ptr %slot.i2138, align 16, !noalias !17
  %65 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i2139)
  %sp179 = getelementptr i256, ptr %sp169, i64 1
  %sp183 = getelementptr i256, ptr %sp169, i64 -1
  %swap.b184 = load i256, ptr %sp183, align 16
  store i256 %swap.b184, ptr %sp179, align 16
  %66 = sub i256 %swap.b184, %65
  store i256 %66, ptr %sp183, align 16
  store i256 %65, ptr %sp169, align 16
  %67 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp183, i8 2)
  %.not2122 = icmp eq i8 %67, 0
  %spec.select1571 = select i1 %.not2122, i8 2, i8 %67, !prof !4
  br label %return

OP66.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining198 = load i64, ptr %gas.remaining.addr, align 8
  %68 = add i64 %gas.remaining198, -22
  %69 = icmp ult i64 %gas.remaining198, 22
  store i64 %68, ptr %gas.remaining.addr, align 8
  br i1 %69, label %return, label %OP66.JUMPDEST.contd, !prof !2, !annotation !3

OP66.JUMPDEST.thread:                             ; preds = %OP17.DUP1.contd52
  br i1 %18, label %return, label %OP67.CALLVALUE, !prof !2, !annotation !3

OP66.JUMPDEST.contd:                              ; preds = %OP66.JUMPDEST
  %70 = icmp ugt i64 %len.addr.34, 1021
  br i1 %70, label %return, label %OP67.CALLVALUE, !prof !18, !annotation !5

OP67.CALLVALUE:                                   ; preds = %OP66.JUMPDEST.thread, %OP66.JUMPDEST.contd
  %len.addr.322462248 = phi i64 [ %len.addr.34, %OP66.JUMPDEST.contd ], [ 1, %OP66.JUMPDEST.thread ]
  %71 = phi i64 [ %68, %OP66.JUMPDEST.contd ], [ %17, %OP66.JUMPDEST.thread ]
  %72 = add nuw nsw i64 %len.addr.322462248, 1
  %contract.call_value.addr202 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value203 = load i256, ptr %contract.call_value.addr202, align 16
  %sp204 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.322462248
  store i256 %contract.call_value203, ptr %sp204, align 16
  %sp208 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %72
  %73 = icmp eq i256 %contract.call_value203, 0
  %74 = zext i1 %73 to i256
  store i256 %74, ptr %sp208, align 16
  br i1 %73, label %OP75.JUMPDEST, label %OP72.PUSH0

OP72.PUSH0:                                       ; preds = %OP67.CALLVALUE
  %75 = add i64 %71, -5
  %76 = icmp ult i64 %71, 5
  store i64 %75, ptr %gas.remaining.addr, align 8
  br i1 %76, label %return, label %OP72.PUSH0.contd218, !prof !2, !annotation !3

OP72.PUSH0.contd218:                              ; preds = %OP72.PUSH0
  store i256 0, ptr %sp208, align 16
  %sp223 = getelementptr i256, ptr %sp204, i64 2
  store i256 0, ptr %sp223, align 16
  %77 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp208, i8 16)
  %.not2119 = icmp eq i8 %77, 0
  %spec.select1572 = select i1 %.not2119, i8 16, i8 %77, !prof !4
  br label %return

OP75.JUMPDEST.loopexit:                           ; preds = %dynamic_jump_table
  %gas.remaining226.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP75.JUMPDEST

OP75.JUMPDEST:                                    ; preds = %OP75.JUMPDEST.loopexit, %OP67.CALLVALUE
  %gas.remaining226 = phi i64 [ %71, %OP67.CALLVALUE ], [ %gas.remaining226.pre, %OP75.JUMPDEST.loopexit ]
  %len.addr.4 = phi i64 [ %72, %OP67.CALLVALUE ], [ %len.addr.34, %OP75.JUMPDEST.loopexit ]
  %78 = add i64 %gas.remaining226, -46
  %79 = icmp ult i64 %gas.remaining226, 46
  store i64 %78, ptr %gas.remaining.addr, align 8
  br i1 %79, label %return, label %OP75.JUMPDEST.contd, !prof !2, !annotation !3

OP75.JUMPDEST.contd:                              ; preds = %OP75.JUMPDEST
  %80 = icmp eq i64 %len.addr.4, 0
  %81 = add i64 %len.addr.4, -1021
  %82 = icmp ult i64 %81, -1020
  %83 = select i1 %80, i8 91, i8 92
  br i1 %82, label %return, label %OP76.POP, !prof !2

OP76.POP:                                         ; preds = %OP75.JUMPDEST.contd
  %84 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.4
  %sp231 = getelementptr i256, ptr %84, i64 -1
  store i256 146, ptr %sp231, align 16
  %sp237 = getelementptr i256, ptr %84, i64 1
  %85 = add nuw nsw i64 %len.addr.4, 3
  %sp241 = getelementptr i256, ptr %84, i64 2
  store i256 141, ptr %84, align 16
  store i256 %3, ptr %sp237, align 16
  store i256 4, ptr %sp241, align 16
  br label %OP304.JUMPDEST

OP90.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining275 = load i64, ptr %gas.remaining.addr, align 8
  %86 = add i64 %gas.remaining275, -12
  %87 = icmp ult i64 %gas.remaining275, 12
  store i64 %86, ptr %gas.remaining.addr, align 8
  br i1 %87, label %return, label %OP90.JUMPDEST.contd, !prof !2, !annotation !3

OP90.JUMPDEST.contd:                              ; preds = %OP90.JUMPDEST
  %88 = icmp ugt i64 %len.addr.34, 1023
  br i1 %88, label %return, label %OP150.JUMPDEST, !prof !2, !annotation !5

OP93.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining279 = load i64, ptr %gas.remaining.addr, align 8
  %89 = add i64 %gas.remaining279, -27
  %90 = icmp ult i64 %gas.remaining279, 27
  store i64 %89, ptr %gas.remaining.addr, align 8
  br i1 %90, label %return, label %OP93.JUMPDEST.contd, !prof !2, !annotation !3

OP93.JUMPDEST.contd:                              ; preds = %OP93.JUMPDEST
  %91 = add i64 %len.addr.34, -1022
  %92 = icmp ult i64 %91, -1021
  br i1 %92, label %return.loopexit.split.loop.exit2320, label %OP94.PUSH1, !prof !2

OP94.PUSH1:                                       ; preds = %OP93.JUMPDEST.contd
  %sp283 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 64, ptr %sp283, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !19)
  %ecx.memory.i2145 = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !19, !noalias !22
  %ecx.memory.len.addr.i2146 = getelementptr inbounds i8, ptr %ecx.memory.i2145, i64 16
  %ecx.memory.len.i2147 = load i64, ptr %ecx.memory.len.addr.i2146, align 8, !noalias !24
  %ecx.memory.last_checkpoint.addr.i2148 = getelementptr inbounds i8, ptr %ecx.memory.i2145, i64 48
  %ecx.memory.last_checkpoint.i2149 = load i64, ptr %ecx.memory.last_checkpoint.addr.i2148, align 8, !noalias !24
  %93 = sub i64 %ecx.memory.len.i2147, %ecx.memory.last_checkpoint.i2149
  %94 = icmp ult i64 %93, 96
  br i1 %94, label %resize.i2157, label %OP95.MLOAD.contd, !prof !2

resize.i2157:                                     ; preds = %OP94.PUSH1
  %95 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !22
  %.not.i2158 = icmp eq i8 %95, 0
  br i1 %.not.i2158, label %OP95.MLOAD.contd, label %return, !prof !4

OP95.MLOAD.contd:                                 ; preds = %OP94.PUSH1, %resize.i2157
  %ecx.memory.buffer.ptr.shared.addr.i2151 = getelementptr inbounds i8, ptr %ecx.memory.i2145, i64 8
  %ecx.memory.buffer.ptr.shared.i2152 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i2151, align 8, !noalias !24
  %ecx.memory.buffer.ptr.i2153 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i2152, i64 %ecx.memory.last_checkpoint.i2149
  %slot.i2154 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i2153, i64 64
  %slot.value.i2155 = load i256, ptr %slot.i2154, align 16, !noalias !24
  %96 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i2155)
  %97 = add nuw nsw i64 %len.addr.34, 2
  %sp291 = getelementptr i256, ptr %sp283, i64 1
  %sp295 = getelementptr i256, ptr %sp283, i64 -1
  %swap.b296 = load i256, ptr %sp295, align 16
  store i256 159, ptr %sp295, align 16
  store i256 %swap.b296, ptr %sp283, align 16
  store i256 %96, ptr %sp291, align 16
  br label %OP356.JUMPDEST

OP101.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining303 = load i64, ptr %gas.remaining.addr, align 8
  %98 = add i64 %gas.remaining303, -19
  %99 = icmp ult i64 %gas.remaining303, 19
  store i64 %98, ptr %gas.remaining.addr, align 8
  br i1 %99, label %return, label %OP101.JUMPDEST.contd, !prof !2, !annotation !3

OP101.JUMPDEST.contd:                             ; preds = %OP101.JUMPDEST
  %100 = icmp eq i64 %len.addr.34, 0
  %101 = add i64 %len.addr.34, -1023
  %102 = icmp ult i64 %101, -1022
  %103 = select i1 %100, i8 91, i8 92
  br i1 %102, label %return, label %OP102.PUSH1, !prof !2

OP102.PUSH1:                                      ; preds = %OP101.JUMPDEST.contd
  %sp307 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 64, ptr %sp307, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !25)
  %ecx.memory.i2161 = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !25, !noalias !28
  %ecx.memory.len.addr.i2162 = getelementptr inbounds i8, ptr %ecx.memory.i2161, i64 16
  %ecx.memory.len.i2163 = load i64, ptr %ecx.memory.len.addr.i2162, align 8, !noalias !30
  %ecx.memory.last_checkpoint.addr.i2164 = getelementptr inbounds i8, ptr %ecx.memory.i2161, i64 48
  %ecx.memory.last_checkpoint.i2165 = load i64, ptr %ecx.memory.last_checkpoint.addr.i2164, align 8, !noalias !30
  %104 = sub i64 %ecx.memory.len.i2163, %ecx.memory.last_checkpoint.i2165
  %105 = icmp ult i64 %104, 96
  br i1 %105, label %resize.i2173, label %OP103.MLOAD.contd, !prof !2

resize.i2173:                                     ; preds = %OP102.PUSH1
  %106 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !28
  %.not.i2174 = icmp eq i8 %106, 0
  br i1 %.not.i2174, label %OP103.MLOAD.contd, label %return, !prof !4

OP103.MLOAD.contd:                                ; preds = %OP102.PUSH1, %resize.i2173
  %ecx.memory.buffer.ptr.shared.addr.i2167 = getelementptr inbounds i8, ptr %ecx.memory.i2161, i64 8
  %ecx.memory.buffer.ptr.shared.i2168 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i2167, align 8, !noalias !30
  %ecx.memory.buffer.ptr.i2169 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i2168, i64 %ecx.memory.last_checkpoint.i2165
  %slot.i2170 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i2169, i64 64
  %slot.value.i2171 = load i256, ptr %slot.i2170, align 16, !noalias !30
  %107 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i2171)
  %sp317 = getelementptr i256, ptr %sp307, i64 1
  %sp321 = getelementptr i256, ptr %sp307, i64 -1
  %swap.b322 = load i256, ptr %sp321, align 16
  store i256 %swap.b322, ptr %sp317, align 16
  %108 = sub i256 %swap.b322, %107
  store i256 %108, ptr %sp321, align 16
  store i256 %107, ptr %sp307, align 16
  %109 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp321, i8 2)
  %.not2116 = icmp eq i8 %109, 0
  %spec.select1573 = select i1 %.not2116, i8 2, i8 %109, !prof !4
  br label %return

OP109.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining336 = load i64, ptr %gas.remaining.addr, align 8
  %110 = add i64 %gas.remaining336, -22
  %111 = icmp ult i64 %gas.remaining336, 22
  store i64 %110, ptr %gas.remaining.addr, align 8
  br i1 %111, label %return, label %OP109.JUMPDEST.contd, !prof !2, !annotation !3

OP109.JUMPDEST.thread:                            ; preds = %OP22.DUP1.contd69
  br i1 %22, label %return, label %OP110.CALLVALUE, !prof !2, !annotation !3

OP109.JUMPDEST.contd:                             ; preds = %OP109.JUMPDEST
  %112 = icmp ugt i64 %len.addr.34, 1021
  br i1 %112, label %return, label %OP110.CALLVALUE, !prof !31, !annotation !5

OP110.CALLVALUE:                                  ; preds = %OP109.JUMPDEST.thread, %OP109.JUMPDEST.contd
  %len.addr.522552257 = phi i64 [ %len.addr.34, %OP109.JUMPDEST.contd ], [ 1, %OP109.JUMPDEST.thread ]
  %113 = phi i64 [ %110, %OP109.JUMPDEST.contd ], [ %21, %OP109.JUMPDEST.thread ]
  %114 = add nuw nsw i64 %len.addr.522552257, 1
  %contract.call_value.addr340 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value341 = load i256, ptr %contract.call_value.addr340, align 16
  %sp342 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.522552257
  store i256 %contract.call_value341, ptr %sp342, align 16
  %sp346 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %114
  %115 = icmp eq i256 %contract.call_value341, 0
  %116 = zext i1 %115 to i256
  store i256 %116, ptr %sp346, align 16
  br i1 %115, label %OP118.JUMPDEST, label %OP115.PUSH0

OP115.PUSH0:                                      ; preds = %OP110.CALLVALUE
  %117 = add i64 %113, -5
  %118 = icmp ult i64 %113, 5
  store i64 %117, ptr %gas.remaining.addr, align 8
  br i1 %118, label %return, label %OP115.PUSH0.contd356, !prof !2, !annotation !3

OP115.PUSH0.contd356:                             ; preds = %OP115.PUSH0
  store i256 0, ptr %sp346, align 16
  %sp361 = getelementptr i256, ptr %sp342, i64 2
  store i256 0, ptr %sp361, align 16
  %119 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp346, i8 16)
  %.not2114 = icmp eq i8 %119, 0
  %spec.select1574 = select i1 %.not2114, i8 16, i8 %119, !prof !4
  br label %return

OP118.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining364.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP118.JUMPDEST

OP118.JUMPDEST:                                   ; preds = %OP118.JUMPDEST.loopexit, %OP110.CALLVALUE
  %gas.remaining364 = phi i64 [ %113, %OP110.CALLVALUE ], [ %gas.remaining364.pre, %OP118.JUMPDEST.loopexit ]
  %len.addr.6 = phi i64 [ %114, %OP110.CALLVALUE ], [ %len.addr.34, %OP118.JUMPDEST.loopexit ]
  %120 = add i64 %gas.remaining364, -17
  %121 = icmp ult i64 %gas.remaining364, 17
  store i64 %120, ptr %gas.remaining.addr, align 8
  br i1 %121, label %return, label %OP118.JUMPDEST.contd, !prof !2, !annotation !3

OP118.JUMPDEST.contd:                             ; preds = %OP118.JUMPDEST
  %122 = icmp eq i64 %len.addr.6, 0
  %123 = add i64 %len.addr.6, -1024
  %124 = icmp ult i64 %123, -1023
  %125 = select i1 %122, i8 91, i8 92
  br i1 %124, label %return, label %OP119.POP, !prof !2

OP119.POP:                                        ; preds = %OP118.JUMPDEST.contd
  %126 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.6
  %sp369 = getelementptr i256, ptr %126, i64 -1
  store i256 188, ptr %sp369, align 16
  br label %OP162.JUMPDEST

OP123.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining371 = load i64, ptr %gas.remaining.addr, align 8
  %127 = add i64 %gas.remaining371, -27
  %128 = icmp ult i64 %gas.remaining371, 27
  store i64 %127, ptr %gas.remaining.addr, align 8
  br i1 %128, label %return, label %OP123.JUMPDEST.contd, !prof !2, !annotation !3

OP123.JUMPDEST.contd:                             ; preds = %OP123.JUMPDEST
  %129 = add i64 %len.addr.34, -1022
  %130 = icmp ult i64 %129, -1021
  br i1 %130, label %return.loopexit.split.loop.exit2324, label %OP124.PUSH1, !prof !2

OP124.PUSH1:                                      ; preds = %OP123.JUMPDEST.contd
  %sp375 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 64, ptr %sp375, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !32)
  %ecx.memory.i2177 = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !32, !noalias !35
  %ecx.memory.len.addr.i2178 = getelementptr inbounds i8, ptr %ecx.memory.i2177, i64 16
  %ecx.memory.len.i2179 = load i64, ptr %ecx.memory.len.addr.i2178, align 8, !noalias !37
  %ecx.memory.last_checkpoint.addr.i2180 = getelementptr inbounds i8, ptr %ecx.memory.i2177, i64 48
  %ecx.memory.last_checkpoint.i2181 = load i64, ptr %ecx.memory.last_checkpoint.addr.i2180, align 8, !noalias !37
  %131 = sub i64 %ecx.memory.len.i2179, %ecx.memory.last_checkpoint.i2181
  %132 = icmp ult i64 %131, 96
  br i1 %132, label %resize.i2189, label %OP125.MLOAD.contd, !prof !2

resize.i2189:                                     ; preds = %OP124.PUSH1
  %133 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !35
  %.not.i2190 = icmp eq i8 %133, 0
  br i1 %.not.i2190, label %OP125.MLOAD.contd, label %return, !prof !4

OP125.MLOAD.contd:                                ; preds = %OP124.PUSH1, %resize.i2189
  %ecx.memory.buffer.ptr.shared.addr.i2183 = getelementptr inbounds i8, ptr %ecx.memory.i2177, i64 8
  %ecx.memory.buffer.ptr.shared.i2184 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i2183, align 8, !noalias !37
  %ecx.memory.buffer.ptr.i2185 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i2184, i64 %ecx.memory.last_checkpoint.i2181
  %slot.i2186 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i2185, i64 64
  %slot.value.i2187 = load i256, ptr %slot.i2186, align 16, !noalias !37
  %134 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i2187)
  %135 = add nuw nsw i64 %len.addr.34, 2
  %sp383 = getelementptr i256, ptr %sp375, i64 1
  %sp387 = getelementptr i256, ptr %sp375, i64 -1
  %swap.b388 = load i256, ptr %sp387, align 16
  store i256 201, ptr %sp387, align 16
  store i256 %swap.b388, ptr %sp375, align 16
  store i256 %134, ptr %sp383, align 16
  br label %OP411.JUMPDEST

OP131.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining395 = load i64, ptr %gas.remaining.addr, align 8
  %136 = add i64 %gas.remaining395, -19
  %137 = icmp ult i64 %gas.remaining395, 19
  store i64 %136, ptr %gas.remaining.addr, align 8
  br i1 %137, label %return, label %OP131.JUMPDEST.contd, !prof !2, !annotation !3

OP131.JUMPDEST.contd:                             ; preds = %OP131.JUMPDEST
  %138 = icmp eq i64 %len.addr.34, 0
  %139 = add i64 %len.addr.34, -1023
  %140 = icmp ult i64 %139, -1022
  %141 = select i1 %138, i8 91, i8 92
  br i1 %140, label %return, label %OP132.PUSH1, !prof !2

OP132.PUSH1:                                      ; preds = %OP131.JUMPDEST.contd
  %sp399 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 64, ptr %sp399, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !38)
  %ecx.memory.i2193 = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !38, !noalias !41
  %ecx.memory.len.addr.i2194 = getelementptr inbounds i8, ptr %ecx.memory.i2193, i64 16
  %ecx.memory.len.i2195 = load i64, ptr %ecx.memory.len.addr.i2194, align 8, !noalias !43
  %ecx.memory.last_checkpoint.addr.i2196 = getelementptr inbounds i8, ptr %ecx.memory.i2193, i64 48
  %ecx.memory.last_checkpoint.i2197 = load i64, ptr %ecx.memory.last_checkpoint.addr.i2196, align 8, !noalias !43
  %142 = sub i64 %ecx.memory.len.i2195, %ecx.memory.last_checkpoint.i2197
  %143 = icmp ult i64 %142, 96
  br i1 %143, label %resize.i2205, label %OP133.MLOAD.contd, !prof !2

resize.i2205:                                     ; preds = %OP132.PUSH1
  %144 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !41
  %.not.i2206 = icmp eq i8 %144, 0
  br i1 %.not.i2206, label %OP133.MLOAD.contd, label %return, !prof !4

OP133.MLOAD.contd:                                ; preds = %OP132.PUSH1, %resize.i2205
  %ecx.memory.buffer.ptr.shared.addr.i2199 = getelementptr inbounds i8, ptr %ecx.memory.i2193, i64 8
  %ecx.memory.buffer.ptr.shared.i2200 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i2199, align 8, !noalias !43
  %ecx.memory.buffer.ptr.i2201 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i2200, i64 %ecx.memory.last_checkpoint.i2197
  %slot.i2202 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i2201, i64 64
  %slot.value.i2203 = load i256, ptr %slot.i2202, align 16, !noalias !43
  %145 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i2203)
  %sp409 = getelementptr i256, ptr %sp399, i64 1
  %sp413 = getelementptr i256, ptr %sp399, i64 -1
  %swap.b414 = load i256, ptr %sp413, align 16
  store i256 %swap.b414, ptr %sp409, align 16
  %146 = sub i256 %swap.b414, %145
  store i256 %146, ptr %sp413, align 16
  store i256 %145, ptr %sp399, align 16
  %147 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp413, i8 2)
  %.not2112 = icmp eq i8 %147, 0
  %spec.select1575 = select i1 %.not2112, i8 2, i8 %147, !prof !4
  br label %return

OP139.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining428 = load i64, ptr %gas.remaining.addr, align 8
  %148 = add i64 %gas.remaining428, -15
  %149 = icmp ult i64 %gas.remaining428, 15
  store i64 %148, ptr %gas.remaining.addr, align 8
  br i1 %149, label %return, label %OP139.JUMPDEST.contd, !prof !2, !annotation !3

OP139.JUMPDEST.thread:                            ; preds = %OP27.DUP1.contd86
  %150 = add i64 %gas.remaining101.pre2566, -114
  %151 = icmp ult i64 %21, 15
  store i64 %150, ptr %gas.remaining.addr, align 8
  br i1 %151, label %return, label %OP140.PUSH2, !prof !2, !annotation !3

OP139.JUMPDEST.contd:                             ; preds = %OP139.JUMPDEST
  %152 = icmp ugt i64 %len.addr.34, 1022
  br i1 %152, label %return, label %OP140.PUSH2, !prof !44, !annotation !5

OP140.PUSH2:                                      ; preds = %OP139.JUMPDEST.thread, %OP139.JUMPDEST.contd
  %gas.remaining5112550 = phi i64 [ %148, %OP139.JUMPDEST.contd ], [ %150, %OP139.JUMPDEST.thread ]
  %len.addr.722642266 = phi i64 [ %len.addr.34, %OP139.JUMPDEST.contd ], [ 1, %OP139.JUMPDEST.thread ]
  %153 = add nuw nsw i64 %len.addr.722642266, 1
  %sp432 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.722642266
  store i256 218, ptr %sp432, align 16
  br label %OP169.JUMPDEST

OP143.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining434 = load i64, ptr %gas.remaining.addr, align 8
  %154 = add i64 %gas.remaining434, -1
  %155 = icmp eq i64 %gas.remaining434, 0
  store i64 %154, ptr %gas.remaining.addr, align 8
  %spec.select1576 = select i1 %155, i8 80, i8 1, !prof !2
  br label %return, !annotation !3

OP145.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining437.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP145.JUMPDEST

OP145.JUMPDEST:                                   ; preds = %OP145.JUMPDEST.loopexit, %OP46.POP
  %gas.remaining437 = phi i64 [ %38, %OP46.POP ], [ %gas.remaining437.pre, %OP145.JUMPDEST.loopexit ]
  %len.addr.8 = phi i64 [ %len.addr.2, %OP46.POP ], [ %len.addr.34, %OP145.JUMPDEST.loopexit ]
  %156 = add i64 %gas.remaining437, -14
  %157 = icmp ult i64 %gas.remaining437, 14
  store i64 %156, ptr %gas.remaining.addr, align 8
  br i1 %157, label %return, label %OP145.JUMPDEST.contd, !prof !2, !annotation !3

OP145.JUMPDEST.contd:                             ; preds = %OP145.JUMPDEST
  %158 = icmp eq i64 %len.addr.8, 0
  %159 = add i64 %len.addr.8, -1023
  %160 = icmp ult i64 %159, -1022
  %161 = select i1 %158, i8 91, i8 92
  br i1 %160, label %return, label %OP146.PUSH0, !prof !2

OP146.PUSH0:                                      ; preds = %OP145.JUMPDEST.contd
  %sp441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.8
  store i256 0, ptr %sp441, align 16
  %162 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp441, i8 18)
  %.not2094 = icmp eq i8 %162, 0
  br i1 %.not2094, label %OP148.DUP2, label %return, !prof !4

OP148.DUP2:                                       ; preds = %OP146.PUSH0
  %163 = add nuw nsw i64 %len.addr.8, 1
  %sp445 = getelementptr i256, ptr %sp441, i64 -1
  %dup2446 = load i256, ptr %sp445, align 16
  %sp447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %163
  store i256 %dup2446, ptr %sp447, align 16
  br label %dynamic_jump_table.preheader

dynamic_jump_table.preheader:                     ; preds = %OP148.DUP2, %OP163.PUSH0, %OP218.PUSH0, %OP262.PUSH0
  %len.addr.34.ph = phi i64 [ %len.addr.9, %OP163.PUSH0 ], [ %265, %OP262.PUSH0 ], [ %226, %OP218.PUSH0 ], [ %163, %OP148.DUP2 ]
  %.ph = phi i256 [ %swap.b507, %OP163.PUSH0 ], [ %swap.b813, %OP262.PUSH0 ], [ %swap.b681, %OP218.PUSH0 ], [ %dup2446, %OP148.DUP2 ]
  %ecx.memory.addr.i2224 = getelementptr inbounds i8, ptr %arg.ecx.addr, i64 40
  br label %dynamic_jump_table

OP150.JUMPDESTthread-pre-split:                   ; preds = %dynamic_jump_table
  %gas.remaining451.pr = load i64, ptr %gas.remaining.addr, align 8
  br label %OP150.JUMPDEST

OP150.JUMPDEST:                                   ; preds = %OP150.JUMPDESTthread-pre-split, %OP90.JUMPDEST.contd
  %gas.remaining451 = phi i64 [ %gas.remaining451.pr, %OP150.JUMPDESTthread-pre-split ], [ %86, %OP90.JUMPDEST.contd ]
  %164 = add i64 %gas.remaining451, -53
  %165 = icmp ult i64 %gas.remaining451, 53
  store i64 %164, ptr %gas.remaining.addr, align 8
  br i1 %165, label %return, label %OP150.JUMPDEST.contd, !prof !2, !annotation !3

OP150.JUMPDEST.contd:                             ; preds = %OP150.JUMPDEST
  %166 = add i64 %len.addr.34, -1022
  %167 = icmp ult i64 %166, -1020
  br i1 %167, label %return.loopexit.split.loop.exit2328, label %OP151.PUSH0, !prof !2

OP151.PUSH0:                                      ; preds = %OP150.JUMPDEST.contd
  %sp455 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 0, ptr %sp455, align 16
  %sp457 = getelementptr i256, ptr %sp455, i64 -1
  %dup2458 = load i256, ptr %sp457, align 16
  %sp459 = getelementptr i256, ptr %sp455, i64 1
  %sp461 = getelementptr i256, ptr %sp455, i64 2
  store i256 18446744073709551615, ptr %sp461, align 16
  %168 = and i256 %dup2458, 18446744073709551615
  store i256 %168, ptr %sp459, align 16
  %169 = tail call i8 @__revmc_builtin_blockhash(ptr nonnull %arg.ecx.addr, ptr nonnull %sp459)
  %.not2118 = icmp eq i8 %169, 0
  br i1 %.not2118, label %OP156.SWAP1, label %return, !prof !4

OP156.SWAP1:                                      ; preds = %OP151.PUSH0
  %swap.a472 = load i256, ptr %sp459, align 16
  %swap.b474 = load i256, ptr %sp455, align 16
  store i256 %swap.b474, ptr %sp459, align 16
  %sp479 = getelementptr i256, ptr %sp455, i64 -2
  %swap.b480 = load i256, ptr %sp479, align 16
  store i256 %swap.a472, ptr %sp479, align 16
  %swap.b485 = load i256, ptr %sp457, align 16
  store i256 %swap.b480, ptr %sp457, align 16
  store i256 %swap.b485, ptr %sp455, align 16
  %170 = add nsw i64 %len.addr.34, -1
  br label %dynamic_jump_table.backedge

dynamic_jump_table.backedge:                      ; preds = %OP156.SWAP1, %OP216.JUMP, %OP234.POP, %OP252.SWAP3, %OP286.POP, %OP299.SWAP3, %OP328.SWAP2, %OP337.PUSH0, %OP353.POP, %OP371.SWAP3, %OP377.PUSH0, %OP394.SWAP1, %OP408.POP, %OP426.SWAP3, %OP460.PUSH1, %OP501.SWAP3, %OP529.SWAP4
  %.sink = phi i64 [ %170, %OP156.SWAP1 ], [ %219, %OP216.JUMP ], [ %240, %OP234.POP ], [ %253, %OP252.SWAP3 ], [ %287, %OP286.POP ], [ %300, %OP299.SWAP3 ], [ %327, %OP328.SWAP2 ], [ %332, %OP337.PUSH0 ], [ %344, %OP353.POP ], [ %355, %OP371.SWAP3 ], [ %361, %OP377.PUSH0 ], [ %371, %OP394.SWAP1 ], [ %383, %OP408.POP ], [ %394, %OP426.SWAP3 ], [ %424, %OP460.PUSH1 ], [ %457, %OP501.SWAP3 ], [ %478, %OP529.SWAP4 ]
  %sp488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %.sink
  %.be = load i256, ptr %sp488, align 16
  br label %dynamic_jump_table

OP162.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining490.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP162.JUMPDEST

OP162.JUMPDEST:                                   ; preds = %OP162.JUMPDEST.loopexit, %OP119.POP
  %gas.remaining490 = phi i64 [ %120, %OP119.POP ], [ %gas.remaining490.pre, %OP162.JUMPDEST.loopexit ]
  %len.addr.9 = phi i64 [ %len.addr.6, %OP119.POP ], [ %len.addr.34, %OP162.JUMPDEST.loopexit ]
  %171 = add i64 %gas.remaining490, -21
  %172 = icmp ult i64 %gas.remaining490, 21
  store i64 %171, ptr %gas.remaining.addr, align 8
  br i1 %172, label %return, label %OP162.JUMPDEST.contd, !prof !2, !annotation !3

OP162.JUMPDEST.contd:                             ; preds = %OP162.JUMPDEST
  %173 = icmp eq i64 %len.addr.9, 0
  %174 = add i64 %len.addr.9, -1023
  %175 = icmp ult i64 %174, -1022
  %176 = select i1 %173, i8 91, i8 92
  br i1 %175, label %return, label %OP163.PUSH0, !prof !2

OP163.PUSH0:                                      ; preds = %OP162.JUMPDEST.contd
  %sp494 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.9
  %contract.caller.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller = load i160, ptr %contract.caller.addr, align 16
  %177 = tail call i160 @llvm.bswap.i160(i160 %contract.caller)
  %178 = zext i160 %177 to i256
  %sp496 = getelementptr i256, ptr %sp494, i64 1
  store i256 0, ptr %sp496, align 16
  %sp506 = getelementptr i256, ptr %sp494, i64 -1
  %swap.b507 = load i256, ptr %sp506, align 16
  store i256 %178, ptr %sp506, align 16
  store i256 %swap.b507, ptr %sp494, align 16
  br label %dynamic_jump_table.preheader

OP169.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining511.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP169.JUMPDEST

OP169.JUMPDEST:                                   ; preds = %OP169.JUMPDEST.loopexit, %OP140.PUSH2
  %gas.remaining511 = phi i64 [ %gas.remaining5112550, %OP140.PUSH2 ], [ %gas.remaining511.pre, %OP169.JUMPDEST.loopexit ]
  %len.addr.10 = phi i64 [ %153, %OP140.PUSH2 ], [ %len.addr.34, %OP169.JUMPDEST.loopexit ]
  %179 = add i64 %gas.remaining511, -38
  %180 = icmp ult i64 %gas.remaining511, 38
  store i64 %179, ptr %gas.remaining.addr, align 8
  br i1 %180, label %return, label %OP169.JUMPDEST.contd, !prof !2, !annotation !3

OP169.JUMPDEST.contd:                             ; preds = %OP169.JUMPDEST
  %181 = icmp ugt i64 %len.addr.10, 1018
  br i1 %181, label %return, label %OP170.PUSH0, !prof !2, !annotation !5

OP170.PUSH0:                                      ; preds = %OP169.JUMPDEST.contd
  %sp515 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.10
  %sp523 = getelementptr i256, ptr %sp515, i64 2
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(96) %sp515, i8 0, i64 96, i1 false)
  %182 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp523, i8 18)
  %.not2110 = icmp eq i8 %182, 0
  br i1 %.not2110, label %OP174.DUP1, label %return, !prof !4

OP174.DUP1:                                       ; preds = %OP170.PUSH0
  %sp519 = getelementptr i256, ptr %sp515, i64 1
  %dup1528 = load i256, ptr %sp523, align 16
  %sp529 = getelementptr i256, ptr %sp515, i64 3
  %swap.b534 = load i256, ptr %sp515, align 16
  store i256 %dup1528, ptr %sp515, align 16
  %swap.b539 = load i256, ptr %sp519, align 16
  store i256 %swap.b534, ptr %sp519, align 16
  store i256 %swap.b539, ptr %sp523, align 16
  %183 = add nuw nsw i64 %len.addr.10, 5
  %sp546 = getelementptr i256, ptr %sp515, i64 4
  store i256 269, ptr %sp529, align 16
  store i256 %dup1528, ptr %sp546, align 16
  br label %OP441.JUMPDEST

OP182.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining553 = load i64, ptr %gas.remaining.addr, align 8
  %184 = add i64 %gas.remaining553, -9
  %185 = icmp ult i64 %gas.remaining553, 9
  store i64 %184, ptr %gas.remaining.addr, align 8
  br i1 %185, label %return, label %OP182.JUMPDEST.contd, !prof !2, !annotation !3

OP182.JUMPDEST.contd:                             ; preds = %OP182.JUMPDEST
  %186 = icmp ult i64 %len.addr.34, 3
  br i1 %186, label %return, label %OP183.SWAP2, !prof !2, !annotation !45

OP183.SWAP2:                                      ; preds = %OP182.JUMPDEST.contd
  %187 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp557 = getelementptr i256, ptr %187, i64 -1
  %swap.a558 = load i256, ptr %sp557, align 16
  %sp559 = getelementptr i256, ptr %187, i64 -3
  %swap.b560 = load i256, ptr %sp559, align 16
  store i256 %swap.a558, ptr %sp559, align 16
  %sp564 = getelementptr i256, ptr %187, i64 -2
  %swap.b565 = load i256, ptr %sp564, align 16
  store i256 %swap.b560, ptr %sp564, align 16
  store i256 %swap.b565, ptr %sp557, align 16
  %188 = add i64 %len.addr.34, -3
  %189 = tail call i8 @__revmc_builtin_sstore(ptr nonnull %arg.ecx.addr, ptr nonnull %sp559, i8 18)
  %.not2108 = icmp eq i8 %189, 0
  br i1 %.not2108, label %OP187.POP, label %return, !prof !4

OP187.POP:                                        ; preds = %OP183.SWAP2
  %gas.remaining569 = load i64, ptr %gas.remaining.addr, align 8
  %190 = add i64 %gas.remaining569, -30
  %191 = icmp ult i64 %gas.remaining569, 30
  store i64 %190, ptr %gas.remaining.addr, align 8
  br i1 %191, label %return, label %OP187.POP.contd, !prof !2, !annotation !3

OP187.POP.contd:                                  ; preds = %OP187.POP
  %192 = icmp eq i64 %188, 0
  %193 = add i64 %len.addr.34, -1024
  %194 = icmp ult i64 %193, -1020
  %195 = select i1 %192, i8 91, i8 92
  br i1 %194, label %return, label %OP187.POP.contd571, !prof !2

OP187.POP.contd571:                               ; preds = %OP187.POP.contd
  %sp573 = getelementptr i256, ptr %187, i64 -4
  store i256 44145446089218951837986422671001722283023151482040629911953553287475855156191, ptr %sp573, align 16
  %sp575 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %188
  store i256 1, ptr %sp575, align 16
  store i256 0, ptr %sp564, align 16
  %196 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp564, i8 18)
  %.not2109 = icmp eq i8 %196, 0
  br i1 %.not2109, label %OP192.PUSH2, label %return, !prof !4

OP192.PUSH2:                                      ; preds = %OP187.POP.contd571
  %swap.b586 = load i256, ptr %sp559, align 16
  store i256 321, ptr %sp559, align 16
  %swap.b591 = load i256, ptr %sp564, align 16
  store i256 %swap.b586, ptr %sp564, align 16
  store i256 %swap.b591, ptr %sp557, align 16
  br label %OP469.JUMPDEST

OP197.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining593 = load i64, ptr %gas.remaining.addr, align 8
  %197 = add i64 %gas.remaining593, -32
  %198 = icmp ult i64 %gas.remaining593, 32
  store i64 %197, ptr %gas.remaining.addr, align 8
  br i1 %198, label %return, label %OP197.JUMPDEST.contd, !prof !2, !annotation !3

OP197.JUMPDEST.contd:                             ; preds = %OP197.JUMPDEST
  %199 = icmp eq i64 %len.addr.34, 0
  %200 = add i64 %len.addr.34, -1021
  %201 = icmp ult i64 %200, -1020
  %202 = select i1 %199, i8 91, i8 92
  br i1 %201, label %return, label %OP198.PUSH0, !prof !2

OP198.PUSH0:                                      ; preds = %OP197.JUMPDEST.contd
  %sp597 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 0, ptr %sp597, align 16
  %203 = tail call i8 @__revmc_builtin_sload(ptr nonnull %arg.ecx.addr, ptr nonnull %sp597, i8 18)
  %.not2106 = icmp eq i8 %203, 0
  br i1 %.not2106, label %OP200.PUSH1, label %return, !prof !4

OP200.PUSH1:                                      ; preds = %OP198.PUSH0
  %sp601 = getelementptr i256, ptr %sp597, i64 1
  store i256 64, ptr %sp601, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !46)
  %ecx.memory.i2209 = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !46, !noalias !49
  %ecx.memory.len.addr.i2210 = getelementptr inbounds i8, ptr %ecx.memory.i2209, i64 16
  %ecx.memory.len.i2211 = load i64, ptr %ecx.memory.len.addr.i2210, align 8, !noalias !51
  %ecx.memory.last_checkpoint.addr.i2212 = getelementptr inbounds i8, ptr %ecx.memory.i2209, i64 48
  %ecx.memory.last_checkpoint.i2213 = load i64, ptr %ecx.memory.last_checkpoint.addr.i2212, align 8, !noalias !51
  %204 = sub i64 %ecx.memory.len.i2211, %ecx.memory.last_checkpoint.i2213
  %205 = icmp ult i64 %204, 96
  br i1 %205, label %resize.i2221, label %OP201.MLOAD.contd, !prof !2

resize.i2221:                                     ; preds = %OP200.PUSH1
  %206 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !49
  %.not.i2222 = icmp eq i8 %206, 0
  br i1 %.not.i2222, label %OP201.MLOAD.contd, label %return, !prof !4

OP201.MLOAD.contd:                                ; preds = %OP200.PUSH1, %resize.i2221
  %ecx.memory.buffer.ptr.shared.addr.i2215 = getelementptr inbounds i8, ptr %ecx.memory.i2209, i64 8
  %ecx.memory.buffer.ptr.shared.i2216 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i2215, align 8, !noalias !51
  %ecx.memory.buffer.ptr.i2217 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i2216, i64 %ecx.memory.last_checkpoint.i2213
  %slot.i2218 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i2217, i64 64
  %slot.value.i2219 = load i256, ptr %slot.i2218, align 16, !noalias !51
  %207 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i2219)
  %208 = add nuw nsw i64 %len.addr.34, 3
  %sp609 = getelementptr i256, ptr %sp597, i64 2
  %sp613 = getelementptr i256, ptr %sp597, i64 -1
  %swap.b614 = load i256, ptr %sp613, align 16
  store i256 337, ptr %sp613, align 16
  %swap.b619 = load i256, ptr %sp597, align 16
  store i256 %swap.b614, ptr %sp597, align 16
  store i256 %swap.b619, ptr %sp601, align 16
  store i256 %207, ptr %sp609, align 16
  br label %OP506.JUMPDEST

OP208.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining626 = load i64, ptr %gas.remaining.addr, align 8
  %209 = add i64 %gas.remaining626, -777
  %210 = icmp ult i64 %gas.remaining626, 777
  store i64 %209, ptr %gas.remaining.addr, align 8
  br i1 %210, label %return, label %OP208.JUMPDEST.contd, !prof !2, !annotation !3

OP208.JUMPDEST.contd:                             ; preds = %OP208.JUMPDEST
  %211 = add i64 %len.addr.34, -1023
  %212 = icmp ult i64 %211, -1020
  br i1 %212, label %return.loopexit.split.loop.exit2334, label %OP209.PUSH1, !prof !2

OP209.PUSH1:                                      ; preds = %OP208.JUMPDEST.contd
  %sp630 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 64, ptr %sp630, align 16
  tail call void @llvm.experimental.noalias.scope.decl(metadata !52)
  %ecx.memory.i2225 = load ptr, ptr %ecx.memory.addr.i2224, align 8, !alias.scope !52, !noalias !55
  %ecx.memory.len.addr.i2226 = getelementptr inbounds i8, ptr %ecx.memory.i2225, i64 16
  %ecx.memory.len.i2227 = load i64, ptr %ecx.memory.len.addr.i2226, align 8, !noalias !57
  %ecx.memory.last_checkpoint.addr.i2228 = getelementptr inbounds i8, ptr %ecx.memory.i2225, i64 48
  %ecx.memory.last_checkpoint.i2229 = load i64, ptr %ecx.memory.last_checkpoint.addr.i2228, align 8, !noalias !57
  %213 = sub i64 %ecx.memory.len.i2227, %ecx.memory.last_checkpoint.i2229
  %214 = icmp ult i64 %213, 96
  br i1 %214, label %resize.i2237, label %OP210.MLOAD.contd, !prof !2

resize.i2237:                                     ; preds = %OP209.PUSH1
  %215 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %arg.ecx.addr, i64 96), !noalias !55
  %.not.i2238 = icmp eq i8 %215, 0
  br i1 %.not.i2238, label %OP210.MLOAD.contd, label %return, !prof !4

OP210.MLOAD.contd:                                ; preds = %OP209.PUSH1, %resize.i2237
  %ecx.memory.buffer.ptr.shared.addr.i2231 = getelementptr inbounds i8, ptr %ecx.memory.i2225, i64 8
  %ecx.memory.buffer.ptr.shared.i2232 = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr.i2231, align 8, !noalias !57
  %ecx.memory.buffer.ptr.i2233 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared.i2232, i64 %ecx.memory.last_checkpoint.i2229
  %slot.i2234 = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.i2233, i64 64
  %slot.value.i2235 = load i256, ptr %slot.i2234, align 16, !noalias !57
  %216 = tail call i256 @llvm.bswap.i256(i256 %slot.value.i2235)
  %sp640 = getelementptr i256, ptr %sp630, i64 1
  %sp644 = getelementptr i256, ptr %sp630, i64 -1
  %swap.b645 = load i256, ptr %sp644, align 16
  store i256 %swap.b645, ptr %sp640, align 16
  %217 = sub i256 %swap.b645, %216
  store i256 %217, ptr %sp644, align 16
  store i256 %216, ptr %sp630, align 16
  %sp658 = getelementptr i256, ptr %sp630, i64 -2
  %218 = tail call i8 @__revmc_builtin_log(ptr nonnull %arg.ecx.addr, ptr %sp658, i8 1)
  %.not2105 = icmp eq i8 %218, 0
  br i1 %.not2105, label %OP216.JUMP, label %return, !prof !4

OP216.JUMP:                                       ; preds = %OP210.MLOAD.contd
  %219 = add nsw i64 %len.addr.34, -3
  br label %dynamic_jump_table.backedge

OP217.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining662.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP217.JUMPDEST

OP217.JUMPDEST:                                   ; preds = %OP217.JUMPDEST.loopexit, %OP476.SWAP2, %OP470.PUSH0, %OP442.PUSH0, %OP227.PUSH2
  %gas.remaining662 = phi i64 [ %227, %OP227.PUSH2 ], [ %432, %OP476.SWAP2 ], [ %425, %OP470.PUSH0 ], [ %401, %OP442.PUSH0 ], [ %gas.remaining662.pre, %OP217.JUMPDEST.loopexit ]
  %len.addr.11 = phi i64 [ %233, %OP227.PUSH2 ], [ %439, %OP476.SWAP2 ], [ %431, %OP470.PUSH0 ], [ %407, %OP442.PUSH0 ], [ %len.addr.34, %OP217.JUMPDEST.loopexit ]
  %220 = add i64 %gas.remaining662, -27
  %221 = icmp ult i64 %gas.remaining662, 27
  store i64 %220, ptr %gas.remaining.addr, align 8
  br i1 %221, label %return, label %OP217.JUMPDEST.contd, !prof !2, !annotation !3

OP217.JUMPDEST.contd:                             ; preds = %OP217.JUMPDEST
  %222 = icmp ult i64 %len.addr.11, 2
  %223 = add i64 %len.addr.11, -1023
  %224 = icmp ult i64 %223, -1021
  %225 = select i1 %222, i8 91, i8 92
  br i1 %224, label %return, label %OP218.PUSH0, !prof !2

OP218.PUSH0:                                      ; preds = %OP217.JUMPDEST.contd
  %sp666 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.11
  %sp668 = getelementptr i256, ptr %sp666, i64 -1
  %dup2669 = load i256, ptr %sp668, align 16
  %sp670 = getelementptr i256, ptr %sp666, i64 1
  store i256 0, ptr %sp670, align 16
  %sp680 = getelementptr i256, ptr %sp666, i64 -2
  %swap.b681 = load i256, ptr %sp680, align 16
  store i256 %dup2669, ptr %sp680, align 16
  store i256 %swap.b681, ptr %sp668, align 16
  store i256 %dup2669, ptr %sp666, align 16
  %226 = add nsw i64 %len.addr.11, -1
  br label %dynamic_jump_table.preheader

OP226.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining691.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP226.JUMPDEST

OP226.JUMPDEST:                                   ; preds = %OP226.JUMPDEST.loopexit, %OP521.PUSH2, %OP507.PUSH0, %OP238.PUSH0
  %gas.remaining691 = phi i64 [ %466, %OP521.PUSH2 ], [ %458, %OP507.PUSH0 ], [ %241, %OP238.PUSH0 ], [ %gas.remaining691.pre, %OP226.JUMPDEST.loopexit ]
  %len.addr.12 = phi i64 [ %472, %OP521.PUSH2 ], [ %465, %OP507.PUSH0 ], [ %248, %OP238.PUSH0 ], [ %len.addr.34, %OP226.JUMPDEST.loopexit ]
  %227 = add i64 %gas.remaining691, -18
  %228 = icmp ult i64 %gas.remaining691, 18
  store i64 %227, ptr %gas.remaining.addr, align 8
  br i1 %228, label %return, label %OP226.JUMPDEST.contd, !prof !2, !annotation !3

OP226.JUMPDEST.contd:                             ; preds = %OP226.JUMPDEST
  %229 = icmp eq i64 %len.addr.12, 0
  %230 = add i64 %len.addr.12, -1022
  %231 = icmp ult i64 %230, -1021
  %232 = select i1 %229, i8 91, i8 92
  br i1 %231, label %return, label %OP227.PUSH2, !prof !2

OP227.PUSH2:                                      ; preds = %OP226.JUMPDEST.contd
  %sp695 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.12
  store i256 365, ptr %sp695, align 16
  %233 = add nuw nsw i64 %len.addr.12, 2
  %sp697 = getelementptr i256, ptr %sp695, i64 -1
  %dup2698 = load i256, ptr %sp697, align 16
  %sp699 = getelementptr i256, ptr %sp695, i64 1
  store i256 %dup2698, ptr %sp699, align 16
  br label %OP217.JUMPDEST

OP231.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining701 = load i64, ptr %gas.remaining.addr, align 8
  %234 = add i64 %gas.remaining701, -19
  %235 = icmp ult i64 %gas.remaining701, 19
  store i64 %234, ptr %gas.remaining.addr, align 8
  br i1 %235, label %return, label %OP231.JUMPDEST.contd, !prof !2, !annotation !3

OP231.JUMPDEST.contd:                             ; preds = %OP231.JUMPDEST
  %236 = add i64 %len.addr.34, -1024
  %237 = icmp ult i64 %236, -1020
  br i1 %237, label %return.loopexit.split.loop.exit2340, label %OP232.DUP3, !prof !2

OP232.DUP3:                                       ; preds = %OP231.JUMPDEST.contd
  %238 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp705 = getelementptr i256, ptr %238, i64 -3
  %dup3 = load i256, ptr %sp705, align 16
  store i256 %dup3, ptr %238, align 16
  %sp710 = getelementptr i256, ptr %238, i64 -1
  %b711 = load i256, ptr %sp710, align 16
  %239 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %dup3, i256 %b711, ptr %arg.ecx.addr)
  %.not2103 = icmp eq i8 %239, 0
  br i1 %.not2103, label %OP234.POP, label %return, !prof !4

OP234.POP:                                        ; preds = %OP232.DUP3
  %240 = add nsw i64 %len.addr.34, -4
  br label %dynamic_jump_table.backedge

OP237.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP52.MLOAD.contd
  %len.addr.13 = phi i64 [ %55, %OP52.MLOAD.contd ], [ %len.addr.34, %dynamic_jump_table ]
  %gas.remaining717 = load i64, ptr %gas.remaining.addr, align 8
  %241 = add i64 %gas.remaining717, -42
  %242 = icmp ult i64 %gas.remaining717, 42
  store i64 %241, ptr %gas.remaining.addr, align 8
  br i1 %242, label %return, label %OP237.JUMPDEST.contd, !prof !2, !annotation !3

OP237.JUMPDEST.contd:                             ; preds = %OP237.JUMPDEST
  %243 = icmp ult i64 %len.addr.13, 2
  %244 = add i64 %len.addr.13, -1020
  %245 = icmp ult i64 %244, -1018
  %246 = select i1 %243, i8 91, i8 92
  br i1 %245, label %return, label %OP238.PUSH0, !prof !2

OP238.PUSH0:                                      ; preds = %OP237.JUMPDEST.contd
  %sp721 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.13
  %sp723 = getelementptr i256, ptr %sp721, i64 1
  %sp725 = getelementptr i256, ptr %sp721, i64 -1
  %dup3726 = load i256, ptr %sp725, align 16
  %sp727 = getelementptr i256, ptr %sp721, i64 2
  %247 = add i256 %dup3726, 32
  store i256 %247, ptr %sp721, align 16
  store i256 390, ptr %sp723, align 16
  %248 = add nuw nsw i64 %len.addr.13, 4
  %sp746 = getelementptr i256, ptr %sp721, i64 3
  store i256 %dup3726, ptr %sp727, align 16
  %sp754 = getelementptr i256, ptr %sp721, i64 -2
  %dup5 = load i256, ptr %sp754, align 16
  store i256 %dup5, ptr %sp746, align 16
  br label %OP226.JUMPDEST

OP251.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining757 = load i64, ptr %gas.remaining.addr, align 8
  %249 = add i64 %gas.remaining757, -19
  %250 = icmp ult i64 %gas.remaining757, 19
  store i64 %249, ptr %gas.remaining.addr, align 8
  br i1 %250, label %return, label %OP251.JUMPDEST.contd, !prof !2, !annotation !3

OP251.JUMPDEST.contd:                             ; preds = %OP251.JUMPDEST
  %251 = icmp ult i64 %len.addr.34, 4
  br i1 %251, label %return, label %OP252.SWAP3, !prof !2, !annotation !45

OP252.SWAP3:                                      ; preds = %OP251.JUMPDEST.contd
  %252 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp761 = getelementptr i256, ptr %252, i64 -1
  %swap.a762 = load i256, ptr %sp761, align 16
  %sp763 = getelementptr i256, ptr %252, i64 -4
  %swap.b764 = load i256, ptr %sp763, align 16
  store i256 %swap.a762, ptr %sp763, align 16
  %sp768 = getelementptr i256, ptr %252, i64 -3
  %swap.b769 = load i256, ptr %sp768, align 16
  store i256 %swap.b764, ptr %sp768, align 16
  store i256 %swap.b769, ptr %sp761, align 16
  %253 = add i64 %len.addr.34, -3
  br label %dynamic_jump_table.backedge

OP257.JUMPDESTthread-pre-split:                   ; preds = %dynamic_jump_table
  %gas.remaining775.pr = load i64, ptr %gas.remaining.addr, align 8
  br label %OP257.JUMPDEST

OP257.JUMPDEST:                                   ; preds = %OP257.JUMPDESTthread-pre-split, %OP314.PUSH2.contd946
  %gas.remaining775 = phi i64 [ %gas.remaining775.pr, %OP257.JUMPDESTthread-pre-split ], [ %312, %OP314.PUSH2.contd946 ]
  %len.addr.14 = phi i64 [ %len.addr.34, %OP257.JUMPDESTthread-pre-split ], [ %308, %OP314.PUSH2.contd946 ]
  %254 = add i64 %gas.remaining775, -6
  %255 = icmp ult i64 %gas.remaining775, 6
  store i64 %254, ptr %gas.remaining.addr, align 8
  br i1 %255, label %return, label %OP257.JUMPDEST.contd, !prof !2, !annotation !3

OP257.JUMPDEST.contd:                             ; preds = %OP257.JUMPDEST
  %256 = icmp ugt i64 %len.addr.14, 1022
  br i1 %256, label %return, label %OP258.PUSH0, !prof !2, !annotation !5

OP258.PUSH0:                                      ; preds = %OP257.JUMPDEST.contd
  %sp779 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.14
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %sp779, i8 0, i64 64, i1 false)
  %257 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp779, i8 16)
  %.not2120 = icmp eq i8 %257, 0
  %spec.select1577 = select i1 %.not2120, i8 16, i8 %257, !prof !4
  br label %return

OP261.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining786.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP261.JUMPDEST

OP261.JUMPDEST:                                   ; preds = %OP261.JUMPDEST.loopexit, %OP273.PUSH2
  %gas.remaining786 = phi i64 [ %266, %OP273.PUSH2 ], [ %gas.remaining786.pre, %OP261.JUMPDEST.loopexit ]
  %len.addr.15 = phi i64 [ %272, %OP273.PUSH2 ], [ %len.addr.34, %OP261.JUMPDEST.loopexit ]
  %258 = add i64 %gas.remaining786, -33
  %259 = icmp ult i64 %gas.remaining786, 33
  store i64 %258, ptr %gas.remaining.addr, align 8
  br i1 %259, label %return, label %OP261.JUMPDEST.contd, !prof !2, !annotation !3

OP261.JUMPDEST.contd:                             ; preds = %OP261.JUMPDEST
  %260 = icmp ult i64 %len.addr.15, 2
  %261 = add i64 %len.addr.15, -1022
  %262 = icmp ult i64 %261, -1020
  %263 = select i1 %260, i8 91, i8 92
  br i1 %262, label %return, label %OP262.PUSH0, !prof !2

OP262.PUSH0:                                      ; preds = %OP261.JUMPDEST.contd
  %sp790 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.15
  %sp792 = getelementptr i256, ptr %sp790, i64 1
  %sp794 = getelementptr i256, ptr %sp790, i64 -1
  %dup3795 = load i256, ptr %sp794, align 16
  %sp796 = getelementptr i256, ptr %sp790, i64 2
  store i256 %dup3795, ptr %sp796, align 16
  %264 = and i256 %dup3795, 18446744073709551615
  store i256 0, ptr %sp792, align 16
  %sp812 = getelementptr i256, ptr %sp790, i64 -2
  %swap.b813 = load i256, ptr %sp812, align 16
  store i256 %264, ptr %sp812, align 16
  store i256 %swap.b813, ptr %sp794, align 16
  store i256 %dup3795, ptr %sp790, align 16
  %265 = add nsw i64 %len.addr.15, -1
  br label %dynamic_jump_table.preheader

OP272.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining823.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP272.JUMPDEST

OP272.JUMPDEST:                                   ; preds = %OP272.JUMPDEST.loopexit, %OP289.PUSH0
  %gas.remaining823 = phi i64 [ %288, %OP289.PUSH0 ], [ %gas.remaining823.pre, %OP272.JUMPDEST.loopexit ]
  %len.addr.16 = phi i64 [ %295, %OP289.PUSH0 ], [ %len.addr.34, %OP272.JUMPDEST.loopexit ]
  %266 = add i64 %gas.remaining823, -18
  %267 = icmp ult i64 %gas.remaining823, 18
  store i64 %266, ptr %gas.remaining.addr, align 8
  br i1 %267, label %return, label %OP272.JUMPDEST.contd, !prof !2, !annotation !3

OP272.JUMPDEST.contd:                             ; preds = %OP272.JUMPDEST
  %268 = icmp eq i64 %len.addr.16, 0
  %269 = add i64 %len.addr.16, -1022
  %270 = icmp ult i64 %269, -1021
  %271 = select i1 %268, i8 91, i8 92
  br i1 %270, label %return, label %OP273.PUSH2, !prof !2

OP273.PUSH2:                                      ; preds = %OP272.JUMPDEST.contd
  %sp827 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.16
  store i256 428, ptr %sp827, align 16
  %272 = add nuw nsw i64 %len.addr.16, 2
  %sp829 = getelementptr i256, ptr %sp827, i64 -1
  %dup2830 = load i256, ptr %sp829, align 16
  %sp831 = getelementptr i256, ptr %sp827, i64 1
  store i256 %dup2830, ptr %sp831, align 16
  br label %OP261.JUMPDEST

OP277.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining833 = load i64, ptr %gas.remaining.addr, align 8
  %273 = add i64 %gas.remaining833, -20
  %274 = icmp ult i64 %gas.remaining833, 20
  store i64 %273, ptr %gas.remaining.addr, align 8
  br i1 %274, label %return, label %OP277.JUMPDEST.contd, !prof !2, !annotation !3

OP277.JUMPDEST.contd:                             ; preds = %OP277.JUMPDEST
  %275 = add i64 %len.addr.34, -1024
  %276 = icmp ult i64 %275, -1022
  br i1 %276, label %return.loopexit.split.loop.exit2350, label %OP278.DUP2, !prof !2

OP278.DUP2:                                       ; preds = %OP277.JUMPDEST.contd
  %277 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp837 = getelementptr i256, ptr %277, i64 -2
  %dup2838 = load i256, ptr %sp837, align 16
  store i256 %dup2838, ptr %277, align 16
  %sp843 = getelementptr i256, ptr %277, i64 -1
  %b844 = load i256, ptr %sp843, align 16
  %278 = icmp eq i256 %dup2838, %b844
  %279 = zext i1 %278 to i256
  store i256 %279, ptr %sp843, align 16
  %280 = add nsw i64 %len.addr.34, -1
  br i1 %278, label %OP285.JUMPDEST, label %OP282.PUSH0

OP282.PUSH0:                                      ; preds = %OP278.DUP2
  %281 = add i64 %gas.remaining833, -25
  %282 = icmp ult i64 %273, 5
  store i64 %281, ptr %gas.remaining.addr, align 8
  br i1 %282, label %return, label %OP282.PUSH0.contd851, !prof !2, !annotation !3

OP282.PUSH0.contd851:                             ; preds = %OP282.PUSH0
  %sp847.le = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %280
  %sp843.le = getelementptr i256, ptr %277, i64 -1
  store i256 0, ptr %sp847.le, align 16
  store i256 0, ptr %277, align 16
  %283 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp843.le, i8 16)
  %.not2102 = icmp eq i8 %283, 0
  %spec.select1578 = select i1 %.not2102, i8 16, i8 %283, !prof !4
  br label %return

OP285.JUMPDEST:                                   ; preds = %dynamic_jump_table.OP285.JUMPDEST_crit_edge, %OP278.DUP2
  %gas.remaining859 = phi i64 [ %gas.remaining859.pre, %dynamic_jump_table.OP285.JUMPDEST_crit_edge ], [ %273, %OP278.DUP2 ]
  %len.addr.17 = phi i64 [ %len.addr.34, %dynamic_jump_table.OP285.JUMPDEST_crit_edge ], [ %280, %OP278.DUP2 ]
  %284 = add i64 %gas.remaining859, -11
  %285 = icmp ult i64 %gas.remaining859, 11
  store i64 %284, ptr %gas.remaining.addr, align 8
  br i1 %285, label %return, label %OP285.JUMPDEST.contd, !prof !2, !annotation !3

OP285.JUMPDEST.contd:                             ; preds = %OP285.JUMPDEST
  %286 = icmp ult i64 %len.addr.17, 2
  br i1 %286, label %return, label %OP286.POP, !prof !2, !annotation !45

OP286.POP:                                        ; preds = %OP285.JUMPDEST.contd
  %287 = add i64 %len.addr.17, -2
  br label %dynamic_jump_table.backedge

OP288.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining866.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP288.JUMPDEST

OP288.JUMPDEST:                                   ; preds = %OP288.JUMPDEST.loopexit, %OP319.PUSH0
  %gas.remaining866 = phi i64 [ %316, %OP319.PUSH0 ], [ %gas.remaining866.pre, %OP288.JUMPDEST.loopexit ]
  %len.addr.18 = phi i64 [ %322, %OP319.PUSH0 ], [ %len.addr.34, %OP288.JUMPDEST.loopexit ]
  %288 = add i64 %gas.remaining866, -31
  %289 = icmp ult i64 %gas.remaining866, 31
  store i64 %288, ptr %gas.remaining.addr, align 8
  br i1 %289, label %return, label %OP288.JUMPDEST.contd, !prof !2, !annotation !3

OP288.JUMPDEST.contd:                             ; preds = %OP288.JUMPDEST
  %290 = icmp eq i64 %len.addr.18, 0
  %291 = add i64 %len.addr.18, -1021
  %292 = icmp ult i64 %291, -1020
  %293 = select i1 %290, i8 91, i8 92
  br i1 %292, label %return, label %OP289.PUSH0, !prof !2

OP289.PUSH0:                                      ; preds = %OP288.JUMPDEST.contd
  %sp870 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.18
  store i256 0, ptr %sp870, align 16
  %sp872 = getelementptr i256, ptr %sp870, i64 -1
  %dup2873 = load i256, ptr %sp872, align 16
  %sp874 = getelementptr i256, ptr %sp870, i64 1
  store i256 %dup2873, ptr %sp874, align 16
  %294 = tail call fastcc i256 @__revmc_ir_builtin_calldataload(i256 %dup2873, ptr %arg.contract.addr.val2126, i64 %contract.input.len)
  store i256 %294, ptr %sp870, align 16
  store i256 455, ptr %sp874, align 16
  %295 = add nuw nsw i64 %len.addr.18, 3
  %sp890 = getelementptr i256, ptr %sp870, i64 2
  store i256 %294, ptr %sp890, align 16
  br label %OP272.JUMPDEST

OP298.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining892 = load i64, ptr %gas.remaining.addr, align 8
  %296 = add i64 %gas.remaining892, -19
  %297 = icmp ult i64 %gas.remaining892, 19
  store i64 %296, ptr %gas.remaining.addr, align 8
  br i1 %297, label %return, label %OP298.JUMPDEST.contd, !prof !2, !annotation !3

OP298.JUMPDEST.contd:                             ; preds = %OP298.JUMPDEST
  %298 = icmp ult i64 %len.addr.34, 4
  br i1 %298, label %return, label %OP299.SWAP3, !prof !2, !annotation !45

OP299.SWAP3:                                      ; preds = %OP298.JUMPDEST.contd
  %299 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp896 = getelementptr i256, ptr %299, i64 -1
  %swap.a897 = load i256, ptr %sp896, align 16
  %sp898 = getelementptr i256, ptr %299, i64 -4
  %swap.b899 = load i256, ptr %sp898, align 16
  store i256 %swap.a897, ptr %sp898, align 16
  %sp903 = getelementptr i256, ptr %299, i64 -3
  %swap.b904 = load i256, ptr %sp903, align 16
  store i256 %swap.b899, ptr %sp903, align 16
  store i256 %swap.b904, ptr %sp896, align 16
  %300 = add i64 %len.addr.34, -3
  br label %dynamic_jump_table.backedge

OP304.JUMPDEST.loopexit:                          ; preds = %dynamic_jump_table
  %gas.remaining910.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP304.JUMPDEST

OP304.JUMPDEST:                                   ; preds = %OP304.JUMPDEST.loopexit, %OP76.POP
  %gas.remaining910 = phi i64 [ %78, %OP76.POP ], [ %gas.remaining910.pre, %OP304.JUMPDEST.loopexit ]
  %len.addr.19 = phi i64 [ %85, %OP76.POP ], [ %len.addr.34, %OP304.JUMPDEST.loopexit ]
  %301 = add i64 %gas.remaining910, -34
  %302 = icmp ult i64 %gas.remaining910, 34
  store i64 %301, ptr %gas.remaining.addr, align 8
  br i1 %302, label %return, label %OP304.JUMPDEST.contd, !prof !2, !annotation !3

OP304.JUMPDEST.contd:                             ; preds = %OP304.JUMPDEST
  %303 = icmp ult i64 %len.addr.19, 2
  %304 = add i64 %len.addr.19, -1021
  %305 = icmp ult i64 %304, -1019
  %306 = select i1 %303, i8 91, i8 92
  br i1 %305, label %return, label %OP305.PUSH0, !prof !2

OP305.PUSH0:                                      ; preds = %OP304.JUMPDEST.contd
  %307 = add nuw nsw i64 %len.addr.19, 1
  %sp914 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.19
  store i256 0, ptr %sp914, align 16
  %308 = add nuw nsw i64 %len.addr.19, 2
  %sp916 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %307
  %sp918 = getelementptr i256, ptr %sp914, i64 -1
  %dup3919 = load i256, ptr %sp918, align 16
  %sp920 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %308
  %sp922 = getelementptr i256, ptr %sp914, i64 -2
  %dup5923 = load i256, ptr %sp922, align 16
  %sp924 = getelementptr i256, ptr %sp914, i64 3
  store i256 %dup5923, ptr %sp924, align 16
  %309 = sub i256 %dup5923, %dup3919
  store i256 %309, ptr %sp920, align 16
  %310 = icmp sgt i256 %309, 31
  %311 = zext i1 %310 to i256
  store i256 %311, ptr %sp916, align 16
  br i1 %310, label %OP318.JUMPDEST, label %OP314.PUSH2

OP314.PUSH2:                                      ; preds = %OP305.PUSH0
  %312 = add i64 %gas.remaining910, -48
  %313 = icmp ult i64 %301, 14
  store i64 %312, ptr %gas.remaining.addr, align 8
  br i1 %313, label %return, label %OP314.PUSH2.contd946, !prof !2, !annotation !3

OP314.PUSH2.contd946:                             ; preds = %OP314.PUSH2
  store i256 481, ptr %sp916, align 16
  br label %OP257.JUMPDEST

OP317.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining949 = load i64, ptr %gas.remaining.addr, align 8
  %314 = add i64 %gas.remaining949, -1
  %315 = icmp eq i64 %gas.remaining949, 0
  store i64 %314, ptr %gas.remaining.addr, align 8
  br i1 %315, label %return, label %OP318.JUMPDEST, !prof !2, !annotation !3

OP318.JUMPDESTthread-pre-split.loopexit:          ; preds = %dynamic_jump_table
  %gas.remaining951.pr.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP318.JUMPDEST

OP318.JUMPDEST:                                   ; preds = %OP305.PUSH0, %OP318.JUMPDESTthread-pre-split.loopexit, %OP317.JUMPDEST
  %gas.remaining951 = phi i64 [ %314, %OP317.JUMPDEST ], [ %301, %OP305.PUSH0 ], [ %gas.remaining951.pr.pre, %OP318.JUMPDESTthread-pre-split.loopexit ]
  %len.addr.20 = phi i64 [ %len.addr.34, %OP317.JUMPDEST ], [ %307, %OP305.PUSH0 ], [ %len.addr.34, %OP318.JUMPDESTthread-pre-split.loopexit ]
  %316 = add i64 %gas.remaining951, -29
  %317 = icmp ult i64 %gas.remaining951, 29
  store i64 %316, ptr %gas.remaining.addr, align 8
  br i1 %317, label %return, label %OP318.JUMPDEST.contd, !prof !2, !annotation !3

OP318.JUMPDEST.contd:                             ; preds = %OP318.JUMPDEST
  %318 = icmp ult i64 %len.addr.20, 3
  %319 = add i64 %len.addr.20, -1020
  %320 = icmp ult i64 %319, -1017
  %321 = select i1 %318, i8 91, i8 92
  br i1 %320, label %return, label %OP319.PUSH0, !prof !2

OP319.PUSH0:                                      ; preds = %OP318.JUMPDEST.contd
  %sp955 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.20
  store i256 0, ptr %sp955, align 16
  %sp957 = getelementptr i256, ptr %sp955, i64 1
  store i256 495, ptr %sp957, align 16
  %sp959 = getelementptr i256, ptr %sp955, i64 -3
  %dup5960 = load i256, ptr %sp959, align 16
  %sp961 = getelementptr i256, ptr %sp955, i64 2
  store i256 %dup5960, ptr %sp961, align 16
  %322 = add nuw nsw i64 %len.addr.20, 4
  %sp965 = getelementptr i256, ptr %sp955, i64 3
  %sp967 = getelementptr i256, ptr %sp955, i64 -2
  %dup6 = load i256, ptr %sp967, align 16
  %sp968 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %322
  store i256 %dup6, ptr %sp968, align 16
  store i256 %dup6, ptr %sp965, align 16
  br label %OP288.JUMPDEST

OP327.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining976 = load i64, ptr %gas.remaining.addr, align 8
  %323 = add i64 %gas.remaining976, -26
  %324 = icmp ult i64 %gas.remaining976, 26
  store i64 %323, ptr %gas.remaining.addr, align 8
  br i1 %324, label %return, label %OP327.JUMPDEST.contd, !prof !2, !annotation !3

OP327.JUMPDEST.contd:                             ; preds = %OP327.JUMPDEST
  %325 = icmp ult i64 %len.addr.34, 6
  br i1 %325, label %return, label %OP328.SWAP2, !prof !2, !annotation !45

OP328.SWAP2:                                      ; preds = %OP327.JUMPDEST.contd
  %326 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp980 = getelementptr i256, ptr %326, i64 -1
  %swap.a981 = load i256, ptr %sp980, align 16
  %sp982 = getelementptr i256, ptr %326, i64 -3
  %swap.b983 = load i256, ptr %sp982, align 16
  store i256 %swap.b983, ptr %sp980, align 16
  %sp989 = getelementptr i256, ptr %326, i64 -6
  %swap.b990 = load i256, ptr %sp989, align 16
  store i256 %swap.a981, ptr %sp989, align 16
  %sp994 = getelementptr i256, ptr %326, i64 -5
  %swap.b995 = load i256, ptr %sp994, align 16
  store i256 %swap.b990, ptr %sp994, align 16
  store i256 %swap.b995, ptr %sp982, align 16
  %327 = add i64 %len.addr.34, -5
  br label %dynamic_jump_table.backedge

OP336.JUMPDEST:                                   ; preds = %dynamic_jump_table.OP336.JUMPDEST_crit_edge, %OP346.PUSH2
  %gas.remaining1001 = phi i64 [ %333, %OP346.PUSH2 ], [ %gas.remaining1001.pre, %dynamic_jump_table.OP336.JUMPDEST_crit_edge ]
  %len.addr.21 = phi i64 [ %337, %OP346.PUSH2 ], [ %len.addr.34, %dynamic_jump_table.OP336.JUMPDEST_crit_edge ]
  %328 = add i64 %gas.remaining1001, -27
  %329 = icmp ult i64 %gas.remaining1001, 27
  store i64 %328, ptr %gas.remaining.addr, align 8
  br i1 %329, label %return, label %OP336.JUMPDEST.contd, !prof !2, !annotation !3

OP336.JUMPDEST.contd:                             ; preds = %OP336.JUMPDEST
  %330 = add i64 %len.addr.21, -1023
  %331 = icmp ult i64 %330, -1021
  br i1 %331, label %return.loopexit.split.loop.exit2366, label %OP337.PUSH0, !prof !2

OP337.PUSH0:                                      ; preds = %OP336.JUMPDEST.contd
  %sp1005 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.21
  %sp1007 = getelementptr i256, ptr %sp1005, i64 -1
  %dup21008 = load i256, ptr %sp1007, align 16
  %sp1009 = getelementptr i256, ptr %sp1005, i64 1
  store i256 0, ptr %sp1009, align 16
  %sp1019 = getelementptr i256, ptr %sp1005, i64 -2
  %swap.b1020 = load i256, ptr %sp1019, align 16
  store i256 %dup21008, ptr %sp1019, align 16
  store i256 %swap.b1020, ptr %sp1007, align 16
  store i256 %dup21008, ptr %sp1005, align 16
  %332 = add nsw i64 %len.addr.21, -1
  br label %dynamic_jump_table.backedge

OP345.JUMPDEST:                                   ; preds = %dynamic_jump_table.OP345.JUMPDEST_crit_edge, %OP357.PUSH0
  %gas.remaining1030 = phi i64 [ %345, %OP357.PUSH0 ], [ %gas.remaining1030.pre, %dynamic_jump_table.OP345.JUMPDEST_crit_edge ]
  %len.addr.22 = phi i64 [ %350, %OP357.PUSH0 ], [ %len.addr.34, %dynamic_jump_table.OP345.JUMPDEST_crit_edge ]
  %333 = add i64 %gas.remaining1030, -18
  %334 = icmp ult i64 %gas.remaining1030, 18
  store i64 %333, ptr %gas.remaining.addr, align 8
  br i1 %334, label %return, label %OP345.JUMPDEST.contd, !prof !2, !annotation !3

OP345.JUMPDEST.contd:                             ; preds = %OP345.JUMPDEST
  %335 = add i64 %len.addr.22, -1022
  %336 = icmp ult i64 %335, -1021
  br i1 %336, label %return.loopexit.split.loop.exit2370, label %OP346.PUSH2, !prof !2

OP346.PUSH2:                                      ; preds = %OP345.JUMPDEST.contd
  %sp1034 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.22
  store i256 522, ptr %sp1034, align 16
  %337 = add nuw nsw i64 %len.addr.22, 2
  %sp1036 = getelementptr i256, ptr %sp1034, i64 -1
  %dup21037 = load i256, ptr %sp1036, align 16
  %sp1038 = getelementptr i256, ptr %sp1034, i64 1
  store i256 %dup21037, ptr %sp1038, align 16
  br label %OP336.JUMPDEST

OP350.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1040 = load i64, ptr %gas.remaining.addr, align 8
  %338 = add i64 %gas.remaining1040, -19
  %339 = icmp ult i64 %gas.remaining1040, 19
  store i64 %338, ptr %gas.remaining.addr, align 8
  br i1 %339, label %return, label %OP350.JUMPDEST.contd, !prof !2, !annotation !3

OP350.JUMPDEST.contd:                             ; preds = %OP350.JUMPDEST
  %340 = add i64 %len.addr.34, -1024
  %341 = icmp ult i64 %340, -1020
  br i1 %341, label %return.loopexit.split.loop.exit2374, label %OP351.DUP3, !prof !2

OP351.DUP3:                                       ; preds = %OP350.JUMPDEST.contd
  %342 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1044 = getelementptr i256, ptr %342, i64 -3
  %dup31045 = load i256, ptr %sp1044, align 16
  store i256 %dup31045, ptr %342, align 16
  %sp1050 = getelementptr i256, ptr %342, i64 -1
  %b1051 = load i256, ptr %sp1050, align 16
  %343 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %dup31045, i256 %b1051, ptr %arg.ecx.addr)
  %.not2100 = icmp eq i8 %343, 0
  br i1 %.not2100, label %OP353.POP, label %return, !prof !4

OP353.POP:                                        ; preds = %OP351.DUP3
  %344 = add nsw i64 %len.addr.34, -4
  br label %dynamic_jump_table.backedge

OP356.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP95.MLOAD.contd
  %len.addr.23 = phi i64 [ %len.addr.34, %dynamic_jump_table ], [ %97, %OP95.MLOAD.contd ]
  %gas.remaining1057 = load i64, ptr %gas.remaining.addr, align 8
  %345 = add i64 %gas.remaining1057, -42
  %346 = icmp ult i64 %gas.remaining1057, 42
  store i64 %345, ptr %gas.remaining.addr, align 8
  br i1 %346, label %return, label %OP356.JUMPDEST.contd, !prof !2, !annotation !3

OP356.JUMPDEST.contd:                             ; preds = %OP356.JUMPDEST
  %347 = add i64 %len.addr.23, -1020
  %348 = icmp ult i64 %347, -1018
  br i1 %348, label %return.loopexit.split.loop.exit2380, label %OP357.PUSH0, !prof !2

OP357.PUSH0:                                      ; preds = %OP356.JUMPDEST.contd
  %sp1061 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.23
  %sp1063 = getelementptr i256, ptr %sp1061, i64 1
  %sp1065 = getelementptr i256, ptr %sp1061, i64 -1
  %dup31066 = load i256, ptr %sp1065, align 16
  %sp1067 = getelementptr i256, ptr %sp1061, i64 2
  %349 = add i256 %dup31066, 32
  store i256 %349, ptr %sp1061, align 16
  store i256 547, ptr %sp1063, align 16
  %350 = add nuw nsw i64 %len.addr.23, 4
  %sp1087 = getelementptr i256, ptr %sp1061, i64 3
  store i256 %dup31066, ptr %sp1067, align 16
  %sp1095 = getelementptr i256, ptr %sp1061, i64 -2
  %dup51096 = load i256, ptr %sp1095, align 16
  store i256 %dup51096, ptr %sp1087, align 16
  br label %OP345.JUMPDEST

OP370.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1099 = load i64, ptr %gas.remaining.addr, align 8
  %351 = add i64 %gas.remaining1099, -19
  %352 = icmp ult i64 %gas.remaining1099, 19
  store i64 %351, ptr %gas.remaining.addr, align 8
  br i1 %352, label %return, label %OP370.JUMPDEST.contd, !prof !2, !annotation !3

OP370.JUMPDEST.contd:                             ; preds = %OP370.JUMPDEST
  %353 = icmp ult i64 %len.addr.34, 4
  br i1 %353, label %return, label %OP371.SWAP3, !prof !2, !annotation !45

OP371.SWAP3:                                      ; preds = %OP370.JUMPDEST.contd
  %354 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1103 = getelementptr i256, ptr %354, i64 -1
  %swap.a1104 = load i256, ptr %sp1103, align 16
  %sp1105 = getelementptr i256, ptr %354, i64 -4
  %swap.b1106 = load i256, ptr %sp1105, align 16
  store i256 %swap.a1104, ptr %sp1105, align 16
  %sp1110 = getelementptr i256, ptr %354, i64 -3
  %swap.b1111 = load i256, ptr %sp1110, align 16
  store i256 %swap.b1106, ptr %sp1110, align 16
  store i256 %swap.b1111, ptr %sp1103, align 16
  %355 = add i64 %len.addr.34, -3
  br label %dynamic_jump_table.backedge

OP376.JUMPDEST:                                   ; preds = %dynamic_jump_table.OP376.JUMPDEST_crit_edge, %OP388.PUSH0
  %gas.remaining1117 = phi i64 [ %362, %OP388.PUSH0 ], [ %gas.remaining1117.pre, %dynamic_jump_table.OP376.JUMPDEST_crit_edge ]
  %len.addr.24 = phi i64 [ %366, %OP388.PUSH0 ], [ %len.addr.34, %dynamic_jump_table.OP376.JUMPDEST_crit_edge ]
  %356 = add i64 %gas.remaining1117, -33
  %357 = icmp ult i64 %gas.remaining1117, 33
  store i64 %356, ptr %gas.remaining.addr, align 8
  br i1 %357, label %return, label %OP376.JUMPDEST.contd, !prof !2, !annotation !3

OP376.JUMPDEST.contd:                             ; preds = %OP376.JUMPDEST
  %358 = add i64 %len.addr.24, -1022
  %359 = icmp ult i64 %358, -1020
  br i1 %359, label %return.loopexit.split.loop.exit2388, label %OP377.PUSH0, !prof !2

OP377.PUSH0:                                      ; preds = %OP376.JUMPDEST.contd
  %sp1121 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.24
  %sp1123 = getelementptr i256, ptr %sp1121, i64 1
  %sp1125 = getelementptr i256, ptr %sp1121, i64 -1
  %dup31126 = load i256, ptr %sp1125, align 16
  %sp1127 = getelementptr i256, ptr %sp1121, i64 2
  store i256 %dup31126, ptr %sp1127, align 16
  %360 = and i256 %dup31126, 1461501637330902918203684832716283019655932542975
  store i256 0, ptr %sp1123, align 16
  %sp1143 = getelementptr i256, ptr %sp1121, i64 -2
  %swap.b1144 = load i256, ptr %sp1143, align 16
  store i256 %360, ptr %sp1143, align 16
  store i256 %swap.b1144, ptr %sp1125, align 16
  store i256 %dup31126, ptr %sp1121, align 16
  %361 = add nsw i64 %len.addr.24, -1
  br label %dynamic_jump_table.backedge

OP387.JUMPDEST:                                   ; preds = %dynamic_jump_table.OP387.JUMPDEST_crit_edge, %OP401.PUSH2
  %gas.remaining1154 = phi i64 [ %372, %OP401.PUSH2 ], [ %gas.remaining1154.pre, %dynamic_jump_table.OP387.JUMPDEST_crit_edge ]
  %len.addr.25 = phi i64 [ %376, %OP401.PUSH2 ], [ %len.addr.34, %dynamic_jump_table.OP387.JUMPDEST_crit_edge ]
  %362 = add i64 %gas.remaining1154, -20
  %363 = icmp ult i64 %gas.remaining1154, 20
  store i64 %362, ptr %gas.remaining.addr, align 8
  br i1 %363, label %return, label %OP387.JUMPDEST.contd, !prof !2, !annotation !3

OP387.JUMPDEST.contd:                             ; preds = %OP387.JUMPDEST
  %364 = add i64 %len.addr.25, -1021
  %365 = icmp ult i64 %364, -1020
  br i1 %365, label %return.loopexit.split.loop.exit2392, label %OP388.PUSH0, !prof !2

OP388.PUSH0:                                      ; preds = %OP387.JUMPDEST.contd
  %sp1158 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.25
  store i256 0, ptr %sp1158, align 16
  %sp1160 = getelementptr i256, ptr %sp1158, i64 1
  store i256 594, ptr %sp1160, align 16
  %366 = add nuw nsw i64 %len.addr.25, 3
  %sp1162 = getelementptr i256, ptr %sp1158, i64 -1
  %dup31163 = load i256, ptr %sp1162, align 16
  %sp1164 = getelementptr i256, ptr %sp1158, i64 2
  store i256 %dup31163, ptr %sp1164, align 16
  br label %OP376.JUMPDEST

OP393.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1166 = load i64, ptr %gas.remaining.addr, align 8
  %367 = add i64 %gas.remaining1166, -22
  %368 = icmp ult i64 %gas.remaining1166, 22
  store i64 %367, ptr %gas.remaining.addr, align 8
  br i1 %368, label %return, label %OP393.JUMPDEST.contd, !prof !2, !annotation !3

OP393.JUMPDEST.contd:                             ; preds = %OP393.JUMPDEST
  %369 = icmp ult i64 %len.addr.34, 4
  br i1 %369, label %return, label %OP394.SWAP1, !prof !2, !annotation !45

OP394.SWAP1:                                      ; preds = %OP393.JUMPDEST.contd
  %370 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1170 = getelementptr i256, ptr %370, i64 -1
  %swap.a1171 = load i256, ptr %sp1170, align 16
  %sp1172 = getelementptr i256, ptr %370, i64 -2
  %swap.b1173 = load i256, ptr %sp1172, align 16
  store i256 %swap.b1173, ptr %sp1170, align 16
  %sp1178 = getelementptr i256, ptr %370, i64 -4
  %swap.b1179 = load i256, ptr %sp1178, align 16
  store i256 %swap.a1171, ptr %sp1178, align 16
  %sp1183 = getelementptr i256, ptr %370, i64 -3
  %swap.b1184 = load i256, ptr %sp1183, align 16
  store i256 %swap.b1179, ptr %sp1183, align 16
  store i256 %swap.b1184, ptr %sp1172, align 16
  %371 = add i64 %len.addr.34, -3
  br label %dynamic_jump_table.backedge

OP400.JUMPDEST:                                   ; preds = %dynamic_jump_table.OP400.JUMPDEST_crit_edge, %OP412.PUSH0
  %gas.remaining1189 = phi i64 [ %384, %OP412.PUSH0 ], [ %gas.remaining1189.pre, %dynamic_jump_table.OP400.JUMPDEST_crit_edge ]
  %len.addr.26 = phi i64 [ %389, %OP412.PUSH0 ], [ %len.addr.34, %dynamic_jump_table.OP400.JUMPDEST_crit_edge ]
  %372 = add i64 %gas.remaining1189, -18
  %373 = icmp ult i64 %gas.remaining1189, 18
  store i64 %372, ptr %gas.remaining.addr, align 8
  br i1 %373, label %return, label %OP400.JUMPDEST.contd, !prof !2, !annotation !3

OP400.JUMPDEST.contd:                             ; preds = %OP400.JUMPDEST
  %374 = add i64 %len.addr.26, -1022
  %375 = icmp ult i64 %374, -1021
  br i1 %375, label %return.loopexit.split.loop.exit2400, label %OP401.PUSH2, !prof !2

OP401.PUSH2:                                      ; preds = %OP400.JUMPDEST.contd
  %sp1193 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.26
  store i256 610, ptr %sp1193, align 16
  %376 = add nuw nsw i64 %len.addr.26, 2
  %sp1195 = getelementptr i256, ptr %sp1193, i64 -1
  %dup21196 = load i256, ptr %sp1195, align 16
  %sp1197 = getelementptr i256, ptr %sp1193, i64 1
  store i256 %dup21196, ptr %sp1197, align 16
  br label %OP387.JUMPDEST

OP405.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1199 = load i64, ptr %gas.remaining.addr, align 8
  %377 = add i64 %gas.remaining1199, -19
  %378 = icmp ult i64 %gas.remaining1199, 19
  store i64 %377, ptr %gas.remaining.addr, align 8
  br i1 %378, label %return, label %OP405.JUMPDEST.contd, !prof !2, !annotation !3

OP405.JUMPDEST.contd:                             ; preds = %OP405.JUMPDEST
  %379 = add i64 %len.addr.34, -1024
  %380 = icmp ult i64 %379, -1020
  br i1 %380, label %return.loopexit.split.loop.exit2404, label %OP406.DUP3, !prof !2

OP406.DUP3:                                       ; preds = %OP405.JUMPDEST.contd
  %381 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1203 = getelementptr i256, ptr %381, i64 -3
  %dup31204 = load i256, ptr %sp1203, align 16
  store i256 %dup31204, ptr %381, align 16
  %sp1209 = getelementptr i256, ptr %381, i64 -1
  %b1210 = load i256, ptr %sp1209, align 16
  %382 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 %dup31204, i256 %b1210, ptr %arg.ecx.addr)
  %.not2099 = icmp eq i8 %382, 0
  br i1 %.not2099, label %OP408.POP, label %return, !prof !4

OP408.POP:                                        ; preds = %OP406.DUP3
  %383 = add nsw i64 %len.addr.34, -4
  br label %dynamic_jump_table.backedge

OP411.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP125.MLOAD.contd
  %len.addr.27 = phi i64 [ %len.addr.34, %dynamic_jump_table ], [ %135, %OP125.MLOAD.contd ]
  %gas.remaining1216 = load i64, ptr %gas.remaining.addr, align 8
  %384 = add i64 %gas.remaining1216, -42
  %385 = icmp ult i64 %gas.remaining1216, 42
  store i64 %384, ptr %gas.remaining.addr, align 8
  br i1 %385, label %return, label %OP411.JUMPDEST.contd, !prof !2, !annotation !3

OP411.JUMPDEST.contd:                             ; preds = %OP411.JUMPDEST
  %386 = add i64 %len.addr.27, -1020
  %387 = icmp ult i64 %386, -1018
  br i1 %387, label %return.loopexit.split.loop.exit2410, label %OP412.PUSH0, !prof !2

OP412.PUSH0:                                      ; preds = %OP411.JUMPDEST.contd
  %sp1220 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.27
  %sp1222 = getelementptr i256, ptr %sp1220, i64 1
  %sp1224 = getelementptr i256, ptr %sp1220, i64 -1
  %dup31225 = load i256, ptr %sp1224, align 16
  %sp1226 = getelementptr i256, ptr %sp1220, i64 2
  %388 = add i256 %dup31225, 32
  store i256 %388, ptr %sp1220, align 16
  store i256 635, ptr %sp1222, align 16
  %389 = add nuw nsw i64 %len.addr.27, 4
  %sp1246 = getelementptr i256, ptr %sp1220, i64 3
  store i256 %dup31225, ptr %sp1226, align 16
  %sp1254 = getelementptr i256, ptr %sp1220, i64 -2
  %dup51255 = load i256, ptr %sp1254, align 16
  store i256 %dup51255, ptr %sp1246, align 16
  br label %OP400.JUMPDEST

OP425.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1258 = load i64, ptr %gas.remaining.addr, align 8
  %390 = add i64 %gas.remaining1258, -19
  %391 = icmp ult i64 %gas.remaining1258, 19
  store i64 %390, ptr %gas.remaining.addr, align 8
  br i1 %391, label %return, label %OP425.JUMPDEST.contd, !prof !2, !annotation !3

OP425.JUMPDEST.contd:                             ; preds = %OP425.JUMPDEST
  %392 = icmp ult i64 %len.addr.34, 4
  br i1 %392, label %return, label %OP426.SWAP3, !prof !2, !annotation !45

OP426.SWAP3:                                      ; preds = %OP425.JUMPDEST.contd
  %393 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1262 = getelementptr i256, ptr %393, i64 -1
  %swap.a1263 = load i256, ptr %sp1262, align 16
  %sp1264 = getelementptr i256, ptr %393, i64 -4
  %swap.b1265 = load i256, ptr %sp1264, align 16
  store i256 %swap.a1263, ptr %sp1264, align 16
  %sp1269 = getelementptr i256, ptr %393, i64 -3
  %swap.b1270 = load i256, ptr %sp1269, align 16
  store i256 %swap.b1265, ptr %sp1269, align 16
  store i256 %swap.b1270, ptr %sp1262, align 16
  %394 = add i64 %len.addr.34, -3
  br label %dynamic_jump_table.backedge

OP431.JUMPDESTthread-pre-split:                   ; preds = %dynamic_jump_table
  %gas.remaining1276.pr = load i64, ptr %gas.remaining.addr, align 8
  br label %OP431.JUMPDEST

OP431.JUMPDEST:                                   ; preds = %OP431.JUMPDESTthread-pre-split, %OP496.PUSH2.contd1461, %OP455.PUSH2.contd1341
  %gas.remaining1276 = phi i64 [ %gas.remaining1276.pr, %OP431.JUMPDESTthread-pre-split ], [ %449, %OP496.PUSH2.contd1461 ], [ %415, %OP455.PUSH2.contd1341 ]
  %395 = add i64 %gas.remaining1276, -23
  %396 = icmp ult i64 %gas.remaining1276, 23
  store i64 %395, ptr %gas.remaining.addr, align 8
  br i1 %396, label %return, label %OP431.JUMPDEST.contd, !prof !2, !annotation !3

OP431.JUMPDEST.contd:                             ; preds = %OP431.JUMPDEST
  %397 = icmp ugt i64 %len.addr.34, 1022
  br i1 %397, label %return, label %OP432.PUSH32, !prof !2, !annotation !5

OP432.PUSH32:                                     ; preds = %OP431.JUMPDEST.contd
  %sp1280 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr %sp1280, align 16
  %sp1282 = getelementptr i256, ptr %sp1280, i64 1
  store i256 0, ptr %sp1282, align 16
  %398 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 0, i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr %arg.ecx.addr)
  %.not2096 = icmp eq i8 %398, 0
  br i1 %.not2096, label %OP435.PUSH1, label %return, !prof !4

OP435.PUSH1:                                      ; preds = %OP432.PUSH32
  store i256 17, ptr %sp1280, align 16
  store i256 4, ptr %sp1282, align 16
  %399 = tail call fastcc i8 @__revmc_ir_builtin_mstore(i256 4, i256 17, ptr %arg.ecx.addr)
  %.not2097 = icmp eq i8 %399, 0
  br i1 %.not2097, label %OP438.PUSH1, label %return, !prof !4

OP438.PUSH1:                                      ; preds = %OP435.PUSH1
  store i256 36, ptr %sp1280, align 16
  store i256 0, ptr %sp1282, align 16
  %400 = tail call i8 @__revmc_builtin_do_return(ptr nonnull %arg.ecx.addr, ptr nonnull %sp1280, i8 16)
  %.not2098 = icmp eq i8 %400, 0
  %spec.select1579 = select i1 %.not2098, i8 16, i8 %400, !prof !4
  br label %return

OP441.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP174.DUP1
  %len.addr.29 = phi i64 [ %183, %OP174.DUP1 ], [ %len.addr.34, %dynamic_jump_table ]
  %gas.remaining1303 = load i64, ptr %gas.remaining.addr, align 8
  %401 = add i64 %gas.remaining1303, -20
  %402 = icmp ult i64 %gas.remaining1303, 20
  store i64 %401, ptr %gas.remaining.addr, align 8
  br i1 %402, label %return, label %OP441.JUMPDEST.contd, !prof !2, !annotation !3

OP441.JUMPDEST.contd:                             ; preds = %OP441.JUMPDEST
  %403 = icmp eq i64 %len.addr.29, 0
  %404 = add i64 %len.addr.29, -1021
  %405 = icmp ult i64 %404, -1020
  %406 = select i1 %403, i8 91, i8 92
  br i1 %405, label %return, label %OP442.PUSH0, !prof !2

OP442.PUSH0:                                      ; preds = %OP441.JUMPDEST.contd
  %sp1307 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.29
  store i256 0, ptr %sp1307, align 16
  %sp1309 = getelementptr i256, ptr %sp1307, i64 1
  store i256 696, ptr %sp1309, align 16
  %407 = add nuw nsw i64 %len.addr.29, 3
  %sp1311 = getelementptr i256, ptr %sp1307, i64 -1
  %dup31312 = load i256, ptr %sp1311, align 16
  %sp1313 = getelementptr i256, ptr %sp1307, i64 2
  store i256 %dup31312, ptr %sp1313, align 16
  br label %OP217.JUMPDEST

OP447.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1315 = load i64, ptr %gas.remaining.addr, align 8
  %408 = add i64 %gas.remaining1315, -28
  %409 = icmp ult i64 %gas.remaining1315, 28
  store i64 %408, ptr %gas.remaining.addr, align 8
  br i1 %409, label %return, label %OP447.JUMPDEST.contd, !prof !2, !annotation !3

OP447.JUMPDEST.contd:                             ; preds = %OP447.JUMPDEST
  %410 = add i64 %len.addr.34, -1024
  %411 = icmp ult i64 %410, -1021
  br i1 %411, label %return.loopexit.split.loop.exit2418, label %OP448.SWAP2, !prof !2

OP448.SWAP2:                                      ; preds = %OP447.JUMPDEST.contd
  %412 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1319 = getelementptr i256, ptr %412, i64 -1
  %swap.a1320 = load i256, ptr %sp1319, align 16
  %sp1321 = getelementptr i256, ptr %412, i64 -3
  store i256 %swap.a1320, ptr %sp1321, align 16
  %413 = add nsw i64 %len.addr.34, -1
  store i256 %swap.a1320, ptr %412, align 16
  %414 = add i256 %swap.a1320, 1
  store i256 %414, ptr %sp1319, align 16
  %.not2095 = icmp eq i256 %414, 0
  br i1 %.not2095, label %OP455.PUSH2, label %OP459.JUMPDEST

OP455.PUSH2:                                      ; preds = %OP448.SWAP2
  %415 = add i64 %gas.remaining1315, -42
  %416 = icmp ult i64 %408, 14
  store i64 %415, ptr %gas.remaining.addr, align 8
  br i1 %416, label %return, label %OP455.PUSH2.contd1341, !prof !2, !annotation !3

OP455.PUSH2.contd1341:                            ; preds = %OP455.PUSH2
  %sp1325.le = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %413
  store i256 745, ptr %sp1325.le, align 16
  br label %OP431.JUMPDEST

OP458.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1344 = load i64, ptr %gas.remaining.addr, align 8
  %417 = add i64 %gas.remaining1344, -1
  %418 = icmp eq i64 %gas.remaining1344, 0
  store i64 %417, ptr %gas.remaining.addr, align 8
  br i1 %418, label %return, label %OP459.JUMPDEST, !prof !2, !annotation !3

OP459.JUMPDEST:                                   ; preds = %OP448.SWAP2, %dynamic_jump_table.OP459.JUMPDESTthread-pre-split_crit_edge, %OP458.JUMPDEST
  %gas.remaining1346 = phi i64 [ %417, %OP458.JUMPDEST ], [ %408, %OP448.SWAP2 ], [ %gas.remaining1346.pr.pre, %dynamic_jump_table.OP459.JUMPDESTthread-pre-split_crit_edge ]
  %len.addr.30 = phi i64 [ %len.addr.34, %OP458.JUMPDEST ], [ %413, %OP448.SWAP2 ], [ %len.addr.34, %dynamic_jump_table.OP459.JUMPDESTthread-pre-split_crit_edge ]
  %419 = add i64 %gas.remaining1346, -31
  %420 = icmp ult i64 %gas.remaining1346, 31
  store i64 %419, ptr %gas.remaining.addr, align 8
  br i1 %420, label %return, label %OP459.JUMPDEST.contd, !prof !2, !annotation !3

OP459.JUMPDEST.contd:                             ; preds = %OP459.JUMPDEST
  %421 = add i64 %len.addr.30, -1023
  %422 = icmp ult i64 %421, -1020
  br i1 %422, label %return.loopexit.split.loop.exit2424, label %OP460.PUSH1, !prof !2

OP460.PUSH1:                                      ; preds = %OP459.JUMPDEST.contd
  %sp1350 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.30
  %sp1352 = getelementptr i256, ptr %sp1350, i64 -2
  %dup31353 = load i256, ptr %sp1352, align 16
  %sp1354 = getelementptr i256, ptr %sp1350, i64 1
  store i256 %dup31353, ptr %sp1354, align 16
  %423 = add i256 %dup31353, 1
  %sp1364 = getelementptr i256, ptr %sp1350, i64 -1
  %swap.b1365 = load i256, ptr %sp1364, align 16
  store i256 %swap.b1365, ptr %sp1350, align 16
  %sp1370 = getelementptr i256, ptr %sp1350, i64 -3
  %swap.b1371 = load i256, ptr %sp1370, align 16
  store i256 %423, ptr %sp1370, align 16
  store i256 %swap.b1371, ptr %sp1352, align 16
  store i256 %dup31353, ptr %sp1364, align 16
  %424 = add nsw i64 %len.addr.30, -2
  br label %dynamic_jump_table.backedge

OP469.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP192.PUSH2
  %gas.remaining1381 = load i64, ptr %gas.remaining.addr, align 8
  %425 = add i64 %gas.remaining1381, -20
  %426 = icmp ult i64 %gas.remaining1381, 20
  store i64 %425, ptr %gas.remaining.addr, align 8
  br i1 %426, label %return, label %OP469.JUMPDEST.contd, !prof !2, !annotation !3

OP469.JUMPDEST.contd:                             ; preds = %OP469.JUMPDEST
  %427 = icmp eq i64 %len.addr.34, 0
  %428 = add i64 %len.addr.34, -1021
  %429 = icmp ult i64 %428, -1020
  %430 = select i1 %427, i8 91, i8 92
  br i1 %429, label %return, label %OP470.PUSH0, !prof !2

OP470.PUSH0:                                      ; preds = %OP469.JUMPDEST.contd
  %sp1385 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 0, ptr %sp1385, align 16
  %sp1387 = getelementptr i256, ptr %sp1385, i64 1
  store i256 767, ptr %sp1387, align 16
  %431 = add nuw nsw i64 %len.addr.34, 3
  %sp1389 = getelementptr i256, ptr %sp1385, i64 -1
  %dup31390 = load i256, ptr %sp1389, align 16
  %sp1391 = getelementptr i256, ptr %sp1385, i64 2
  store i256 %dup31390, ptr %sp1391, align 16
  br label %OP217.JUMPDEST

OP475.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1393 = load i64, ptr %gas.remaining.addr, align 8
  %432 = add i64 %gas.remaining1393, -23
  %433 = icmp ult i64 %gas.remaining1393, 23
  store i64 %432, ptr %gas.remaining.addr, align 8
  br i1 %433, label %return, label %OP475.JUMPDEST.contd, !prof !2, !annotation !3

OP475.JUMPDEST.contd:                             ; preds = %OP475.JUMPDEST
  %434 = icmp ult i64 %len.addr.34, 4
  %435 = add i64 %len.addr.34, -1023
  %436 = icmp ult i64 %435, -1019
  %437 = select i1 %434, i8 91, i8 92
  br i1 %436, label %return, label %OP476.SWAP2, !prof !2

OP476.SWAP2:                                      ; preds = %OP475.JUMPDEST.contd
  %438 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1397 = getelementptr i256, ptr %438, i64 -1
  %swap.a1398 = load i256, ptr %sp1397, align 16
  %sp1399 = getelementptr i256, ptr %438, i64 -3
  store i256 %swap.a1398, ptr %sp1399, align 16
  store i256 778, ptr %sp1397, align 16
  %439 = add nuw nsw i64 %len.addr.34, 1
  %sp1405 = getelementptr i256, ptr %438, i64 -4
  %dup41406 = load i256, ptr %sp1405, align 16
  store i256 %dup41406, ptr %438, align 16
  br label %OP217.JUMPDEST

OP482.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1409 = load i64, ptr %gas.remaining.addr, align 8
  %440 = add i64 %gas.remaining1409, -45
  %441 = icmp ult i64 %gas.remaining1409, 45
  store i64 %440, ptr %gas.remaining.addr, align 8
  br i1 %441, label %return, label %OP482.JUMPDEST.contd, !prof !2, !annotation !3

OP482.JUMPDEST.contd:                             ; preds = %OP482.JUMPDEST
  %442 = add i64 %len.addr.34, -1024
  %443 = icmp ult i64 %442, -1020
  br i1 %443, label %return.loopexit.split.loop.exit2428, label %OP483.SWAP3, !prof !2

OP483.SWAP3:                                      ; preds = %OP482.JUMPDEST.contd
  %444 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1413 = getelementptr i256, ptr %444, i64 -1
  %swap.a1414 = load i256, ptr %sp1413, align 16
  %sp1415 = getelementptr i256, ptr %444, i64 -4
  store i256 %swap.a1414, ptr %sp1415, align 16
  %445 = add nsw i64 %len.addr.34, -1
  %sp1421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %445
  %sp1423 = getelementptr i256, ptr %444, i64 -3
  %dup31424 = load i256, ptr %sp1423, align 16
  %446 = sub i256 %dup31424, %swap.a1414
  %sp1435 = getelementptr i256, ptr %444, i64 -2
  store i256 %446, ptr %sp1435, align 16
  store i256 %446, ptr %444, align 16
  %447 = icmp ule i256 %swap.a1414, %dup31424
  %448 = zext i1 %447 to i256
  store i256 %448, ptr %sp1421, align 16
  br i1 %447, label %OP500.JUMPDEST, label %OP496.PUSH2

OP496.PUSH2:                                      ; preds = %OP483.SWAP3
  %449 = add i64 %gas.remaining1409, -59
  %450 = icmp ult i64 %440, 14
  store i64 %449, ptr %gas.remaining.addr, align 8
  br i1 %450, label %return, label %OP496.PUSH2.contd1461, !prof !2, !annotation !3

OP496.PUSH2.contd1461:                            ; preds = %OP496.PUSH2
  store i256 801, ptr %sp1421, align 16
  br label %OP431.JUMPDEST

OP499.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1464 = load i64, ptr %gas.remaining.addr, align 8
  %451 = add i64 %gas.remaining1464, -1
  %452 = icmp eq i64 %gas.remaining1464, 0
  store i64 %451, ptr %gas.remaining.addr, align 8
  br i1 %452, label %return, label %OP500.JUMPDEST, !prof !2, !annotation !3

OP500.JUMPDEST:                                   ; preds = %OP483.SWAP3, %dynamic_jump_table.OP500.JUMPDESTthread-pre-split_crit_edge, %OP499.JUMPDEST
  %gas.remaining1466 = phi i64 [ %451, %OP499.JUMPDEST ], [ %440, %OP483.SWAP3 ], [ %gas.remaining1466.pr.pre, %dynamic_jump_table.OP500.JUMPDESTthread-pre-split_crit_edge ]
  %len.addr.32 = phi i64 [ %len.addr.34, %OP499.JUMPDEST ], [ %445, %OP483.SWAP3 ], [ %len.addr.34, %dynamic_jump_table.OP500.JUMPDESTthread-pre-split_crit_edge ]
  %453 = add i64 %gas.remaining1466, -19
  %454 = icmp ult i64 %gas.remaining1466, 19
  store i64 %453, ptr %gas.remaining.addr, align 8
  br i1 %454, label %return, label %OP500.JUMPDEST.contd, !prof !2, !annotation !3

OP500.JUMPDEST.contd:                             ; preds = %OP500.JUMPDEST
  %455 = icmp ult i64 %len.addr.32, 4
  br i1 %455, label %return, label %OP501.SWAP3, !prof !2, !annotation !45

OP501.SWAP3:                                      ; preds = %OP500.JUMPDEST.contd
  %456 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.32
  %sp1470 = getelementptr i256, ptr %456, i64 -1
  %swap.a1471 = load i256, ptr %sp1470, align 16
  %sp1472 = getelementptr i256, ptr %456, i64 -4
  %swap.b1473 = load i256, ptr %sp1472, align 16
  store i256 %swap.a1471, ptr %sp1472, align 16
  %sp1477 = getelementptr i256, ptr %456, i64 -3
  %swap.b1478 = load i256, ptr %sp1477, align 16
  store i256 %swap.b1473, ptr %sp1477, align 16
  store i256 %swap.b1478, ptr %sp1470, align 16
  %457 = add i64 %len.addr.32, -3
  br label %dynamic_jump_table.backedge

OP506.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP201.MLOAD.contd
  %len.addr.33 = phi i64 [ %208, %OP201.MLOAD.contd ], [ %len.addr.34, %dynamic_jump_table ]
  %gas.remaining1484 = load i64, ptr %gas.remaining.addr, align 8
  %458 = add i64 %gas.remaining1484, -42
  %459 = icmp ult i64 %gas.remaining1484, 42
  store i64 %458, ptr %gas.remaining.addr, align 8
  br i1 %459, label %return, label %OP506.JUMPDEST.contd, !prof !2, !annotation !3

OP506.JUMPDEST.contd:                             ; preds = %OP506.JUMPDEST
  %460 = icmp ult i64 %len.addr.33, 3
  %461 = add i64 %len.addr.33, -1020
  %462 = icmp ult i64 %461, -1017
  %463 = select i1 %460, i8 91, i8 92
  br i1 %462, label %return, label %OP507.PUSH0, !prof !2

OP507.PUSH0:                                      ; preds = %OP506.JUMPDEST.contd
  %sp1488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.33
  %sp1490 = getelementptr i256, ptr %sp1488, i64 1
  %sp1492 = getelementptr i256, ptr %sp1488, i64 -1
  %dup31493 = load i256, ptr %sp1492, align 16
  %sp1494 = getelementptr i256, ptr %sp1488, i64 2
  %464 = add i256 %dup31493, 64
  store i256 %464, ptr %sp1488, align 16
  store i256 827, ptr %sp1490, align 16
  %465 = add nuw nsw i64 %len.addr.33, 4
  %sp1514 = getelementptr i256, ptr %sp1488, i64 3
  store i256 %dup31493, ptr %sp1494, align 16
  %sp1522 = getelementptr i256, ptr %sp1488, i64 -3
  %dup61523 = load i256, ptr %sp1522, align 16
  store i256 %dup61523, ptr %sp1514, align 16
  br label %OP226.JUMPDEST

OP520.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1526 = load i64, ptr %gas.remaining.addr, align 8
  %466 = add i64 %gas.remaining1526, -27
  %467 = icmp ult i64 %gas.remaining1526, 27
  store i64 %466, ptr %gas.remaining.addr, align 8
  br i1 %467, label %return, label %OP520.JUMPDEST.contd, !prof !2, !annotation !3

OP520.JUMPDEST.contd:                             ; preds = %OP520.JUMPDEST
  %468 = icmp ult i64 %len.addr.34, 3
  %469 = add i64 %len.addr.34, -1021
  %470 = icmp ult i64 %469, -1018
  %471 = select i1 %468, i8 91, i8 92
  br i1 %470, label %return, label %OP521.PUSH2, !prof !2

OP521.PUSH2:                                      ; preds = %OP520.JUMPDEST.contd
  %sp1530 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %len.addr.34
  store i256 840, ptr %sp1530, align 16
  %sp1532 = getelementptr i256, ptr %sp1530, i64 1
  %472 = add nuw nsw i64 %len.addr.34, 3
  %sp1534 = getelementptr i256, ptr %sp1530, i64 -2
  %dup41535 = load i256, ptr %sp1534, align 16
  %sp1536 = getelementptr i256, ptr %sp1530, i64 2
  %473 = add i256 %dup41535, 32
  store i256 %473, ptr %sp1532, align 16
  %sp1544 = getelementptr i256, ptr %sp1530, i64 -3
  %dup51545 = load i256, ptr %sp1544, align 16
  store i256 %dup51545, ptr %sp1536, align 16
  br label %OP226.JUMPDEST

OP528.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1548 = load i64, ptr %gas.remaining.addr, align 8
  %474 = add i64 %gas.remaining1548, -21
  %475 = icmp ult i64 %gas.remaining1548, 21
  store i64 %474, ptr %gas.remaining.addr, align 8
  br i1 %475, label %return, label %OP528.JUMPDEST.contd, !prof !2, !annotation !3

OP528.JUMPDEST.contd:                             ; preds = %OP528.JUMPDEST
  %476 = icmp ult i64 %len.addr.34, 5
  br i1 %476, label %return, label %OP529.SWAP4, !prof !2, !annotation !45

OP529.SWAP4:                                      ; preds = %OP528.JUMPDEST.contd
  %477 = getelementptr i256, ptr %arg.stack.addr, i64 %len.addr.34
  %sp1552 = getelementptr i256, ptr %477, i64 -1
  %swap.a1553 = load i256, ptr %sp1552, align 16
  %sp1554 = getelementptr i256, ptr %477, i64 -5
  %swap.b1555 = load i256, ptr %sp1554, align 16
  store i256 %swap.a1553, ptr %sp1554, align 16
  %sp1559 = getelementptr i256, ptr %477, i64 -4
  %swap.b1560 = load i256, ptr %sp1559, align 16
  store i256 %swap.b1555, ptr %sp1559, align 16
  store i256 %swap.b1560, ptr %sp1552, align 16
  %478 = add i64 %len.addr.34, -4
  br label %dynamic_jump_table.backedge

OP548.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1568 = load i64, ptr %gas.remaining.addr, align 8
  %479 = add i64 %gas.remaining1568, -1
  %480 = icmp eq i64 %gas.remaining1568, 0
  store i64 %479, ptr %gas.remaining.addr, align 8
  %spec.select1580 = select i1 %480, i8 80, i8 85, !prof !2
  br label %return, !annotation !3

dynamic_jump_table:                               ; preds = %dynamic_jump_table.backedge, %dynamic_jump_table.preheader
  %len.addr.34 = phi i64 [ %len.addr.34.ph, %dynamic_jump_table.preheader ], [ %.sink, %dynamic_jump_table.backedge ]
  %481 = phi i256 [ %.ph, %dynamic_jump_table.preheader ], [ %.be, %dynamic_jump_table.backedge ]
  switch i256 %481, label %return [
    i256 62, label %OP32.JUMPDEST.loopexit
    i256 66, label %OP36.JUMPDEST.loopexit
    i256 77, label %OP45.JUMPDEST.loopexit
    i256 86, label %OP50.JUMPDEST
    i256 99, label %OP58.JUMPDEST
    i256 108, label %OP66.JUMPDEST
    i256 119, label %OP75.JUMPDEST.loopexit
    i256 141, label %OP90.JUMPDEST
    i256 146, label %OP93.JUMPDEST
    i256 159, label %OP101.JUMPDEST
    i256 168, label %OP109.JUMPDEST
    i256 179, label %OP118.JUMPDEST.loopexit
    i256 188, label %OP123.JUMPDEST
    i256 201, label %OP131.JUMPDEST
    i256 210, label %OP139.JUMPDEST
    i256 218, label %OP143.JUMPDEST
    i256 220, label %OP145.JUMPDEST.loopexit
    i256 225, label %OP150.JUMPDESTthread-pre-split
    i256 245, label %OP162.JUMPDEST.loopexit
    i256 252, label %OP169.JUMPDEST.loopexit
    i256 269, label %OP182.JUMPDEST
    i256 321, label %OP197.JUMPDEST
    i256 337, label %OP208.JUMPDEST
    i256 347, label %OP217.JUMPDEST.loopexit
    i256 356, label %OP226.JUMPDEST.loopexit
    i256 365, label %OP231.JUMPDEST
    i256 371, label %OP237.JUMPDEST
    i256 390, label %OP251.JUMPDEST
    i256 396, label %OP257.JUMPDESTthread-pre-split
    i256 400, label %OP261.JUMPDEST.loopexit
    i256 419, label %OP272.JUMPDEST.loopexit
    i256 428, label %OP277.JUMPDEST
    i256 438, label %dynamic_jump_table.OP285.JUMPDEST_crit_edge
    i256 441, label %OP288.JUMPDEST.loopexit
    i256 455, label %OP298.JUMPDEST
    i256 461, label %OP304.JUMPDEST.loopexit
    i256 481, label %OP317.JUMPDEST
    i256 482, label %OP318.JUMPDESTthread-pre-split.loopexit
    i256 495, label %OP327.JUMPDEST
    i256 504, label %dynamic_jump_table.OP336.JUMPDEST_crit_edge
    i256 513, label %dynamic_jump_table.OP345.JUMPDEST_crit_edge
    i256 522, label %OP350.JUMPDEST
    i256 528, label %OP356.JUMPDEST
    i256 547, label %OP370.JUMPDEST
    i256 553, label %dynamic_jump_table.OP376.JUMPDEST_crit_edge
    i256 584, label %dynamic_jump_table.OP387.JUMPDEST_crit_edge
    i256 594, label %OP393.JUMPDEST
    i256 601, label %dynamic_jump_table.OP400.JUMPDEST_crit_edge
    i256 610, label %OP405.JUMPDEST
    i256 616, label %OP411.JUMPDEST
    i256 635, label %OP425.JUMPDEST
    i256 641, label %OP431.JUMPDESTthread-pre-split
    i256 686, label %OP441.JUMPDEST
    i256 696, label %OP447.JUMPDEST
    i256 745, label %OP458.JUMPDEST
    i256 746, label %dynamic_jump_table.OP459.JUMPDESTthread-pre-split_crit_edge
    i256 757, label %OP469.JUMPDEST
    i256 767, label %OP475.JUMPDEST
    i256 778, label %OP482.JUMPDEST
    i256 801, label %OP499.JUMPDEST
    i256 802, label %dynamic_jump_table.OP500.JUMPDESTthread-pre-split_crit_edge
    i256 808, label %OP506.JUMPDEST
    i256 827, label %OP520.JUMPDEST
    i256 840, label %OP528.JUMPDEST
    i256 865, label %OP548.JUMPDEST
  ], !prof !58

dynamic_jump_table.OP336.JUMPDEST_crit_edge:      ; preds = %dynamic_jump_table
  %gas.remaining1001.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP336.JUMPDEST

dynamic_jump_table.OP345.JUMPDEST_crit_edge:      ; preds = %dynamic_jump_table
  %gas.remaining1030.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP345.JUMPDEST

dynamic_jump_table.OP376.JUMPDEST_crit_edge:      ; preds = %dynamic_jump_table
  %gas.remaining1117.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP376.JUMPDEST

dynamic_jump_table.OP387.JUMPDEST_crit_edge:      ; preds = %dynamic_jump_table
  %gas.remaining1154.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP387.JUMPDEST

dynamic_jump_table.OP400.JUMPDEST_crit_edge:      ; preds = %dynamic_jump_table
  %gas.remaining1189.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP400.JUMPDEST

dynamic_jump_table.OP285.JUMPDEST_crit_edge:      ; preds = %dynamic_jump_table
  %gas.remaining859.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP285.JUMPDEST

dynamic_jump_table.OP459.JUMPDESTthread-pre-split_crit_edge: ; preds = %dynamic_jump_table
  %gas.remaining1346.pr.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP459.JUMPDEST

dynamic_jump_table.OP500.JUMPDESTthread-pre-split_crit_edge: ; preds = %dynamic_jump_table
  %gas.remaining1466.pr.pre = load i64, ptr %gas.remaining.addr, align 8
  br label %OP500.JUMPDEST

return.loopexit.split.loop.exit2320:              ; preds = %OP93.JUMPDEST.contd
  %482 = icmp eq i64 %len.addr.34, 0
  %483 = select i1 %482, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2324:              ; preds = %OP123.JUMPDEST.contd
  %484 = icmp eq i64 %len.addr.34, 0
  %485 = select i1 %484, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2328:              ; preds = %OP150.JUMPDEST.contd
  %486 = icmp ult i64 %len.addr.34, 2
  %487 = select i1 %486, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2334:              ; preds = %OP208.JUMPDEST.contd
  %488 = icmp ult i64 %len.addr.34, 3
  %489 = select i1 %488, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2340:              ; preds = %OP231.JUMPDEST.contd
  %490 = icmp ult i64 %len.addr.34, 4
  %491 = select i1 %490, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2350:              ; preds = %OP277.JUMPDEST.contd
  %492 = icmp ult i64 %len.addr.34, 2
  %493 = select i1 %492, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2366:              ; preds = %OP336.JUMPDEST.contd
  %494 = icmp ult i64 %len.addr.21, 2
  %495 = select i1 %494, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2370:              ; preds = %OP345.JUMPDEST.contd
  %496 = icmp eq i64 %len.addr.22, 0
  %497 = select i1 %496, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2374:              ; preds = %OP350.JUMPDEST.contd
  %498 = icmp ult i64 %len.addr.34, 4
  %499 = select i1 %498, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2380:              ; preds = %OP356.JUMPDEST.contd
  %500 = icmp ult i64 %len.addr.23, 2
  %501 = select i1 %500, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2388:              ; preds = %OP376.JUMPDEST.contd
  %502 = icmp ult i64 %len.addr.24, 2
  %503 = select i1 %502, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2392:              ; preds = %OP387.JUMPDEST.contd
  %504 = icmp eq i64 %len.addr.25, 0
  %505 = select i1 %504, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2400:              ; preds = %OP400.JUMPDEST.contd
  %506 = icmp eq i64 %len.addr.26, 0
  %507 = select i1 %506, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2404:              ; preds = %OP405.JUMPDEST.contd
  %508 = icmp ult i64 %len.addr.34, 4
  %509 = select i1 %508, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2410:              ; preds = %OP411.JUMPDEST.contd
  %510 = icmp ult i64 %len.addr.27, 2
  %511 = select i1 %510, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2418:              ; preds = %OP447.JUMPDEST.contd
  %512 = icmp ult i64 %len.addr.34, 3
  %513 = select i1 %512, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2424:              ; preds = %OP459.JUMPDEST.contd
  %514 = icmp ult i64 %len.addr.30, 3
  %515 = select i1 %514, i8 91, i8 92
  br label %return

return.loopexit.split.loop.exit2428:              ; preds = %OP482.JUMPDEST.contd
  %516 = icmp ult i64 %len.addr.34, 4
  %517 = select i1 %516, i8 91, i8 92
  br label %return

return:                                           ; preds = %OP90.JUMPDEST, %OP90.JUMPDEST.contd, %OP93.JUMPDEST, %OP123.JUMPDEST, %OP150.JUMPDEST, %OP151.PUSH0, %OP208.JUMPDEST, %OP210.MLOAD.contd, %OP231.JUMPDEST, %OP232.DUP3, %OP251.JUMPDEST, %OP251.JUMPDEST.contd, %OP277.JUMPDEST, %OP285.JUMPDEST, %OP285.JUMPDEST.contd, %OP298.JUMPDEST, %OP298.JUMPDEST.contd, %OP327.JUMPDEST, %OP327.JUMPDEST.contd, %OP336.JUMPDEST, %OP345.JUMPDEST, %OP350.JUMPDEST, %OP351.DUP3, %OP356.JUMPDEST, %OP370.JUMPDEST, %OP370.JUMPDEST.contd, %OP376.JUMPDEST, %OP387.JUMPDEST, %OP393.JUMPDEST, %OP393.JUMPDEST.contd, %OP400.JUMPDEST, %OP405.JUMPDEST, %OP406.DUP3, %OP411.JUMPDEST, %OP425.JUMPDEST, %OP425.JUMPDEST.contd, %OP447.JUMPDEST, %OP458.JUMPDEST, %OP459.JUMPDEST, %OP482.JUMPDEST, %OP499.JUMPDEST, %OP500.JUMPDEST, %OP500.JUMPDEST.contd, %OP528.JUMPDEST, %OP528.JUMPDEST.contd, %dynamic_jump_table, %resize.i2157, %resize.i2189, %resize.i2237, %return.loopexit.split.loop.exit2320, %return.loopexit.split.loop.exit2324, %return.loopexit.split.loop.exit2328, %return.loopexit.split.loop.exit2334, %return.loopexit.split.loop.exit2340, %return.loopexit.split.loop.exit2350, %return.loopexit.split.loop.exit2366, %return.loopexit.split.loop.exit2370, %return.loopexit.split.loop.exit2374, %return.loopexit.split.loop.exit2380, %return.loopexit.split.loop.exit2388, %return.loopexit.split.loop.exit2392, %return.loopexit.split.loop.exit2400, %return.loopexit.split.loop.exit2404, %return.loopexit.split.loop.exit2410, %return.loopexit.split.loop.exit2418, %return.loopexit.split.loop.exit2424, %return.loopexit.split.loop.exit2428, %resize.i2221, %OP139.JUMPDEST.thread, %resize.i2205, %OP109.JUMPDEST.thread, %resize.i2173, %OP66.JUMPDEST.thread, %resize.i2141, %resize.i, %OP548.JUMPDEST, %OP438.PUSH1, %OP282.PUSH0.contd851, %OP258.PUSH0, %OP143.JUMPDEST, %OP133.MLOAD.contd, %OP115.PUSH0.contd356, %OP103.MLOAD.contd, %OP72.PUSH0.contd218, %OP60.MLOAD.contd, %OP42.PUSH0.contd130, %OP33.PUSH0, %OP520.JUMPDEST.contd, %OP520.JUMPDEST, %OP506.JUMPDEST.contd, %OP506.JUMPDEST, %OP496.PUSH2, %OP475.JUMPDEST.contd, %OP475.JUMPDEST, %OP469.JUMPDEST.contd, %OP469.JUMPDEST, %OP455.PUSH2, %OP441.JUMPDEST.contd, %OP441.JUMPDEST, %OP435.PUSH1, %OP432.PUSH32, %OP431.JUMPDEST.contd, %OP431.JUMPDEST, %OP318.JUMPDEST.contd, %OP318.JUMPDEST, %OP317.JUMPDEST, %OP314.PUSH2, %OP304.JUMPDEST.contd, %OP304.JUMPDEST, %OP288.JUMPDEST.contd, %OP288.JUMPDEST, %OP282.PUSH0, %OP272.JUMPDEST.contd, %OP272.JUMPDEST, %OP261.JUMPDEST.contd, %OP261.JUMPDEST, %OP257.JUMPDEST.contd, %OP257.JUMPDEST, %OP237.JUMPDEST.contd, %OP237.JUMPDEST, %OP226.JUMPDEST.contd, %OP226.JUMPDEST, %OP217.JUMPDEST.contd, %OP217.JUMPDEST, %OP198.PUSH0, %OP197.JUMPDEST.contd, %OP197.JUMPDEST, %OP187.POP.contd571, %OP187.POP.contd, %OP187.POP, %OP183.SWAP2, %OP182.JUMPDEST.contd, %OP182.JUMPDEST, %OP170.PUSH0, %OP169.JUMPDEST.contd, %OP169.JUMPDEST, %OP162.JUMPDEST.contd, %OP162.JUMPDEST, %OP146.PUSH0, %OP145.JUMPDEST.contd, %OP145.JUMPDEST, %OP139.JUMPDEST.contd, %OP139.JUMPDEST, %OP131.JUMPDEST.contd, %OP131.JUMPDEST, %OP118.JUMPDEST.contd, %OP118.JUMPDEST, %OP115.PUSH0, %OP109.JUMPDEST.contd, %OP109.JUMPDEST, %OP101.JUMPDEST.contd, %OP101.JUMPDEST, %OP75.JUMPDEST.contd, %OP75.JUMPDEST, %OP72.PUSH0, %OP66.JUMPDEST.contd, %OP66.JUMPDEST, %OP58.JUMPDEST.contd, %OP58.JUMPDEST, %OP50.JUMPDEST.contd, %OP50.JUMPDEST, %OP45.JUMPDEST.contd, %OP45.JUMPDEST, %OP42.PUSH0, %OP36.JUMPDEST.contd, %OP36.JUMPDEST, %OP32.JUMPDEST.contd, %OP32.JUMPDEST, %OP27.DUP1, %OP22.DUP1, %OP17.DUP1, %OP8.PUSH0, %OP0.PUSH1.contd1, %entry
  %518 = phi i8 [ 80, %entry ], [ %2, %OP0.PUSH1.contd1 ], [ 80, %OP8.PUSH0 ], [ 80, %OP17.DUP1 ], [ 80, %OP22.DUP1 ], [ 80, %OP27.DUP1 ], [ 80, %OP32.JUMPDEST ], [ 92, %OP32.JUMPDEST.contd ], [ 80, %OP36.JUMPDEST ], [ 92, %OP36.JUMPDEST.contd ], [ 80, %OP42.PUSH0 ], [ 80, %OP45.JUMPDEST ], [ %43, %OP45.JUMPDEST.contd ], [ 80, %OP50.JUMPDEST ], [ %50, %OP50.JUMPDEST.contd ], [ 80, %OP58.JUMPDEST ], [ %61, %OP58.JUMPDEST.contd ], [ 80, %OP66.JUMPDEST ], [ 92, %OP66.JUMPDEST.contd ], [ 80, %OP72.PUSH0 ], [ 80, %OP75.JUMPDEST ], [ %83, %OP75.JUMPDEST.contd ], [ 80, %OP101.JUMPDEST ], [ %103, %OP101.JUMPDEST.contd ], [ 80, %OP109.JUMPDEST ], [ 92, %OP109.JUMPDEST.contd ], [ 80, %OP115.PUSH0 ], [ 80, %OP118.JUMPDEST ], [ %125, %OP118.JUMPDEST.contd ], [ 80, %OP131.JUMPDEST ], [ %141, %OP131.JUMPDEST.contd ], [ 80, %OP139.JUMPDEST ], [ 92, %OP139.JUMPDEST.contd ], [ 80, %OP145.JUMPDEST ], [ %161, %OP145.JUMPDEST.contd ], [ %162, %OP146.PUSH0 ], [ 80, %OP162.JUMPDEST ], [ %176, %OP162.JUMPDEST.contd ], [ 80, %OP169.JUMPDEST ], [ 92, %OP169.JUMPDEST.contd ], [ %182, %OP170.PUSH0 ], [ 80, %OP182.JUMPDEST ], [ 91, %OP182.JUMPDEST.contd ], [ %189, %OP183.SWAP2 ], [ 80, %OP187.POP ], [ %195, %OP187.POP.contd ], [ %196, %OP187.POP.contd571 ], [ 80, %OP197.JUMPDEST ], [ %202, %OP197.JUMPDEST.contd ], [ %203, %OP198.PUSH0 ], [ 80, %OP217.JUMPDEST ], [ %225, %OP217.JUMPDEST.contd ], [ 80, %OP226.JUMPDEST ], [ %232, %OP226.JUMPDEST.contd ], [ 80, %OP237.JUMPDEST ], [ %246, %OP237.JUMPDEST.contd ], [ 80, %OP257.JUMPDEST ], [ 92, %OP257.JUMPDEST.contd ], [ 80, %OP261.JUMPDEST ], [ %263, %OP261.JUMPDEST.contd ], [ 80, %OP272.JUMPDEST ], [ %271, %OP272.JUMPDEST.contd ], [ 80, %OP282.PUSH0 ], [ 80, %OP288.JUMPDEST ], [ %293, %OP288.JUMPDEST.contd ], [ 80, %OP304.JUMPDEST ], [ %306, %OP304.JUMPDEST.contd ], [ 80, %OP314.PUSH2 ], [ 80, %OP317.JUMPDEST ], [ 80, %OP318.JUMPDEST ], [ %321, %OP318.JUMPDEST.contd ], [ 80, %OP431.JUMPDEST ], [ 92, %OP431.JUMPDEST.contd ], [ %398, %OP432.PUSH32 ], [ %399, %OP435.PUSH1 ], [ 80, %OP441.JUMPDEST ], [ %406, %OP441.JUMPDEST.contd ], [ 80, %OP455.PUSH2 ], [ 80, %OP469.JUMPDEST ], [ %430, %OP469.JUMPDEST.contd ], [ 80, %OP475.JUMPDEST ], [ %437, %OP475.JUMPDEST.contd ], [ 80, %OP496.PUSH2 ], [ 80, %OP506.JUMPDEST ], [ %463, %OP506.JUMPDEST.contd ], [ 80, %OP520.JUMPDEST ], [ %471, %OP520.JUMPDEST.contd ], [ %spec.select, %OP33.PUSH0 ], [ %spec.select1570, %OP42.PUSH0.contd130 ], [ %spec.select1571, %OP60.MLOAD.contd ], [ %spec.select1572, %OP72.PUSH0.contd218 ], [ %spec.select1573, %OP103.MLOAD.contd ], [ %spec.select1574, %OP115.PUSH0.contd356 ], [ %spec.select1575, %OP133.MLOAD.contd ], [ %spec.select1576, %OP143.JUMPDEST ], [ %spec.select1577, %OP258.PUSH0 ], [ %spec.select1578, %OP282.PUSH0.contd851 ], [ %spec.select1579, %OP438.PUSH1 ], [ %spec.select1580, %OP548.JUMPDEST ], [ %53, %resize.i ], [ %64, %resize.i2141 ], [ 80, %OP66.JUMPDEST.thread ], [ %106, %resize.i2173 ], [ 80, %OP109.JUMPDEST.thread ], [ %144, %resize.i2205 ], [ 80, %OP139.JUMPDEST.thread ], [ %206, %resize.i2221 ], [ %483, %return.loopexit.split.loop.exit2320 ], [ %485, %return.loopexit.split.loop.exit2324 ], [ %487, %return.loopexit.split.loop.exit2328 ], [ %489, %return.loopexit.split.loop.exit2334 ], [ %491, %return.loopexit.split.loop.exit2340 ], [ %493, %return.loopexit.split.loop.exit2350 ], [ %495, %return.loopexit.split.loop.exit2366 ], [ %497, %return.loopexit.split.loop.exit2370 ], [ %499, %return.loopexit.split.loop.exit2374 ], [ %501, %return.loopexit.split.loop.exit2380 ], [ %503, %return.loopexit.split.loop.exit2388 ], [ %505, %return.loopexit.split.loop.exit2392 ], [ %507, %return.loopexit.split.loop.exit2400 ], [ %509, %return.loopexit.split.loop.exit2404 ], [ %511, %return.loopexit.split.loop.exit2410 ], [ %513, %return.loopexit.split.loop.exit2418 ], [ %515, %return.loopexit.split.loop.exit2424 ], [ %517, %return.loopexit.split.loop.exit2428 ], [ 80, %OP90.JUMPDEST ], [ 92, %OP90.JUMPDEST.contd ], [ 80, %OP93.JUMPDEST ], [ 80, %OP123.JUMPDEST ], [ 80, %OP150.JUMPDEST ], [ %169, %OP151.PUSH0 ], [ 80, %OP208.JUMPDEST ], [ %218, %OP210.MLOAD.contd ], [ 80, %OP231.JUMPDEST ], [ %239, %OP232.DUP3 ], [ 80, %OP251.JUMPDEST ], [ 91, %OP251.JUMPDEST.contd ], [ 80, %OP277.JUMPDEST ], [ 80, %OP285.JUMPDEST ], [ 91, %OP285.JUMPDEST.contd ], [ 80, %OP298.JUMPDEST ], [ 91, %OP298.JUMPDEST.contd ], [ 80, %OP327.JUMPDEST ], [ 91, %OP327.JUMPDEST.contd ], [ 80, %OP336.JUMPDEST ], [ 80, %OP345.JUMPDEST ], [ 80, %OP350.JUMPDEST ], [ %343, %OP351.DUP3 ], [ 80, %OP356.JUMPDEST ], [ 80, %OP370.JUMPDEST ], [ 91, %OP370.JUMPDEST.contd ], [ 80, %OP376.JUMPDEST ], [ 80, %OP387.JUMPDEST ], [ 80, %OP393.JUMPDEST ], [ 91, %OP393.JUMPDEST.contd ], [ 80, %OP400.JUMPDEST ], [ 80, %OP405.JUMPDEST ], [ %382, %OP406.DUP3 ], [ 80, %OP411.JUMPDEST ], [ 80, %OP425.JUMPDEST ], [ 91, %OP425.JUMPDEST.contd ], [ 80, %OP447.JUMPDEST ], [ 80, %OP458.JUMPDEST ], [ 80, %OP459.JUMPDEST ], [ 80, %OP482.JUMPDEST ], [ 80, %OP499.JUMPDEST ], [ 80, %OP500.JUMPDEST ], [ 91, %OP500.JUMPDEST.contd ], [ 80, %OP528.JUMPDEST ], [ 91, %OP528.JUMPDEST.contd ], [ 89, %dynamic_jump_table ], [ %95, %resize.i2157 ], [ %133, %resize.i2189 ], [ %215, %resize.i2237 ]
  ret i8 %518
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind speculatable willreturn
define private fastcc i8 @__revmc_ir_builtin_mstore(i256 noundef %0, i256 noundef %1, ptr noalias nocapture noundef nonnull %2) unnamed_addr #1 {
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
  %7 = icmp ugt i64 %5, -33
  %8 = or i1 %4, %7
  %9 = select i1 %8, i64 -1, i64 %6
  %10 = icmp ugt i64 %9, %3
  br i1 %10, label %resize, label %contd, !prof !2

resize:                                           ; preds = %entry
  %11 = tail call i8 @__revmc_builtin_resize_memory(ptr nonnull %2, i64 %9)
  %.not = icmp eq i8 %11, 0
  br i1 %.not, label %contd, label %common.ret, !prof !4

common.ret:                                       ; preds = %resize, %contd
  %common.ret.op = phi i8 [ 0, %contd ], [ %11, %resize ]
  ret i8 %common.ret.op

contd:                                            ; preds = %resize, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %12 = tail call i256 @llvm.bswap.i256(i256 %1)
  store i256 %12, ptr %slot, align 16
  br label %common.ret
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_resize_memory(ptr noalias nocapture noundef align 8 dereferenceable(88), i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.bswap.i256(i256) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite)
define private fastcc i256 @__revmc_ir_builtin_calldataload(i256 noundef %0, ptr nocapture readonly %.72.val, i64 %.80.val) unnamed_addr #4 {
entry:
  %1 = zext i64 %.80.val to i256
  %2 = icmp ugt i256 %1, %0
  br i1 %2, label %then, label %contd

then:                                             ; preds = %entry
  %3 = trunc i256 %0 to i64
  %calldata.addr = getelementptr inbounds i8, ptr %.72.val, i64 %3
  %4 = sub i64 %.80.val, %3
  %5 = tail call i64 @llvm.umin.i64(i64 %4, i64 32)
  %calldata.addr1 = alloca i256, align 16
  store i256 0, ptr %calldata.addr1, align 16
  call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 16 %calldata.addr1, ptr align 1 %calldata.addr, i64 %5, i1 false)
  %calldata.i256 = load i256, ptr %calldata.addr1, align 16
  %6 = tail call i256 @llvm.bswap.i256(i256 %calldata.i256)
  br label %contd

contd:                                            ; preds = %entry, %then
  %7 = phi i256 [ %6, %then ], [ 0, %entry ]
  ret i256 %7
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_do_return(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sload(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_blockhash(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32)) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i160 @llvm.bswap.i160(i160) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sstore(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_log(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8, i8 noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="skylake" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind speculatable willreturn "target-cpu"="skylake" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind speculatable willreturn memory(argmem: readwrite) "target-cpu"="skylake" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!"branch_weights", i32 20000, i32 1}
!5 = !{!"check StackOverflow"}
!6 = !{!7}
!7 = distinct !{!7, !8, !"__revmc_ir_builtin_mload: argument 1"}
!8 = distinct !{!8, !"__revmc_ir_builtin_mload"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"__revmc_ir_builtin_mload: argument 0"}
!11 = !{!10, !7}
!12 = !{!13}
!13 = distinct !{!13, !14, !"__revmc_ir_builtin_mload: argument 1"}
!14 = distinct !{!14, !"__revmc_ir_builtin_mload"}
!15 = !{!16}
!16 = distinct !{!16, !14, !"__revmc_ir_builtin_mload: argument 0"}
!17 = !{!16, !13}
!18 = !{!"branch_weights", i32 118717, i32 2147364931}
!19 = !{!20}
!20 = distinct !{!20, !21, !"__revmc_ir_builtin_mload: argument 1"}
!21 = distinct !{!21, !"__revmc_ir_builtin_mload"}
!22 = !{!23}
!23 = distinct !{!23, !21, !"__revmc_ir_builtin_mload: argument 0"}
!24 = !{!23, !20}
!25 = !{!26}
!26 = distinct !{!26, !27, !"__revmc_ir_builtin_mload: argument 1"}
!27 = distinct !{!27, !"__revmc_ir_builtin_mload"}
!28 = !{!29}
!29 = distinct !{!29, !27, !"__revmc_ir_builtin_mload: argument 0"}
!30 = !{!29, !26}
!31 = !{!"branch_weights", i32 112758, i32 2147370890}
!32 = !{!33}
!33 = distinct !{!33, !34, !"__revmc_ir_builtin_mload: argument 1"}
!34 = distinct !{!34, !"__revmc_ir_builtin_mload"}
!35 = !{!36}
!36 = distinct !{!36, !34, !"__revmc_ir_builtin_mload: argument 0"}
!37 = !{!36, !33}
!38 = !{!39}
!39 = distinct !{!39, !40, !"__revmc_ir_builtin_mload: argument 1"}
!40 = distinct !{!40, !"__revmc_ir_builtin_mload"}
!41 = !{!42}
!42 = distinct !{!42, !40, !"__revmc_ir_builtin_mload: argument 0"}
!43 = !{!42, !39}
!44 = !{!"branch_weights", i32 109997, i32 2147373651}
!45 = !{!"check StackUnderflow"}
!46 = !{!47}
!47 = distinct !{!47, !48, !"__revmc_ir_builtin_mload: argument 1"}
!48 = distinct !{!48, !"__revmc_ir_builtin_mload"}
!49 = !{!50}
!50 = distinct !{!50, !48, !"__revmc_ir_builtin_mload: argument 0"}
!51 = !{!50, !47}
!52 = !{!53}
!53 = distinct !{!53, !54, !"__revmc_ir_builtin_mload: argument 1"}
!54 = distinct !{!54, !"__revmc_ir_builtin_mload"}
!55 = !{!56}
!56 = distinct !{!56, !54, !"__revmc_ir_builtin_mload: argument 0"}
!57 = !{!56, !53}
!58 = !{!"branch_weights", i32 1, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000}
