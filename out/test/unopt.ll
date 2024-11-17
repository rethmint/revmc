; ModuleID = 'test'
source_filename = "evm"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin22.6.0"

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define i8 @test(ptr nocapture noundef align 8 dereferenceable(24) %arg.gas.addr, ptr noalias nocapture noundef align 8 dereferenceable(32768) %arg.stack.addr, ptr noalias nocapture noundef align 8 dereferenceable(8) %arg.stack_len.addr, ptr noalias nocapture noundef align 16 dereferenceable(656) %arg.env.addr, ptr noalias nocapture noundef align 8 dereferenceable(224) %arg.contract.addr, ptr noalias nocapture noundef align 8 dereferenceable(88) %arg.ecx.addr) #0 {
entry:
  %gas.remaining.addr = getelementptr inbounds i8, ptr %arg.gas.addr, i64 8
  %len.addr = alloca i64, align 8
  br label %entry.post

entry.post:                                       ; preds = %entry
  store i64 0, ptr %len.addr, align 8
  br label %OP0.PUSH1

resume:                                           ; No predecessors!
  unreachable

unreachable:                                      ; No predecessors!
  unreachable

OP0.PUSH1:                                        ; preds = %entry.post
  %gas.remaining = load i64, ptr %gas.remaining.addr, align 8
  %0 = sub i64 %gas.remaining, 30
  %1 = icmp ult i64 %gas.remaining, 30
  store i64 %0, ptr %gas.remaining.addr, align 8
  br i1 %1, label %return, label %OP0.PUSH1.contd, !prof !2, !annotation !3

OP0.PUSH1.contd:                                  ; preds = %OP0.PUSH1
  %stack_len = load i64, ptr %len.addr, align 8
  %2 = icmp ugt i64 %stack_len, 1022
  br i1 %2, label %return, label %OP0.PUSH1.contd1, !prof !2, !annotation !4

OP0.PUSH1.contd1:                                 ; preds = %OP0.PUSH1.contd
  %3 = add i64 %stack_len, 1
  store i64 %3, ptr %len.addr, align 8
  %sp = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len
  store i256 128, ptr %sp, align 16
  br label %OP1.PUSH1, !annotation !5

OP1.PUSH1:                                        ; preds = %OP0.PUSH1.contd1
  %stack_len2 = load i64, ptr %len.addr, align 8
  %4 = add i64 %stack_len2, 1
  store i64 %4, ptr %len.addr, align 8
  %sp3 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len2
  store i256 64, ptr %sp3, align 16
  br label %OP2.MSTORE, !annotation !5

OP2.MSTORE:                                       ; preds = %OP1.PUSH1
  %stack_len4 = load i64, ptr %len.addr, align 8
  %5 = add i64 %stack_len4, -2
  store i64 %5, ptr %len.addr, align 8
  %6 = add i64 %stack_len4, -1
  %sp5 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %6
  %a = load i256, ptr %sp5, align 16
  %7 = add i64 %stack_len4, -2
  %sp6 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %7
  %b = load i256, ptr %sp6, align 16
  %8 = call i8 @__revmc_ir_builtin_mstore(i256 %a, i256 %b, ptr %arg.ecx.addr)
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %return, label %OP2.MSTORE.contd, !prof !2

OP2.MSTORE.contd:                                 ; preds = %OP2.MSTORE
  br label %OP3.PUSH1, !annotation !5

OP3.PUSH1:                                        ; preds = %OP2.MSTORE.contd
  %stack_len7 = load i64, ptr %len.addr, align 8
  %10 = add i64 %stack_len7, 1
  store i64 %10, ptr %len.addr, align 8
  %sp8 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len7
  store i256 4, ptr %sp8, align 16
  br label %OP4.CALLDATASIZE, !annotation !5

OP4.CALLDATASIZE:                                 ; preds = %OP3.PUSH1
  %stack_len9 = load i64, ptr %len.addr, align 8
  %11 = add i64 %stack_len9, 1
  store i64 %11, ptr %len.addr, align 8
  %contract.input.len.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %contract.input.len = load i64, ptr %contract.input.len.addr, align 8
  %12 = zext i64 %contract.input.len to i256
  %sp10 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len9
  store i256 %12, ptr %sp10, align 16
  br label %OP5.LT, !annotation !5

OP5.LT:                                           ; preds = %OP4.CALLDATASIZE
  %stack_len11 = load i64, ptr %len.addr, align 8
  %13 = add i64 %stack_len11, -1
  store i64 %13, ptr %len.addr, align 8
  %14 = add i64 %stack_len11, -1
  %sp12 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %14
  %a13 = load i256, ptr %sp12, align 16
  %15 = add i64 %stack_len11, -2
  %sp14 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %15
  %b15 = load i256, ptr %sp14, align 16
  %16 = icmp ult i256 %a13, %b15
  %17 = zext i1 %16 to i256
  %18 = add i64 %stack_len11, -2
  %sp16 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %18
  store i256 %17, ptr %sp16, align 16
  br label %OP6.PUSH2, !annotation !5

OP6.PUSH2:                                        ; preds = %OP5.LT
  br label %OP7.JUMPI, !annotation !6

OP7.JUMPI:                                        ; preds = %OP6.PUSH2
  %stack_len17 = load i64, ptr %len.addr, align 8
  %19 = add i64 %stack_len17, -1
  store i64 %19, ptr %len.addr, align 8
  %20 = add i64 %stack_len17, -1
  %sp18 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %20
  %a19 = load i256, ptr %sp18, align 16
  %21 = icmp ne i256 %a19, 0
  br i1 %21, label %OP32.JUMPDEST, label %OP8.PUSH0

OP8.PUSH0:                                        ; preds = %OP7.JUMPI
  %gas.remaining20 = load i64, ptr %gas.remaining.addr, align 8
  %22 = sub i64 %gas.remaining20, 33
  %23 = icmp ult i64 %gas.remaining20, 33
  store i64 %22, ptr %gas.remaining.addr, align 8
  br i1 %23, label %return, label %OP8.PUSH0.contd, !prof !2, !annotation !3

OP8.PUSH0.contd:                                  ; preds = %OP8.PUSH0
  %stack_len21 = load i64, ptr %len.addr, align 8
  %24 = icmp ugt i64 %stack_len21, 1021
  br i1 %24, label %return, label %OP8.PUSH0.contd22, !prof !2, !annotation !4

OP8.PUSH0.contd22:                                ; preds = %OP8.PUSH0.contd
  %25 = add i64 %stack_len21, 1
  store i64 %25, ptr %len.addr, align 8
  %sp23 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len21
  store i256 0, ptr %sp23, align 16
  br label %OP9.CALLDATALOAD, !annotation !5

OP9.CALLDATALOAD:                                 ; preds = %OP8.PUSH0.contd22
  %stack_len24 = load i64, ptr %len.addr, align 8
  %26 = add i64 %stack_len24, -1
  %sp25 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %26
  %a26 = load i256, ptr %sp25, align 16
  %27 = call i256 @__revmc_ir_builtin_calldataload(i256 %a26, ptr %arg.contract.addr)
  %28 = add i64 %stack_len24, -1
  %sp27 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %28
  store i256 %27, ptr %sp27, align 16
  br label %OP10.PUSH1, !annotation !5

OP10.PUSH1:                                       ; preds = %OP9.CALLDATALOAD
  %stack_len28 = load i64, ptr %len.addr, align 8
  %29 = add i64 %stack_len28, 1
  store i64 %29, ptr %len.addr, align 8
  %sp29 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len28
  store i256 224, ptr %sp29, align 16
  br label %OP11.SHR, !annotation !5

OP11.SHR:                                         ; preds = %OP10.PUSH1
  %stack_len30 = load i64, ptr %len.addr, align 8
  %30 = add i64 %stack_len30, -1
  store i64 %30, ptr %len.addr, align 8
  %31 = add i64 %stack_len30, -1
  %sp31 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %31
  %a32 = load i256, ptr %sp31, align 16
  %32 = add i64 %stack_len30, -2
  %sp33 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %32
  %b34 = load i256, ptr %sp33, align 16
  %33 = lshr i256 %b34, %a32
  %34 = icmp ugt i256 %a32, 255
  %35 = select i1 %34, i256 0, i256 %33
  %36 = add i64 %stack_len30, -2
  %sp35 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %36
  store i256 %35, ptr %sp35, align 16
  br label %OP12.DUP1, !annotation !5

OP12.DUP1:                                        ; preds = %OP11.SHR
  %stack_len36 = load i64, ptr %len.addr, align 8
  %37 = add i64 %stack_len36, 1
  store i64 %37, ptr %len.addr, align 8
  %38 = sub i64 %stack_len36, 1
  %sp37 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %38
  %dup1 = load i256, ptr %sp37, align 16
  %sp38 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len36
  store i256 %dup1, ptr %sp38, align 16
  br label %OP13.PUSH4, !annotation !5

OP13.PUSH4:                                       ; preds = %OP12.DUP1
  %stack_len39 = load i64, ptr %len.addr, align 8
  %39 = add i64 %stack_len39, 1
  store i64 %39, ptr %len.addr, align 8
  %sp40 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len39
  store i256 107354813, ptr %sp40, align 16
  br label %OP14.EQ, !annotation !5

OP14.EQ:                                          ; preds = %OP13.PUSH4
  %stack_len41 = load i64, ptr %len.addr, align 8
  %40 = add i64 %stack_len41, -1
  store i64 %40, ptr %len.addr, align 8
  %41 = add i64 %stack_len41, -1
  %sp42 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %41
  %a43 = load i256, ptr %sp42, align 16
  %42 = add i64 %stack_len41, -2
  %sp44 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %42
  %b45 = load i256, ptr %sp44, align 16
  %43 = icmp eq i256 %a43, %b45
  %44 = zext i1 %43 to i256
  %45 = add i64 %stack_len41, -2
  %sp46 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %45
  store i256 %44, ptr %sp46, align 16
  br label %OP15.PUSH2, !annotation !5

OP15.PUSH2:                                       ; preds = %OP14.EQ
  br label %OP16.JUMPI, !annotation !6

OP16.JUMPI:                                       ; preds = %OP15.PUSH2
  %stack_len47 = load i64, ptr %len.addr, align 8
  %46 = add i64 %stack_len47, -1
  store i64 %46, ptr %len.addr, align 8
  %47 = add i64 %stack_len47, -1
  %sp48 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %47
  %a49 = load i256, ptr %sp48, align 16
  %48 = icmp ne i256 %a49, 0
  br i1 %48, label %OP36.JUMPDEST, label %OP17.DUP1

OP17.DUP1:                                        ; preds = %OP16.JUMPI
  %gas.remaining50 = load i64, ptr %gas.remaining.addr, align 8
  %49 = sub i64 %gas.remaining50, 22
  %50 = icmp ult i64 %gas.remaining50, 22
  store i64 %49, ptr %gas.remaining.addr, align 8
  br i1 %50, label %return, label %OP17.DUP1.contd, !prof !2, !annotation !3

OP17.DUP1.contd:                                  ; preds = %OP17.DUP1
  %stack_len51 = load i64, ptr %len.addr, align 8
  %51 = icmp ult i64 %stack_len51, 1
  %52 = icmp ugt i64 %stack_len51, 1022
  %53 = or i1 %51, %52
  %54 = select i1 %51, i8 91, i8 92
  br i1 %53, label %return, label %OP17.DUP1.contd52, !prof !2

OP17.DUP1.contd52:                                ; preds = %OP17.DUP1.contd
  %55 = add i64 %stack_len51, 1
  store i64 %55, ptr %len.addr, align 8
  %56 = sub i64 %stack_len51, 1
  %sp53 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %56
  %dup154 = load i256, ptr %sp53, align 16
  %sp55 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len51
  store i256 %dup154, ptr %sp55, align 16
  br label %OP18.PUSH4, !annotation !5

OP18.PUSH4:                                       ; preds = %OP17.DUP1.contd52
  %stack_len56 = load i64, ptr %len.addr, align 8
  %57 = add i64 %stack_len56, 1
  store i64 %57, ptr %len.addr, align 8
  %sp57 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len56
  store i256 2894061151, ptr %sp57, align 16
  br label %OP19.EQ, !annotation !5

OP19.EQ:                                          ; preds = %OP18.PUSH4
  %stack_len58 = load i64, ptr %len.addr, align 8
  %58 = add i64 %stack_len58, -1
  store i64 %58, ptr %len.addr, align 8
  %59 = add i64 %stack_len58, -1
  %sp59 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %59
  %a60 = load i256, ptr %sp59, align 16
  %60 = add i64 %stack_len58, -2
  %sp61 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %60
  %b62 = load i256, ptr %sp61, align 16
  %61 = icmp eq i256 %a60, %b62
  %62 = zext i1 %61 to i256
  %63 = add i64 %stack_len58, -2
  %sp63 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %63
  store i256 %62, ptr %sp63, align 16
  br label %OP20.PUSH2, !annotation !5

OP20.PUSH2:                                       ; preds = %OP19.EQ
  br label %OP21.JUMPI, !annotation !6

OP21.JUMPI:                                       ; preds = %OP20.PUSH2
  %stack_len64 = load i64, ptr %len.addr, align 8
  %64 = add i64 %stack_len64, -1
  store i64 %64, ptr %len.addr, align 8
  %65 = add i64 %stack_len64, -1
  %sp65 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %65
  %a66 = load i256, ptr %sp65, align 16
  %66 = icmp ne i256 %a66, 0
  br i1 %66, label %OP66.JUMPDEST, label %OP22.DUP1

OP22.DUP1:                                        ; preds = %OP21.JUMPI
  %gas.remaining67 = load i64, ptr %gas.remaining.addr, align 8
  %67 = sub i64 %gas.remaining67, 22
  %68 = icmp ult i64 %gas.remaining67, 22
  store i64 %67, ptr %gas.remaining.addr, align 8
  br i1 %68, label %return, label %OP22.DUP1.contd, !prof !2, !annotation !3

OP22.DUP1.contd:                                  ; preds = %OP22.DUP1
  %stack_len68 = load i64, ptr %len.addr, align 8
  %69 = icmp ult i64 %stack_len68, 1
  %70 = icmp ugt i64 %stack_len68, 1022
  %71 = or i1 %69, %70
  %72 = select i1 %69, i8 91, i8 92
  br i1 %71, label %return, label %OP22.DUP1.contd69, !prof !2

OP22.DUP1.contd69:                                ; preds = %OP22.DUP1.contd
  %73 = add i64 %stack_len68, 1
  store i64 %73, ptr %len.addr, align 8
  %74 = sub i64 %stack_len68, 1
  %sp70 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %74
  %dup171 = load i256, ptr %sp70, align 16
  %sp72 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len68
  store i256 %dup171, ptr %sp72, align 16
  br label %OP23.PUSH4, !annotation !5

OP23.PUSH4:                                       ; preds = %OP22.DUP1.contd69
  %stack_len73 = load i64, ptr %len.addr, align 8
  %75 = add i64 %stack_len73, 1
  store i64 %75, ptr %len.addr, align 8
  %sp74 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len73
  store i256 3486268094, ptr %sp74, align 16
  br label %OP24.EQ, !annotation !5

OP24.EQ:                                          ; preds = %OP23.PUSH4
  %stack_len75 = load i64, ptr %len.addr, align 8
  %76 = add i64 %stack_len75, -1
  store i64 %76, ptr %len.addr, align 8
  %77 = add i64 %stack_len75, -1
  %sp76 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %77
  %a77 = load i256, ptr %sp76, align 16
  %78 = add i64 %stack_len75, -2
  %sp78 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %78
  %b79 = load i256, ptr %sp78, align 16
  %79 = icmp eq i256 %a77, %b79
  %80 = zext i1 %79 to i256
  %81 = add i64 %stack_len75, -2
  %sp80 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %81
  store i256 %80, ptr %sp80, align 16
  br label %OP25.PUSH2, !annotation !5

OP25.PUSH2:                                       ; preds = %OP24.EQ
  br label %OP26.JUMPI, !annotation !6

OP26.JUMPI:                                       ; preds = %OP25.PUSH2
  %stack_len81 = load i64, ptr %len.addr, align 8
  %82 = add i64 %stack_len81, -1
  store i64 %82, ptr %len.addr, align 8
  %83 = add i64 %stack_len81, -1
  %sp82 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %83
  %a83 = load i256, ptr %sp82, align 16
  %84 = icmp ne i256 %a83, 0
  br i1 %84, label %OP109.JUMPDEST, label %OP27.DUP1

OP27.DUP1:                                        ; preds = %OP26.JUMPI
  %gas.remaining84 = load i64, ptr %gas.remaining.addr, align 8
  %85 = sub i64 %gas.remaining84, 22
  %86 = icmp ult i64 %gas.remaining84, 22
  store i64 %85, ptr %gas.remaining.addr, align 8
  br i1 %86, label %return, label %OP27.DUP1.contd, !prof !2, !annotation !3

OP27.DUP1.contd:                                  ; preds = %OP27.DUP1
  %stack_len85 = load i64, ptr %len.addr, align 8
  %87 = icmp ult i64 %stack_len85, 1
  %88 = icmp ugt i64 %stack_len85, 1022
  %89 = or i1 %87, %88
  %90 = select i1 %87, i8 91, i8 92
  br i1 %89, label %return, label %OP27.DUP1.contd86, !prof !2

OP27.DUP1.contd86:                                ; preds = %OP27.DUP1.contd
  %91 = add i64 %stack_len85, 1
  store i64 %91, ptr %len.addr, align 8
  %92 = sub i64 %stack_len85, 1
  %sp87 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %92
  %dup188 = load i256, ptr %sp87, align 16
  %sp89 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len85
  store i256 %dup188, ptr %sp89, align 16
  br label %OP28.PUSH4, !annotation !5

OP28.PUSH4:                                       ; preds = %OP27.DUP1.contd86
  %stack_len90 = load i64, ptr %len.addr, align 8
  %93 = add i64 %stack_len90, 1
  store i64 %93, ptr %len.addr, align 8
  %sp91 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len90
  store i256 3901915068, ptr %sp91, align 16
  br label %OP29.EQ, !annotation !5

OP29.EQ:                                          ; preds = %OP28.PUSH4
  %stack_len92 = load i64, ptr %len.addr, align 8
  %94 = add i64 %stack_len92, -1
  store i64 %94, ptr %len.addr, align 8
  %95 = add i64 %stack_len92, -1
  %sp93 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %95
  %a94 = load i256, ptr %sp93, align 16
  %96 = add i64 %stack_len92, -2
  %sp95 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %96
  %b96 = load i256, ptr %sp95, align 16
  %97 = icmp eq i256 %a94, %b96
  %98 = zext i1 %97 to i256
  %99 = add i64 %stack_len92, -2
  %sp97 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %99
  store i256 %98, ptr %sp97, align 16
  br label %OP30.PUSH2, !annotation !5

OP30.PUSH2:                                       ; preds = %OP29.EQ
  br label %OP31.JUMPI, !annotation !6

OP31.JUMPI:                                       ; preds = %OP30.PUSH2
  %stack_len98 = load i64, ptr %len.addr, align 8
  %100 = add i64 %stack_len98, -1
  store i64 %100, ptr %len.addr, align 8
  %101 = add i64 %stack_len98, -1
  %sp99 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %101
  %a100 = load i256, ptr %sp99, align 16
  %102 = icmp ne i256 %a100, 0
  br i1 %102, label %OP139.JUMPDEST, label %OP32.JUMPDEST

OP32.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP31.JUMPI, %OP7.JUMPI
  %gas.remaining101 = load i64, ptr %gas.remaining.addr, align 8
  %103 = sub i64 %gas.remaining101, 6
  %104 = icmp ult i64 %gas.remaining101, 6
  store i64 %103, ptr %gas.remaining.addr, align 8
  br i1 %104, label %return, label %OP32.JUMPDEST.contd, !prof !2, !annotation !3

OP32.JUMPDEST.contd:                              ; preds = %OP32.JUMPDEST
  %stack_len102 = load i64, ptr %len.addr, align 8
  %105 = icmp ugt i64 %stack_len102, 1022
  br i1 %105, label %return, label %OP32.JUMPDEST.contd103, !prof !2, !annotation !4

OP32.JUMPDEST.contd103:                           ; preds = %OP32.JUMPDEST.contd
  br label %OP33.PUSH0, !annotation !5

OP33.PUSH0:                                       ; preds = %OP32.JUMPDEST.contd103
  %stack_len104 = load i64, ptr %len.addr, align 8
  %106 = add i64 %stack_len104, 1
  store i64 %106, ptr %len.addr, align 8
  %sp105 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len104
  store i256 0, ptr %sp105, align 16
  br label %OP34.DUP1, !annotation !5

OP34.DUP1:                                        ; preds = %OP33.PUSH0
  %stack_len106 = load i64, ptr %len.addr, align 8
  %107 = add i64 %stack_len106, 1
  store i64 %107, ptr %len.addr, align 8
  %108 = sub i64 %stack_len106, 1
  %sp107 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %108
  %dup1108 = load i256, ptr %sp107, align 16
  %sp109 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len106
  store i256 %dup1108, ptr %sp109, align 16
  br label %OP35.REVERT, !annotation !5

OP35.REVERT:                                      ; preds = %OP34.DUP1
  %stack_len110 = load i64, ptr %len.addr, align 8
  %109 = add i64 %stack_len110, -2
  store i64 %109, ptr %len.addr, align 8
  %110 = sub i64 %stack_len110, 2
  %sp111 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %110
  %111 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp111, i8 16)
  %112 = icmp ne i8 %111, 0
  br i1 %112, label %return, label %OP35.REVERT.contd, !prof !2

OP35.REVERT.contd:                                ; preds = %OP35.REVERT
  br label %return, !annotation !7

OP36.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP16.JUMPI
  %gas.remaining112 = load i64, ptr %gas.remaining.addr, align 8
  %113 = sub i64 %gas.remaining112, 22
  %114 = icmp ult i64 %gas.remaining112, 22
  store i64 %113, ptr %gas.remaining.addr, align 8
  br i1 %114, label %return, label %OP36.JUMPDEST.contd, !prof !2, !annotation !3

OP36.JUMPDEST.contd:                              ; preds = %OP36.JUMPDEST
  %stack_len113 = load i64, ptr %len.addr, align 8
  %115 = icmp ugt i64 %stack_len113, 1021
  br i1 %115, label %return, label %OP36.JUMPDEST.contd114, !prof !2, !annotation !4

OP36.JUMPDEST.contd114:                           ; preds = %OP36.JUMPDEST.contd
  br label %OP37.CALLVALUE, !annotation !5

OP37.CALLVALUE:                                   ; preds = %OP36.JUMPDEST.contd114
  %stack_len115 = load i64, ptr %len.addr, align 8
  %116 = add i64 %stack_len115, 1
  store i64 %116, ptr %len.addr, align 8
  %contract.call_value.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value = load i256, ptr %contract.call_value.addr, align 16
  %sp116 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len115
  store i256 %contract.call_value, ptr %sp116, align 16
  br label %OP38.DUP1, !annotation !5

OP38.DUP1:                                        ; preds = %OP37.CALLVALUE
  %stack_len117 = load i64, ptr %len.addr, align 8
  %117 = add i64 %stack_len117, 1
  store i64 %117, ptr %len.addr, align 8
  %118 = sub i64 %stack_len117, 1
  %sp118 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %118
  %dup1119 = load i256, ptr %sp118, align 16
  %sp120 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len117
  store i256 %dup1119, ptr %sp120, align 16
  br label %OP39.ISZERO, !annotation !5

OP39.ISZERO:                                      ; preds = %OP38.DUP1
  %stack_len121 = load i64, ptr %len.addr, align 8
  %119 = add i64 %stack_len121, -1
  %sp122 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %119
  %a123 = load i256, ptr %sp122, align 16
  %120 = icmp eq i256 %a123, 0
  %121 = zext i1 %120 to i256
  %122 = add i64 %stack_len121, -1
  %sp124 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %122
  store i256 %121, ptr %sp124, align 16
  br label %OP40.PUSH2, !annotation !5

OP40.PUSH2:                                       ; preds = %OP39.ISZERO
  br label %OP41.JUMPI, !annotation !6

OP41.JUMPI:                                       ; preds = %OP40.PUSH2
  %stack_len125 = load i64, ptr %len.addr, align 8
  %123 = add i64 %stack_len125, -1
  store i64 %123, ptr %len.addr, align 8
  %124 = add i64 %stack_len125, -1
  %sp126 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %124
  %a127 = load i256, ptr %sp126, align 16
  %125 = icmp ne i256 %a127, 0
  br i1 %125, label %OP45.JUMPDEST, label %OP42.PUSH0

OP42.PUSH0:                                       ; preds = %OP41.JUMPI
  %gas.remaining128 = load i64, ptr %gas.remaining.addr, align 8
  %126 = sub i64 %gas.remaining128, 5
  %127 = icmp ult i64 %gas.remaining128, 5
  store i64 %126, ptr %gas.remaining.addr, align 8
  br i1 %127, label %return, label %OP42.PUSH0.contd, !prof !2, !annotation !3

OP42.PUSH0.contd:                                 ; preds = %OP42.PUSH0
  %stack_len129 = load i64, ptr %len.addr, align 8
  %128 = icmp ugt i64 %stack_len129, 1022
  br i1 %128, label %return, label %OP42.PUSH0.contd130, !prof !2, !annotation !4

OP42.PUSH0.contd130:                              ; preds = %OP42.PUSH0.contd
  %129 = add i64 %stack_len129, 1
  store i64 %129, ptr %len.addr, align 8
  %sp131 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len129
  store i256 0, ptr %sp131, align 16
  br label %OP43.DUP1, !annotation !5

OP43.DUP1:                                        ; preds = %OP42.PUSH0.contd130
  %stack_len132 = load i64, ptr %len.addr, align 8
  %130 = add i64 %stack_len132, 1
  store i64 %130, ptr %len.addr, align 8
  %131 = sub i64 %stack_len132, 1
  %sp133 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %131
  %dup1134 = load i256, ptr %sp133, align 16
  %sp135 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len132
  store i256 %dup1134, ptr %sp135, align 16
  br label %OP44.REVERT, !annotation !5

OP44.REVERT:                                      ; preds = %OP43.DUP1
  %stack_len136 = load i64, ptr %len.addr, align 8
  %132 = add i64 %stack_len136, -2
  store i64 %132, ptr %len.addr, align 8
  %133 = sub i64 %stack_len136, 2
  %sp137 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %133
  %134 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp137, i8 16)
  %135 = icmp ne i8 %134, 0
  br i1 %135, label %return, label %OP44.REVERT.contd, !prof !2

OP44.REVERT.contd:                                ; preds = %OP44.REVERT
  br label %return, !annotation !7

OP45.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP41.JUMPI
  %gas.remaining138 = load i64, ptr %gas.remaining.addr, align 8
  %136 = sub i64 %gas.remaining138, 17
  %137 = icmp ult i64 %gas.remaining138, 17
  store i64 %136, ptr %gas.remaining.addr, align 8
  br i1 %137, label %return, label %OP45.JUMPDEST.contd, !prof !2, !annotation !3

OP45.JUMPDEST.contd:                              ; preds = %OP45.JUMPDEST
  %stack_len139 = load i64, ptr %len.addr, align 8
  %138 = icmp ult i64 %stack_len139, 1
  %139 = icmp ugt i64 %stack_len139, 1023
  %140 = or i1 %138, %139
  %141 = select i1 %138, i8 91, i8 92
  br i1 %140, label %return, label %OP45.JUMPDEST.contd140, !prof !2

OP45.JUMPDEST.contd140:                           ; preds = %OP45.JUMPDEST.contd
  br label %OP46.POP, !annotation !5

OP46.POP:                                         ; preds = %OP45.JUMPDEST.contd140
  %stack_len141 = load i64, ptr %len.addr, align 8
  %142 = add i64 %stack_len141, -1
  store i64 %142, ptr %len.addr, align 8
  br label %OP47.PUSH2, !annotation !5

OP47.PUSH2:                                       ; preds = %OP46.POP
  %stack_len142 = load i64, ptr %len.addr, align 8
  %143 = add i64 %stack_len142, 1
  store i64 %143, ptr %len.addr, align 8
  %sp143 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len142
  store i256 86, ptr %sp143, align 16
  br label %OP48.PUSH2, !annotation !5

OP48.PUSH2:                                       ; preds = %OP47.PUSH2
  br label %OP49.JUMP, !annotation !6

OP49.JUMP:                                        ; preds = %OP48.PUSH2
  %stack_len144 = load i64, ptr %len.addr, align 8
  br label %OP145.JUMPDEST

OP50.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining145 = load i64, ptr %gas.remaining.addr, align 8
  %144 = sub i64 %gas.remaining145, 27
  %145 = icmp ult i64 %gas.remaining145, 27
  store i64 %144, ptr %gas.remaining.addr, align 8
  br i1 %145, label %return, label %OP50.JUMPDEST.contd, !prof !2, !annotation !3

OP50.JUMPDEST.contd:                              ; preds = %OP50.JUMPDEST
  %stack_len146 = load i64, ptr %len.addr, align 8
  %146 = icmp ult i64 %stack_len146, 1
  %147 = icmp ugt i64 %stack_len146, 1021
  %148 = or i1 %146, %147
  %149 = select i1 %146, i8 91, i8 92
  br i1 %148, label %return, label %OP50.JUMPDEST.contd147, !prof !2

OP50.JUMPDEST.contd147:                           ; preds = %OP50.JUMPDEST.contd
  br label %OP51.PUSH1, !annotation !5

OP51.PUSH1:                                       ; preds = %OP50.JUMPDEST.contd147
  %stack_len148 = load i64, ptr %len.addr, align 8
  %150 = add i64 %stack_len148, 1
  store i64 %150, ptr %len.addr, align 8
  %sp149 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len148
  store i256 64, ptr %sp149, align 16
  br label %OP52.MLOAD, !annotation !5

OP52.MLOAD:                                       ; preds = %OP51.PUSH1
  %stack_len150 = load i64, ptr %len.addr, align 8
  %151 = add i64 %stack_len150, -1
  %sp151 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %151
  %a152 = load i256, ptr %sp151, align 16
  %mload.out.slot = alloca i256, align 16
  %152 = call i8 @__revmc_ir_builtin_mload(i256 %a152, ptr %mload.out.slot, ptr %arg.ecx.addr)
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %return, label %OP52.MLOAD.contd, !prof !2

OP52.MLOAD.contd:                                 ; preds = %OP52.MLOAD
  %mload.out = load i256, ptr %mload.out.slot, align 16
  %154 = add i64 %stack_len150, -1
  %sp153 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %154
  store i256 %mload.out, ptr %sp153, align 16
  br label %OP53.PUSH2, !annotation !5

OP53.PUSH2:                                       ; preds = %OP52.MLOAD.contd
  %stack_len154 = load i64, ptr %len.addr, align 8
  %155 = add i64 %stack_len154, 1
  store i64 %155, ptr %len.addr, align 8
  %sp155 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len154
  store i256 99, ptr %sp155, align 16
  br label %OP54.SWAP2, !annotation !5

OP54.SWAP2:                                       ; preds = %OP53.PUSH2
  %stack_len156 = load i64, ptr %len.addr, align 8
  %156 = sub i64 %stack_len156, 1
  %sp157 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %156
  %swap.a = load i256, ptr %sp157, align 16
  %157 = sub i64 %stack_len156, 3
  %sp158 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %157
  %swap.b = load i256, ptr %sp158, align 16
  store i256 %swap.a, ptr %sp158, align 16
  store i256 %swap.b, ptr %sp157, align 16
  br label %OP55.SWAP1, !annotation !5

OP55.SWAP1:                                       ; preds = %OP54.SWAP2
  %stack_len159 = load i64, ptr %len.addr, align 8
  %158 = sub i64 %stack_len159, 1
  %sp160 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %158
  %swap.a161 = load i256, ptr %sp160, align 16
  %159 = sub i64 %stack_len159, 2
  %sp162 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %159
  %swap.b163 = load i256, ptr %sp162, align 16
  store i256 %swap.a161, ptr %sp162, align 16
  store i256 %swap.b163, ptr %sp160, align 16
  br label %OP56.PUSH2, !annotation !5

OP56.PUSH2:                                       ; preds = %OP55.SWAP1
  br label %OP57.JUMP, !annotation !6

OP57.JUMP:                                        ; preds = %OP56.PUSH2
  %stack_len164 = load i64, ptr %len.addr, align 8
  br label %OP237.JUMPDEST

OP58.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining165 = load i64, ptr %gas.remaining.addr, align 8
  %160 = sub i64 %gas.remaining165, 19
  %161 = icmp ult i64 %gas.remaining165, 19
  store i64 %160, ptr %gas.remaining.addr, align 8
  br i1 %161, label %return, label %OP58.JUMPDEST.contd, !prof !2, !annotation !3

OP58.JUMPDEST.contd:                              ; preds = %OP58.JUMPDEST
  %stack_len166 = load i64, ptr %len.addr, align 8
  %162 = icmp ult i64 %stack_len166, 1
  %163 = icmp ugt i64 %stack_len166, 1022
  %164 = or i1 %162, %163
  %165 = select i1 %162, i8 91, i8 92
  br i1 %164, label %return, label %OP58.JUMPDEST.contd167, !prof !2

OP58.JUMPDEST.contd167:                           ; preds = %OP58.JUMPDEST.contd
  br label %OP59.PUSH1, !annotation !5

OP59.PUSH1:                                       ; preds = %OP58.JUMPDEST.contd167
  %stack_len168 = load i64, ptr %len.addr, align 8
  %166 = add i64 %stack_len168, 1
  store i64 %166, ptr %len.addr, align 8
  %sp169 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len168
  store i256 64, ptr %sp169, align 16
  br label %OP60.MLOAD, !annotation !5

OP60.MLOAD:                                       ; preds = %OP59.PUSH1
  %stack_len170 = load i64, ptr %len.addr, align 8
  %167 = add i64 %stack_len170, -1
  %sp171 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %167
  %a172 = load i256, ptr %sp171, align 16
  %mload.out.slot173 = alloca i256, align 16
  %168 = call i8 @__revmc_ir_builtin_mload(i256 %a172, ptr %mload.out.slot173, ptr %arg.ecx.addr)
  %169 = icmp ne i8 %168, 0
  br i1 %169, label %return, label %OP60.MLOAD.contd, !prof !2

OP60.MLOAD.contd:                                 ; preds = %OP60.MLOAD
  %mload.out174 = load i256, ptr %mload.out.slot173, align 16
  %170 = add i64 %stack_len170, -1
  %sp175 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %170
  store i256 %mload.out174, ptr %sp175, align 16
  br label %OP61.DUP1, !annotation !5

OP61.DUP1:                                        ; preds = %OP60.MLOAD.contd
  %stack_len176 = load i64, ptr %len.addr, align 8
  %171 = add i64 %stack_len176, 1
  store i64 %171, ptr %len.addr, align 8
  %172 = sub i64 %stack_len176, 1
  %sp177 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %172
  %dup1178 = load i256, ptr %sp177, align 16
  %sp179 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len176
  store i256 %dup1178, ptr %sp179, align 16
  br label %OP62.SWAP2, !annotation !5

OP62.SWAP2:                                       ; preds = %OP61.DUP1
  %stack_len180 = load i64, ptr %len.addr, align 8
  %173 = sub i64 %stack_len180, 1
  %sp181 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %173
  %swap.a182 = load i256, ptr %sp181, align 16
  %174 = sub i64 %stack_len180, 3
  %sp183 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %174
  %swap.b184 = load i256, ptr %sp183, align 16
  store i256 %swap.a182, ptr %sp183, align 16
  store i256 %swap.b184, ptr %sp181, align 16
  br label %OP63.SUB, !annotation !5

OP63.SUB:                                         ; preds = %OP62.SWAP2
  %stack_len185 = load i64, ptr %len.addr, align 8
  %175 = add i64 %stack_len185, -1
  store i64 %175, ptr %len.addr, align 8
  %176 = add i64 %stack_len185, -1
  %sp186 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %176
  %a187 = load i256, ptr %sp186, align 16
  %177 = add i64 %stack_len185, -2
  %sp188 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %177
  %b189 = load i256, ptr %sp188, align 16
  %178 = sub i256 %a187, %b189
  %179 = add i64 %stack_len185, -2
  %sp190 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %179
  store i256 %178, ptr %sp190, align 16
  br label %OP64.SWAP1, !annotation !5

OP64.SWAP1:                                       ; preds = %OP63.SUB
  %stack_len191 = load i64, ptr %len.addr, align 8
  %180 = sub i64 %stack_len191, 1
  %sp192 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %180
  %swap.a193 = load i256, ptr %sp192, align 16
  %181 = sub i64 %stack_len191, 2
  %sp194 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %181
  %swap.b195 = load i256, ptr %sp194, align 16
  store i256 %swap.a193, ptr %sp194, align 16
  store i256 %swap.b195, ptr %sp192, align 16
  br label %OP65.RETURN, !annotation !5

OP65.RETURN:                                      ; preds = %OP64.SWAP1
  %stack_len196 = load i64, ptr %len.addr, align 8
  %182 = add i64 %stack_len196, -2
  store i64 %182, ptr %len.addr, align 8
  %183 = sub i64 %stack_len196, 2
  %sp197 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %183
  %184 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp197, i8 2)
  %185 = icmp ne i8 %184, 0
  br i1 %185, label %return, label %OP65.RETURN.contd, !prof !2

OP65.RETURN.contd:                                ; preds = %OP65.RETURN
  br label %return, !annotation !8

OP66.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP21.JUMPI
  %gas.remaining198 = load i64, ptr %gas.remaining.addr, align 8
  %186 = sub i64 %gas.remaining198, 22
  %187 = icmp ult i64 %gas.remaining198, 22
  store i64 %186, ptr %gas.remaining.addr, align 8
  br i1 %187, label %return, label %OP66.JUMPDEST.contd, !prof !2, !annotation !3

OP66.JUMPDEST.contd:                              ; preds = %OP66.JUMPDEST
  %stack_len199 = load i64, ptr %len.addr, align 8
  %188 = icmp ugt i64 %stack_len199, 1021
  br i1 %188, label %return, label %OP66.JUMPDEST.contd200, !prof !2, !annotation !4

OP66.JUMPDEST.contd200:                           ; preds = %OP66.JUMPDEST.contd
  br label %OP67.CALLVALUE, !annotation !5

OP67.CALLVALUE:                                   ; preds = %OP66.JUMPDEST.contd200
  %stack_len201 = load i64, ptr %len.addr, align 8
  %189 = add i64 %stack_len201, 1
  store i64 %189, ptr %len.addr, align 8
  %contract.call_value.addr202 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value203 = load i256, ptr %contract.call_value.addr202, align 16
  %sp204 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len201
  store i256 %contract.call_value203, ptr %sp204, align 16
  br label %OP68.DUP1, !annotation !5

OP68.DUP1:                                        ; preds = %OP67.CALLVALUE
  %stack_len205 = load i64, ptr %len.addr, align 8
  %190 = add i64 %stack_len205, 1
  store i64 %190, ptr %len.addr, align 8
  %191 = sub i64 %stack_len205, 1
  %sp206 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %191
  %dup1207 = load i256, ptr %sp206, align 16
  %sp208 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len205
  store i256 %dup1207, ptr %sp208, align 16
  br label %OP69.ISZERO, !annotation !5

OP69.ISZERO:                                      ; preds = %OP68.DUP1
  %stack_len209 = load i64, ptr %len.addr, align 8
  %192 = add i64 %stack_len209, -1
  %sp210 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %192
  %a211 = load i256, ptr %sp210, align 16
  %193 = icmp eq i256 %a211, 0
  %194 = zext i1 %193 to i256
  %195 = add i64 %stack_len209, -1
  %sp212 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %195
  store i256 %194, ptr %sp212, align 16
  br label %OP70.PUSH2, !annotation !5

OP70.PUSH2:                                       ; preds = %OP69.ISZERO
  br label %OP71.JUMPI, !annotation !6

OP71.JUMPI:                                       ; preds = %OP70.PUSH2
  %stack_len213 = load i64, ptr %len.addr, align 8
  %196 = add i64 %stack_len213, -1
  store i64 %196, ptr %len.addr, align 8
  %197 = add i64 %stack_len213, -1
  %sp214 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %197
  %a215 = load i256, ptr %sp214, align 16
  %198 = icmp ne i256 %a215, 0
  br i1 %198, label %OP75.JUMPDEST, label %OP72.PUSH0

OP72.PUSH0:                                       ; preds = %OP71.JUMPI
  %gas.remaining216 = load i64, ptr %gas.remaining.addr, align 8
  %199 = sub i64 %gas.remaining216, 5
  %200 = icmp ult i64 %gas.remaining216, 5
  store i64 %199, ptr %gas.remaining.addr, align 8
  br i1 %200, label %return, label %OP72.PUSH0.contd, !prof !2, !annotation !3

OP72.PUSH0.contd:                                 ; preds = %OP72.PUSH0
  %stack_len217 = load i64, ptr %len.addr, align 8
  %201 = icmp ugt i64 %stack_len217, 1022
  br i1 %201, label %return, label %OP72.PUSH0.contd218, !prof !2, !annotation !4

OP72.PUSH0.contd218:                              ; preds = %OP72.PUSH0.contd
  %202 = add i64 %stack_len217, 1
  store i64 %202, ptr %len.addr, align 8
  %sp219 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len217
  store i256 0, ptr %sp219, align 16
  br label %OP73.DUP1, !annotation !5

OP73.DUP1:                                        ; preds = %OP72.PUSH0.contd218
  %stack_len220 = load i64, ptr %len.addr, align 8
  %203 = add i64 %stack_len220, 1
  store i64 %203, ptr %len.addr, align 8
  %204 = sub i64 %stack_len220, 1
  %sp221 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %204
  %dup1222 = load i256, ptr %sp221, align 16
  %sp223 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len220
  store i256 %dup1222, ptr %sp223, align 16
  br label %OP74.REVERT, !annotation !5

OP74.REVERT:                                      ; preds = %OP73.DUP1
  %stack_len224 = load i64, ptr %len.addr, align 8
  %205 = add i64 %stack_len224, -2
  store i64 %205, ptr %len.addr, align 8
  %206 = sub i64 %stack_len224, 2
  %sp225 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %206
  %207 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp225, i8 16)
  %208 = icmp ne i8 %207, 0
  br i1 %208, label %return, label %OP74.REVERT.contd, !prof !2

OP74.REVERT.contd:                                ; preds = %OP74.REVERT
  br label %return, !annotation !7

OP75.JUMPDEST:                                    ; preds = %dynamic_jump_table, %OP71.JUMPI
  %gas.remaining226 = load i64, ptr %gas.remaining.addr, align 8
  %209 = sub i64 %gas.remaining226, 46
  %210 = icmp ult i64 %gas.remaining226, 46
  store i64 %209, ptr %gas.remaining.addr, align 8
  br i1 %210, label %return, label %OP75.JUMPDEST.contd, !prof !2, !annotation !3

OP75.JUMPDEST.contd:                              ; preds = %OP75.JUMPDEST
  %stack_len227 = load i64, ptr %len.addr, align 8
  %211 = icmp ult i64 %stack_len227, 1
  %212 = icmp ugt i64 %stack_len227, 1020
  %213 = or i1 %211, %212
  %214 = select i1 %211, i8 91, i8 92
  br i1 %213, label %return, label %OP75.JUMPDEST.contd228, !prof !2

OP75.JUMPDEST.contd228:                           ; preds = %OP75.JUMPDEST.contd
  br label %OP76.POP, !annotation !5

OP76.POP:                                         ; preds = %OP75.JUMPDEST.contd228
  %stack_len229 = load i64, ptr %len.addr, align 8
  %215 = add i64 %stack_len229, -1
  store i64 %215, ptr %len.addr, align 8
  br label %OP77.PUSH2, !annotation !5

OP77.PUSH2:                                       ; preds = %OP76.POP
  %stack_len230 = load i64, ptr %len.addr, align 8
  %216 = add i64 %stack_len230, 1
  store i64 %216, ptr %len.addr, align 8
  %sp231 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len230
  store i256 146, ptr %sp231, align 16
  br label %OP78.PUSH1, !annotation !5

OP78.PUSH1:                                       ; preds = %OP77.PUSH2
  %stack_len232 = load i64, ptr %len.addr, align 8
  %217 = add i64 %stack_len232, 1
  store i64 %217, ptr %len.addr, align 8
  %sp233 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len232
  store i256 4, ptr %sp233, align 16
  br label %OP79.DUP1, !annotation !5

OP79.DUP1:                                        ; preds = %OP78.PUSH1
  %stack_len234 = load i64, ptr %len.addr, align 8
  %218 = add i64 %stack_len234, 1
  store i64 %218, ptr %len.addr, align 8
  %219 = sub i64 %stack_len234, 1
  %sp235 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %219
  %dup1236 = load i256, ptr %sp235, align 16
  %sp237 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len234
  store i256 %dup1236, ptr %sp237, align 16
  br label %OP80.CALLDATASIZE, !annotation !5

OP80.CALLDATASIZE:                                ; preds = %OP79.DUP1
  %stack_len238 = load i64, ptr %len.addr, align 8
  %220 = add i64 %stack_len238, 1
  store i64 %220, ptr %len.addr, align 8
  %contract.input.len.addr239 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 80
  %contract.input.len240 = load i64, ptr %contract.input.len.addr239, align 8
  %221 = zext i64 %contract.input.len240 to i256
  %sp241 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len238
  store i256 %221, ptr %sp241, align 16
  br label %OP81.SUB, !annotation !5

OP81.SUB:                                         ; preds = %OP80.CALLDATASIZE
  %stack_len242 = load i64, ptr %len.addr, align 8
  %222 = add i64 %stack_len242, -1
  store i64 %222, ptr %len.addr, align 8
  %223 = add i64 %stack_len242, -1
  %sp243 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %223
  %a244 = load i256, ptr %sp243, align 16
  %224 = add i64 %stack_len242, -2
  %sp245 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %224
  %b246 = load i256, ptr %sp245, align 16
  %225 = sub i256 %a244, %b246
  %226 = add i64 %stack_len242, -2
  %sp247 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %226
  store i256 %225, ptr %sp247, align 16
  br label %OP82.DUP2, !annotation !5

OP82.DUP2:                                        ; preds = %OP81.SUB
  %stack_len248 = load i64, ptr %len.addr, align 8
  %227 = add i64 %stack_len248, 1
  store i64 %227, ptr %len.addr, align 8
  %228 = sub i64 %stack_len248, 2
  %sp249 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %228
  %dup2 = load i256, ptr %sp249, align 16
  %sp250 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len248
  store i256 %dup2, ptr %sp250, align 16
  br label %OP83.ADD, !annotation !5

OP83.ADD:                                         ; preds = %OP82.DUP2
  %stack_len251 = load i64, ptr %len.addr, align 8
  %229 = add i64 %stack_len251, -1
  store i64 %229, ptr %len.addr, align 8
  %230 = add i64 %stack_len251, -1
  %sp252 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %230
  %a253 = load i256, ptr %sp252, align 16
  %231 = add i64 %stack_len251, -2
  %sp254 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %231
  %b255 = load i256, ptr %sp254, align 16
  %232 = add i256 %a253, %b255
  %233 = add i64 %stack_len251, -2
  %sp256 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %233
  store i256 %232, ptr %sp256, align 16
  br label %OP84.SWAP1, !annotation !5

OP84.SWAP1:                                       ; preds = %OP83.ADD
  %stack_len257 = load i64, ptr %len.addr, align 8
  %234 = sub i64 %stack_len257, 1
  %sp258 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %234
  %swap.a259 = load i256, ptr %sp258, align 16
  %235 = sub i64 %stack_len257, 2
  %sp260 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %235
  %swap.b261 = load i256, ptr %sp260, align 16
  store i256 %swap.a259, ptr %sp260, align 16
  store i256 %swap.b261, ptr %sp258, align 16
  br label %OP85.PUSH2, !annotation !5

OP85.PUSH2:                                       ; preds = %OP84.SWAP1
  %stack_len262 = load i64, ptr %len.addr, align 8
  %236 = add i64 %stack_len262, 1
  store i64 %236, ptr %len.addr, align 8
  %sp263 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len262
  store i256 141, ptr %sp263, align 16
  br label %OP86.SWAP2, !annotation !5

OP86.SWAP2:                                       ; preds = %OP85.PUSH2
  %stack_len264 = load i64, ptr %len.addr, align 8
  %237 = sub i64 %stack_len264, 1
  %sp265 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %237
  %swap.a266 = load i256, ptr %sp265, align 16
  %238 = sub i64 %stack_len264, 3
  %sp267 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %238
  %swap.b268 = load i256, ptr %sp267, align 16
  store i256 %swap.a266, ptr %sp267, align 16
  store i256 %swap.b268, ptr %sp265, align 16
  br label %OP87.SWAP1, !annotation !5

OP87.SWAP1:                                       ; preds = %OP86.SWAP2
  %stack_len269 = load i64, ptr %len.addr, align 8
  %239 = sub i64 %stack_len269, 1
  %sp270 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %239
  %swap.a271 = load i256, ptr %sp270, align 16
  %240 = sub i64 %stack_len269, 2
  %sp272 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %240
  %swap.b273 = load i256, ptr %sp272, align 16
  store i256 %swap.a271, ptr %sp272, align 16
  store i256 %swap.b273, ptr %sp270, align 16
  br label %OP88.PUSH2, !annotation !5

OP88.PUSH2:                                       ; preds = %OP87.SWAP1
  br label %OP89.JUMP, !annotation !6

OP89.JUMP:                                        ; preds = %OP88.PUSH2
  %stack_len274 = load i64, ptr %len.addr, align 8
  br label %OP304.JUMPDEST

OP90.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining275 = load i64, ptr %gas.remaining.addr, align 8
  %241 = sub i64 %gas.remaining275, 12
  %242 = icmp ult i64 %gas.remaining275, 12
  store i64 %241, ptr %gas.remaining.addr, align 8
  br i1 %242, label %return, label %OP90.JUMPDEST.contd, !prof !2, !annotation !3

OP90.JUMPDEST.contd:                              ; preds = %OP90.JUMPDEST
  %stack_len276 = load i64, ptr %len.addr, align 8
  %243 = icmp ugt i64 %stack_len276, 1023
  br i1 %243, label %return, label %OP90.JUMPDEST.contd277, !prof !2, !annotation !4

OP90.JUMPDEST.contd277:                           ; preds = %OP90.JUMPDEST.contd
  br label %OP91.PUSH2, !annotation !5

OP91.PUSH2:                                       ; preds = %OP90.JUMPDEST.contd277
  br label %OP92.JUMP, !annotation !6

OP92.JUMP:                                        ; preds = %OP91.PUSH2
  %stack_len278 = load i64, ptr %len.addr, align 8
  br label %OP150.JUMPDEST

OP93.JUMPDEST:                                    ; preds = %dynamic_jump_table
  %gas.remaining279 = load i64, ptr %gas.remaining.addr, align 8
  %244 = sub i64 %gas.remaining279, 27
  %245 = icmp ult i64 %gas.remaining279, 27
  store i64 %244, ptr %gas.remaining.addr, align 8
  br i1 %245, label %return, label %OP93.JUMPDEST.contd, !prof !2, !annotation !3

OP93.JUMPDEST.contd:                              ; preds = %OP93.JUMPDEST
  %stack_len280 = load i64, ptr %len.addr, align 8
  %246 = icmp ult i64 %stack_len280, 1
  %247 = icmp ugt i64 %stack_len280, 1021
  %248 = or i1 %246, %247
  %249 = select i1 %246, i8 91, i8 92
  br i1 %248, label %return, label %OP93.JUMPDEST.contd281, !prof !2

OP93.JUMPDEST.contd281:                           ; preds = %OP93.JUMPDEST.contd
  br label %OP94.PUSH1, !annotation !5

OP94.PUSH1:                                       ; preds = %OP93.JUMPDEST.contd281
  %stack_len282 = load i64, ptr %len.addr, align 8
  %250 = add i64 %stack_len282, 1
  store i64 %250, ptr %len.addr, align 8
  %sp283 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len282
  store i256 64, ptr %sp283, align 16
  br label %OP95.MLOAD, !annotation !5

OP95.MLOAD:                                       ; preds = %OP94.PUSH1
  %stack_len284 = load i64, ptr %len.addr, align 8
  %251 = add i64 %stack_len284, -1
  %sp285 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %251
  %a286 = load i256, ptr %sp285, align 16
  %mload.out.slot287 = alloca i256, align 16
  %252 = call i8 @__revmc_ir_builtin_mload(i256 %a286, ptr %mload.out.slot287, ptr %arg.ecx.addr)
  %253 = icmp ne i8 %252, 0
  br i1 %253, label %return, label %OP95.MLOAD.contd, !prof !2

OP95.MLOAD.contd:                                 ; preds = %OP95.MLOAD
  %mload.out288 = load i256, ptr %mload.out.slot287, align 16
  %254 = add i64 %stack_len284, -1
  %sp289 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %254
  store i256 %mload.out288, ptr %sp289, align 16
  br label %OP96.PUSH2, !annotation !5

OP96.PUSH2:                                       ; preds = %OP95.MLOAD.contd
  %stack_len290 = load i64, ptr %len.addr, align 8
  %255 = add i64 %stack_len290, 1
  store i64 %255, ptr %len.addr, align 8
  %sp291 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len290
  store i256 159, ptr %sp291, align 16
  br label %OP97.SWAP2, !annotation !5

OP97.SWAP2:                                       ; preds = %OP96.PUSH2
  %stack_len292 = load i64, ptr %len.addr, align 8
  %256 = sub i64 %stack_len292, 1
  %sp293 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %256
  %swap.a294 = load i256, ptr %sp293, align 16
  %257 = sub i64 %stack_len292, 3
  %sp295 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %257
  %swap.b296 = load i256, ptr %sp295, align 16
  store i256 %swap.a294, ptr %sp295, align 16
  store i256 %swap.b296, ptr %sp293, align 16
  br label %OP98.SWAP1, !annotation !5

OP98.SWAP1:                                       ; preds = %OP97.SWAP2
  %stack_len297 = load i64, ptr %len.addr, align 8
  %258 = sub i64 %stack_len297, 1
  %sp298 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %258
  %swap.a299 = load i256, ptr %sp298, align 16
  %259 = sub i64 %stack_len297, 2
  %sp300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %259
  %swap.b301 = load i256, ptr %sp300, align 16
  store i256 %swap.a299, ptr %sp300, align 16
  store i256 %swap.b301, ptr %sp298, align 16
  br label %OP99.PUSH2, !annotation !5

OP99.PUSH2:                                       ; preds = %OP98.SWAP1
  br label %OP100.JUMP, !annotation !6

OP100.JUMP:                                       ; preds = %OP99.PUSH2
  %stack_len302 = load i64, ptr %len.addr, align 8
  br label %OP356.JUMPDEST

OP101.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining303 = load i64, ptr %gas.remaining.addr, align 8
  %260 = sub i64 %gas.remaining303, 19
  %261 = icmp ult i64 %gas.remaining303, 19
  store i64 %260, ptr %gas.remaining.addr, align 8
  br i1 %261, label %return, label %OP101.JUMPDEST.contd, !prof !2, !annotation !3

OP101.JUMPDEST.contd:                             ; preds = %OP101.JUMPDEST
  %stack_len304 = load i64, ptr %len.addr, align 8
  %262 = icmp ult i64 %stack_len304, 1
  %263 = icmp ugt i64 %stack_len304, 1022
  %264 = or i1 %262, %263
  %265 = select i1 %262, i8 91, i8 92
  br i1 %264, label %return, label %OP101.JUMPDEST.contd305, !prof !2

OP101.JUMPDEST.contd305:                          ; preds = %OP101.JUMPDEST.contd
  br label %OP102.PUSH1, !annotation !5

OP102.PUSH1:                                      ; preds = %OP101.JUMPDEST.contd305
  %stack_len306 = load i64, ptr %len.addr, align 8
  %266 = add i64 %stack_len306, 1
  store i64 %266, ptr %len.addr, align 8
  %sp307 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len306
  store i256 64, ptr %sp307, align 16
  br label %OP103.MLOAD, !annotation !5

OP103.MLOAD:                                      ; preds = %OP102.PUSH1
  %stack_len308 = load i64, ptr %len.addr, align 8
  %267 = add i64 %stack_len308, -1
  %sp309 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %267
  %a310 = load i256, ptr %sp309, align 16
  %mload.out.slot311 = alloca i256, align 16
  %268 = call i8 @__revmc_ir_builtin_mload(i256 %a310, ptr %mload.out.slot311, ptr %arg.ecx.addr)
  %269 = icmp ne i8 %268, 0
  br i1 %269, label %return, label %OP103.MLOAD.contd, !prof !2

OP103.MLOAD.contd:                                ; preds = %OP103.MLOAD
  %mload.out312 = load i256, ptr %mload.out.slot311, align 16
  %270 = add i64 %stack_len308, -1
  %sp313 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %270
  store i256 %mload.out312, ptr %sp313, align 16
  br label %OP104.DUP1, !annotation !5

OP104.DUP1:                                       ; preds = %OP103.MLOAD.contd
  %stack_len314 = load i64, ptr %len.addr, align 8
  %271 = add i64 %stack_len314, 1
  store i64 %271, ptr %len.addr, align 8
  %272 = sub i64 %stack_len314, 1
  %sp315 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %272
  %dup1316 = load i256, ptr %sp315, align 16
  %sp317 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len314
  store i256 %dup1316, ptr %sp317, align 16
  br label %OP105.SWAP2, !annotation !5

OP105.SWAP2:                                      ; preds = %OP104.DUP1
  %stack_len318 = load i64, ptr %len.addr, align 8
  %273 = sub i64 %stack_len318, 1
  %sp319 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %273
  %swap.a320 = load i256, ptr %sp319, align 16
  %274 = sub i64 %stack_len318, 3
  %sp321 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %274
  %swap.b322 = load i256, ptr %sp321, align 16
  store i256 %swap.a320, ptr %sp321, align 16
  store i256 %swap.b322, ptr %sp319, align 16
  br label %OP106.SUB, !annotation !5

OP106.SUB:                                        ; preds = %OP105.SWAP2
  %stack_len323 = load i64, ptr %len.addr, align 8
  %275 = add i64 %stack_len323, -1
  store i64 %275, ptr %len.addr, align 8
  %276 = add i64 %stack_len323, -1
  %sp324 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %276
  %a325 = load i256, ptr %sp324, align 16
  %277 = add i64 %stack_len323, -2
  %sp326 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %277
  %b327 = load i256, ptr %sp326, align 16
  %278 = sub i256 %a325, %b327
  %279 = add i64 %stack_len323, -2
  %sp328 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %279
  store i256 %278, ptr %sp328, align 16
  br label %OP107.SWAP1, !annotation !5

OP107.SWAP1:                                      ; preds = %OP106.SUB
  %stack_len329 = load i64, ptr %len.addr, align 8
  %280 = sub i64 %stack_len329, 1
  %sp330 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %280
  %swap.a331 = load i256, ptr %sp330, align 16
  %281 = sub i64 %stack_len329, 2
  %sp332 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %281
  %swap.b333 = load i256, ptr %sp332, align 16
  store i256 %swap.a331, ptr %sp332, align 16
  store i256 %swap.b333, ptr %sp330, align 16
  br label %OP108.RETURN, !annotation !5

OP108.RETURN:                                     ; preds = %OP107.SWAP1
  %stack_len334 = load i64, ptr %len.addr, align 8
  %282 = add i64 %stack_len334, -2
  store i64 %282, ptr %len.addr, align 8
  %283 = sub i64 %stack_len334, 2
  %sp335 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %283
  %284 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp335, i8 2)
  %285 = icmp ne i8 %284, 0
  br i1 %285, label %return, label %OP108.RETURN.contd, !prof !2

OP108.RETURN.contd:                               ; preds = %OP108.RETURN
  br label %return, !annotation !8

OP109.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP26.JUMPI
  %gas.remaining336 = load i64, ptr %gas.remaining.addr, align 8
  %286 = sub i64 %gas.remaining336, 22
  %287 = icmp ult i64 %gas.remaining336, 22
  store i64 %286, ptr %gas.remaining.addr, align 8
  br i1 %287, label %return, label %OP109.JUMPDEST.contd, !prof !2, !annotation !3

OP109.JUMPDEST.contd:                             ; preds = %OP109.JUMPDEST
  %stack_len337 = load i64, ptr %len.addr, align 8
  %288 = icmp ugt i64 %stack_len337, 1021
  br i1 %288, label %return, label %OP109.JUMPDEST.contd338, !prof !2, !annotation !4

OP109.JUMPDEST.contd338:                          ; preds = %OP109.JUMPDEST.contd
  br label %OP110.CALLVALUE, !annotation !5

OP110.CALLVALUE:                                  ; preds = %OP109.JUMPDEST.contd338
  %stack_len339 = load i64, ptr %len.addr, align 8
  %289 = add i64 %stack_len339, 1
  store i64 %289, ptr %len.addr, align 8
  %contract.call_value.addr340 = getelementptr inbounds i8, ptr %arg.contract.addr, i64 96
  %contract.call_value341 = load i256, ptr %contract.call_value.addr340, align 16
  %sp342 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len339
  store i256 %contract.call_value341, ptr %sp342, align 16
  br label %OP111.DUP1, !annotation !5

OP111.DUP1:                                       ; preds = %OP110.CALLVALUE
  %stack_len343 = load i64, ptr %len.addr, align 8
  %290 = add i64 %stack_len343, 1
  store i64 %290, ptr %len.addr, align 8
  %291 = sub i64 %stack_len343, 1
  %sp344 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %291
  %dup1345 = load i256, ptr %sp344, align 16
  %sp346 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len343
  store i256 %dup1345, ptr %sp346, align 16
  br label %OP112.ISZERO, !annotation !5

OP112.ISZERO:                                     ; preds = %OP111.DUP1
  %stack_len347 = load i64, ptr %len.addr, align 8
  %292 = add i64 %stack_len347, -1
  %sp348 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %292
  %a349 = load i256, ptr %sp348, align 16
  %293 = icmp eq i256 %a349, 0
  %294 = zext i1 %293 to i256
  %295 = add i64 %stack_len347, -1
  %sp350 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %295
  store i256 %294, ptr %sp350, align 16
  br label %OP113.PUSH2, !annotation !5

OP113.PUSH2:                                      ; preds = %OP112.ISZERO
  br label %OP114.JUMPI, !annotation !6

OP114.JUMPI:                                      ; preds = %OP113.PUSH2
  %stack_len351 = load i64, ptr %len.addr, align 8
  %296 = add i64 %stack_len351, -1
  store i64 %296, ptr %len.addr, align 8
  %297 = add i64 %stack_len351, -1
  %sp352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %297
  %a353 = load i256, ptr %sp352, align 16
  %298 = icmp ne i256 %a353, 0
  br i1 %298, label %OP118.JUMPDEST, label %OP115.PUSH0

OP115.PUSH0:                                      ; preds = %OP114.JUMPI
  %gas.remaining354 = load i64, ptr %gas.remaining.addr, align 8
  %299 = sub i64 %gas.remaining354, 5
  %300 = icmp ult i64 %gas.remaining354, 5
  store i64 %299, ptr %gas.remaining.addr, align 8
  br i1 %300, label %return, label %OP115.PUSH0.contd, !prof !2, !annotation !3

OP115.PUSH0.contd:                                ; preds = %OP115.PUSH0
  %stack_len355 = load i64, ptr %len.addr, align 8
  %301 = icmp ugt i64 %stack_len355, 1022
  br i1 %301, label %return, label %OP115.PUSH0.contd356, !prof !2, !annotation !4

OP115.PUSH0.contd356:                             ; preds = %OP115.PUSH0.contd
  %302 = add i64 %stack_len355, 1
  store i64 %302, ptr %len.addr, align 8
  %sp357 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len355
  store i256 0, ptr %sp357, align 16
  br label %OP116.DUP1, !annotation !5

OP116.DUP1:                                       ; preds = %OP115.PUSH0.contd356
  %stack_len358 = load i64, ptr %len.addr, align 8
  %303 = add i64 %stack_len358, 1
  store i64 %303, ptr %len.addr, align 8
  %304 = sub i64 %stack_len358, 1
  %sp359 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %304
  %dup1360 = load i256, ptr %sp359, align 16
  %sp361 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len358
  store i256 %dup1360, ptr %sp361, align 16
  br label %OP117.REVERT, !annotation !5

OP117.REVERT:                                     ; preds = %OP116.DUP1
  %stack_len362 = load i64, ptr %len.addr, align 8
  %305 = add i64 %stack_len362, -2
  store i64 %305, ptr %len.addr, align 8
  %306 = sub i64 %stack_len362, 2
  %sp363 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %306
  %307 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp363, i8 16)
  %308 = icmp ne i8 %307, 0
  br i1 %308, label %return, label %OP117.REVERT.contd, !prof !2

OP117.REVERT.contd:                               ; preds = %OP117.REVERT
  br label %return, !annotation !7

OP118.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP114.JUMPI
  %gas.remaining364 = load i64, ptr %gas.remaining.addr, align 8
  %309 = sub i64 %gas.remaining364, 17
  %310 = icmp ult i64 %gas.remaining364, 17
  store i64 %309, ptr %gas.remaining.addr, align 8
  br i1 %310, label %return, label %OP118.JUMPDEST.contd, !prof !2, !annotation !3

OP118.JUMPDEST.contd:                             ; preds = %OP118.JUMPDEST
  %stack_len365 = load i64, ptr %len.addr, align 8
  %311 = icmp ult i64 %stack_len365, 1
  %312 = icmp ugt i64 %stack_len365, 1023
  %313 = or i1 %311, %312
  %314 = select i1 %311, i8 91, i8 92
  br i1 %313, label %return, label %OP118.JUMPDEST.contd366, !prof !2

OP118.JUMPDEST.contd366:                          ; preds = %OP118.JUMPDEST.contd
  br label %OP119.POP, !annotation !5

OP119.POP:                                        ; preds = %OP118.JUMPDEST.contd366
  %stack_len367 = load i64, ptr %len.addr, align 8
  %315 = add i64 %stack_len367, -1
  store i64 %315, ptr %len.addr, align 8
  br label %OP120.PUSH2, !annotation !5

OP120.PUSH2:                                      ; preds = %OP119.POP
  %stack_len368 = load i64, ptr %len.addr, align 8
  %316 = add i64 %stack_len368, 1
  store i64 %316, ptr %len.addr, align 8
  %sp369 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len368
  store i256 188, ptr %sp369, align 16
  br label %OP121.PUSH2, !annotation !5

OP121.PUSH2:                                      ; preds = %OP120.PUSH2
  br label %OP122.JUMP, !annotation !6

OP122.JUMP:                                       ; preds = %OP121.PUSH2
  %stack_len370 = load i64, ptr %len.addr, align 8
  br label %OP162.JUMPDEST

OP123.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining371 = load i64, ptr %gas.remaining.addr, align 8
  %317 = sub i64 %gas.remaining371, 27
  %318 = icmp ult i64 %gas.remaining371, 27
  store i64 %317, ptr %gas.remaining.addr, align 8
  br i1 %318, label %return, label %OP123.JUMPDEST.contd, !prof !2, !annotation !3

OP123.JUMPDEST.contd:                             ; preds = %OP123.JUMPDEST
  %stack_len372 = load i64, ptr %len.addr, align 8
  %319 = icmp ult i64 %stack_len372, 1
  %320 = icmp ugt i64 %stack_len372, 1021
  %321 = or i1 %319, %320
  %322 = select i1 %319, i8 91, i8 92
  br i1 %321, label %return, label %OP123.JUMPDEST.contd373, !prof !2

OP123.JUMPDEST.contd373:                          ; preds = %OP123.JUMPDEST.contd
  br label %OP124.PUSH1, !annotation !5

OP124.PUSH1:                                      ; preds = %OP123.JUMPDEST.contd373
  %stack_len374 = load i64, ptr %len.addr, align 8
  %323 = add i64 %stack_len374, 1
  store i64 %323, ptr %len.addr, align 8
  %sp375 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len374
  store i256 64, ptr %sp375, align 16
  br label %OP125.MLOAD, !annotation !5

OP125.MLOAD:                                      ; preds = %OP124.PUSH1
  %stack_len376 = load i64, ptr %len.addr, align 8
  %324 = add i64 %stack_len376, -1
  %sp377 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %324
  %a378 = load i256, ptr %sp377, align 16
  %mload.out.slot379 = alloca i256, align 16
  %325 = call i8 @__revmc_ir_builtin_mload(i256 %a378, ptr %mload.out.slot379, ptr %arg.ecx.addr)
  %326 = icmp ne i8 %325, 0
  br i1 %326, label %return, label %OP125.MLOAD.contd, !prof !2

OP125.MLOAD.contd:                                ; preds = %OP125.MLOAD
  %mload.out380 = load i256, ptr %mload.out.slot379, align 16
  %327 = add i64 %stack_len376, -1
  %sp381 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %327
  store i256 %mload.out380, ptr %sp381, align 16
  br label %OP126.PUSH2, !annotation !5

OP126.PUSH2:                                      ; preds = %OP125.MLOAD.contd
  %stack_len382 = load i64, ptr %len.addr, align 8
  %328 = add i64 %stack_len382, 1
  store i64 %328, ptr %len.addr, align 8
  %sp383 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len382
  store i256 201, ptr %sp383, align 16
  br label %OP127.SWAP2, !annotation !5

OP127.SWAP2:                                      ; preds = %OP126.PUSH2
  %stack_len384 = load i64, ptr %len.addr, align 8
  %329 = sub i64 %stack_len384, 1
  %sp385 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %329
  %swap.a386 = load i256, ptr %sp385, align 16
  %330 = sub i64 %stack_len384, 3
  %sp387 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %330
  %swap.b388 = load i256, ptr %sp387, align 16
  store i256 %swap.a386, ptr %sp387, align 16
  store i256 %swap.b388, ptr %sp385, align 16
  br label %OP128.SWAP1, !annotation !5

OP128.SWAP1:                                      ; preds = %OP127.SWAP2
  %stack_len389 = load i64, ptr %len.addr, align 8
  %331 = sub i64 %stack_len389, 1
  %sp390 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %331
  %swap.a391 = load i256, ptr %sp390, align 16
  %332 = sub i64 %stack_len389, 2
  %sp392 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %332
  %swap.b393 = load i256, ptr %sp392, align 16
  store i256 %swap.a391, ptr %sp392, align 16
  store i256 %swap.b393, ptr %sp390, align 16
  br label %OP129.PUSH2, !annotation !5

OP129.PUSH2:                                      ; preds = %OP128.SWAP1
  br label %OP130.JUMP, !annotation !6

OP130.JUMP:                                       ; preds = %OP129.PUSH2
  %stack_len394 = load i64, ptr %len.addr, align 8
  br label %OP411.JUMPDEST

OP131.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining395 = load i64, ptr %gas.remaining.addr, align 8
  %333 = sub i64 %gas.remaining395, 19
  %334 = icmp ult i64 %gas.remaining395, 19
  store i64 %333, ptr %gas.remaining.addr, align 8
  br i1 %334, label %return, label %OP131.JUMPDEST.contd, !prof !2, !annotation !3

OP131.JUMPDEST.contd:                             ; preds = %OP131.JUMPDEST
  %stack_len396 = load i64, ptr %len.addr, align 8
  %335 = icmp ult i64 %stack_len396, 1
  %336 = icmp ugt i64 %stack_len396, 1022
  %337 = or i1 %335, %336
  %338 = select i1 %335, i8 91, i8 92
  br i1 %337, label %return, label %OP131.JUMPDEST.contd397, !prof !2

OP131.JUMPDEST.contd397:                          ; preds = %OP131.JUMPDEST.contd
  br label %OP132.PUSH1, !annotation !5

OP132.PUSH1:                                      ; preds = %OP131.JUMPDEST.contd397
  %stack_len398 = load i64, ptr %len.addr, align 8
  %339 = add i64 %stack_len398, 1
  store i64 %339, ptr %len.addr, align 8
  %sp399 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len398
  store i256 64, ptr %sp399, align 16
  br label %OP133.MLOAD, !annotation !5

OP133.MLOAD:                                      ; preds = %OP132.PUSH1
  %stack_len400 = load i64, ptr %len.addr, align 8
  %340 = add i64 %stack_len400, -1
  %sp401 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %340
  %a402 = load i256, ptr %sp401, align 16
  %mload.out.slot403 = alloca i256, align 16
  %341 = call i8 @__revmc_ir_builtin_mload(i256 %a402, ptr %mload.out.slot403, ptr %arg.ecx.addr)
  %342 = icmp ne i8 %341, 0
  br i1 %342, label %return, label %OP133.MLOAD.contd, !prof !2

OP133.MLOAD.contd:                                ; preds = %OP133.MLOAD
  %mload.out404 = load i256, ptr %mload.out.slot403, align 16
  %343 = add i64 %stack_len400, -1
  %sp405 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %343
  store i256 %mload.out404, ptr %sp405, align 16
  br label %OP134.DUP1, !annotation !5

OP134.DUP1:                                       ; preds = %OP133.MLOAD.contd
  %stack_len406 = load i64, ptr %len.addr, align 8
  %344 = add i64 %stack_len406, 1
  store i64 %344, ptr %len.addr, align 8
  %345 = sub i64 %stack_len406, 1
  %sp407 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %345
  %dup1408 = load i256, ptr %sp407, align 16
  %sp409 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len406
  store i256 %dup1408, ptr %sp409, align 16
  br label %OP135.SWAP2, !annotation !5

OP135.SWAP2:                                      ; preds = %OP134.DUP1
  %stack_len410 = load i64, ptr %len.addr, align 8
  %346 = sub i64 %stack_len410, 1
  %sp411 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %346
  %swap.a412 = load i256, ptr %sp411, align 16
  %347 = sub i64 %stack_len410, 3
  %sp413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %347
  %swap.b414 = load i256, ptr %sp413, align 16
  store i256 %swap.a412, ptr %sp413, align 16
  store i256 %swap.b414, ptr %sp411, align 16
  br label %OP136.SUB, !annotation !5

OP136.SUB:                                        ; preds = %OP135.SWAP2
  %stack_len415 = load i64, ptr %len.addr, align 8
  %348 = add i64 %stack_len415, -1
  store i64 %348, ptr %len.addr, align 8
  %349 = add i64 %stack_len415, -1
  %sp416 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %349
  %a417 = load i256, ptr %sp416, align 16
  %350 = add i64 %stack_len415, -2
  %sp418 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %350
  %b419 = load i256, ptr %sp418, align 16
  %351 = sub i256 %a417, %b419
  %352 = add i64 %stack_len415, -2
  %sp420 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %352
  store i256 %351, ptr %sp420, align 16
  br label %OP137.SWAP1, !annotation !5

OP137.SWAP1:                                      ; preds = %OP136.SUB
  %stack_len421 = load i64, ptr %len.addr, align 8
  %353 = sub i64 %stack_len421, 1
  %sp422 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %353
  %swap.a423 = load i256, ptr %sp422, align 16
  %354 = sub i64 %stack_len421, 2
  %sp424 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %354
  %swap.b425 = load i256, ptr %sp424, align 16
  store i256 %swap.a423, ptr %sp424, align 16
  store i256 %swap.b425, ptr %sp422, align 16
  br label %OP138.RETURN, !annotation !5

OP138.RETURN:                                     ; preds = %OP137.SWAP1
  %stack_len426 = load i64, ptr %len.addr, align 8
  %355 = add i64 %stack_len426, -2
  store i64 %355, ptr %len.addr, align 8
  %356 = sub i64 %stack_len426, 2
  %sp427 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %356
  %357 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp427, i8 2)
  %358 = icmp ne i8 %357, 0
  br i1 %358, label %return, label %OP138.RETURN.contd, !prof !2

OP138.RETURN.contd:                               ; preds = %OP138.RETURN
  br label %return, !annotation !8

OP139.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP31.JUMPI
  %gas.remaining428 = load i64, ptr %gas.remaining.addr, align 8
  %359 = sub i64 %gas.remaining428, 15
  %360 = icmp ult i64 %gas.remaining428, 15
  store i64 %359, ptr %gas.remaining.addr, align 8
  br i1 %360, label %return, label %OP139.JUMPDEST.contd, !prof !2, !annotation !3

OP139.JUMPDEST.contd:                             ; preds = %OP139.JUMPDEST
  %stack_len429 = load i64, ptr %len.addr, align 8
  %361 = icmp ugt i64 %stack_len429, 1022
  br i1 %361, label %return, label %OP139.JUMPDEST.contd430, !prof !2, !annotation !4

OP139.JUMPDEST.contd430:                          ; preds = %OP139.JUMPDEST.contd
  br label %OP140.PUSH2, !annotation !5

OP140.PUSH2:                                      ; preds = %OP139.JUMPDEST.contd430
  %stack_len431 = load i64, ptr %len.addr, align 8
  %362 = add i64 %stack_len431, 1
  store i64 %362, ptr %len.addr, align 8
  %sp432 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len431
  store i256 218, ptr %sp432, align 16
  br label %OP141.PUSH2, !annotation !5

OP141.PUSH2:                                      ; preds = %OP140.PUSH2
  br label %OP142.JUMP, !annotation !6

OP142.JUMP:                                       ; preds = %OP141.PUSH2
  %stack_len433 = load i64, ptr %len.addr, align 8
  br label %OP169.JUMPDEST

OP143.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining434 = load i64, ptr %gas.remaining.addr, align 8
  %363 = sub i64 %gas.remaining434, 1
  %364 = icmp ult i64 %gas.remaining434, 1
  store i64 %363, ptr %gas.remaining.addr, align 8
  br i1 %364, label %return, label %OP143.JUMPDEST.contd, !prof !2, !annotation !3

OP143.JUMPDEST.contd:                             ; preds = %OP143.JUMPDEST
  %stack_len435 = load i64, ptr %len.addr, align 8
  br label %OP144.STOP, !annotation !5

OP144.STOP:                                       ; preds = %OP143.JUMPDEST.contd
  %stack_len436 = load i64, ptr %len.addr, align 8
  br label %return, !annotation !9

OP145.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP49.JUMP
  %gas.remaining437 = load i64, ptr %gas.remaining.addr, align 8
  %365 = sub i64 %gas.remaining437, 14
  %366 = icmp ult i64 %gas.remaining437, 14
  store i64 %365, ptr %gas.remaining.addr, align 8
  br i1 %366, label %return, label %OP145.JUMPDEST.contd, !prof !2, !annotation !3

OP145.JUMPDEST.contd:                             ; preds = %OP145.JUMPDEST
  %stack_len438 = load i64, ptr %len.addr, align 8
  %367 = icmp ult i64 %stack_len438, 1
  %368 = icmp ugt i64 %stack_len438, 1022
  %369 = or i1 %367, %368
  %370 = select i1 %367, i8 91, i8 92
  br i1 %369, label %return, label %OP145.JUMPDEST.contd439, !prof !2

OP145.JUMPDEST.contd439:                          ; preds = %OP145.JUMPDEST.contd
  br label %OP146.PUSH0, !annotation !5

OP146.PUSH0:                                      ; preds = %OP145.JUMPDEST.contd439
  %stack_len440 = load i64, ptr %len.addr, align 8
  %371 = add i64 %stack_len440, 1
  store i64 %371, ptr %len.addr, align 8
  %sp441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len440
  store i256 0, ptr %sp441, align 16
  br label %OP147.SLOAD, !annotation !5

OP147.SLOAD:                                      ; preds = %OP146.PUSH0
  %stack_len442 = load i64, ptr %len.addr, align 8
  %372 = sub i64 %stack_len442, 1
  %sp443 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %372
  %373 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp443, i8 18)
  %374 = icmp ne i8 %373, 0
  br i1 %374, label %return, label %OP147.SLOAD.contd, !prof !2

OP147.SLOAD.contd:                                ; preds = %OP147.SLOAD
  br label %OP148.DUP2, !annotation !5

OP148.DUP2:                                       ; preds = %OP147.SLOAD.contd
  %stack_len444 = load i64, ptr %len.addr, align 8
  %375 = add i64 %stack_len444, 1
  store i64 %375, ptr %len.addr, align 8
  %376 = sub i64 %stack_len444, 2
  %sp445 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %376
  %dup2446 = load i256, ptr %sp445, align 16
  %sp447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len444
  store i256 %dup2446, ptr %sp447, align 16
  br label %OP149.JUMP, !annotation !5

OP149.JUMP:                                       ; preds = %OP148.DUP2
  %stack_len448 = load i64, ptr %len.addr, align 8
  %377 = add i64 %stack_len448, -1
  store i64 %377, ptr %len.addr, align 8
  %378 = add i64 %stack_len448, -1
  %sp449 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %378
  %a450 = load i256, ptr %sp449, align 16
  br label %dynamic_jump_table

OP150.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP92.JUMP
  %gas.remaining451 = load i64, ptr %gas.remaining.addr, align 8
  %379 = sub i64 %gas.remaining451, 53
  %380 = icmp ult i64 %gas.remaining451, 53
  store i64 %379, ptr %gas.remaining.addr, align 8
  br i1 %380, label %return, label %OP150.JUMPDEST.contd, !prof !2, !annotation !3

OP150.JUMPDEST.contd:                             ; preds = %OP150.JUMPDEST
  %stack_len452 = load i64, ptr %len.addr, align 8
  %381 = icmp ult i64 %stack_len452, 2
  %382 = icmp ugt i64 %stack_len452, 1021
  %383 = or i1 %381, %382
  %384 = select i1 %381, i8 91, i8 92
  br i1 %383, label %return, label %OP150.JUMPDEST.contd453, !prof !2

OP150.JUMPDEST.contd453:                          ; preds = %OP150.JUMPDEST.contd
  br label %OP151.PUSH0, !annotation !5

OP151.PUSH0:                                      ; preds = %OP150.JUMPDEST.contd453
  %stack_len454 = load i64, ptr %len.addr, align 8
  %385 = add i64 %stack_len454, 1
  store i64 %385, ptr %len.addr, align 8
  %sp455 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len454
  store i256 0, ptr %sp455, align 16
  br label %OP152.DUP2, !annotation !5

OP152.DUP2:                                       ; preds = %OP151.PUSH0
  %stack_len456 = load i64, ptr %len.addr, align 8
  %386 = add i64 %stack_len456, 1
  store i64 %386, ptr %len.addr, align 8
  %387 = sub i64 %stack_len456, 2
  %sp457 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %387
  %dup2458 = load i256, ptr %sp457, align 16
  %sp459 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len456
  store i256 %dup2458, ptr %sp459, align 16
  br label %OP153.PUSH8, !annotation !5

OP153.PUSH8:                                      ; preds = %OP152.DUP2
  %stack_len460 = load i64, ptr %len.addr, align 8
  %388 = add i64 %stack_len460, 1
  store i64 %388, ptr %len.addr, align 8
  %sp461 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len460
  store i256 18446744073709551615, ptr %sp461, align 16
  br label %OP154.AND, !annotation !5

OP154.AND:                                        ; preds = %OP153.PUSH8
  %stack_len462 = load i64, ptr %len.addr, align 8
  %389 = add i64 %stack_len462, -1
  store i64 %389, ptr %len.addr, align 8
  %390 = add i64 %stack_len462, -1
  %sp463 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %390
  %a464 = load i256, ptr %sp463, align 16
  %391 = add i64 %stack_len462, -2
  %sp465 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %391
  %b466 = load i256, ptr %sp465, align 16
  %392 = and i256 %a464, %b466
  %393 = add i64 %stack_len462, -2
  %sp467 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %393
  store i256 %392, ptr %sp467, align 16
  br label %OP155.BLOCKHASH, !annotation !5

OP155.BLOCKHASH:                                  ; preds = %OP154.AND
  %stack_len468 = load i64, ptr %len.addr, align 8
  %394 = sub i64 %stack_len468, 1
  %sp469 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %394
  %395 = call i8 @__revmc_builtin_blockhash(ptr %arg.ecx.addr, ptr %sp469)
  %396 = icmp ne i8 %395, 0
  br i1 %396, label %return, label %OP155.BLOCKHASH.contd, !prof !2

OP155.BLOCKHASH.contd:                            ; preds = %OP155.BLOCKHASH
  br label %OP156.SWAP1, !annotation !5

OP156.SWAP1:                                      ; preds = %OP155.BLOCKHASH.contd
  %stack_len470 = load i64, ptr %len.addr, align 8
  %397 = sub i64 %stack_len470, 1
  %sp471 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %397
  %swap.a472 = load i256, ptr %sp471, align 16
  %398 = sub i64 %stack_len470, 2
  %sp473 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %398
  %swap.b474 = load i256, ptr %sp473, align 16
  store i256 %swap.a472, ptr %sp473, align 16
  store i256 %swap.b474, ptr %sp471, align 16
  br label %OP157.POP, !annotation !5

OP157.POP:                                        ; preds = %OP156.SWAP1
  %stack_len475 = load i64, ptr %len.addr, align 8
  %399 = add i64 %stack_len475, -1
  store i64 %399, ptr %len.addr, align 8
  br label %OP158.SWAP2, !annotation !5

OP158.SWAP2:                                      ; preds = %OP157.POP
  %stack_len476 = load i64, ptr %len.addr, align 8
  %400 = sub i64 %stack_len476, 1
  %sp477 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %400
  %swap.a478 = load i256, ptr %sp477, align 16
  %401 = sub i64 %stack_len476, 3
  %sp479 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %401
  %swap.b480 = load i256, ptr %sp479, align 16
  store i256 %swap.a478, ptr %sp479, align 16
  store i256 %swap.b480, ptr %sp477, align 16
  br label %OP159.SWAP1, !annotation !5

OP159.SWAP1:                                      ; preds = %OP158.SWAP2
  %stack_len481 = load i64, ptr %len.addr, align 8
  %402 = sub i64 %stack_len481, 1
  %sp482 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %402
  %swap.a483 = load i256, ptr %sp482, align 16
  %403 = sub i64 %stack_len481, 2
  %sp484 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %403
  %swap.b485 = load i256, ptr %sp484, align 16
  store i256 %swap.a483, ptr %sp484, align 16
  store i256 %swap.b485, ptr %sp482, align 16
  br label %OP160.POP, !annotation !5

OP160.POP:                                        ; preds = %OP159.SWAP1
  %stack_len486 = load i64, ptr %len.addr, align 8
  %404 = add i64 %stack_len486, -1
  store i64 %404, ptr %len.addr, align 8
  br label %OP161.JUMP, !annotation !5

OP161.JUMP:                                       ; preds = %OP160.POP
  %stack_len487 = load i64, ptr %len.addr, align 8
  %405 = add i64 %stack_len487, -1
  store i64 %405, ptr %len.addr, align 8
  %406 = add i64 %stack_len487, -1
  %sp488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %406
  %a489 = load i256, ptr %sp488, align 16
  br label %dynamic_jump_table

OP162.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP122.JUMP
  %gas.remaining490 = load i64, ptr %gas.remaining.addr, align 8
  %407 = sub i64 %gas.remaining490, 21
  %408 = icmp ult i64 %gas.remaining490, 21
  store i64 %407, ptr %gas.remaining.addr, align 8
  br i1 %408, label %return, label %OP162.JUMPDEST.contd, !prof !2, !annotation !3

OP162.JUMPDEST.contd:                             ; preds = %OP162.JUMPDEST
  %stack_len491 = load i64, ptr %len.addr, align 8
  %409 = icmp ult i64 %stack_len491, 1
  %410 = icmp ugt i64 %stack_len491, 1022
  %411 = or i1 %409, %410
  %412 = select i1 %409, i8 91, i8 92
  br i1 %411, label %return, label %OP162.JUMPDEST.contd492, !prof !2

OP162.JUMPDEST.contd492:                          ; preds = %OP162.JUMPDEST.contd
  br label %OP163.PUSH0, !annotation !5

OP163.PUSH0:                                      ; preds = %OP162.JUMPDEST.contd492
  %stack_len493 = load i64, ptr %len.addr, align 8
  %413 = add i64 %stack_len493, 1
  store i64 %413, ptr %len.addr, align 8
  %sp494 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len493
  store i256 0, ptr %sp494, align 16
  br label %OP164.CALLER, !annotation !5

OP164.CALLER:                                     ; preds = %OP163.PUSH0
  %stack_len495 = load i64, ptr %len.addr, align 8
  %414 = add i64 %stack_len495, 1
  store i64 %414, ptr %len.addr, align 8
  %contract.caller.addr = getelementptr inbounds i8, ptr %arg.contract.addr, i64 148
  %contract.caller = load i160, ptr %contract.caller.addr, align 16
  %415 = call i160 @llvm.bswap.i160(i160 %contract.caller)
  %416 = zext i160 %415 to i256
  %sp496 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len495
  store i256 %416, ptr %sp496, align 16
  br label %OP165.SWAP1, !annotation !5

OP165.SWAP1:                                      ; preds = %OP164.CALLER
  %stack_len497 = load i64, ptr %len.addr, align 8
  %417 = sub i64 %stack_len497, 1
  %sp498 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %417
  %swap.a499 = load i256, ptr %sp498, align 16
  %418 = sub i64 %stack_len497, 2
  %sp500 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %418
  %swap.b501 = load i256, ptr %sp500, align 16
  store i256 %swap.a499, ptr %sp500, align 16
  store i256 %swap.b501, ptr %sp498, align 16
  br label %OP166.POP, !annotation !5

OP166.POP:                                        ; preds = %OP165.SWAP1
  %stack_len502 = load i64, ptr %len.addr, align 8
  %419 = add i64 %stack_len502, -1
  store i64 %419, ptr %len.addr, align 8
  br label %OP167.SWAP1, !annotation !5

OP167.SWAP1:                                      ; preds = %OP166.POP
  %stack_len503 = load i64, ptr %len.addr, align 8
  %420 = sub i64 %stack_len503, 1
  %sp504 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %420
  %swap.a505 = load i256, ptr %sp504, align 16
  %421 = sub i64 %stack_len503, 2
  %sp506 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %421
  %swap.b507 = load i256, ptr %sp506, align 16
  store i256 %swap.a505, ptr %sp506, align 16
  store i256 %swap.b507, ptr %sp504, align 16
  br label %OP168.JUMP, !annotation !5

OP168.JUMP:                                       ; preds = %OP167.SWAP1
  %stack_len508 = load i64, ptr %len.addr, align 8
  %422 = add i64 %stack_len508, -1
  store i64 %422, ptr %len.addr, align 8
  %423 = add i64 %stack_len508, -1
  %sp509 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %423
  %a510 = load i256, ptr %sp509, align 16
  br label %dynamic_jump_table

OP169.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP142.JUMP
  %gas.remaining511 = load i64, ptr %gas.remaining.addr, align 8
  %424 = sub i64 %gas.remaining511, 38
  %425 = icmp ult i64 %gas.remaining511, 38
  store i64 %424, ptr %gas.remaining.addr, align 8
  br i1 %425, label %return, label %OP169.JUMPDEST.contd, !prof !2, !annotation !3

OP169.JUMPDEST.contd:                             ; preds = %OP169.JUMPDEST
  %stack_len512 = load i64, ptr %len.addr, align 8
  %426 = icmp ugt i64 %stack_len512, 1018
  br i1 %426, label %return, label %OP169.JUMPDEST.contd513, !prof !2, !annotation !4

OP169.JUMPDEST.contd513:                          ; preds = %OP169.JUMPDEST.contd
  br label %OP170.PUSH0, !annotation !5

OP170.PUSH0:                                      ; preds = %OP169.JUMPDEST.contd513
  %stack_len514 = load i64, ptr %len.addr, align 8
  %427 = add i64 %stack_len514, 1
  store i64 %427, ptr %len.addr, align 8
  %sp515 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len514
  store i256 0, ptr %sp515, align 16
  br label %OP171.DUP1, !annotation !5

OP171.DUP1:                                       ; preds = %OP170.PUSH0
  %stack_len516 = load i64, ptr %len.addr, align 8
  %428 = add i64 %stack_len516, 1
  store i64 %428, ptr %len.addr, align 8
  %429 = sub i64 %stack_len516, 1
  %sp517 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %429
  %dup1518 = load i256, ptr %sp517, align 16
  %sp519 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len516
  store i256 %dup1518, ptr %sp519, align 16
  br label %OP172.DUP2, !annotation !5

OP172.DUP2:                                       ; preds = %OP171.DUP1
  %stack_len520 = load i64, ptr %len.addr, align 8
  %430 = add i64 %stack_len520, 1
  store i64 %430, ptr %len.addr, align 8
  %431 = sub i64 %stack_len520, 2
  %sp521 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %431
  %dup2522 = load i256, ptr %sp521, align 16
  %sp523 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len520
  store i256 %dup2522, ptr %sp523, align 16
  br label %OP173.SLOAD, !annotation !5

OP173.SLOAD:                                      ; preds = %OP172.DUP2
  %stack_len524 = load i64, ptr %len.addr, align 8
  %432 = sub i64 %stack_len524, 1
  %sp525 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %432
  %433 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp525, i8 18)
  %434 = icmp ne i8 %433, 0
  br i1 %434, label %return, label %OP173.SLOAD.contd, !prof !2

OP173.SLOAD.contd:                                ; preds = %OP173.SLOAD
  br label %OP174.DUP1, !annotation !5

OP174.DUP1:                                       ; preds = %OP173.SLOAD.contd
  %stack_len526 = load i64, ptr %len.addr, align 8
  %435 = add i64 %stack_len526, 1
  store i64 %435, ptr %len.addr, align 8
  %436 = sub i64 %stack_len526, 1
  %sp527 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %436
  %dup1528 = load i256, ptr %sp527, align 16
  %sp529 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len526
  store i256 %dup1528, ptr %sp529, align 16
  br label %OP175.SWAP3, !annotation !5

OP175.SWAP3:                                      ; preds = %OP174.DUP1
  %stack_len530 = load i64, ptr %len.addr, align 8
  %437 = sub i64 %stack_len530, 1
  %sp531 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %437
  %swap.a532 = load i256, ptr %sp531, align 16
  %438 = sub i64 %stack_len530, 4
  %sp533 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %438
  %swap.b534 = load i256, ptr %sp533, align 16
  store i256 %swap.a532, ptr %sp533, align 16
  store i256 %swap.b534, ptr %sp531, align 16
  br label %OP176.SWAP2, !annotation !5

OP176.SWAP2:                                      ; preds = %OP175.SWAP3
  %stack_len535 = load i64, ptr %len.addr, align 8
  %439 = sub i64 %stack_len535, 1
  %sp536 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %439
  %swap.a537 = load i256, ptr %sp536, align 16
  %440 = sub i64 %stack_len535, 3
  %sp538 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %440
  %swap.b539 = load i256, ptr %sp538, align 16
  store i256 %swap.a537, ptr %sp538, align 16
  store i256 %swap.b539, ptr %sp536, align 16
  br label %OP177.SWAP1, !annotation !5

OP177.SWAP1:                                      ; preds = %OP176.SWAP2
  %stack_len540 = load i64, ptr %len.addr, align 8
  %441 = sub i64 %stack_len540, 1
  %sp541 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %441
  %swap.a542 = load i256, ptr %sp541, align 16
  %442 = sub i64 %stack_len540, 2
  %sp543 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %442
  %swap.b544 = load i256, ptr %sp543, align 16
  store i256 %swap.a542, ptr %sp543, align 16
  store i256 %swap.b544, ptr %sp541, align 16
  br label %OP178.PUSH2, !annotation !5

OP178.PUSH2:                                      ; preds = %OP177.SWAP1
  %stack_len545 = load i64, ptr %len.addr, align 8
  %443 = add i64 %stack_len545, 1
  store i64 %443, ptr %len.addr, align 8
  %sp546 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len545
  store i256 269, ptr %sp546, align 16
  br label %OP179.SWAP1, !annotation !5

OP179.SWAP1:                                      ; preds = %OP178.PUSH2
  %stack_len547 = load i64, ptr %len.addr, align 8
  %444 = sub i64 %stack_len547, 1
  %sp548 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %444
  %swap.a549 = load i256, ptr %sp548, align 16
  %445 = sub i64 %stack_len547, 2
  %sp550 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %445
  %swap.b551 = load i256, ptr %sp550, align 16
  store i256 %swap.a549, ptr %sp550, align 16
  store i256 %swap.b551, ptr %sp548, align 16
  br label %OP180.PUSH2, !annotation !5

OP180.PUSH2:                                      ; preds = %OP179.SWAP1
  br label %OP181.JUMP, !annotation !6

OP181.JUMP:                                       ; preds = %OP180.PUSH2
  %stack_len552 = load i64, ptr %len.addr, align 8
  br label %OP441.JUMPDEST

OP182.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining553 = load i64, ptr %gas.remaining.addr, align 8
  %446 = sub i64 %gas.remaining553, 9
  %447 = icmp ult i64 %gas.remaining553, 9
  store i64 %446, ptr %gas.remaining.addr, align 8
  br i1 %447, label %return, label %OP182.JUMPDEST.contd, !prof !2, !annotation !3

OP182.JUMPDEST.contd:                             ; preds = %OP182.JUMPDEST
  %stack_len554 = load i64, ptr %len.addr, align 8
  %448 = icmp ult i64 %stack_len554, 3
  br i1 %448, label %return, label %OP182.JUMPDEST.contd555, !prof !2, !annotation !10

OP182.JUMPDEST.contd555:                          ; preds = %OP182.JUMPDEST.contd
  br label %OP183.SWAP2, !annotation !5

OP183.SWAP2:                                      ; preds = %OP182.JUMPDEST.contd555
  %stack_len556 = load i64, ptr %len.addr, align 8
  %449 = sub i64 %stack_len556, 1
  %sp557 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %449
  %swap.a558 = load i256, ptr %sp557, align 16
  %450 = sub i64 %stack_len556, 3
  %sp559 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %450
  %swap.b560 = load i256, ptr %sp559, align 16
  store i256 %swap.a558, ptr %sp559, align 16
  store i256 %swap.b560, ptr %sp557, align 16
  br label %OP184.SWAP1, !annotation !5

OP184.SWAP1:                                      ; preds = %OP183.SWAP2
  %stack_len561 = load i64, ptr %len.addr, align 8
  %451 = sub i64 %stack_len561, 1
  %sp562 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %451
  %swap.a563 = load i256, ptr %sp562, align 16
  %452 = sub i64 %stack_len561, 2
  %sp564 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %452
  %swap.b565 = load i256, ptr %sp564, align 16
  store i256 %swap.a563, ptr %sp564, align 16
  store i256 %swap.b565, ptr %sp562, align 16
  br label %OP185.POP, !annotation !5

OP185.POP:                                        ; preds = %OP184.SWAP1
  %stack_len566 = load i64, ptr %len.addr, align 8
  %453 = add i64 %stack_len566, -1
  store i64 %453, ptr %len.addr, align 8
  br label %OP186.SSTORE, !annotation !5

OP186.SSTORE:                                     ; preds = %OP185.POP
  %stack_len567 = load i64, ptr %len.addr, align 8
  %454 = add i64 %stack_len567, -2
  store i64 %454, ptr %len.addr, align 8
  %455 = sub i64 %stack_len567, 2
  %sp568 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %455
  %456 = call i8 @__revmc_builtin_sstore(ptr %arg.ecx.addr, ptr %sp568, i8 18)
  %457 = icmp ne i8 %456, 0
  br i1 %457, label %return, label %OP186.SSTORE.contd, !prof !2

OP186.SSTORE.contd:                               ; preds = %OP186.SSTORE
  br label %OP187.POP, !annotation !5

OP187.POP:                                        ; preds = %OP186.SSTORE.contd
  %gas.remaining569 = load i64, ptr %gas.remaining.addr, align 8
  %458 = sub i64 %gas.remaining569, 30
  %459 = icmp ult i64 %gas.remaining569, 30
  store i64 %458, ptr %gas.remaining.addr, align 8
  br i1 %459, label %return, label %OP187.POP.contd, !prof !2, !annotation !3

OP187.POP.contd:                                  ; preds = %OP187.POP
  %stack_len570 = load i64, ptr %len.addr, align 8
  %460 = icmp ult i64 %stack_len570, 1
  %461 = icmp ugt i64 %stack_len570, 1020
  %462 = or i1 %460, %461
  %463 = select i1 %460, i8 91, i8 92
  br i1 %462, label %return, label %OP187.POP.contd571, !prof !2

OP187.POP.contd571:                               ; preds = %OP187.POP.contd
  %464 = add i64 %stack_len570, -1
  store i64 %464, ptr %len.addr, align 8
  br label %OP188.PUSH32, !annotation !5

OP188.PUSH32:                                     ; preds = %OP187.POP.contd571
  %stack_len572 = load i64, ptr %len.addr, align 8
  %465 = add i64 %stack_len572, 1
  store i64 %465, ptr %len.addr, align 8
  %sp573 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len572
  store i256 44145446089218951837986422671001722283023151482040629911953553287475855156191, ptr %sp573, align 16
  br label %OP189.PUSH1, !annotation !5

OP189.PUSH1:                                      ; preds = %OP188.PUSH32
  %stack_len574 = load i64, ptr %len.addr, align 8
  %466 = add i64 %stack_len574, 1
  store i64 %466, ptr %len.addr, align 8
  %sp575 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len574
  store i256 1, ptr %sp575, align 16
  br label %OP190.PUSH0, !annotation !5

OP190.PUSH0:                                      ; preds = %OP189.PUSH1
  %stack_len576 = load i64, ptr %len.addr, align 8
  %467 = add i64 %stack_len576, 1
  store i64 %467, ptr %len.addr, align 8
  %sp577 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len576
  store i256 0, ptr %sp577, align 16
  br label %OP191.SLOAD, !annotation !5

OP191.SLOAD:                                      ; preds = %OP190.PUSH0
  %stack_len578 = load i64, ptr %len.addr, align 8
  %468 = sub i64 %stack_len578, 1
  %sp579 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %468
  %469 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp579, i8 18)
  %470 = icmp ne i8 %469, 0
  br i1 %470, label %return, label %OP191.SLOAD.contd, !prof !2

OP191.SLOAD.contd:                                ; preds = %OP191.SLOAD
  br label %OP192.PUSH2, !annotation !5

OP192.PUSH2:                                      ; preds = %OP191.SLOAD.contd
  %stack_len580 = load i64, ptr %len.addr, align 8
  %471 = add i64 %stack_len580, 1
  store i64 %471, ptr %len.addr, align 8
  %sp581 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len580
  store i256 321, ptr %sp581, align 16
  br label %OP193.SWAP2, !annotation !5

OP193.SWAP2:                                      ; preds = %OP192.PUSH2
  %stack_len582 = load i64, ptr %len.addr, align 8
  %472 = sub i64 %stack_len582, 1
  %sp583 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %472
  %swap.a584 = load i256, ptr %sp583, align 16
  %473 = sub i64 %stack_len582, 3
  %sp585 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %473
  %swap.b586 = load i256, ptr %sp585, align 16
  store i256 %swap.a584, ptr %sp585, align 16
  store i256 %swap.b586, ptr %sp583, align 16
  br label %OP194.SWAP1, !annotation !5

OP194.SWAP1:                                      ; preds = %OP193.SWAP2
  %stack_len587 = load i64, ptr %len.addr, align 8
  %474 = sub i64 %stack_len587, 1
  %sp588 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %474
  %swap.a589 = load i256, ptr %sp588, align 16
  %475 = sub i64 %stack_len587, 2
  %sp590 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %475
  %swap.b591 = load i256, ptr %sp590, align 16
  store i256 %swap.a589, ptr %sp590, align 16
  store i256 %swap.b591, ptr %sp588, align 16
  br label %OP195.PUSH2, !annotation !5

OP195.PUSH2:                                      ; preds = %OP194.SWAP1
  br label %OP196.JUMP, !annotation !6

OP196.JUMP:                                       ; preds = %OP195.PUSH2
  %stack_len592 = load i64, ptr %len.addr, align 8
  br label %OP469.JUMPDEST

OP197.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining593 = load i64, ptr %gas.remaining.addr, align 8
  %476 = sub i64 %gas.remaining593, 32
  %477 = icmp ult i64 %gas.remaining593, 32
  store i64 %476, ptr %gas.remaining.addr, align 8
  br i1 %477, label %return, label %OP197.JUMPDEST.contd, !prof !2, !annotation !3

OP197.JUMPDEST.contd:                             ; preds = %OP197.JUMPDEST
  %stack_len594 = load i64, ptr %len.addr, align 8
  %478 = icmp ult i64 %stack_len594, 1
  %479 = icmp ugt i64 %stack_len594, 1020
  %480 = or i1 %478, %479
  %481 = select i1 %478, i8 91, i8 92
  br i1 %480, label %return, label %OP197.JUMPDEST.contd595, !prof !2

OP197.JUMPDEST.contd595:                          ; preds = %OP197.JUMPDEST.contd
  br label %OP198.PUSH0, !annotation !5

OP198.PUSH0:                                      ; preds = %OP197.JUMPDEST.contd595
  %stack_len596 = load i64, ptr %len.addr, align 8
  %482 = add i64 %stack_len596, 1
  store i64 %482, ptr %len.addr, align 8
  %sp597 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len596
  store i256 0, ptr %sp597, align 16
  br label %OP199.SLOAD, !annotation !5

OP199.SLOAD:                                      ; preds = %OP198.PUSH0
  %stack_len598 = load i64, ptr %len.addr, align 8
  %483 = sub i64 %stack_len598, 1
  %sp599 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %483
  %484 = call i8 @__revmc_builtin_sload(ptr %arg.ecx.addr, ptr %sp599, i8 18)
  %485 = icmp ne i8 %484, 0
  br i1 %485, label %return, label %OP199.SLOAD.contd, !prof !2

OP199.SLOAD.contd:                                ; preds = %OP199.SLOAD
  br label %OP200.PUSH1, !annotation !5

OP200.PUSH1:                                      ; preds = %OP199.SLOAD.contd
  %stack_len600 = load i64, ptr %len.addr, align 8
  %486 = add i64 %stack_len600, 1
  store i64 %486, ptr %len.addr, align 8
  %sp601 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len600
  store i256 64, ptr %sp601, align 16
  br label %OP201.MLOAD, !annotation !5

OP201.MLOAD:                                      ; preds = %OP200.PUSH1
  %stack_len602 = load i64, ptr %len.addr, align 8
  %487 = add i64 %stack_len602, -1
  %sp603 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %487
  %a604 = load i256, ptr %sp603, align 16
  %mload.out.slot605 = alloca i256, align 16
  %488 = call i8 @__revmc_ir_builtin_mload(i256 %a604, ptr %mload.out.slot605, ptr %arg.ecx.addr)
  %489 = icmp ne i8 %488, 0
  br i1 %489, label %return, label %OP201.MLOAD.contd, !prof !2

OP201.MLOAD.contd:                                ; preds = %OP201.MLOAD
  %mload.out606 = load i256, ptr %mload.out.slot605, align 16
  %490 = add i64 %stack_len602, -1
  %sp607 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %490
  store i256 %mload.out606, ptr %sp607, align 16
  br label %OP202.PUSH2, !annotation !5

OP202.PUSH2:                                      ; preds = %OP201.MLOAD.contd
  %stack_len608 = load i64, ptr %len.addr, align 8
  %491 = add i64 %stack_len608, 1
  store i64 %491, ptr %len.addr, align 8
  %sp609 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len608
  store i256 337, ptr %sp609, align 16
  br label %OP203.SWAP3, !annotation !5

OP203.SWAP3:                                      ; preds = %OP202.PUSH2
  %stack_len610 = load i64, ptr %len.addr, align 8
  %492 = sub i64 %stack_len610, 1
  %sp611 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %492
  %swap.a612 = load i256, ptr %sp611, align 16
  %493 = sub i64 %stack_len610, 4
  %sp613 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %493
  %swap.b614 = load i256, ptr %sp613, align 16
  store i256 %swap.a612, ptr %sp613, align 16
  store i256 %swap.b614, ptr %sp611, align 16
  br label %OP204.SWAP2, !annotation !5

OP204.SWAP2:                                      ; preds = %OP203.SWAP3
  %stack_len615 = load i64, ptr %len.addr, align 8
  %494 = sub i64 %stack_len615, 1
  %sp616 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %494
  %swap.a617 = load i256, ptr %sp616, align 16
  %495 = sub i64 %stack_len615, 3
  %sp618 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %495
  %swap.b619 = load i256, ptr %sp618, align 16
  store i256 %swap.a617, ptr %sp618, align 16
  store i256 %swap.b619, ptr %sp616, align 16
  br label %OP205.SWAP1, !annotation !5

OP205.SWAP1:                                      ; preds = %OP204.SWAP2
  %stack_len620 = load i64, ptr %len.addr, align 8
  %496 = sub i64 %stack_len620, 1
  %sp621 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %496
  %swap.a622 = load i256, ptr %sp621, align 16
  %497 = sub i64 %stack_len620, 2
  %sp623 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %497
  %swap.b624 = load i256, ptr %sp623, align 16
  store i256 %swap.a622, ptr %sp623, align 16
  store i256 %swap.b624, ptr %sp621, align 16
  br label %OP206.PUSH2, !annotation !5

OP206.PUSH2:                                      ; preds = %OP205.SWAP1
  br label %OP207.JUMP, !annotation !6

OP207.JUMP:                                       ; preds = %OP206.PUSH2
  %stack_len625 = load i64, ptr %len.addr, align 8
  br label %OP506.JUMPDEST

OP208.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining626 = load i64, ptr %gas.remaining.addr, align 8
  %498 = sub i64 %gas.remaining626, 777
  %499 = icmp ult i64 %gas.remaining626, 777
  store i64 %498, ptr %gas.remaining.addr, align 8
  br i1 %499, label %return, label %OP208.JUMPDEST.contd, !prof !2, !annotation !3

OP208.JUMPDEST.contd:                             ; preds = %OP208.JUMPDEST
  %stack_len627 = load i64, ptr %len.addr, align 8
  %500 = icmp ult i64 %stack_len627, 3
  %501 = icmp ugt i64 %stack_len627, 1022
  %502 = or i1 %500, %501
  %503 = select i1 %500, i8 91, i8 92
  br i1 %502, label %return, label %OP208.JUMPDEST.contd628, !prof !2

OP208.JUMPDEST.contd628:                          ; preds = %OP208.JUMPDEST.contd
  br label %OP209.PUSH1, !annotation !5

OP209.PUSH1:                                      ; preds = %OP208.JUMPDEST.contd628
  %stack_len629 = load i64, ptr %len.addr, align 8
  %504 = add i64 %stack_len629, 1
  store i64 %504, ptr %len.addr, align 8
  %sp630 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len629
  store i256 64, ptr %sp630, align 16
  br label %OP210.MLOAD, !annotation !5

OP210.MLOAD:                                      ; preds = %OP209.PUSH1
  %stack_len631 = load i64, ptr %len.addr, align 8
  %505 = add i64 %stack_len631, -1
  %sp632 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %505
  %a633 = load i256, ptr %sp632, align 16
  %mload.out.slot634 = alloca i256, align 16
  %506 = call i8 @__revmc_ir_builtin_mload(i256 %a633, ptr %mload.out.slot634, ptr %arg.ecx.addr)
  %507 = icmp ne i8 %506, 0
  br i1 %507, label %return, label %OP210.MLOAD.contd, !prof !2

OP210.MLOAD.contd:                                ; preds = %OP210.MLOAD
  %mload.out635 = load i256, ptr %mload.out.slot634, align 16
  %508 = add i64 %stack_len631, -1
  %sp636 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %508
  store i256 %mload.out635, ptr %sp636, align 16
  br label %OP211.DUP1, !annotation !5

OP211.DUP1:                                       ; preds = %OP210.MLOAD.contd
  %stack_len637 = load i64, ptr %len.addr, align 8
  %509 = add i64 %stack_len637, 1
  store i64 %509, ptr %len.addr, align 8
  %510 = sub i64 %stack_len637, 1
  %sp638 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %510
  %dup1639 = load i256, ptr %sp638, align 16
  %sp640 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len637
  store i256 %dup1639, ptr %sp640, align 16
  br label %OP212.SWAP2, !annotation !5

OP212.SWAP2:                                      ; preds = %OP211.DUP1
  %stack_len641 = load i64, ptr %len.addr, align 8
  %511 = sub i64 %stack_len641, 1
  %sp642 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %511
  %swap.a643 = load i256, ptr %sp642, align 16
  %512 = sub i64 %stack_len641, 3
  %sp644 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %512
  %swap.b645 = load i256, ptr %sp644, align 16
  store i256 %swap.a643, ptr %sp644, align 16
  store i256 %swap.b645, ptr %sp642, align 16
  br label %OP213.SUB, !annotation !5

OP213.SUB:                                        ; preds = %OP212.SWAP2
  %stack_len646 = load i64, ptr %len.addr, align 8
  %513 = add i64 %stack_len646, -1
  store i64 %513, ptr %len.addr, align 8
  %514 = add i64 %stack_len646, -1
  %sp647 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %514
  %a648 = load i256, ptr %sp647, align 16
  %515 = add i64 %stack_len646, -2
  %sp649 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %515
  %b650 = load i256, ptr %sp649, align 16
  %516 = sub i256 %a648, %b650
  %517 = add i64 %stack_len646, -2
  %sp651 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %517
  store i256 %516, ptr %sp651, align 16
  br label %OP214.SWAP1, !annotation !5

OP214.SWAP1:                                      ; preds = %OP213.SUB
  %stack_len652 = load i64, ptr %len.addr, align 8
  %518 = sub i64 %stack_len652, 1
  %sp653 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %518
  %swap.a654 = load i256, ptr %sp653, align 16
  %519 = sub i64 %stack_len652, 2
  %sp655 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %519
  %swap.b656 = load i256, ptr %sp655, align 16
  store i256 %swap.a654, ptr %sp655, align 16
  store i256 %swap.b656, ptr %sp653, align 16
  br label %OP215.LOG1, !annotation !5

OP215.LOG1:                                       ; preds = %OP214.SWAP1
  %stack_len657 = load i64, ptr %len.addr, align 8
  %520 = add i64 %stack_len657, -3
  store i64 %520, ptr %len.addr, align 8
  %521 = sub i64 %stack_len657, 3
  %sp658 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %521
  %522 = call i8 @__revmc_builtin_log(ptr %arg.ecx.addr, ptr %sp658, i8 1)
  %523 = icmp ne i8 %522, 0
  br i1 %523, label %return, label %OP215.LOG1.contd, !prof !2

OP215.LOG1.contd:                                 ; preds = %OP215.LOG1
  br label %OP216.JUMP, !annotation !5

OP216.JUMP:                                       ; preds = %OP215.LOG1.contd
  %stack_len659 = load i64, ptr %len.addr, align 8
  %524 = add i64 %stack_len659, -1
  store i64 %524, ptr %len.addr, align 8
  %525 = add i64 %stack_len659, -1
  %sp660 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %525
  %a661 = load i256, ptr %sp660, align 16
  br label %dynamic_jump_table

OP217.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP481.JUMP, %OP474.JUMP, %OP446.JUMP, %OP230.JUMP
  %gas.remaining662 = load i64, ptr %gas.remaining.addr, align 8
  %526 = sub i64 %gas.remaining662, 27
  %527 = icmp ult i64 %gas.remaining662, 27
  store i64 %526, ptr %gas.remaining.addr, align 8
  br i1 %527, label %return, label %OP217.JUMPDEST.contd, !prof !2, !annotation !3

OP217.JUMPDEST.contd:                             ; preds = %OP217.JUMPDEST
  %stack_len663 = load i64, ptr %len.addr, align 8
  %528 = icmp ult i64 %stack_len663, 2
  %529 = icmp ugt i64 %stack_len663, 1022
  %530 = or i1 %528, %529
  %531 = select i1 %528, i8 91, i8 92
  br i1 %530, label %return, label %OP217.JUMPDEST.contd664, !prof !2

OP217.JUMPDEST.contd664:                          ; preds = %OP217.JUMPDEST.contd
  br label %OP218.PUSH0, !annotation !5

OP218.PUSH0:                                      ; preds = %OP217.JUMPDEST.contd664
  %stack_len665 = load i64, ptr %len.addr, align 8
  %532 = add i64 %stack_len665, 1
  store i64 %532, ptr %len.addr, align 8
  %sp666 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len665
  store i256 0, ptr %sp666, align 16
  br label %OP219.DUP2, !annotation !5

OP219.DUP2:                                       ; preds = %OP218.PUSH0
  %stack_len667 = load i64, ptr %len.addr, align 8
  %533 = add i64 %stack_len667, 1
  store i64 %533, ptr %len.addr, align 8
  %534 = sub i64 %stack_len667, 2
  %sp668 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %534
  %dup2669 = load i256, ptr %sp668, align 16
  %sp670 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len667
  store i256 %dup2669, ptr %sp670, align 16
  br label %OP220.SWAP1, !annotation !5

OP220.SWAP1:                                      ; preds = %OP219.DUP2
  %stack_len671 = load i64, ptr %len.addr, align 8
  %535 = sub i64 %stack_len671, 1
  %sp672 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %535
  %swap.a673 = load i256, ptr %sp672, align 16
  %536 = sub i64 %stack_len671, 2
  %sp674 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %536
  %swap.b675 = load i256, ptr %sp674, align 16
  store i256 %swap.a673, ptr %sp674, align 16
  store i256 %swap.b675, ptr %sp672, align 16
  br label %OP221.POP, !annotation !5

OP221.POP:                                        ; preds = %OP220.SWAP1
  %stack_len676 = load i64, ptr %len.addr, align 8
  %537 = add i64 %stack_len676, -1
  store i64 %537, ptr %len.addr, align 8
  br label %OP222.SWAP2, !annotation !5

OP222.SWAP2:                                      ; preds = %OP221.POP
  %stack_len677 = load i64, ptr %len.addr, align 8
  %538 = sub i64 %stack_len677, 1
  %sp678 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %538
  %swap.a679 = load i256, ptr %sp678, align 16
  %539 = sub i64 %stack_len677, 3
  %sp680 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %539
  %swap.b681 = load i256, ptr %sp680, align 16
  store i256 %swap.a679, ptr %sp680, align 16
  store i256 %swap.b681, ptr %sp678, align 16
  br label %OP223.SWAP1, !annotation !5

OP223.SWAP1:                                      ; preds = %OP222.SWAP2
  %stack_len682 = load i64, ptr %len.addr, align 8
  %540 = sub i64 %stack_len682, 1
  %sp683 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %540
  %swap.a684 = load i256, ptr %sp683, align 16
  %541 = sub i64 %stack_len682, 2
  %sp685 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %541
  %swap.b686 = load i256, ptr %sp685, align 16
  store i256 %swap.a684, ptr %sp685, align 16
  store i256 %swap.b686, ptr %sp683, align 16
  br label %OP224.POP, !annotation !5

OP224.POP:                                        ; preds = %OP223.SWAP1
  %stack_len687 = load i64, ptr %len.addr, align 8
  %542 = add i64 %stack_len687, -1
  store i64 %542, ptr %len.addr, align 8
  br label %OP225.JUMP, !annotation !5

OP225.JUMP:                                       ; preds = %OP224.POP
  %stack_len688 = load i64, ptr %len.addr, align 8
  %543 = add i64 %stack_len688, -1
  store i64 %543, ptr %len.addr, align 8
  %544 = add i64 %stack_len688, -1
  %sp689 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %544
  %a690 = load i256, ptr %sp689, align 16
  br label %dynamic_jump_table

OP226.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP527.JUMP, %OP519.JUMP, %OP250.JUMP
  %gas.remaining691 = load i64, ptr %gas.remaining.addr, align 8
  %545 = sub i64 %gas.remaining691, 18
  %546 = icmp ult i64 %gas.remaining691, 18
  store i64 %545, ptr %gas.remaining.addr, align 8
  br i1 %546, label %return, label %OP226.JUMPDEST.contd, !prof !2, !annotation !3

OP226.JUMPDEST.contd:                             ; preds = %OP226.JUMPDEST
  %stack_len692 = load i64, ptr %len.addr, align 8
  %547 = icmp ult i64 %stack_len692, 1
  %548 = icmp ugt i64 %stack_len692, 1021
  %549 = or i1 %547, %548
  %550 = select i1 %547, i8 91, i8 92
  br i1 %549, label %return, label %OP226.JUMPDEST.contd693, !prof !2

OP226.JUMPDEST.contd693:                          ; preds = %OP226.JUMPDEST.contd
  br label %OP227.PUSH2, !annotation !5

OP227.PUSH2:                                      ; preds = %OP226.JUMPDEST.contd693
  %stack_len694 = load i64, ptr %len.addr, align 8
  %551 = add i64 %stack_len694, 1
  store i64 %551, ptr %len.addr, align 8
  %sp695 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len694
  store i256 365, ptr %sp695, align 16
  br label %OP228.DUP2, !annotation !5

OP228.DUP2:                                       ; preds = %OP227.PUSH2
  %stack_len696 = load i64, ptr %len.addr, align 8
  %552 = add i64 %stack_len696, 1
  store i64 %552, ptr %len.addr, align 8
  %553 = sub i64 %stack_len696, 2
  %sp697 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %553
  %dup2698 = load i256, ptr %sp697, align 16
  %sp699 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len696
  store i256 %dup2698, ptr %sp699, align 16
  br label %OP229.PUSH2, !annotation !5

OP229.PUSH2:                                      ; preds = %OP228.DUP2
  br label %OP230.JUMP, !annotation !6

OP230.JUMP:                                       ; preds = %OP229.PUSH2
  %stack_len700 = load i64, ptr %len.addr, align 8
  br label %OP217.JUMPDEST

OP231.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining701 = load i64, ptr %gas.remaining.addr, align 8
  %554 = sub i64 %gas.remaining701, 19
  %555 = icmp ult i64 %gas.remaining701, 19
  store i64 %554, ptr %gas.remaining.addr, align 8
  br i1 %555, label %return, label %OP231.JUMPDEST.contd, !prof !2, !annotation !3

OP231.JUMPDEST.contd:                             ; preds = %OP231.JUMPDEST
  %stack_len702 = load i64, ptr %len.addr, align 8
  %556 = icmp ult i64 %stack_len702, 4
  %557 = icmp ugt i64 %stack_len702, 1023
  %558 = or i1 %556, %557
  %559 = select i1 %556, i8 91, i8 92
  br i1 %558, label %return, label %OP231.JUMPDEST.contd703, !prof !2

OP231.JUMPDEST.contd703:                          ; preds = %OP231.JUMPDEST.contd
  br label %OP232.DUP3, !annotation !5

OP232.DUP3:                                       ; preds = %OP231.JUMPDEST.contd703
  %stack_len704 = load i64, ptr %len.addr, align 8
  %560 = add i64 %stack_len704, 1
  store i64 %560, ptr %len.addr, align 8
  %561 = sub i64 %stack_len704, 3
  %sp705 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %561
  %dup3 = load i256, ptr %sp705, align 16
  %sp706 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len704
  store i256 %dup3, ptr %sp706, align 16
  br label %OP233.MSTORE, !annotation !5

OP233.MSTORE:                                     ; preds = %OP232.DUP3
  %stack_len707 = load i64, ptr %len.addr, align 8
  %562 = add i64 %stack_len707, -2
  store i64 %562, ptr %len.addr, align 8
  %563 = add i64 %stack_len707, -1
  %sp708 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %563
  %a709 = load i256, ptr %sp708, align 16
  %564 = add i64 %stack_len707, -2
  %sp710 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %564
  %b711 = load i256, ptr %sp710, align 16
  %565 = call i8 @__revmc_ir_builtin_mstore(i256 %a709, i256 %b711, ptr %arg.ecx.addr)
  %566 = icmp ne i8 %565, 0
  br i1 %566, label %return, label %OP233.MSTORE.contd, !prof !2

OP233.MSTORE.contd:                               ; preds = %OP233.MSTORE
  br label %OP234.POP, !annotation !5

OP234.POP:                                        ; preds = %OP233.MSTORE.contd
  %stack_len712 = load i64, ptr %len.addr, align 8
  %567 = add i64 %stack_len712, -1
  store i64 %567, ptr %len.addr, align 8
  br label %OP235.POP, !annotation !5

OP235.POP:                                        ; preds = %OP234.POP
  %stack_len713 = load i64, ptr %len.addr, align 8
  %568 = add i64 %stack_len713, -1
  store i64 %568, ptr %len.addr, align 8
  br label %OP236.JUMP, !annotation !5

OP236.JUMP:                                       ; preds = %OP235.POP
  %stack_len714 = load i64, ptr %len.addr, align 8
  %569 = add i64 %stack_len714, -1
  store i64 %569, ptr %len.addr, align 8
  %570 = add i64 %stack_len714, -1
  %sp715 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %570
  %a716 = load i256, ptr %sp715, align 16
  br label %dynamic_jump_table

OP237.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP57.JUMP
  %gas.remaining717 = load i64, ptr %gas.remaining.addr, align 8
  %571 = sub i64 %gas.remaining717, 42
  %572 = icmp ult i64 %gas.remaining717, 42
  store i64 %571, ptr %gas.remaining.addr, align 8
  br i1 %572, label %return, label %OP237.JUMPDEST.contd, !prof !2, !annotation !3

OP237.JUMPDEST.contd:                             ; preds = %OP237.JUMPDEST
  %stack_len718 = load i64, ptr %len.addr, align 8
  %573 = icmp ult i64 %stack_len718, 2
  %574 = icmp ugt i64 %stack_len718, 1019
  %575 = or i1 %573, %574
  %576 = select i1 %573, i8 91, i8 92
  br i1 %575, label %return, label %OP237.JUMPDEST.contd719, !prof !2

OP237.JUMPDEST.contd719:                          ; preds = %OP237.JUMPDEST.contd
  br label %OP238.PUSH0, !annotation !5

OP238.PUSH0:                                      ; preds = %OP237.JUMPDEST.contd719
  %stack_len720 = load i64, ptr %len.addr, align 8
  %577 = add i64 %stack_len720, 1
  store i64 %577, ptr %len.addr, align 8
  %sp721 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len720
  store i256 0, ptr %sp721, align 16
  br label %OP239.PUSH1, !annotation !5

OP239.PUSH1:                                      ; preds = %OP238.PUSH0
  %stack_len722 = load i64, ptr %len.addr, align 8
  %578 = add i64 %stack_len722, 1
  store i64 %578, ptr %len.addr, align 8
  %sp723 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len722
  store i256 32, ptr %sp723, align 16
  br label %OP240.DUP3, !annotation !5

OP240.DUP3:                                       ; preds = %OP239.PUSH1
  %stack_len724 = load i64, ptr %len.addr, align 8
  %579 = add i64 %stack_len724, 1
  store i64 %579, ptr %len.addr, align 8
  %580 = sub i64 %stack_len724, 3
  %sp725 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %580
  %dup3726 = load i256, ptr %sp725, align 16
  %sp727 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len724
  store i256 %dup3726, ptr %sp727, align 16
  br label %OP241.ADD, !annotation !5

OP241.ADD:                                        ; preds = %OP240.DUP3
  %stack_len728 = load i64, ptr %len.addr, align 8
  %581 = add i64 %stack_len728, -1
  store i64 %581, ptr %len.addr, align 8
  %582 = add i64 %stack_len728, -1
  %sp729 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %582
  %a730 = load i256, ptr %sp729, align 16
  %583 = add i64 %stack_len728, -2
  %sp731 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %583
  %b732 = load i256, ptr %sp731, align 16
  %584 = add i256 %a730, %b732
  %585 = add i64 %stack_len728, -2
  %sp733 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %585
  store i256 %584, ptr %sp733, align 16
  br label %OP242.SWAP1, !annotation !5

OP242.SWAP1:                                      ; preds = %OP241.ADD
  %stack_len734 = load i64, ptr %len.addr, align 8
  %586 = sub i64 %stack_len734, 1
  %sp735 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %586
  %swap.a736 = load i256, ptr %sp735, align 16
  %587 = sub i64 %stack_len734, 2
  %sp737 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %587
  %swap.b738 = load i256, ptr %sp737, align 16
  store i256 %swap.a736, ptr %sp737, align 16
  store i256 %swap.b738, ptr %sp735, align 16
  br label %OP243.POP, !annotation !5

OP243.POP:                                        ; preds = %OP242.SWAP1
  %stack_len739 = load i64, ptr %len.addr, align 8
  %588 = add i64 %stack_len739, -1
  store i64 %588, ptr %len.addr, align 8
  br label %OP244.PUSH2, !annotation !5

OP244.PUSH2:                                      ; preds = %OP243.POP
  %stack_len740 = load i64, ptr %len.addr, align 8
  %589 = add i64 %stack_len740, 1
  store i64 %589, ptr %len.addr, align 8
  %sp741 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len740
  store i256 390, ptr %sp741, align 16
  br label %OP245.PUSH0, !annotation !5

OP245.PUSH0:                                      ; preds = %OP244.PUSH2
  %stack_len742 = load i64, ptr %len.addr, align 8
  %590 = add i64 %stack_len742, 1
  store i64 %590, ptr %len.addr, align 8
  %sp743 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len742
  store i256 0, ptr %sp743, align 16
  br label %OP246.DUP4, !annotation !5

OP246.DUP4:                                       ; preds = %OP245.PUSH0
  %stack_len744 = load i64, ptr %len.addr, align 8
  %591 = add i64 %stack_len744, 1
  store i64 %591, ptr %len.addr, align 8
  %592 = sub i64 %stack_len744, 4
  %sp745 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %592
  %dup4 = load i256, ptr %sp745, align 16
  %sp746 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len744
  store i256 %dup4, ptr %sp746, align 16
  br label %OP247.ADD, !annotation !5

OP247.ADD:                                        ; preds = %OP246.DUP4
  %stack_len747 = load i64, ptr %len.addr, align 8
  %593 = add i64 %stack_len747, -1
  store i64 %593, ptr %len.addr, align 8
  %594 = add i64 %stack_len747, -1
  %sp748 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %594
  %a749 = load i256, ptr %sp748, align 16
  %595 = add i64 %stack_len747, -2
  %sp750 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %595
  %b751 = load i256, ptr %sp750, align 16
  %596 = add i256 %a749, %b751
  %597 = add i64 %stack_len747, -2
  %sp752 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %597
  store i256 %596, ptr %sp752, align 16
  br label %OP248.DUP5, !annotation !5

OP248.DUP5:                                       ; preds = %OP247.ADD
  %stack_len753 = load i64, ptr %len.addr, align 8
  %598 = add i64 %stack_len753, 1
  store i64 %598, ptr %len.addr, align 8
  %599 = sub i64 %stack_len753, 5
  %sp754 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %599
  %dup5 = load i256, ptr %sp754, align 16
  %sp755 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len753
  store i256 %dup5, ptr %sp755, align 16
  br label %OP249.PUSH2, !annotation !5

OP249.PUSH2:                                      ; preds = %OP248.DUP5
  br label %OP250.JUMP, !annotation !6

OP250.JUMP:                                       ; preds = %OP249.PUSH2
  %stack_len756 = load i64, ptr %len.addr, align 8
  br label %OP226.JUMPDEST

OP251.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining757 = load i64, ptr %gas.remaining.addr, align 8
  %600 = sub i64 %gas.remaining757, 19
  %601 = icmp ult i64 %gas.remaining757, 19
  store i64 %600, ptr %gas.remaining.addr, align 8
  br i1 %601, label %return, label %OP251.JUMPDEST.contd, !prof !2, !annotation !3

OP251.JUMPDEST.contd:                             ; preds = %OP251.JUMPDEST
  %stack_len758 = load i64, ptr %len.addr, align 8
  %602 = icmp ult i64 %stack_len758, 4
  br i1 %602, label %return, label %OP251.JUMPDEST.contd759, !prof !2, !annotation !10

OP251.JUMPDEST.contd759:                          ; preds = %OP251.JUMPDEST.contd
  br label %OP252.SWAP3, !annotation !5

OP252.SWAP3:                                      ; preds = %OP251.JUMPDEST.contd759
  %stack_len760 = load i64, ptr %len.addr, align 8
  %603 = sub i64 %stack_len760, 1
  %sp761 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %603
  %swap.a762 = load i256, ptr %sp761, align 16
  %604 = sub i64 %stack_len760, 4
  %sp763 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %604
  %swap.b764 = load i256, ptr %sp763, align 16
  store i256 %swap.a762, ptr %sp763, align 16
  store i256 %swap.b764, ptr %sp761, align 16
  br label %OP253.SWAP2, !annotation !5

OP253.SWAP2:                                      ; preds = %OP252.SWAP3
  %stack_len765 = load i64, ptr %len.addr, align 8
  %605 = sub i64 %stack_len765, 1
  %sp766 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %605
  %swap.a767 = load i256, ptr %sp766, align 16
  %606 = sub i64 %stack_len765, 3
  %sp768 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %606
  %swap.b769 = load i256, ptr %sp768, align 16
  store i256 %swap.a767, ptr %sp768, align 16
  store i256 %swap.b769, ptr %sp766, align 16
  br label %OP254.POP, !annotation !5

OP254.POP:                                        ; preds = %OP253.SWAP2
  %stack_len770 = load i64, ptr %len.addr, align 8
  %607 = add i64 %stack_len770, -1
  store i64 %607, ptr %len.addr, align 8
  br label %OP255.POP, !annotation !5

OP255.POP:                                        ; preds = %OP254.POP
  %stack_len771 = load i64, ptr %len.addr, align 8
  %608 = add i64 %stack_len771, -1
  store i64 %608, ptr %len.addr, align 8
  br label %OP256.JUMP, !annotation !5

OP256.JUMP:                                       ; preds = %OP255.POP
  %stack_len772 = load i64, ptr %len.addr, align 8
  %609 = add i64 %stack_len772, -1
  store i64 %609, ptr %len.addr, align 8
  %610 = add i64 %stack_len772, -1
  %sp773 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %610
  %a774 = load i256, ptr %sp773, align 16
  br label %dynamic_jump_table

OP257.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP316.JUMP
  %gas.remaining775 = load i64, ptr %gas.remaining.addr, align 8
  %611 = sub i64 %gas.remaining775, 6
  %612 = icmp ult i64 %gas.remaining775, 6
  store i64 %611, ptr %gas.remaining.addr, align 8
  br i1 %612, label %return, label %OP257.JUMPDEST.contd, !prof !2, !annotation !3

OP257.JUMPDEST.contd:                             ; preds = %OP257.JUMPDEST
  %stack_len776 = load i64, ptr %len.addr, align 8
  %613 = icmp ugt i64 %stack_len776, 1022
  br i1 %613, label %return, label %OP257.JUMPDEST.contd777, !prof !2, !annotation !4

OP257.JUMPDEST.contd777:                          ; preds = %OP257.JUMPDEST.contd
  br label %OP258.PUSH0, !annotation !5

OP258.PUSH0:                                      ; preds = %OP257.JUMPDEST.contd777
  %stack_len778 = load i64, ptr %len.addr, align 8
  %614 = add i64 %stack_len778, 1
  store i64 %614, ptr %len.addr, align 8
  %sp779 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len778
  store i256 0, ptr %sp779, align 16
  br label %OP259.DUP1, !annotation !5

OP259.DUP1:                                       ; preds = %OP258.PUSH0
  %stack_len780 = load i64, ptr %len.addr, align 8
  %615 = add i64 %stack_len780, 1
  store i64 %615, ptr %len.addr, align 8
  %616 = sub i64 %stack_len780, 1
  %sp781 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %616
  %dup1782 = load i256, ptr %sp781, align 16
  %sp783 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len780
  store i256 %dup1782, ptr %sp783, align 16
  br label %OP260.REVERT, !annotation !5

OP260.REVERT:                                     ; preds = %OP259.DUP1
  %stack_len784 = load i64, ptr %len.addr, align 8
  %617 = add i64 %stack_len784, -2
  store i64 %617, ptr %len.addr, align 8
  %618 = sub i64 %stack_len784, 2
  %sp785 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %618
  %619 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp785, i8 16)
  %620 = icmp ne i8 %619, 0
  br i1 %620, label %return, label %OP260.REVERT.contd, !prof !2

OP260.REVERT.contd:                               ; preds = %OP260.REVERT
  br label %return, !annotation !7

OP261.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP276.JUMP
  %gas.remaining786 = load i64, ptr %gas.remaining.addr, align 8
  %621 = sub i64 %gas.remaining786, 33
  %622 = icmp ult i64 %gas.remaining786, 33
  store i64 %621, ptr %gas.remaining.addr, align 8
  br i1 %622, label %return, label %OP261.JUMPDEST.contd, !prof !2, !annotation !3

OP261.JUMPDEST.contd:                             ; preds = %OP261.JUMPDEST
  %stack_len787 = load i64, ptr %len.addr, align 8
  %623 = icmp ult i64 %stack_len787, 2
  %624 = icmp ugt i64 %stack_len787, 1021
  %625 = or i1 %623, %624
  %626 = select i1 %623, i8 91, i8 92
  br i1 %625, label %return, label %OP261.JUMPDEST.contd788, !prof !2

OP261.JUMPDEST.contd788:                          ; preds = %OP261.JUMPDEST.contd
  br label %OP262.PUSH0, !annotation !5

OP262.PUSH0:                                      ; preds = %OP261.JUMPDEST.contd788
  %stack_len789 = load i64, ptr %len.addr, align 8
  %627 = add i64 %stack_len789, 1
  store i64 %627, ptr %len.addr, align 8
  %sp790 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len789
  store i256 0, ptr %sp790, align 16
  br label %OP263.PUSH8, !annotation !5

OP263.PUSH8:                                      ; preds = %OP262.PUSH0
  %stack_len791 = load i64, ptr %len.addr, align 8
  %628 = add i64 %stack_len791, 1
  store i64 %628, ptr %len.addr, align 8
  %sp792 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len791
  store i256 18446744073709551615, ptr %sp792, align 16
  br label %OP264.DUP3, !annotation !5

OP264.DUP3:                                       ; preds = %OP263.PUSH8
  %stack_len793 = load i64, ptr %len.addr, align 8
  %629 = add i64 %stack_len793, 1
  store i64 %629, ptr %len.addr, align 8
  %630 = sub i64 %stack_len793, 3
  %sp794 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %630
  %dup3795 = load i256, ptr %sp794, align 16
  %sp796 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len793
  store i256 %dup3795, ptr %sp796, align 16
  br label %OP265.AND, !annotation !5

OP265.AND:                                        ; preds = %OP264.DUP3
  %stack_len797 = load i64, ptr %len.addr, align 8
  %631 = add i64 %stack_len797, -1
  store i64 %631, ptr %len.addr, align 8
  %632 = add i64 %stack_len797, -1
  %sp798 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %632
  %a799 = load i256, ptr %sp798, align 16
  %633 = add i64 %stack_len797, -2
  %sp800 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %633
  %b801 = load i256, ptr %sp800, align 16
  %634 = and i256 %a799, %b801
  %635 = add i64 %stack_len797, -2
  %sp802 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %635
  store i256 %634, ptr %sp802, align 16
  br label %OP266.SWAP1, !annotation !5

OP266.SWAP1:                                      ; preds = %OP265.AND
  %stack_len803 = load i64, ptr %len.addr, align 8
  %636 = sub i64 %stack_len803, 1
  %sp804 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %636
  %swap.a805 = load i256, ptr %sp804, align 16
  %637 = sub i64 %stack_len803, 2
  %sp806 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %637
  %swap.b807 = load i256, ptr %sp806, align 16
  store i256 %swap.a805, ptr %sp806, align 16
  store i256 %swap.b807, ptr %sp804, align 16
  br label %OP267.POP, !annotation !5

OP267.POP:                                        ; preds = %OP266.SWAP1
  %stack_len808 = load i64, ptr %len.addr, align 8
  %638 = add i64 %stack_len808, -1
  store i64 %638, ptr %len.addr, align 8
  br label %OP268.SWAP2, !annotation !5

OP268.SWAP2:                                      ; preds = %OP267.POP
  %stack_len809 = load i64, ptr %len.addr, align 8
  %639 = sub i64 %stack_len809, 1
  %sp810 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %639
  %swap.a811 = load i256, ptr %sp810, align 16
  %640 = sub i64 %stack_len809, 3
  %sp812 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %640
  %swap.b813 = load i256, ptr %sp812, align 16
  store i256 %swap.a811, ptr %sp812, align 16
  store i256 %swap.b813, ptr %sp810, align 16
  br label %OP269.SWAP1, !annotation !5

OP269.SWAP1:                                      ; preds = %OP268.SWAP2
  %stack_len814 = load i64, ptr %len.addr, align 8
  %641 = sub i64 %stack_len814, 1
  %sp815 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %641
  %swap.a816 = load i256, ptr %sp815, align 16
  %642 = sub i64 %stack_len814, 2
  %sp817 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %642
  %swap.b818 = load i256, ptr %sp817, align 16
  store i256 %swap.a816, ptr %sp817, align 16
  store i256 %swap.b818, ptr %sp815, align 16
  br label %OP270.POP, !annotation !5

OP270.POP:                                        ; preds = %OP269.SWAP1
  %stack_len819 = load i64, ptr %len.addr, align 8
  %643 = add i64 %stack_len819, -1
  store i64 %643, ptr %len.addr, align 8
  br label %OP271.JUMP, !annotation !5

OP271.JUMP:                                       ; preds = %OP270.POP
  %stack_len820 = load i64, ptr %len.addr, align 8
  %644 = add i64 %stack_len820, -1
  store i64 %644, ptr %len.addr, align 8
  %645 = add i64 %stack_len820, -1
  %sp821 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %645
  %a822 = load i256, ptr %sp821, align 16
  br label %dynamic_jump_table

OP272.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP297.JUMP
  %gas.remaining823 = load i64, ptr %gas.remaining.addr, align 8
  %646 = sub i64 %gas.remaining823, 18
  %647 = icmp ult i64 %gas.remaining823, 18
  store i64 %646, ptr %gas.remaining.addr, align 8
  br i1 %647, label %return, label %OP272.JUMPDEST.contd, !prof !2, !annotation !3

OP272.JUMPDEST.contd:                             ; preds = %OP272.JUMPDEST
  %stack_len824 = load i64, ptr %len.addr, align 8
  %648 = icmp ult i64 %stack_len824, 1
  %649 = icmp ugt i64 %stack_len824, 1021
  %650 = or i1 %648, %649
  %651 = select i1 %648, i8 91, i8 92
  br i1 %650, label %return, label %OP272.JUMPDEST.contd825, !prof !2

OP272.JUMPDEST.contd825:                          ; preds = %OP272.JUMPDEST.contd
  br label %OP273.PUSH2, !annotation !5

OP273.PUSH2:                                      ; preds = %OP272.JUMPDEST.contd825
  %stack_len826 = load i64, ptr %len.addr, align 8
  %652 = add i64 %stack_len826, 1
  store i64 %652, ptr %len.addr, align 8
  %sp827 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len826
  store i256 428, ptr %sp827, align 16
  br label %OP274.DUP2, !annotation !5

OP274.DUP2:                                       ; preds = %OP273.PUSH2
  %stack_len828 = load i64, ptr %len.addr, align 8
  %653 = add i64 %stack_len828, 1
  store i64 %653, ptr %len.addr, align 8
  %654 = sub i64 %stack_len828, 2
  %sp829 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %654
  %dup2830 = load i256, ptr %sp829, align 16
  %sp831 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len828
  store i256 %dup2830, ptr %sp831, align 16
  br label %OP275.PUSH2, !annotation !5

OP275.PUSH2:                                      ; preds = %OP274.DUP2
  br label %OP276.JUMP, !annotation !6

OP276.JUMP:                                       ; preds = %OP275.PUSH2
  %stack_len832 = load i64, ptr %len.addr, align 8
  br label %OP261.JUMPDEST

OP277.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining833 = load i64, ptr %gas.remaining.addr, align 8
  %655 = sub i64 %gas.remaining833, 20
  %656 = icmp ult i64 %gas.remaining833, 20
  store i64 %655, ptr %gas.remaining.addr, align 8
  br i1 %656, label %return, label %OP277.JUMPDEST.contd, !prof !2, !annotation !3

OP277.JUMPDEST.contd:                             ; preds = %OP277.JUMPDEST
  %stack_len834 = load i64, ptr %len.addr, align 8
  %657 = icmp ult i64 %stack_len834, 2
  %658 = icmp ugt i64 %stack_len834, 1023
  %659 = or i1 %657, %658
  %660 = select i1 %657, i8 91, i8 92
  br i1 %659, label %return, label %OP277.JUMPDEST.contd835, !prof !2

OP277.JUMPDEST.contd835:                          ; preds = %OP277.JUMPDEST.contd
  br label %OP278.DUP2, !annotation !5

OP278.DUP2:                                       ; preds = %OP277.JUMPDEST.contd835
  %stack_len836 = load i64, ptr %len.addr, align 8
  %661 = add i64 %stack_len836, 1
  store i64 %661, ptr %len.addr, align 8
  %662 = sub i64 %stack_len836, 2
  %sp837 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %662
  %dup2838 = load i256, ptr %sp837, align 16
  %sp839 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len836
  store i256 %dup2838, ptr %sp839, align 16
  br label %OP279.EQ, !annotation !5

OP279.EQ:                                         ; preds = %OP278.DUP2
  %stack_len840 = load i64, ptr %len.addr, align 8
  %663 = add i64 %stack_len840, -1
  store i64 %663, ptr %len.addr, align 8
  %664 = add i64 %stack_len840, -1
  %sp841 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %664
  %a842 = load i256, ptr %sp841, align 16
  %665 = add i64 %stack_len840, -2
  %sp843 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %665
  %b844 = load i256, ptr %sp843, align 16
  %666 = icmp eq i256 %a842, %b844
  %667 = zext i1 %666 to i256
  %668 = add i64 %stack_len840, -2
  %sp845 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %668
  store i256 %667, ptr %sp845, align 16
  br label %OP280.PUSH2, !annotation !5

OP280.PUSH2:                                      ; preds = %OP279.EQ
  br label %OP281.JUMPI, !annotation !6

OP281.JUMPI:                                      ; preds = %OP280.PUSH2
  %stack_len846 = load i64, ptr %len.addr, align 8
  %669 = add i64 %stack_len846, -1
  store i64 %669, ptr %len.addr, align 8
  %670 = add i64 %stack_len846, -1
  %sp847 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %670
  %a848 = load i256, ptr %sp847, align 16
  %671 = icmp ne i256 %a848, 0
  br i1 %671, label %OP285.JUMPDEST, label %OP282.PUSH0

OP282.PUSH0:                                      ; preds = %OP281.JUMPI
  %gas.remaining849 = load i64, ptr %gas.remaining.addr, align 8
  %672 = sub i64 %gas.remaining849, 5
  %673 = icmp ult i64 %gas.remaining849, 5
  store i64 %672, ptr %gas.remaining.addr, align 8
  br i1 %673, label %return, label %OP282.PUSH0.contd, !prof !2, !annotation !3

OP282.PUSH0.contd:                                ; preds = %OP282.PUSH0
  %stack_len850 = load i64, ptr %len.addr, align 8
  %674 = icmp ugt i64 %stack_len850, 1022
  br i1 %674, label %return, label %OP282.PUSH0.contd851, !prof !2, !annotation !4

OP282.PUSH0.contd851:                             ; preds = %OP282.PUSH0.contd
  %675 = add i64 %stack_len850, 1
  store i64 %675, ptr %len.addr, align 8
  %sp852 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len850
  store i256 0, ptr %sp852, align 16
  br label %OP283.DUP1, !annotation !5

OP283.DUP1:                                       ; preds = %OP282.PUSH0.contd851
  %stack_len853 = load i64, ptr %len.addr, align 8
  %676 = add i64 %stack_len853, 1
  store i64 %676, ptr %len.addr, align 8
  %677 = sub i64 %stack_len853, 1
  %sp854 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %677
  %dup1855 = load i256, ptr %sp854, align 16
  %sp856 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len853
  store i256 %dup1855, ptr %sp856, align 16
  br label %OP284.REVERT, !annotation !5

OP284.REVERT:                                     ; preds = %OP283.DUP1
  %stack_len857 = load i64, ptr %len.addr, align 8
  %678 = add i64 %stack_len857, -2
  store i64 %678, ptr %len.addr, align 8
  %679 = sub i64 %stack_len857, 2
  %sp858 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %679
  %680 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp858, i8 16)
  %681 = icmp ne i8 %680, 0
  br i1 %681, label %return, label %OP284.REVERT.contd, !prof !2

OP284.REVERT.contd:                               ; preds = %OP284.REVERT
  br label %return, !annotation !7

OP285.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP281.JUMPI
  %gas.remaining859 = load i64, ptr %gas.remaining.addr, align 8
  %682 = sub i64 %gas.remaining859, 11
  %683 = icmp ult i64 %gas.remaining859, 11
  store i64 %682, ptr %gas.remaining.addr, align 8
  br i1 %683, label %return, label %OP285.JUMPDEST.contd, !prof !2, !annotation !3

OP285.JUMPDEST.contd:                             ; preds = %OP285.JUMPDEST
  %stack_len860 = load i64, ptr %len.addr, align 8
  %684 = icmp ult i64 %stack_len860, 2
  br i1 %684, label %return, label %OP285.JUMPDEST.contd861, !prof !2, !annotation !10

OP285.JUMPDEST.contd861:                          ; preds = %OP285.JUMPDEST.contd
  br label %OP286.POP, !annotation !5

OP286.POP:                                        ; preds = %OP285.JUMPDEST.contd861
  %stack_len862 = load i64, ptr %len.addr, align 8
  %685 = add i64 %stack_len862, -1
  store i64 %685, ptr %len.addr, align 8
  br label %OP287.JUMP, !annotation !5

OP287.JUMP:                                       ; preds = %OP286.POP
  %stack_len863 = load i64, ptr %len.addr, align 8
  %686 = add i64 %stack_len863, -1
  store i64 %686, ptr %len.addr, align 8
  %687 = add i64 %stack_len863, -1
  %sp864 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %687
  %a865 = load i256, ptr %sp864, align 16
  br label %dynamic_jump_table

OP288.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP326.JUMP
  %gas.remaining866 = load i64, ptr %gas.remaining.addr, align 8
  %688 = sub i64 %gas.remaining866, 31
  %689 = icmp ult i64 %gas.remaining866, 31
  store i64 %688, ptr %gas.remaining.addr, align 8
  br i1 %689, label %return, label %OP288.JUMPDEST.contd, !prof !2, !annotation !3

OP288.JUMPDEST.contd:                             ; preds = %OP288.JUMPDEST
  %stack_len867 = load i64, ptr %len.addr, align 8
  %690 = icmp ult i64 %stack_len867, 1
  %691 = icmp ugt i64 %stack_len867, 1020
  %692 = or i1 %690, %691
  %693 = select i1 %690, i8 91, i8 92
  br i1 %692, label %return, label %OP288.JUMPDEST.contd868, !prof !2

OP288.JUMPDEST.contd868:                          ; preds = %OP288.JUMPDEST.contd
  br label %OP289.PUSH0, !annotation !5

OP289.PUSH0:                                      ; preds = %OP288.JUMPDEST.contd868
  %stack_len869 = load i64, ptr %len.addr, align 8
  %694 = add i64 %stack_len869, 1
  store i64 %694, ptr %len.addr, align 8
  %sp870 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len869
  store i256 0, ptr %sp870, align 16
  br label %OP290.DUP2, !annotation !5

OP290.DUP2:                                       ; preds = %OP289.PUSH0
  %stack_len871 = load i64, ptr %len.addr, align 8
  %695 = add i64 %stack_len871, 1
  store i64 %695, ptr %len.addr, align 8
  %696 = sub i64 %stack_len871, 2
  %sp872 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %696
  %dup2873 = load i256, ptr %sp872, align 16
  %sp874 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len871
  store i256 %dup2873, ptr %sp874, align 16
  br label %OP291.CALLDATALOAD, !annotation !5

OP291.CALLDATALOAD:                               ; preds = %OP290.DUP2
  %stack_len875 = load i64, ptr %len.addr, align 8
  %697 = add i64 %stack_len875, -1
  %sp876 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %697
  %a877 = load i256, ptr %sp876, align 16
  %698 = call i256 @__revmc_ir_builtin_calldataload(i256 %a877, ptr %arg.contract.addr)
  %699 = add i64 %stack_len875, -1
  %sp878 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %699
  store i256 %698, ptr %sp878, align 16
  br label %OP292.SWAP1, !annotation !5

OP292.SWAP1:                                      ; preds = %OP291.CALLDATALOAD
  %stack_len879 = load i64, ptr %len.addr, align 8
  %700 = sub i64 %stack_len879, 1
  %sp880 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %700
  %swap.a881 = load i256, ptr %sp880, align 16
  %701 = sub i64 %stack_len879, 2
  %sp882 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %701
  %swap.b883 = load i256, ptr %sp882, align 16
  store i256 %swap.a881, ptr %sp882, align 16
  store i256 %swap.b883, ptr %sp880, align 16
  br label %OP293.POP, !annotation !5

OP293.POP:                                        ; preds = %OP292.SWAP1
  %stack_len884 = load i64, ptr %len.addr, align 8
  %702 = add i64 %stack_len884, -1
  store i64 %702, ptr %len.addr, align 8
  br label %OP294.PUSH2, !annotation !5

OP294.PUSH2:                                      ; preds = %OP293.POP
  %stack_len885 = load i64, ptr %len.addr, align 8
  %703 = add i64 %stack_len885, 1
  store i64 %703, ptr %len.addr, align 8
  %sp886 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len885
  store i256 455, ptr %sp886, align 16
  br label %OP295.DUP2, !annotation !5

OP295.DUP2:                                       ; preds = %OP294.PUSH2
  %stack_len887 = load i64, ptr %len.addr, align 8
  %704 = add i64 %stack_len887, 1
  store i64 %704, ptr %len.addr, align 8
  %705 = sub i64 %stack_len887, 2
  %sp888 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %705
  %dup2889 = load i256, ptr %sp888, align 16
  %sp890 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len887
  store i256 %dup2889, ptr %sp890, align 16
  br label %OP296.PUSH2, !annotation !5

OP296.PUSH2:                                      ; preds = %OP295.DUP2
  br label %OP297.JUMP, !annotation !6

OP297.JUMP:                                       ; preds = %OP296.PUSH2
  %stack_len891 = load i64, ptr %len.addr, align 8
  br label %OP272.JUMPDEST

OP298.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining892 = load i64, ptr %gas.remaining.addr, align 8
  %706 = sub i64 %gas.remaining892, 19
  %707 = icmp ult i64 %gas.remaining892, 19
  store i64 %706, ptr %gas.remaining.addr, align 8
  br i1 %707, label %return, label %OP298.JUMPDEST.contd, !prof !2, !annotation !3

OP298.JUMPDEST.contd:                             ; preds = %OP298.JUMPDEST
  %stack_len893 = load i64, ptr %len.addr, align 8
  %708 = icmp ult i64 %stack_len893, 4
  br i1 %708, label %return, label %OP298.JUMPDEST.contd894, !prof !2, !annotation !10

OP298.JUMPDEST.contd894:                          ; preds = %OP298.JUMPDEST.contd
  br label %OP299.SWAP3, !annotation !5

OP299.SWAP3:                                      ; preds = %OP298.JUMPDEST.contd894
  %stack_len895 = load i64, ptr %len.addr, align 8
  %709 = sub i64 %stack_len895, 1
  %sp896 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %709
  %swap.a897 = load i256, ptr %sp896, align 16
  %710 = sub i64 %stack_len895, 4
  %sp898 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %710
  %swap.b899 = load i256, ptr %sp898, align 16
  store i256 %swap.a897, ptr %sp898, align 16
  store i256 %swap.b899, ptr %sp896, align 16
  br label %OP300.SWAP2, !annotation !5

OP300.SWAP2:                                      ; preds = %OP299.SWAP3
  %stack_len900 = load i64, ptr %len.addr, align 8
  %711 = sub i64 %stack_len900, 1
  %sp901 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %711
  %swap.a902 = load i256, ptr %sp901, align 16
  %712 = sub i64 %stack_len900, 3
  %sp903 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %712
  %swap.b904 = load i256, ptr %sp903, align 16
  store i256 %swap.a902, ptr %sp903, align 16
  store i256 %swap.b904, ptr %sp901, align 16
  br label %OP301.POP, !annotation !5

OP301.POP:                                        ; preds = %OP300.SWAP2
  %stack_len905 = load i64, ptr %len.addr, align 8
  %713 = add i64 %stack_len905, -1
  store i64 %713, ptr %len.addr, align 8
  br label %OP302.POP, !annotation !5

OP302.POP:                                        ; preds = %OP301.POP
  %stack_len906 = load i64, ptr %len.addr, align 8
  %714 = add i64 %stack_len906, -1
  store i64 %714, ptr %len.addr, align 8
  br label %OP303.JUMP, !annotation !5

OP303.JUMP:                                       ; preds = %OP302.POP
  %stack_len907 = load i64, ptr %len.addr, align 8
  %715 = add i64 %stack_len907, -1
  store i64 %715, ptr %len.addr, align 8
  %716 = add i64 %stack_len907, -1
  %sp908 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %716
  %a909 = load i256, ptr %sp908, align 16
  br label %dynamic_jump_table

OP304.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP89.JUMP
  %gas.remaining910 = load i64, ptr %gas.remaining.addr, align 8
  %717 = sub i64 %gas.remaining910, 34
  %718 = icmp ult i64 %gas.remaining910, 34
  store i64 %717, ptr %gas.remaining.addr, align 8
  br i1 %718, label %return, label %OP304.JUMPDEST.contd, !prof !2, !annotation !3

OP304.JUMPDEST.contd:                             ; preds = %OP304.JUMPDEST
  %stack_len911 = load i64, ptr %len.addr, align 8
  %719 = icmp ult i64 %stack_len911, 2
  %720 = icmp ugt i64 %stack_len911, 1020
  %721 = or i1 %719, %720
  %722 = select i1 %719, i8 91, i8 92
  br i1 %721, label %return, label %OP304.JUMPDEST.contd912, !prof !2

OP304.JUMPDEST.contd912:                          ; preds = %OP304.JUMPDEST.contd
  br label %OP305.PUSH0, !annotation !5

OP305.PUSH0:                                      ; preds = %OP304.JUMPDEST.contd912
  %stack_len913 = load i64, ptr %len.addr, align 8
  %723 = add i64 %stack_len913, 1
  store i64 %723, ptr %len.addr, align 8
  %sp914 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len913
  store i256 0, ptr %sp914, align 16
  br label %OP306.PUSH1, !annotation !5

OP306.PUSH1:                                      ; preds = %OP305.PUSH0
  %stack_len915 = load i64, ptr %len.addr, align 8
  %724 = add i64 %stack_len915, 1
  store i64 %724, ptr %len.addr, align 8
  %sp916 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len915
  store i256 32, ptr %sp916, align 16
  br label %OP307.DUP3, !annotation !5

OP307.DUP3:                                       ; preds = %OP306.PUSH1
  %stack_len917 = load i64, ptr %len.addr, align 8
  %725 = add i64 %stack_len917, 1
  store i64 %725, ptr %len.addr, align 8
  %726 = sub i64 %stack_len917, 3
  %sp918 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %726
  %dup3919 = load i256, ptr %sp918, align 16
  %sp920 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len917
  store i256 %dup3919, ptr %sp920, align 16
  br label %OP308.DUP5, !annotation !5

OP308.DUP5:                                       ; preds = %OP307.DUP3
  %stack_len921 = load i64, ptr %len.addr, align 8
  %727 = add i64 %stack_len921, 1
  store i64 %727, ptr %len.addr, align 8
  %728 = sub i64 %stack_len921, 5
  %sp922 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %728
  %dup5923 = load i256, ptr %sp922, align 16
  %sp924 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len921
  store i256 %dup5923, ptr %sp924, align 16
  br label %OP309.SUB, !annotation !5

OP309.SUB:                                        ; preds = %OP308.DUP5
  %stack_len925 = load i64, ptr %len.addr, align 8
  %729 = add i64 %stack_len925, -1
  store i64 %729, ptr %len.addr, align 8
  %730 = add i64 %stack_len925, -1
  %sp926 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %730
  %a927 = load i256, ptr %sp926, align 16
  %731 = add i64 %stack_len925, -2
  %sp928 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %731
  %b929 = load i256, ptr %sp928, align 16
  %732 = sub i256 %a927, %b929
  %733 = add i64 %stack_len925, -2
  %sp930 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %733
  store i256 %732, ptr %sp930, align 16
  br label %OP310.SLT, !annotation !5

OP310.SLT:                                        ; preds = %OP309.SUB
  %stack_len931 = load i64, ptr %len.addr, align 8
  %734 = add i64 %stack_len931, -1
  store i64 %734, ptr %len.addr, align 8
  %735 = add i64 %stack_len931, -1
  %sp932 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %735
  %a933 = load i256, ptr %sp932, align 16
  %736 = add i64 %stack_len931, -2
  %sp934 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %736
  %b935 = load i256, ptr %sp934, align 16
  %737 = icmp slt i256 %a933, %b935
  %738 = zext i1 %737 to i256
  %739 = add i64 %stack_len931, -2
  %sp936 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %739
  store i256 %738, ptr %sp936, align 16
  br label %OP311.ISZERO, !annotation !5

OP311.ISZERO:                                     ; preds = %OP310.SLT
  %stack_len937 = load i64, ptr %len.addr, align 8
  %740 = add i64 %stack_len937, -1
  %sp938 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %740
  %a939 = load i256, ptr %sp938, align 16
  %741 = icmp eq i256 %a939, 0
  %742 = zext i1 %741 to i256
  %743 = add i64 %stack_len937, -1
  %sp940 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %743
  store i256 %742, ptr %sp940, align 16
  br label %OP312.PUSH2, !annotation !5

OP312.PUSH2:                                      ; preds = %OP311.ISZERO
  br label %OP313.JUMPI, !annotation !6

OP313.JUMPI:                                      ; preds = %OP312.PUSH2
  %stack_len941 = load i64, ptr %len.addr, align 8
  %744 = add i64 %stack_len941, -1
  store i64 %744, ptr %len.addr, align 8
  %745 = add i64 %stack_len941, -1
  %sp942 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %745
  %a943 = load i256, ptr %sp942, align 16
  %746 = icmp ne i256 %a943, 0
  br i1 %746, label %OP318.JUMPDEST, label %OP314.PUSH2

OP314.PUSH2:                                      ; preds = %OP313.JUMPI
  %gas.remaining944 = load i64, ptr %gas.remaining.addr, align 8
  %747 = sub i64 %gas.remaining944, 14
  %748 = icmp ult i64 %gas.remaining944, 14
  store i64 %747, ptr %gas.remaining.addr, align 8
  br i1 %748, label %return, label %OP314.PUSH2.contd, !prof !2, !annotation !3

OP314.PUSH2.contd:                                ; preds = %OP314.PUSH2
  %stack_len945 = load i64, ptr %len.addr, align 8
  %749 = icmp ugt i64 %stack_len945, 1022
  br i1 %749, label %return, label %OP314.PUSH2.contd946, !prof !2, !annotation !4

OP314.PUSH2.contd946:                             ; preds = %OP314.PUSH2.contd
  %750 = add i64 %stack_len945, 1
  store i64 %750, ptr %len.addr, align 8
  %sp947 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len945
  store i256 481, ptr %sp947, align 16
  br label %OP315.PUSH2, !annotation !5

OP315.PUSH2:                                      ; preds = %OP314.PUSH2.contd946
  br label %OP316.JUMP, !annotation !6

OP316.JUMP:                                       ; preds = %OP315.PUSH2
  %stack_len948 = load i64, ptr %len.addr, align 8
  br label %OP257.JUMPDEST

OP317.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining949 = load i64, ptr %gas.remaining.addr, align 8
  %751 = sub i64 %gas.remaining949, 1
  %752 = icmp ult i64 %gas.remaining949, 1
  store i64 %751, ptr %gas.remaining.addr, align 8
  br i1 %752, label %return, label %OP317.JUMPDEST.contd, !prof !2, !annotation !3

OP317.JUMPDEST.contd:                             ; preds = %OP317.JUMPDEST
  %stack_len950 = load i64, ptr %len.addr, align 8
  br label %OP318.JUMPDEST, !annotation !5

OP318.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP317.JUMPDEST.contd, %OP313.JUMPI
  %gas.remaining951 = load i64, ptr %gas.remaining.addr, align 8
  %753 = sub i64 %gas.remaining951, 29
  %754 = icmp ult i64 %gas.remaining951, 29
  store i64 %753, ptr %gas.remaining.addr, align 8
  br i1 %754, label %return, label %OP318.JUMPDEST.contd, !prof !2, !annotation !3

OP318.JUMPDEST.contd:                             ; preds = %OP318.JUMPDEST
  %stack_len952 = load i64, ptr %len.addr, align 8
  %755 = icmp ult i64 %stack_len952, 3
  %756 = icmp ugt i64 %stack_len952, 1019
  %757 = or i1 %755, %756
  %758 = select i1 %755, i8 91, i8 92
  br i1 %757, label %return, label %OP318.JUMPDEST.contd953, !prof !2

OP318.JUMPDEST.contd953:                          ; preds = %OP318.JUMPDEST.contd
  br label %OP319.PUSH0, !annotation !5

OP319.PUSH0:                                      ; preds = %OP318.JUMPDEST.contd953
  %stack_len954 = load i64, ptr %len.addr, align 8
  %759 = add i64 %stack_len954, 1
  store i64 %759, ptr %len.addr, align 8
  %sp955 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len954
  store i256 0, ptr %sp955, align 16
  br label %OP320.PUSH2, !annotation !5

OP320.PUSH2:                                      ; preds = %OP319.PUSH0
  %stack_len956 = load i64, ptr %len.addr, align 8
  %760 = add i64 %stack_len956, 1
  store i64 %760, ptr %len.addr, align 8
  %sp957 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len956
  store i256 495, ptr %sp957, align 16
  br label %OP321.DUP5, !annotation !5

OP321.DUP5:                                       ; preds = %OP320.PUSH2
  %stack_len958 = load i64, ptr %len.addr, align 8
  %761 = add i64 %stack_len958, 1
  store i64 %761, ptr %len.addr, align 8
  %762 = sub i64 %stack_len958, 5
  %sp959 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %762
  %dup5960 = load i256, ptr %sp959, align 16
  %sp961 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len958
  store i256 %dup5960, ptr %sp961, align 16
  br label %OP322.DUP3, !annotation !5

OP322.DUP3:                                       ; preds = %OP321.DUP5
  %stack_len962 = load i64, ptr %len.addr, align 8
  %763 = add i64 %stack_len962, 1
  store i64 %763, ptr %len.addr, align 8
  %764 = sub i64 %stack_len962, 3
  %sp963 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %764
  %dup3964 = load i256, ptr %sp963, align 16
  %sp965 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len962
  store i256 %dup3964, ptr %sp965, align 16
  br label %OP323.DUP6, !annotation !5

OP323.DUP6:                                       ; preds = %OP322.DUP3
  %stack_len966 = load i64, ptr %len.addr, align 8
  %765 = add i64 %stack_len966, 1
  store i64 %765, ptr %len.addr, align 8
  %766 = sub i64 %stack_len966, 6
  %sp967 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %766
  %dup6 = load i256, ptr %sp967, align 16
  %sp968 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len966
  store i256 %dup6, ptr %sp968, align 16
  br label %OP324.ADD, !annotation !5

OP324.ADD:                                        ; preds = %OP323.DUP6
  %stack_len969 = load i64, ptr %len.addr, align 8
  %767 = add i64 %stack_len969, -1
  store i64 %767, ptr %len.addr, align 8
  %768 = add i64 %stack_len969, -1
  %sp970 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %768
  %a971 = load i256, ptr %sp970, align 16
  %769 = add i64 %stack_len969, -2
  %sp972 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %769
  %b973 = load i256, ptr %sp972, align 16
  %770 = add i256 %a971, %b973
  %771 = add i64 %stack_len969, -2
  %sp974 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %771
  store i256 %770, ptr %sp974, align 16
  br label %OP325.PUSH2, !annotation !5

OP325.PUSH2:                                      ; preds = %OP324.ADD
  br label %OP326.JUMP, !annotation !6

OP326.JUMP:                                       ; preds = %OP325.PUSH2
  %stack_len975 = load i64, ptr %len.addr, align 8
  br label %OP288.JUMPDEST

OP327.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining976 = load i64, ptr %gas.remaining.addr, align 8
  %772 = sub i64 %gas.remaining976, 26
  %773 = icmp ult i64 %gas.remaining976, 26
  store i64 %772, ptr %gas.remaining.addr, align 8
  br i1 %773, label %return, label %OP327.JUMPDEST.contd, !prof !2, !annotation !3

OP327.JUMPDEST.contd:                             ; preds = %OP327.JUMPDEST
  %stack_len977 = load i64, ptr %len.addr, align 8
  %774 = icmp ult i64 %stack_len977, 6
  br i1 %774, label %return, label %OP327.JUMPDEST.contd978, !prof !2, !annotation !10

OP327.JUMPDEST.contd978:                          ; preds = %OP327.JUMPDEST.contd
  br label %OP328.SWAP2, !annotation !5

OP328.SWAP2:                                      ; preds = %OP327.JUMPDEST.contd978
  %stack_len979 = load i64, ptr %len.addr, align 8
  %775 = sub i64 %stack_len979, 1
  %sp980 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %775
  %swap.a981 = load i256, ptr %sp980, align 16
  %776 = sub i64 %stack_len979, 3
  %sp982 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %776
  %swap.b983 = load i256, ptr %sp982, align 16
  store i256 %swap.a981, ptr %sp982, align 16
  store i256 %swap.b983, ptr %sp980, align 16
  br label %OP329.POP, !annotation !5

OP329.POP:                                        ; preds = %OP328.SWAP2
  %stack_len984 = load i64, ptr %len.addr, align 8
  %777 = add i64 %stack_len984, -1
  store i64 %777, ptr %len.addr, align 8
  br label %OP330.POP, !annotation !5

OP330.POP:                                        ; preds = %OP329.POP
  %stack_len985 = load i64, ptr %len.addr, align 8
  %778 = add i64 %stack_len985, -1
  store i64 %778, ptr %len.addr, align 8
  br label %OP331.SWAP3, !annotation !5

OP331.SWAP3:                                      ; preds = %OP330.POP
  %stack_len986 = load i64, ptr %len.addr, align 8
  %779 = sub i64 %stack_len986, 1
  %sp987 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %779
  %swap.a988 = load i256, ptr %sp987, align 16
  %780 = sub i64 %stack_len986, 4
  %sp989 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %780
  %swap.b990 = load i256, ptr %sp989, align 16
  store i256 %swap.a988, ptr %sp989, align 16
  store i256 %swap.b990, ptr %sp987, align 16
  br label %OP332.SWAP2, !annotation !5

OP332.SWAP2:                                      ; preds = %OP331.SWAP3
  %stack_len991 = load i64, ptr %len.addr, align 8
  %781 = sub i64 %stack_len991, 1
  %sp992 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %781
  %swap.a993 = load i256, ptr %sp992, align 16
  %782 = sub i64 %stack_len991, 3
  %sp994 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %782
  %swap.b995 = load i256, ptr %sp994, align 16
  store i256 %swap.a993, ptr %sp994, align 16
  store i256 %swap.b995, ptr %sp992, align 16
  br label %OP333.POP, !annotation !5

OP333.POP:                                        ; preds = %OP332.SWAP2
  %stack_len996 = load i64, ptr %len.addr, align 8
  %783 = add i64 %stack_len996, -1
  store i64 %783, ptr %len.addr, align 8
  br label %OP334.POP, !annotation !5

OP334.POP:                                        ; preds = %OP333.POP
  %stack_len997 = load i64, ptr %len.addr, align 8
  %784 = add i64 %stack_len997, -1
  store i64 %784, ptr %len.addr, align 8
  br label %OP335.JUMP, !annotation !5

OP335.JUMP:                                       ; preds = %OP334.POP
  %stack_len998 = load i64, ptr %len.addr, align 8
  %785 = add i64 %stack_len998, -1
  store i64 %785, ptr %len.addr, align 8
  %786 = add i64 %stack_len998, -1
  %sp999 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %786
  %a1000 = load i256, ptr %sp999, align 16
  br label %dynamic_jump_table

OP336.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP349.JUMP
  %gas.remaining1001 = load i64, ptr %gas.remaining.addr, align 8
  %787 = sub i64 %gas.remaining1001, 27
  %788 = icmp ult i64 %gas.remaining1001, 27
  store i64 %787, ptr %gas.remaining.addr, align 8
  br i1 %788, label %return, label %OP336.JUMPDEST.contd, !prof !2, !annotation !3

OP336.JUMPDEST.contd:                             ; preds = %OP336.JUMPDEST
  %stack_len1002 = load i64, ptr %len.addr, align 8
  %789 = icmp ult i64 %stack_len1002, 2
  %790 = icmp ugt i64 %stack_len1002, 1022
  %791 = or i1 %789, %790
  %792 = select i1 %789, i8 91, i8 92
  br i1 %791, label %return, label %OP336.JUMPDEST.contd1003, !prof !2

OP336.JUMPDEST.contd1003:                         ; preds = %OP336.JUMPDEST.contd
  br label %OP337.PUSH0, !annotation !5

OP337.PUSH0:                                      ; preds = %OP336.JUMPDEST.contd1003
  %stack_len1004 = load i64, ptr %len.addr, align 8
  %793 = add i64 %stack_len1004, 1
  store i64 %793, ptr %len.addr, align 8
  %sp1005 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1004
  store i256 0, ptr %sp1005, align 16
  br label %OP338.DUP2, !annotation !5

OP338.DUP2:                                       ; preds = %OP337.PUSH0
  %stack_len1006 = load i64, ptr %len.addr, align 8
  %794 = add i64 %stack_len1006, 1
  store i64 %794, ptr %len.addr, align 8
  %795 = sub i64 %stack_len1006, 2
  %sp1007 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %795
  %dup21008 = load i256, ptr %sp1007, align 16
  %sp1009 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1006
  store i256 %dup21008, ptr %sp1009, align 16
  br label %OP339.SWAP1, !annotation !5

OP339.SWAP1:                                      ; preds = %OP338.DUP2
  %stack_len1010 = load i64, ptr %len.addr, align 8
  %796 = sub i64 %stack_len1010, 1
  %sp1011 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %796
  %swap.a1012 = load i256, ptr %sp1011, align 16
  %797 = sub i64 %stack_len1010, 2
  %sp1013 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %797
  %swap.b1014 = load i256, ptr %sp1013, align 16
  store i256 %swap.a1012, ptr %sp1013, align 16
  store i256 %swap.b1014, ptr %sp1011, align 16
  br label %OP340.POP, !annotation !5

OP340.POP:                                        ; preds = %OP339.SWAP1
  %stack_len1015 = load i64, ptr %len.addr, align 8
  %798 = add i64 %stack_len1015, -1
  store i64 %798, ptr %len.addr, align 8
  br label %OP341.SWAP2, !annotation !5

OP341.SWAP2:                                      ; preds = %OP340.POP
  %stack_len1016 = load i64, ptr %len.addr, align 8
  %799 = sub i64 %stack_len1016, 1
  %sp1017 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %799
  %swap.a1018 = load i256, ptr %sp1017, align 16
  %800 = sub i64 %stack_len1016, 3
  %sp1019 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %800
  %swap.b1020 = load i256, ptr %sp1019, align 16
  store i256 %swap.a1018, ptr %sp1019, align 16
  store i256 %swap.b1020, ptr %sp1017, align 16
  br label %OP342.SWAP1, !annotation !5

OP342.SWAP1:                                      ; preds = %OP341.SWAP2
  %stack_len1021 = load i64, ptr %len.addr, align 8
  %801 = sub i64 %stack_len1021, 1
  %sp1022 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %801
  %swap.a1023 = load i256, ptr %sp1022, align 16
  %802 = sub i64 %stack_len1021, 2
  %sp1024 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %802
  %swap.b1025 = load i256, ptr %sp1024, align 16
  store i256 %swap.a1023, ptr %sp1024, align 16
  store i256 %swap.b1025, ptr %sp1022, align 16
  br label %OP343.POP, !annotation !5

OP343.POP:                                        ; preds = %OP342.SWAP1
  %stack_len1026 = load i64, ptr %len.addr, align 8
  %803 = add i64 %stack_len1026, -1
  store i64 %803, ptr %len.addr, align 8
  br label %OP344.JUMP, !annotation !5

OP344.JUMP:                                       ; preds = %OP343.POP
  %stack_len1027 = load i64, ptr %len.addr, align 8
  %804 = add i64 %stack_len1027, -1
  store i64 %804, ptr %len.addr, align 8
  %805 = add i64 %stack_len1027, -1
  %sp1028 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %805
  %a1029 = load i256, ptr %sp1028, align 16
  br label %dynamic_jump_table

OP345.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP369.JUMP
  %gas.remaining1030 = load i64, ptr %gas.remaining.addr, align 8
  %806 = sub i64 %gas.remaining1030, 18
  %807 = icmp ult i64 %gas.remaining1030, 18
  store i64 %806, ptr %gas.remaining.addr, align 8
  br i1 %807, label %return, label %OP345.JUMPDEST.contd, !prof !2, !annotation !3

OP345.JUMPDEST.contd:                             ; preds = %OP345.JUMPDEST
  %stack_len1031 = load i64, ptr %len.addr, align 8
  %808 = icmp ult i64 %stack_len1031, 1
  %809 = icmp ugt i64 %stack_len1031, 1021
  %810 = or i1 %808, %809
  %811 = select i1 %808, i8 91, i8 92
  br i1 %810, label %return, label %OP345.JUMPDEST.contd1032, !prof !2

OP345.JUMPDEST.contd1032:                         ; preds = %OP345.JUMPDEST.contd
  br label %OP346.PUSH2, !annotation !5

OP346.PUSH2:                                      ; preds = %OP345.JUMPDEST.contd1032
  %stack_len1033 = load i64, ptr %len.addr, align 8
  %812 = add i64 %stack_len1033, 1
  store i64 %812, ptr %len.addr, align 8
  %sp1034 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1033
  store i256 522, ptr %sp1034, align 16
  br label %OP347.DUP2, !annotation !5

OP347.DUP2:                                       ; preds = %OP346.PUSH2
  %stack_len1035 = load i64, ptr %len.addr, align 8
  %813 = add i64 %stack_len1035, 1
  store i64 %813, ptr %len.addr, align 8
  %814 = sub i64 %stack_len1035, 2
  %sp1036 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %814
  %dup21037 = load i256, ptr %sp1036, align 16
  %sp1038 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1035
  store i256 %dup21037, ptr %sp1038, align 16
  br label %OP348.PUSH2, !annotation !5

OP348.PUSH2:                                      ; preds = %OP347.DUP2
  br label %OP349.JUMP, !annotation !6

OP349.JUMP:                                       ; preds = %OP348.PUSH2
  %stack_len1039 = load i64, ptr %len.addr, align 8
  br label %OP336.JUMPDEST

OP350.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1040 = load i64, ptr %gas.remaining.addr, align 8
  %815 = sub i64 %gas.remaining1040, 19
  %816 = icmp ult i64 %gas.remaining1040, 19
  store i64 %815, ptr %gas.remaining.addr, align 8
  br i1 %816, label %return, label %OP350.JUMPDEST.contd, !prof !2, !annotation !3

OP350.JUMPDEST.contd:                             ; preds = %OP350.JUMPDEST
  %stack_len1041 = load i64, ptr %len.addr, align 8
  %817 = icmp ult i64 %stack_len1041, 4
  %818 = icmp ugt i64 %stack_len1041, 1023
  %819 = or i1 %817, %818
  %820 = select i1 %817, i8 91, i8 92
  br i1 %819, label %return, label %OP350.JUMPDEST.contd1042, !prof !2

OP350.JUMPDEST.contd1042:                         ; preds = %OP350.JUMPDEST.contd
  br label %OP351.DUP3, !annotation !5

OP351.DUP3:                                       ; preds = %OP350.JUMPDEST.contd1042
  %stack_len1043 = load i64, ptr %len.addr, align 8
  %821 = add i64 %stack_len1043, 1
  store i64 %821, ptr %len.addr, align 8
  %822 = sub i64 %stack_len1043, 3
  %sp1044 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %822
  %dup31045 = load i256, ptr %sp1044, align 16
  %sp1046 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1043
  store i256 %dup31045, ptr %sp1046, align 16
  br label %OP352.MSTORE, !annotation !5

OP352.MSTORE:                                     ; preds = %OP351.DUP3
  %stack_len1047 = load i64, ptr %len.addr, align 8
  %823 = add i64 %stack_len1047, -2
  store i64 %823, ptr %len.addr, align 8
  %824 = add i64 %stack_len1047, -1
  %sp1048 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %824
  %a1049 = load i256, ptr %sp1048, align 16
  %825 = add i64 %stack_len1047, -2
  %sp1050 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %825
  %b1051 = load i256, ptr %sp1050, align 16
  %826 = call i8 @__revmc_ir_builtin_mstore(i256 %a1049, i256 %b1051, ptr %arg.ecx.addr)
  %827 = icmp ne i8 %826, 0
  br i1 %827, label %return, label %OP352.MSTORE.contd, !prof !2

OP352.MSTORE.contd:                               ; preds = %OP352.MSTORE
  br label %OP353.POP, !annotation !5

OP353.POP:                                        ; preds = %OP352.MSTORE.contd
  %stack_len1052 = load i64, ptr %len.addr, align 8
  %828 = add i64 %stack_len1052, -1
  store i64 %828, ptr %len.addr, align 8
  br label %OP354.POP, !annotation !5

OP354.POP:                                        ; preds = %OP353.POP
  %stack_len1053 = load i64, ptr %len.addr, align 8
  %829 = add i64 %stack_len1053, -1
  store i64 %829, ptr %len.addr, align 8
  br label %OP355.JUMP, !annotation !5

OP355.JUMP:                                       ; preds = %OP354.POP
  %stack_len1054 = load i64, ptr %len.addr, align 8
  %830 = add i64 %stack_len1054, -1
  store i64 %830, ptr %len.addr, align 8
  %831 = add i64 %stack_len1054, -1
  %sp1055 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %831
  %a1056 = load i256, ptr %sp1055, align 16
  br label %dynamic_jump_table

OP356.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP100.JUMP
  %gas.remaining1057 = load i64, ptr %gas.remaining.addr, align 8
  %832 = sub i64 %gas.remaining1057, 42
  %833 = icmp ult i64 %gas.remaining1057, 42
  store i64 %832, ptr %gas.remaining.addr, align 8
  br i1 %833, label %return, label %OP356.JUMPDEST.contd, !prof !2, !annotation !3

OP356.JUMPDEST.contd:                             ; preds = %OP356.JUMPDEST
  %stack_len1058 = load i64, ptr %len.addr, align 8
  %834 = icmp ult i64 %stack_len1058, 2
  %835 = icmp ugt i64 %stack_len1058, 1019
  %836 = or i1 %834, %835
  %837 = select i1 %834, i8 91, i8 92
  br i1 %836, label %return, label %OP356.JUMPDEST.contd1059, !prof !2

OP356.JUMPDEST.contd1059:                         ; preds = %OP356.JUMPDEST.contd
  br label %OP357.PUSH0, !annotation !5

OP357.PUSH0:                                      ; preds = %OP356.JUMPDEST.contd1059
  %stack_len1060 = load i64, ptr %len.addr, align 8
  %838 = add i64 %stack_len1060, 1
  store i64 %838, ptr %len.addr, align 8
  %sp1061 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1060
  store i256 0, ptr %sp1061, align 16
  br label %OP358.PUSH1, !annotation !5

OP358.PUSH1:                                      ; preds = %OP357.PUSH0
  %stack_len1062 = load i64, ptr %len.addr, align 8
  %839 = add i64 %stack_len1062, 1
  store i64 %839, ptr %len.addr, align 8
  %sp1063 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1062
  store i256 32, ptr %sp1063, align 16
  br label %OP359.DUP3, !annotation !5

OP359.DUP3:                                       ; preds = %OP358.PUSH1
  %stack_len1064 = load i64, ptr %len.addr, align 8
  %840 = add i64 %stack_len1064, 1
  store i64 %840, ptr %len.addr, align 8
  %841 = sub i64 %stack_len1064, 3
  %sp1065 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %841
  %dup31066 = load i256, ptr %sp1065, align 16
  %sp1067 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1064
  store i256 %dup31066, ptr %sp1067, align 16
  br label %OP360.ADD, !annotation !5

OP360.ADD:                                        ; preds = %OP359.DUP3
  %stack_len1068 = load i64, ptr %len.addr, align 8
  %842 = add i64 %stack_len1068, -1
  store i64 %842, ptr %len.addr, align 8
  %843 = add i64 %stack_len1068, -1
  %sp1069 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %843
  %a1070 = load i256, ptr %sp1069, align 16
  %844 = add i64 %stack_len1068, -2
  %sp1071 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %844
  %b1072 = load i256, ptr %sp1071, align 16
  %845 = add i256 %a1070, %b1072
  %846 = add i64 %stack_len1068, -2
  %sp1073 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %846
  store i256 %845, ptr %sp1073, align 16
  br label %OP361.SWAP1, !annotation !5

OP361.SWAP1:                                      ; preds = %OP360.ADD
  %stack_len1074 = load i64, ptr %len.addr, align 8
  %847 = sub i64 %stack_len1074, 1
  %sp1075 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %847
  %swap.a1076 = load i256, ptr %sp1075, align 16
  %848 = sub i64 %stack_len1074, 2
  %sp1077 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %848
  %swap.b1078 = load i256, ptr %sp1077, align 16
  store i256 %swap.a1076, ptr %sp1077, align 16
  store i256 %swap.b1078, ptr %sp1075, align 16
  br label %OP362.POP, !annotation !5

OP362.POP:                                        ; preds = %OP361.SWAP1
  %stack_len1079 = load i64, ptr %len.addr, align 8
  %849 = add i64 %stack_len1079, -1
  store i64 %849, ptr %len.addr, align 8
  br label %OP363.PUSH2, !annotation !5

OP363.PUSH2:                                      ; preds = %OP362.POP
  %stack_len1080 = load i64, ptr %len.addr, align 8
  %850 = add i64 %stack_len1080, 1
  store i64 %850, ptr %len.addr, align 8
  %sp1081 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1080
  store i256 547, ptr %sp1081, align 16
  br label %OP364.PUSH0, !annotation !5

OP364.PUSH0:                                      ; preds = %OP363.PUSH2
  %stack_len1082 = load i64, ptr %len.addr, align 8
  %851 = add i64 %stack_len1082, 1
  store i64 %851, ptr %len.addr, align 8
  %sp1083 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1082
  store i256 0, ptr %sp1083, align 16
  br label %OP365.DUP4, !annotation !5

OP365.DUP4:                                       ; preds = %OP364.PUSH0
  %stack_len1084 = load i64, ptr %len.addr, align 8
  %852 = add i64 %stack_len1084, 1
  store i64 %852, ptr %len.addr, align 8
  %853 = sub i64 %stack_len1084, 4
  %sp1085 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %853
  %dup41086 = load i256, ptr %sp1085, align 16
  %sp1087 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1084
  store i256 %dup41086, ptr %sp1087, align 16
  br label %OP366.ADD, !annotation !5

OP366.ADD:                                        ; preds = %OP365.DUP4
  %stack_len1088 = load i64, ptr %len.addr, align 8
  %854 = add i64 %stack_len1088, -1
  store i64 %854, ptr %len.addr, align 8
  %855 = add i64 %stack_len1088, -1
  %sp1089 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %855
  %a1090 = load i256, ptr %sp1089, align 16
  %856 = add i64 %stack_len1088, -2
  %sp1091 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %856
  %b1092 = load i256, ptr %sp1091, align 16
  %857 = add i256 %a1090, %b1092
  %858 = add i64 %stack_len1088, -2
  %sp1093 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %858
  store i256 %857, ptr %sp1093, align 16
  br label %OP367.DUP5, !annotation !5

OP367.DUP5:                                       ; preds = %OP366.ADD
  %stack_len1094 = load i64, ptr %len.addr, align 8
  %859 = add i64 %stack_len1094, 1
  store i64 %859, ptr %len.addr, align 8
  %860 = sub i64 %stack_len1094, 5
  %sp1095 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %860
  %dup51096 = load i256, ptr %sp1095, align 16
  %sp1097 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1094
  store i256 %dup51096, ptr %sp1097, align 16
  br label %OP368.PUSH2, !annotation !5

OP368.PUSH2:                                      ; preds = %OP367.DUP5
  br label %OP369.JUMP, !annotation !6

OP369.JUMP:                                       ; preds = %OP368.PUSH2
  %stack_len1098 = load i64, ptr %len.addr, align 8
  br label %OP345.JUMPDEST

OP370.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1099 = load i64, ptr %gas.remaining.addr, align 8
  %861 = sub i64 %gas.remaining1099, 19
  %862 = icmp ult i64 %gas.remaining1099, 19
  store i64 %861, ptr %gas.remaining.addr, align 8
  br i1 %862, label %return, label %OP370.JUMPDEST.contd, !prof !2, !annotation !3

OP370.JUMPDEST.contd:                             ; preds = %OP370.JUMPDEST
  %stack_len1100 = load i64, ptr %len.addr, align 8
  %863 = icmp ult i64 %stack_len1100, 4
  br i1 %863, label %return, label %OP370.JUMPDEST.contd1101, !prof !2, !annotation !10

OP370.JUMPDEST.contd1101:                         ; preds = %OP370.JUMPDEST.contd
  br label %OP371.SWAP3, !annotation !5

OP371.SWAP3:                                      ; preds = %OP370.JUMPDEST.contd1101
  %stack_len1102 = load i64, ptr %len.addr, align 8
  %864 = sub i64 %stack_len1102, 1
  %sp1103 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %864
  %swap.a1104 = load i256, ptr %sp1103, align 16
  %865 = sub i64 %stack_len1102, 4
  %sp1105 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %865
  %swap.b1106 = load i256, ptr %sp1105, align 16
  store i256 %swap.a1104, ptr %sp1105, align 16
  store i256 %swap.b1106, ptr %sp1103, align 16
  br label %OP372.SWAP2, !annotation !5

OP372.SWAP2:                                      ; preds = %OP371.SWAP3
  %stack_len1107 = load i64, ptr %len.addr, align 8
  %866 = sub i64 %stack_len1107, 1
  %sp1108 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %866
  %swap.a1109 = load i256, ptr %sp1108, align 16
  %867 = sub i64 %stack_len1107, 3
  %sp1110 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %867
  %swap.b1111 = load i256, ptr %sp1110, align 16
  store i256 %swap.a1109, ptr %sp1110, align 16
  store i256 %swap.b1111, ptr %sp1108, align 16
  br label %OP373.POP, !annotation !5

OP373.POP:                                        ; preds = %OP372.SWAP2
  %stack_len1112 = load i64, ptr %len.addr, align 8
  %868 = add i64 %stack_len1112, -1
  store i64 %868, ptr %len.addr, align 8
  br label %OP374.POP, !annotation !5

OP374.POP:                                        ; preds = %OP373.POP
  %stack_len1113 = load i64, ptr %len.addr, align 8
  %869 = add i64 %stack_len1113, -1
  store i64 %869, ptr %len.addr, align 8
  br label %OP375.JUMP, !annotation !5

OP375.JUMP:                                       ; preds = %OP374.POP
  %stack_len1114 = load i64, ptr %len.addr, align 8
  %870 = add i64 %stack_len1114, -1
  store i64 %870, ptr %len.addr, align 8
  %871 = add i64 %stack_len1114, -1
  %sp1115 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %871
  %a1116 = load i256, ptr %sp1115, align 16
  br label %dynamic_jump_table

OP376.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP392.JUMP
  %gas.remaining1117 = load i64, ptr %gas.remaining.addr, align 8
  %872 = sub i64 %gas.remaining1117, 33
  %873 = icmp ult i64 %gas.remaining1117, 33
  store i64 %872, ptr %gas.remaining.addr, align 8
  br i1 %873, label %return, label %OP376.JUMPDEST.contd, !prof !2, !annotation !3

OP376.JUMPDEST.contd:                             ; preds = %OP376.JUMPDEST
  %stack_len1118 = load i64, ptr %len.addr, align 8
  %874 = icmp ult i64 %stack_len1118, 2
  %875 = icmp ugt i64 %stack_len1118, 1021
  %876 = or i1 %874, %875
  %877 = select i1 %874, i8 91, i8 92
  br i1 %876, label %return, label %OP376.JUMPDEST.contd1119, !prof !2

OP376.JUMPDEST.contd1119:                         ; preds = %OP376.JUMPDEST.contd
  br label %OP377.PUSH0, !annotation !5

OP377.PUSH0:                                      ; preds = %OP376.JUMPDEST.contd1119
  %stack_len1120 = load i64, ptr %len.addr, align 8
  %878 = add i64 %stack_len1120, 1
  store i64 %878, ptr %len.addr, align 8
  %sp1121 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1120
  store i256 0, ptr %sp1121, align 16
  br label %OP378.PUSH20, !annotation !5

OP378.PUSH20:                                     ; preds = %OP377.PUSH0
  %stack_len1122 = load i64, ptr %len.addr, align 8
  %879 = add i64 %stack_len1122, 1
  store i64 %879, ptr %len.addr, align 8
  %sp1123 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1122
  store i256 1461501637330902918203684832716283019655932542975, ptr %sp1123, align 16
  br label %OP379.DUP3, !annotation !5

OP379.DUP3:                                       ; preds = %OP378.PUSH20
  %stack_len1124 = load i64, ptr %len.addr, align 8
  %880 = add i64 %stack_len1124, 1
  store i64 %880, ptr %len.addr, align 8
  %881 = sub i64 %stack_len1124, 3
  %sp1125 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %881
  %dup31126 = load i256, ptr %sp1125, align 16
  %sp1127 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1124
  store i256 %dup31126, ptr %sp1127, align 16
  br label %OP380.AND, !annotation !5

OP380.AND:                                        ; preds = %OP379.DUP3
  %stack_len1128 = load i64, ptr %len.addr, align 8
  %882 = add i64 %stack_len1128, -1
  store i64 %882, ptr %len.addr, align 8
  %883 = add i64 %stack_len1128, -1
  %sp1129 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %883
  %a1130 = load i256, ptr %sp1129, align 16
  %884 = add i64 %stack_len1128, -2
  %sp1131 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %884
  %b1132 = load i256, ptr %sp1131, align 16
  %885 = and i256 %a1130, %b1132
  %886 = add i64 %stack_len1128, -2
  %sp1133 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %886
  store i256 %885, ptr %sp1133, align 16
  br label %OP381.SWAP1, !annotation !5

OP381.SWAP1:                                      ; preds = %OP380.AND
  %stack_len1134 = load i64, ptr %len.addr, align 8
  %887 = sub i64 %stack_len1134, 1
  %sp1135 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %887
  %swap.a1136 = load i256, ptr %sp1135, align 16
  %888 = sub i64 %stack_len1134, 2
  %sp1137 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %888
  %swap.b1138 = load i256, ptr %sp1137, align 16
  store i256 %swap.a1136, ptr %sp1137, align 16
  store i256 %swap.b1138, ptr %sp1135, align 16
  br label %OP382.POP, !annotation !5

OP382.POP:                                        ; preds = %OP381.SWAP1
  %stack_len1139 = load i64, ptr %len.addr, align 8
  %889 = add i64 %stack_len1139, -1
  store i64 %889, ptr %len.addr, align 8
  br label %OP383.SWAP2, !annotation !5

OP383.SWAP2:                                      ; preds = %OP382.POP
  %stack_len1140 = load i64, ptr %len.addr, align 8
  %890 = sub i64 %stack_len1140, 1
  %sp1141 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %890
  %swap.a1142 = load i256, ptr %sp1141, align 16
  %891 = sub i64 %stack_len1140, 3
  %sp1143 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %891
  %swap.b1144 = load i256, ptr %sp1143, align 16
  store i256 %swap.a1142, ptr %sp1143, align 16
  store i256 %swap.b1144, ptr %sp1141, align 16
  br label %OP384.SWAP1, !annotation !5

OP384.SWAP1:                                      ; preds = %OP383.SWAP2
  %stack_len1145 = load i64, ptr %len.addr, align 8
  %892 = sub i64 %stack_len1145, 1
  %sp1146 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %892
  %swap.a1147 = load i256, ptr %sp1146, align 16
  %893 = sub i64 %stack_len1145, 2
  %sp1148 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %893
  %swap.b1149 = load i256, ptr %sp1148, align 16
  store i256 %swap.a1147, ptr %sp1148, align 16
  store i256 %swap.b1149, ptr %sp1146, align 16
  br label %OP385.POP, !annotation !5

OP385.POP:                                        ; preds = %OP384.SWAP1
  %stack_len1150 = load i64, ptr %len.addr, align 8
  %894 = add i64 %stack_len1150, -1
  store i64 %894, ptr %len.addr, align 8
  br label %OP386.JUMP, !annotation !5

OP386.JUMP:                                       ; preds = %OP385.POP
  %stack_len1151 = load i64, ptr %len.addr, align 8
  %895 = add i64 %stack_len1151, -1
  store i64 %895, ptr %len.addr, align 8
  %896 = add i64 %stack_len1151, -1
  %sp1152 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %896
  %a1153 = load i256, ptr %sp1152, align 16
  br label %dynamic_jump_table

OP387.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP404.JUMP
  %gas.remaining1154 = load i64, ptr %gas.remaining.addr, align 8
  %897 = sub i64 %gas.remaining1154, 20
  %898 = icmp ult i64 %gas.remaining1154, 20
  store i64 %897, ptr %gas.remaining.addr, align 8
  br i1 %898, label %return, label %OP387.JUMPDEST.contd, !prof !2, !annotation !3

OP387.JUMPDEST.contd:                             ; preds = %OP387.JUMPDEST
  %stack_len1155 = load i64, ptr %len.addr, align 8
  %899 = icmp ult i64 %stack_len1155, 1
  %900 = icmp ugt i64 %stack_len1155, 1020
  %901 = or i1 %899, %900
  %902 = select i1 %899, i8 91, i8 92
  br i1 %901, label %return, label %OP387.JUMPDEST.contd1156, !prof !2

OP387.JUMPDEST.contd1156:                         ; preds = %OP387.JUMPDEST.contd
  br label %OP388.PUSH0, !annotation !5

OP388.PUSH0:                                      ; preds = %OP387.JUMPDEST.contd1156
  %stack_len1157 = load i64, ptr %len.addr, align 8
  %903 = add i64 %stack_len1157, 1
  store i64 %903, ptr %len.addr, align 8
  %sp1158 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1157
  store i256 0, ptr %sp1158, align 16
  br label %OP389.PUSH2, !annotation !5

OP389.PUSH2:                                      ; preds = %OP388.PUSH0
  %stack_len1159 = load i64, ptr %len.addr, align 8
  %904 = add i64 %stack_len1159, 1
  store i64 %904, ptr %len.addr, align 8
  %sp1160 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1159
  store i256 594, ptr %sp1160, align 16
  br label %OP390.DUP3, !annotation !5

OP390.DUP3:                                       ; preds = %OP389.PUSH2
  %stack_len1161 = load i64, ptr %len.addr, align 8
  %905 = add i64 %stack_len1161, 1
  store i64 %905, ptr %len.addr, align 8
  %906 = sub i64 %stack_len1161, 3
  %sp1162 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %906
  %dup31163 = load i256, ptr %sp1162, align 16
  %sp1164 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1161
  store i256 %dup31163, ptr %sp1164, align 16
  br label %OP391.PUSH2, !annotation !5

OP391.PUSH2:                                      ; preds = %OP390.DUP3
  br label %OP392.JUMP, !annotation !6

OP392.JUMP:                                       ; preds = %OP391.PUSH2
  %stack_len1165 = load i64, ptr %len.addr, align 8
  br label %OP376.JUMPDEST

OP393.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1166 = load i64, ptr %gas.remaining.addr, align 8
  %907 = sub i64 %gas.remaining1166, 22
  %908 = icmp ult i64 %gas.remaining1166, 22
  store i64 %907, ptr %gas.remaining.addr, align 8
  br i1 %908, label %return, label %OP393.JUMPDEST.contd, !prof !2, !annotation !3

OP393.JUMPDEST.contd:                             ; preds = %OP393.JUMPDEST
  %stack_len1167 = load i64, ptr %len.addr, align 8
  %909 = icmp ult i64 %stack_len1167, 4
  br i1 %909, label %return, label %OP393.JUMPDEST.contd1168, !prof !2, !annotation !10

OP393.JUMPDEST.contd1168:                         ; preds = %OP393.JUMPDEST.contd
  br label %OP394.SWAP1, !annotation !5

OP394.SWAP1:                                      ; preds = %OP393.JUMPDEST.contd1168
  %stack_len1169 = load i64, ptr %len.addr, align 8
  %910 = sub i64 %stack_len1169, 1
  %sp1170 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %910
  %swap.a1171 = load i256, ptr %sp1170, align 16
  %911 = sub i64 %stack_len1169, 2
  %sp1172 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %911
  %swap.b1173 = load i256, ptr %sp1172, align 16
  store i256 %swap.a1171, ptr %sp1172, align 16
  store i256 %swap.b1173, ptr %sp1170, align 16
  br label %OP395.POP, !annotation !5

OP395.POP:                                        ; preds = %OP394.SWAP1
  %stack_len1174 = load i64, ptr %len.addr, align 8
  %912 = add i64 %stack_len1174, -1
  store i64 %912, ptr %len.addr, align 8
  br label %OP396.SWAP2, !annotation !5

OP396.SWAP2:                                      ; preds = %OP395.POP
  %stack_len1175 = load i64, ptr %len.addr, align 8
  %913 = sub i64 %stack_len1175, 1
  %sp1176 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %913
  %swap.a1177 = load i256, ptr %sp1176, align 16
  %914 = sub i64 %stack_len1175, 3
  %sp1178 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %914
  %swap.b1179 = load i256, ptr %sp1178, align 16
  store i256 %swap.a1177, ptr %sp1178, align 16
  store i256 %swap.b1179, ptr %sp1176, align 16
  br label %OP397.SWAP1, !annotation !5

OP397.SWAP1:                                      ; preds = %OP396.SWAP2
  %stack_len1180 = load i64, ptr %len.addr, align 8
  %915 = sub i64 %stack_len1180, 1
  %sp1181 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %915
  %swap.a1182 = load i256, ptr %sp1181, align 16
  %916 = sub i64 %stack_len1180, 2
  %sp1183 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %916
  %swap.b1184 = load i256, ptr %sp1183, align 16
  store i256 %swap.a1182, ptr %sp1183, align 16
  store i256 %swap.b1184, ptr %sp1181, align 16
  br label %OP398.POP, !annotation !5

OP398.POP:                                        ; preds = %OP397.SWAP1
  %stack_len1185 = load i64, ptr %len.addr, align 8
  %917 = add i64 %stack_len1185, -1
  store i64 %917, ptr %len.addr, align 8
  br label %OP399.JUMP, !annotation !5

OP399.JUMP:                                       ; preds = %OP398.POP
  %stack_len1186 = load i64, ptr %len.addr, align 8
  %918 = add i64 %stack_len1186, -1
  store i64 %918, ptr %len.addr, align 8
  %919 = add i64 %stack_len1186, -1
  %sp1187 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %919
  %a1188 = load i256, ptr %sp1187, align 16
  br label %dynamic_jump_table

OP400.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP424.JUMP
  %gas.remaining1189 = load i64, ptr %gas.remaining.addr, align 8
  %920 = sub i64 %gas.remaining1189, 18
  %921 = icmp ult i64 %gas.remaining1189, 18
  store i64 %920, ptr %gas.remaining.addr, align 8
  br i1 %921, label %return, label %OP400.JUMPDEST.contd, !prof !2, !annotation !3

OP400.JUMPDEST.contd:                             ; preds = %OP400.JUMPDEST
  %stack_len1190 = load i64, ptr %len.addr, align 8
  %922 = icmp ult i64 %stack_len1190, 1
  %923 = icmp ugt i64 %stack_len1190, 1021
  %924 = or i1 %922, %923
  %925 = select i1 %922, i8 91, i8 92
  br i1 %924, label %return, label %OP400.JUMPDEST.contd1191, !prof !2

OP400.JUMPDEST.contd1191:                         ; preds = %OP400.JUMPDEST.contd
  br label %OP401.PUSH2, !annotation !5

OP401.PUSH2:                                      ; preds = %OP400.JUMPDEST.contd1191
  %stack_len1192 = load i64, ptr %len.addr, align 8
  %926 = add i64 %stack_len1192, 1
  store i64 %926, ptr %len.addr, align 8
  %sp1193 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1192
  store i256 610, ptr %sp1193, align 16
  br label %OP402.DUP2, !annotation !5

OP402.DUP2:                                       ; preds = %OP401.PUSH2
  %stack_len1194 = load i64, ptr %len.addr, align 8
  %927 = add i64 %stack_len1194, 1
  store i64 %927, ptr %len.addr, align 8
  %928 = sub i64 %stack_len1194, 2
  %sp1195 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %928
  %dup21196 = load i256, ptr %sp1195, align 16
  %sp1197 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1194
  store i256 %dup21196, ptr %sp1197, align 16
  br label %OP403.PUSH2, !annotation !5

OP403.PUSH2:                                      ; preds = %OP402.DUP2
  br label %OP404.JUMP, !annotation !6

OP404.JUMP:                                       ; preds = %OP403.PUSH2
  %stack_len1198 = load i64, ptr %len.addr, align 8
  br label %OP387.JUMPDEST

OP405.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1199 = load i64, ptr %gas.remaining.addr, align 8
  %929 = sub i64 %gas.remaining1199, 19
  %930 = icmp ult i64 %gas.remaining1199, 19
  store i64 %929, ptr %gas.remaining.addr, align 8
  br i1 %930, label %return, label %OP405.JUMPDEST.contd, !prof !2, !annotation !3

OP405.JUMPDEST.contd:                             ; preds = %OP405.JUMPDEST
  %stack_len1200 = load i64, ptr %len.addr, align 8
  %931 = icmp ult i64 %stack_len1200, 4
  %932 = icmp ugt i64 %stack_len1200, 1023
  %933 = or i1 %931, %932
  %934 = select i1 %931, i8 91, i8 92
  br i1 %933, label %return, label %OP405.JUMPDEST.contd1201, !prof !2

OP405.JUMPDEST.contd1201:                         ; preds = %OP405.JUMPDEST.contd
  br label %OP406.DUP3, !annotation !5

OP406.DUP3:                                       ; preds = %OP405.JUMPDEST.contd1201
  %stack_len1202 = load i64, ptr %len.addr, align 8
  %935 = add i64 %stack_len1202, 1
  store i64 %935, ptr %len.addr, align 8
  %936 = sub i64 %stack_len1202, 3
  %sp1203 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %936
  %dup31204 = load i256, ptr %sp1203, align 16
  %sp1205 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1202
  store i256 %dup31204, ptr %sp1205, align 16
  br label %OP407.MSTORE, !annotation !5

OP407.MSTORE:                                     ; preds = %OP406.DUP3
  %stack_len1206 = load i64, ptr %len.addr, align 8
  %937 = add i64 %stack_len1206, -2
  store i64 %937, ptr %len.addr, align 8
  %938 = add i64 %stack_len1206, -1
  %sp1207 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %938
  %a1208 = load i256, ptr %sp1207, align 16
  %939 = add i64 %stack_len1206, -2
  %sp1209 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %939
  %b1210 = load i256, ptr %sp1209, align 16
  %940 = call i8 @__revmc_ir_builtin_mstore(i256 %a1208, i256 %b1210, ptr %arg.ecx.addr)
  %941 = icmp ne i8 %940, 0
  br i1 %941, label %return, label %OP407.MSTORE.contd, !prof !2

OP407.MSTORE.contd:                               ; preds = %OP407.MSTORE
  br label %OP408.POP, !annotation !5

OP408.POP:                                        ; preds = %OP407.MSTORE.contd
  %stack_len1211 = load i64, ptr %len.addr, align 8
  %942 = add i64 %stack_len1211, -1
  store i64 %942, ptr %len.addr, align 8
  br label %OP409.POP, !annotation !5

OP409.POP:                                        ; preds = %OP408.POP
  %stack_len1212 = load i64, ptr %len.addr, align 8
  %943 = add i64 %stack_len1212, -1
  store i64 %943, ptr %len.addr, align 8
  br label %OP410.JUMP, !annotation !5

OP410.JUMP:                                       ; preds = %OP409.POP
  %stack_len1213 = load i64, ptr %len.addr, align 8
  %944 = add i64 %stack_len1213, -1
  store i64 %944, ptr %len.addr, align 8
  %945 = add i64 %stack_len1213, -1
  %sp1214 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %945
  %a1215 = load i256, ptr %sp1214, align 16
  br label %dynamic_jump_table

OP411.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP130.JUMP
  %gas.remaining1216 = load i64, ptr %gas.remaining.addr, align 8
  %946 = sub i64 %gas.remaining1216, 42
  %947 = icmp ult i64 %gas.remaining1216, 42
  store i64 %946, ptr %gas.remaining.addr, align 8
  br i1 %947, label %return, label %OP411.JUMPDEST.contd, !prof !2, !annotation !3

OP411.JUMPDEST.contd:                             ; preds = %OP411.JUMPDEST
  %stack_len1217 = load i64, ptr %len.addr, align 8
  %948 = icmp ult i64 %stack_len1217, 2
  %949 = icmp ugt i64 %stack_len1217, 1019
  %950 = or i1 %948, %949
  %951 = select i1 %948, i8 91, i8 92
  br i1 %950, label %return, label %OP411.JUMPDEST.contd1218, !prof !2

OP411.JUMPDEST.contd1218:                         ; preds = %OP411.JUMPDEST.contd
  br label %OP412.PUSH0, !annotation !5

OP412.PUSH0:                                      ; preds = %OP411.JUMPDEST.contd1218
  %stack_len1219 = load i64, ptr %len.addr, align 8
  %952 = add i64 %stack_len1219, 1
  store i64 %952, ptr %len.addr, align 8
  %sp1220 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1219
  store i256 0, ptr %sp1220, align 16
  br label %OP413.PUSH1, !annotation !5

OP413.PUSH1:                                      ; preds = %OP412.PUSH0
  %stack_len1221 = load i64, ptr %len.addr, align 8
  %953 = add i64 %stack_len1221, 1
  store i64 %953, ptr %len.addr, align 8
  %sp1222 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1221
  store i256 32, ptr %sp1222, align 16
  br label %OP414.DUP3, !annotation !5

OP414.DUP3:                                       ; preds = %OP413.PUSH1
  %stack_len1223 = load i64, ptr %len.addr, align 8
  %954 = add i64 %stack_len1223, 1
  store i64 %954, ptr %len.addr, align 8
  %955 = sub i64 %stack_len1223, 3
  %sp1224 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %955
  %dup31225 = load i256, ptr %sp1224, align 16
  %sp1226 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1223
  store i256 %dup31225, ptr %sp1226, align 16
  br label %OP415.ADD, !annotation !5

OP415.ADD:                                        ; preds = %OP414.DUP3
  %stack_len1227 = load i64, ptr %len.addr, align 8
  %956 = add i64 %stack_len1227, -1
  store i64 %956, ptr %len.addr, align 8
  %957 = add i64 %stack_len1227, -1
  %sp1228 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %957
  %a1229 = load i256, ptr %sp1228, align 16
  %958 = add i64 %stack_len1227, -2
  %sp1230 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %958
  %b1231 = load i256, ptr %sp1230, align 16
  %959 = add i256 %a1229, %b1231
  %960 = add i64 %stack_len1227, -2
  %sp1232 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %960
  store i256 %959, ptr %sp1232, align 16
  br label %OP416.SWAP1, !annotation !5

OP416.SWAP1:                                      ; preds = %OP415.ADD
  %stack_len1233 = load i64, ptr %len.addr, align 8
  %961 = sub i64 %stack_len1233, 1
  %sp1234 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %961
  %swap.a1235 = load i256, ptr %sp1234, align 16
  %962 = sub i64 %stack_len1233, 2
  %sp1236 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %962
  %swap.b1237 = load i256, ptr %sp1236, align 16
  store i256 %swap.a1235, ptr %sp1236, align 16
  store i256 %swap.b1237, ptr %sp1234, align 16
  br label %OP417.POP, !annotation !5

OP417.POP:                                        ; preds = %OP416.SWAP1
  %stack_len1238 = load i64, ptr %len.addr, align 8
  %963 = add i64 %stack_len1238, -1
  store i64 %963, ptr %len.addr, align 8
  br label %OP418.PUSH2, !annotation !5

OP418.PUSH2:                                      ; preds = %OP417.POP
  %stack_len1239 = load i64, ptr %len.addr, align 8
  %964 = add i64 %stack_len1239, 1
  store i64 %964, ptr %len.addr, align 8
  %sp1240 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1239
  store i256 635, ptr %sp1240, align 16
  br label %OP419.PUSH0, !annotation !5

OP419.PUSH0:                                      ; preds = %OP418.PUSH2
  %stack_len1241 = load i64, ptr %len.addr, align 8
  %965 = add i64 %stack_len1241, 1
  store i64 %965, ptr %len.addr, align 8
  %sp1242 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1241
  store i256 0, ptr %sp1242, align 16
  br label %OP420.DUP4, !annotation !5

OP420.DUP4:                                       ; preds = %OP419.PUSH0
  %stack_len1243 = load i64, ptr %len.addr, align 8
  %966 = add i64 %stack_len1243, 1
  store i64 %966, ptr %len.addr, align 8
  %967 = sub i64 %stack_len1243, 4
  %sp1244 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %967
  %dup41245 = load i256, ptr %sp1244, align 16
  %sp1246 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1243
  store i256 %dup41245, ptr %sp1246, align 16
  br label %OP421.ADD, !annotation !5

OP421.ADD:                                        ; preds = %OP420.DUP4
  %stack_len1247 = load i64, ptr %len.addr, align 8
  %968 = add i64 %stack_len1247, -1
  store i64 %968, ptr %len.addr, align 8
  %969 = add i64 %stack_len1247, -1
  %sp1248 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %969
  %a1249 = load i256, ptr %sp1248, align 16
  %970 = add i64 %stack_len1247, -2
  %sp1250 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %970
  %b1251 = load i256, ptr %sp1250, align 16
  %971 = add i256 %a1249, %b1251
  %972 = add i64 %stack_len1247, -2
  %sp1252 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %972
  store i256 %971, ptr %sp1252, align 16
  br label %OP422.DUP5, !annotation !5

OP422.DUP5:                                       ; preds = %OP421.ADD
  %stack_len1253 = load i64, ptr %len.addr, align 8
  %973 = add i64 %stack_len1253, 1
  store i64 %973, ptr %len.addr, align 8
  %974 = sub i64 %stack_len1253, 5
  %sp1254 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %974
  %dup51255 = load i256, ptr %sp1254, align 16
  %sp1256 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1253
  store i256 %dup51255, ptr %sp1256, align 16
  br label %OP423.PUSH2, !annotation !5

OP423.PUSH2:                                      ; preds = %OP422.DUP5
  br label %OP424.JUMP, !annotation !6

OP424.JUMP:                                       ; preds = %OP423.PUSH2
  %stack_len1257 = load i64, ptr %len.addr, align 8
  br label %OP400.JUMPDEST

OP425.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1258 = load i64, ptr %gas.remaining.addr, align 8
  %975 = sub i64 %gas.remaining1258, 19
  %976 = icmp ult i64 %gas.remaining1258, 19
  store i64 %975, ptr %gas.remaining.addr, align 8
  br i1 %976, label %return, label %OP425.JUMPDEST.contd, !prof !2, !annotation !3

OP425.JUMPDEST.contd:                             ; preds = %OP425.JUMPDEST
  %stack_len1259 = load i64, ptr %len.addr, align 8
  %977 = icmp ult i64 %stack_len1259, 4
  br i1 %977, label %return, label %OP425.JUMPDEST.contd1260, !prof !2, !annotation !10

OP425.JUMPDEST.contd1260:                         ; preds = %OP425.JUMPDEST.contd
  br label %OP426.SWAP3, !annotation !5

OP426.SWAP3:                                      ; preds = %OP425.JUMPDEST.contd1260
  %stack_len1261 = load i64, ptr %len.addr, align 8
  %978 = sub i64 %stack_len1261, 1
  %sp1262 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %978
  %swap.a1263 = load i256, ptr %sp1262, align 16
  %979 = sub i64 %stack_len1261, 4
  %sp1264 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %979
  %swap.b1265 = load i256, ptr %sp1264, align 16
  store i256 %swap.a1263, ptr %sp1264, align 16
  store i256 %swap.b1265, ptr %sp1262, align 16
  br label %OP427.SWAP2, !annotation !5

OP427.SWAP2:                                      ; preds = %OP426.SWAP3
  %stack_len1266 = load i64, ptr %len.addr, align 8
  %980 = sub i64 %stack_len1266, 1
  %sp1267 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %980
  %swap.a1268 = load i256, ptr %sp1267, align 16
  %981 = sub i64 %stack_len1266, 3
  %sp1269 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %981
  %swap.b1270 = load i256, ptr %sp1269, align 16
  store i256 %swap.a1268, ptr %sp1269, align 16
  store i256 %swap.b1270, ptr %sp1267, align 16
  br label %OP428.POP, !annotation !5

OP428.POP:                                        ; preds = %OP427.SWAP2
  %stack_len1271 = load i64, ptr %len.addr, align 8
  %982 = add i64 %stack_len1271, -1
  store i64 %982, ptr %len.addr, align 8
  br label %OP429.POP, !annotation !5

OP429.POP:                                        ; preds = %OP428.POP
  %stack_len1272 = load i64, ptr %len.addr, align 8
  %983 = add i64 %stack_len1272, -1
  store i64 %983, ptr %len.addr, align 8
  br label %OP430.JUMP, !annotation !5

OP430.JUMP:                                       ; preds = %OP429.POP
  %stack_len1273 = load i64, ptr %len.addr, align 8
  %984 = add i64 %stack_len1273, -1
  store i64 %984, ptr %len.addr, align 8
  %985 = add i64 %stack_len1273, -1
  %sp1274 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %985
  %a1275 = load i256, ptr %sp1274, align 16
  br label %dynamic_jump_table

OP431.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP498.JUMP, %OP457.JUMP
  %gas.remaining1276 = load i64, ptr %gas.remaining.addr, align 8
  %986 = sub i64 %gas.remaining1276, 23
  %987 = icmp ult i64 %gas.remaining1276, 23
  store i64 %986, ptr %gas.remaining.addr, align 8
  br i1 %987, label %return, label %OP431.JUMPDEST.contd, !prof !2, !annotation !3

OP431.JUMPDEST.contd:                             ; preds = %OP431.JUMPDEST
  %stack_len1277 = load i64, ptr %len.addr, align 8
  %988 = icmp ugt i64 %stack_len1277, 1022
  br i1 %988, label %return, label %OP431.JUMPDEST.contd1278, !prof !2, !annotation !4

OP431.JUMPDEST.contd1278:                         ; preds = %OP431.JUMPDEST.contd
  br label %OP432.PUSH32, !annotation !5

OP432.PUSH32:                                     ; preds = %OP431.JUMPDEST.contd1278
  %stack_len1279 = load i64, ptr %len.addr, align 8
  %989 = add i64 %stack_len1279, 1
  store i64 %989, ptr %len.addr, align 8
  %sp1280 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1279
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr %sp1280, align 16
  br label %OP433.PUSH0, !annotation !5

OP433.PUSH0:                                      ; preds = %OP432.PUSH32
  %stack_len1281 = load i64, ptr %len.addr, align 8
  %990 = add i64 %stack_len1281, 1
  store i64 %990, ptr %len.addr, align 8
  %sp1282 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1281
  store i256 0, ptr %sp1282, align 16
  br label %OP434.MSTORE, !annotation !5

OP434.MSTORE:                                     ; preds = %OP433.PUSH0
  %stack_len1283 = load i64, ptr %len.addr, align 8
  %991 = add i64 %stack_len1283, -2
  store i64 %991, ptr %len.addr, align 8
  %992 = add i64 %stack_len1283, -1
  %sp1284 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %992
  %a1285 = load i256, ptr %sp1284, align 16
  %993 = add i64 %stack_len1283, -2
  %sp1286 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %993
  %b1287 = load i256, ptr %sp1286, align 16
  %994 = call i8 @__revmc_ir_builtin_mstore(i256 %a1285, i256 %b1287, ptr %arg.ecx.addr)
  %995 = icmp ne i8 %994, 0
  br i1 %995, label %return, label %OP434.MSTORE.contd, !prof !2

OP434.MSTORE.contd:                               ; preds = %OP434.MSTORE
  br label %OP435.PUSH1, !annotation !5

OP435.PUSH1:                                      ; preds = %OP434.MSTORE.contd
  %stack_len1288 = load i64, ptr %len.addr, align 8
  %996 = add i64 %stack_len1288, 1
  store i64 %996, ptr %len.addr, align 8
  %sp1289 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1288
  store i256 17, ptr %sp1289, align 16
  br label %OP436.PUSH1, !annotation !5

OP436.PUSH1:                                      ; preds = %OP435.PUSH1
  %stack_len1290 = load i64, ptr %len.addr, align 8
  %997 = add i64 %stack_len1290, 1
  store i64 %997, ptr %len.addr, align 8
  %sp1291 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1290
  store i256 4, ptr %sp1291, align 16
  br label %OP437.MSTORE, !annotation !5

OP437.MSTORE:                                     ; preds = %OP436.PUSH1
  %stack_len1292 = load i64, ptr %len.addr, align 8
  %998 = add i64 %stack_len1292, -2
  store i64 %998, ptr %len.addr, align 8
  %999 = add i64 %stack_len1292, -1
  %sp1293 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %999
  %a1294 = load i256, ptr %sp1293, align 16
  %1000 = add i64 %stack_len1292, -2
  %sp1295 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1000
  %b1296 = load i256, ptr %sp1295, align 16
  %1001 = call i8 @__revmc_ir_builtin_mstore(i256 %a1294, i256 %b1296, ptr %arg.ecx.addr)
  %1002 = icmp ne i8 %1001, 0
  br i1 %1002, label %return, label %OP437.MSTORE.contd, !prof !2

OP437.MSTORE.contd:                               ; preds = %OP437.MSTORE
  br label %OP438.PUSH1, !annotation !5

OP438.PUSH1:                                      ; preds = %OP437.MSTORE.contd
  %stack_len1297 = load i64, ptr %len.addr, align 8
  %1003 = add i64 %stack_len1297, 1
  store i64 %1003, ptr %len.addr, align 8
  %sp1298 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1297
  store i256 36, ptr %sp1298, align 16
  br label %OP439.PUSH0, !annotation !5

OP439.PUSH0:                                      ; preds = %OP438.PUSH1
  %stack_len1299 = load i64, ptr %len.addr, align 8
  %1004 = add i64 %stack_len1299, 1
  store i64 %1004, ptr %len.addr, align 8
  %sp1300 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1299
  store i256 0, ptr %sp1300, align 16
  br label %OP440.REVERT, !annotation !5

OP440.REVERT:                                     ; preds = %OP439.PUSH0
  %stack_len1301 = load i64, ptr %len.addr, align 8
  %1005 = add i64 %stack_len1301, -2
  store i64 %1005, ptr %len.addr, align 8
  %1006 = sub i64 %stack_len1301, 2
  %sp1302 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1006
  %1007 = call i8 @__revmc_builtin_do_return(ptr %arg.ecx.addr, ptr %sp1302, i8 16)
  %1008 = icmp ne i8 %1007, 0
  br i1 %1008, label %return, label %OP440.REVERT.contd, !prof !2

OP440.REVERT.contd:                               ; preds = %OP440.REVERT
  br label %return, !annotation !7

OP441.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP181.JUMP
  %gas.remaining1303 = load i64, ptr %gas.remaining.addr, align 8
  %1009 = sub i64 %gas.remaining1303, 20
  %1010 = icmp ult i64 %gas.remaining1303, 20
  store i64 %1009, ptr %gas.remaining.addr, align 8
  br i1 %1010, label %return, label %OP441.JUMPDEST.contd, !prof !2, !annotation !3

OP441.JUMPDEST.contd:                             ; preds = %OP441.JUMPDEST
  %stack_len1304 = load i64, ptr %len.addr, align 8
  %1011 = icmp ult i64 %stack_len1304, 1
  %1012 = icmp ugt i64 %stack_len1304, 1020
  %1013 = or i1 %1011, %1012
  %1014 = select i1 %1011, i8 91, i8 92
  br i1 %1013, label %return, label %OP441.JUMPDEST.contd1305, !prof !2

OP441.JUMPDEST.contd1305:                         ; preds = %OP441.JUMPDEST.contd
  br label %OP442.PUSH0, !annotation !5

OP442.PUSH0:                                      ; preds = %OP441.JUMPDEST.contd1305
  %stack_len1306 = load i64, ptr %len.addr, align 8
  %1015 = add i64 %stack_len1306, 1
  store i64 %1015, ptr %len.addr, align 8
  %sp1307 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1306
  store i256 0, ptr %sp1307, align 16
  br label %OP443.PUSH2, !annotation !5

OP443.PUSH2:                                      ; preds = %OP442.PUSH0
  %stack_len1308 = load i64, ptr %len.addr, align 8
  %1016 = add i64 %stack_len1308, 1
  store i64 %1016, ptr %len.addr, align 8
  %sp1309 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1308
  store i256 696, ptr %sp1309, align 16
  br label %OP444.DUP3, !annotation !5

OP444.DUP3:                                       ; preds = %OP443.PUSH2
  %stack_len1310 = load i64, ptr %len.addr, align 8
  %1017 = add i64 %stack_len1310, 1
  store i64 %1017, ptr %len.addr, align 8
  %1018 = sub i64 %stack_len1310, 3
  %sp1311 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1018
  %dup31312 = load i256, ptr %sp1311, align 16
  %sp1313 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1310
  store i256 %dup31312, ptr %sp1313, align 16
  br label %OP445.PUSH2, !annotation !5

OP445.PUSH2:                                      ; preds = %OP444.DUP3
  br label %OP446.JUMP, !annotation !6

OP446.JUMP:                                       ; preds = %OP445.PUSH2
  %stack_len1314 = load i64, ptr %len.addr, align 8
  br label %OP217.JUMPDEST

OP447.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1315 = load i64, ptr %gas.remaining.addr, align 8
  %1019 = sub i64 %gas.remaining1315, 28
  %1020 = icmp ult i64 %gas.remaining1315, 28
  store i64 %1019, ptr %gas.remaining.addr, align 8
  br i1 %1020, label %return, label %OP447.JUMPDEST.contd, !prof !2, !annotation !3

OP447.JUMPDEST.contd:                             ; preds = %OP447.JUMPDEST
  %stack_len1316 = load i64, ptr %len.addr, align 8
  %1021 = icmp ult i64 %stack_len1316, 3
  %1022 = icmp ugt i64 %stack_len1316, 1023
  %1023 = or i1 %1021, %1022
  %1024 = select i1 %1021, i8 91, i8 92
  br i1 %1023, label %return, label %OP447.JUMPDEST.contd1317, !prof !2

OP447.JUMPDEST.contd1317:                         ; preds = %OP447.JUMPDEST.contd
  br label %OP448.SWAP2, !annotation !5

OP448.SWAP2:                                      ; preds = %OP447.JUMPDEST.contd1317
  %stack_len1318 = load i64, ptr %len.addr, align 8
  %1025 = sub i64 %stack_len1318, 1
  %sp1319 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1025
  %swap.a1320 = load i256, ptr %sp1319, align 16
  %1026 = sub i64 %stack_len1318, 3
  %sp1321 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1026
  %swap.b1322 = load i256, ptr %sp1321, align 16
  store i256 %swap.a1320, ptr %sp1321, align 16
  store i256 %swap.b1322, ptr %sp1319, align 16
  br label %OP449.POP, !annotation !5

OP449.POP:                                        ; preds = %OP448.SWAP2
  %stack_len1323 = load i64, ptr %len.addr, align 8
  %1027 = add i64 %stack_len1323, -1
  store i64 %1027, ptr %len.addr, align 8
  br label %OP450.PUSH32, !annotation !5

OP450.PUSH32:                                     ; preds = %OP449.POP
  %stack_len1324 = load i64, ptr %len.addr, align 8
  %1028 = add i64 %stack_len1324, 1
  store i64 %1028, ptr %len.addr, align 8
  %sp1325 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1324
  store i256 -1, ptr %sp1325, align 16
  br label %OP451.DUP3, !annotation !5

OP451.DUP3:                                       ; preds = %OP450.PUSH32
  %stack_len1326 = load i64, ptr %len.addr, align 8
  %1029 = add i64 %stack_len1326, 1
  store i64 %1029, ptr %len.addr, align 8
  %1030 = sub i64 %stack_len1326, 3
  %sp1327 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1030
  %dup31328 = load i256, ptr %sp1327, align 16
  %sp1329 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1326
  store i256 %dup31328, ptr %sp1329, align 16
  br label %OP452.SUB, !annotation !5

OP452.SUB:                                        ; preds = %OP451.DUP3
  %stack_len1330 = load i64, ptr %len.addr, align 8
  %1031 = add i64 %stack_len1330, -1
  store i64 %1031, ptr %len.addr, align 8
  %1032 = add i64 %stack_len1330, -1
  %sp1331 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1032
  %a1332 = load i256, ptr %sp1331, align 16
  %1033 = add i64 %stack_len1330, -2
  %sp1333 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1033
  %b1334 = load i256, ptr %sp1333, align 16
  %1034 = sub i256 %a1332, %b1334
  %1035 = add i64 %stack_len1330, -2
  %sp1335 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1035
  store i256 %1034, ptr %sp1335, align 16
  br label %OP453.PUSH2, !annotation !5

OP453.PUSH2:                                      ; preds = %OP452.SUB
  br label %OP454.JUMPI, !annotation !6

OP454.JUMPI:                                      ; preds = %OP453.PUSH2
  %stack_len1336 = load i64, ptr %len.addr, align 8
  %1036 = add i64 %stack_len1336, -1
  store i64 %1036, ptr %len.addr, align 8
  %1037 = add i64 %stack_len1336, -1
  %sp1337 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1037
  %a1338 = load i256, ptr %sp1337, align 16
  %1038 = icmp ne i256 %a1338, 0
  br i1 %1038, label %OP459.JUMPDEST, label %OP455.PUSH2

OP455.PUSH2:                                      ; preds = %OP454.JUMPI
  %gas.remaining1339 = load i64, ptr %gas.remaining.addr, align 8
  %1039 = sub i64 %gas.remaining1339, 14
  %1040 = icmp ult i64 %gas.remaining1339, 14
  store i64 %1039, ptr %gas.remaining.addr, align 8
  br i1 %1040, label %return, label %OP455.PUSH2.contd, !prof !2, !annotation !3

OP455.PUSH2.contd:                                ; preds = %OP455.PUSH2
  %stack_len1340 = load i64, ptr %len.addr, align 8
  %1041 = icmp ugt i64 %stack_len1340, 1022
  br i1 %1041, label %return, label %OP455.PUSH2.contd1341, !prof !2, !annotation !4

OP455.PUSH2.contd1341:                            ; preds = %OP455.PUSH2.contd
  %1042 = add i64 %stack_len1340, 1
  store i64 %1042, ptr %len.addr, align 8
  %sp1342 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1340
  store i256 745, ptr %sp1342, align 16
  br label %OP456.PUSH2, !annotation !5

OP456.PUSH2:                                      ; preds = %OP455.PUSH2.contd1341
  br label %OP457.JUMP, !annotation !6

OP457.JUMP:                                       ; preds = %OP456.PUSH2
  %stack_len1343 = load i64, ptr %len.addr, align 8
  br label %OP431.JUMPDEST

OP458.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1344 = load i64, ptr %gas.remaining.addr, align 8
  %1043 = sub i64 %gas.remaining1344, 1
  %1044 = icmp ult i64 %gas.remaining1344, 1
  store i64 %1043, ptr %gas.remaining.addr, align 8
  br i1 %1044, label %return, label %OP458.JUMPDEST.contd, !prof !2, !annotation !3

OP458.JUMPDEST.contd:                             ; preds = %OP458.JUMPDEST
  %stack_len1345 = load i64, ptr %len.addr, align 8
  br label %OP459.JUMPDEST, !annotation !5

OP459.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP458.JUMPDEST.contd, %OP454.JUMPI
  %gas.remaining1346 = load i64, ptr %gas.remaining.addr, align 8
  %1045 = sub i64 %gas.remaining1346, 31
  %1046 = icmp ult i64 %gas.remaining1346, 31
  store i64 %1045, ptr %gas.remaining.addr, align 8
  br i1 %1046, label %return, label %OP459.JUMPDEST.contd, !prof !2, !annotation !3

OP459.JUMPDEST.contd:                             ; preds = %OP459.JUMPDEST
  %stack_len1347 = load i64, ptr %len.addr, align 8
  %1047 = icmp ult i64 %stack_len1347, 3
  %1048 = icmp ugt i64 %stack_len1347, 1022
  %1049 = or i1 %1047, %1048
  %1050 = select i1 %1047, i8 91, i8 92
  br i1 %1049, label %return, label %OP459.JUMPDEST.contd1348, !prof !2

OP459.JUMPDEST.contd1348:                         ; preds = %OP459.JUMPDEST.contd
  br label %OP460.PUSH1, !annotation !5

OP460.PUSH1:                                      ; preds = %OP459.JUMPDEST.contd1348
  %stack_len1349 = load i64, ptr %len.addr, align 8
  %1051 = add i64 %stack_len1349, 1
  store i64 %1051, ptr %len.addr, align 8
  %sp1350 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1349
  store i256 1, ptr %sp1350, align 16
  br label %OP461.DUP3, !annotation !5

OP461.DUP3:                                       ; preds = %OP460.PUSH1
  %stack_len1351 = load i64, ptr %len.addr, align 8
  %1052 = add i64 %stack_len1351, 1
  store i64 %1052, ptr %len.addr, align 8
  %1053 = sub i64 %stack_len1351, 3
  %sp1352 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1053
  %dup31353 = load i256, ptr %sp1352, align 16
  %sp1354 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1351
  store i256 %dup31353, ptr %sp1354, align 16
  br label %OP462.ADD, !annotation !5

OP462.ADD:                                        ; preds = %OP461.DUP3
  %stack_len1355 = load i64, ptr %len.addr, align 8
  %1054 = add i64 %stack_len1355, -1
  store i64 %1054, ptr %len.addr, align 8
  %1055 = add i64 %stack_len1355, -1
  %sp1356 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1055
  %a1357 = load i256, ptr %sp1356, align 16
  %1056 = add i64 %stack_len1355, -2
  %sp1358 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1056
  %b1359 = load i256, ptr %sp1358, align 16
  %1057 = add i256 %a1357, %b1359
  %1058 = add i64 %stack_len1355, -2
  %sp1360 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1058
  store i256 %1057, ptr %sp1360, align 16
  br label %OP463.SWAP1, !annotation !5

OP463.SWAP1:                                      ; preds = %OP462.ADD
  %stack_len1361 = load i64, ptr %len.addr, align 8
  %1059 = sub i64 %stack_len1361, 1
  %sp1362 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1059
  %swap.a1363 = load i256, ptr %sp1362, align 16
  %1060 = sub i64 %stack_len1361, 2
  %sp1364 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1060
  %swap.b1365 = load i256, ptr %sp1364, align 16
  store i256 %swap.a1363, ptr %sp1364, align 16
  store i256 %swap.b1365, ptr %sp1362, align 16
  br label %OP464.POP, !annotation !5

OP464.POP:                                        ; preds = %OP463.SWAP1
  %stack_len1366 = load i64, ptr %len.addr, align 8
  %1061 = add i64 %stack_len1366, -1
  store i64 %1061, ptr %len.addr, align 8
  br label %OP465.SWAP2, !annotation !5

OP465.SWAP2:                                      ; preds = %OP464.POP
  %stack_len1367 = load i64, ptr %len.addr, align 8
  %1062 = sub i64 %stack_len1367, 1
  %sp1368 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1062
  %swap.a1369 = load i256, ptr %sp1368, align 16
  %1063 = sub i64 %stack_len1367, 3
  %sp1370 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1063
  %swap.b1371 = load i256, ptr %sp1370, align 16
  store i256 %swap.a1369, ptr %sp1370, align 16
  store i256 %swap.b1371, ptr %sp1368, align 16
  br label %OP466.SWAP1, !annotation !5

OP466.SWAP1:                                      ; preds = %OP465.SWAP2
  %stack_len1372 = load i64, ptr %len.addr, align 8
  %1064 = sub i64 %stack_len1372, 1
  %sp1373 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1064
  %swap.a1374 = load i256, ptr %sp1373, align 16
  %1065 = sub i64 %stack_len1372, 2
  %sp1375 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1065
  %swap.b1376 = load i256, ptr %sp1375, align 16
  store i256 %swap.a1374, ptr %sp1375, align 16
  store i256 %swap.b1376, ptr %sp1373, align 16
  br label %OP467.POP, !annotation !5

OP467.POP:                                        ; preds = %OP466.SWAP1
  %stack_len1377 = load i64, ptr %len.addr, align 8
  %1066 = add i64 %stack_len1377, -1
  store i64 %1066, ptr %len.addr, align 8
  br label %OP468.JUMP, !annotation !5

OP468.JUMP:                                       ; preds = %OP467.POP
  %stack_len1378 = load i64, ptr %len.addr, align 8
  %1067 = add i64 %stack_len1378, -1
  store i64 %1067, ptr %len.addr, align 8
  %1068 = add i64 %stack_len1378, -1
  %sp1379 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1068
  %a1380 = load i256, ptr %sp1379, align 16
  br label %dynamic_jump_table

OP469.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP196.JUMP
  %gas.remaining1381 = load i64, ptr %gas.remaining.addr, align 8
  %1069 = sub i64 %gas.remaining1381, 20
  %1070 = icmp ult i64 %gas.remaining1381, 20
  store i64 %1069, ptr %gas.remaining.addr, align 8
  br i1 %1070, label %return, label %OP469.JUMPDEST.contd, !prof !2, !annotation !3

OP469.JUMPDEST.contd:                             ; preds = %OP469.JUMPDEST
  %stack_len1382 = load i64, ptr %len.addr, align 8
  %1071 = icmp ult i64 %stack_len1382, 1
  %1072 = icmp ugt i64 %stack_len1382, 1020
  %1073 = or i1 %1071, %1072
  %1074 = select i1 %1071, i8 91, i8 92
  br i1 %1073, label %return, label %OP469.JUMPDEST.contd1383, !prof !2

OP469.JUMPDEST.contd1383:                         ; preds = %OP469.JUMPDEST.contd
  br label %OP470.PUSH0, !annotation !5

OP470.PUSH0:                                      ; preds = %OP469.JUMPDEST.contd1383
  %stack_len1384 = load i64, ptr %len.addr, align 8
  %1075 = add i64 %stack_len1384, 1
  store i64 %1075, ptr %len.addr, align 8
  %sp1385 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1384
  store i256 0, ptr %sp1385, align 16
  br label %OP471.PUSH2, !annotation !5

OP471.PUSH2:                                      ; preds = %OP470.PUSH0
  %stack_len1386 = load i64, ptr %len.addr, align 8
  %1076 = add i64 %stack_len1386, 1
  store i64 %1076, ptr %len.addr, align 8
  %sp1387 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1386
  store i256 767, ptr %sp1387, align 16
  br label %OP472.DUP3, !annotation !5

OP472.DUP3:                                       ; preds = %OP471.PUSH2
  %stack_len1388 = load i64, ptr %len.addr, align 8
  %1077 = add i64 %stack_len1388, 1
  store i64 %1077, ptr %len.addr, align 8
  %1078 = sub i64 %stack_len1388, 3
  %sp1389 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1078
  %dup31390 = load i256, ptr %sp1389, align 16
  %sp1391 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1388
  store i256 %dup31390, ptr %sp1391, align 16
  br label %OP473.PUSH2, !annotation !5

OP473.PUSH2:                                      ; preds = %OP472.DUP3
  br label %OP474.JUMP, !annotation !6

OP474.JUMP:                                       ; preds = %OP473.PUSH2
  %stack_len1392 = load i64, ptr %len.addr, align 8
  br label %OP217.JUMPDEST

OP475.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1393 = load i64, ptr %gas.remaining.addr, align 8
  %1079 = sub i64 %gas.remaining1393, 23
  %1080 = icmp ult i64 %gas.remaining1393, 23
  store i64 %1079, ptr %gas.remaining.addr, align 8
  br i1 %1080, label %return, label %OP475.JUMPDEST.contd, !prof !2, !annotation !3

OP475.JUMPDEST.contd:                             ; preds = %OP475.JUMPDEST
  %stack_len1394 = load i64, ptr %len.addr, align 8
  %1081 = icmp ult i64 %stack_len1394, 4
  %1082 = icmp ugt i64 %stack_len1394, 1022
  %1083 = or i1 %1081, %1082
  %1084 = select i1 %1081, i8 91, i8 92
  br i1 %1083, label %return, label %OP475.JUMPDEST.contd1395, !prof !2

OP475.JUMPDEST.contd1395:                         ; preds = %OP475.JUMPDEST.contd
  br label %OP476.SWAP2, !annotation !5

OP476.SWAP2:                                      ; preds = %OP475.JUMPDEST.contd1395
  %stack_len1396 = load i64, ptr %len.addr, align 8
  %1085 = sub i64 %stack_len1396, 1
  %sp1397 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1085
  %swap.a1398 = load i256, ptr %sp1397, align 16
  %1086 = sub i64 %stack_len1396, 3
  %sp1399 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1086
  %swap.b1400 = load i256, ptr %sp1399, align 16
  store i256 %swap.a1398, ptr %sp1399, align 16
  store i256 %swap.b1400, ptr %sp1397, align 16
  br label %OP477.POP, !annotation !5

OP477.POP:                                        ; preds = %OP476.SWAP2
  %stack_len1401 = load i64, ptr %len.addr, align 8
  %1087 = add i64 %stack_len1401, -1
  store i64 %1087, ptr %len.addr, align 8
  br label %OP478.PUSH2, !annotation !5

OP478.PUSH2:                                      ; preds = %OP477.POP
  %stack_len1402 = load i64, ptr %len.addr, align 8
  %1088 = add i64 %stack_len1402, 1
  store i64 %1088, ptr %len.addr, align 8
  %sp1403 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1402
  store i256 778, ptr %sp1403, align 16
  br label %OP479.DUP4, !annotation !5

OP479.DUP4:                                       ; preds = %OP478.PUSH2
  %stack_len1404 = load i64, ptr %len.addr, align 8
  %1089 = add i64 %stack_len1404, 1
  store i64 %1089, ptr %len.addr, align 8
  %1090 = sub i64 %stack_len1404, 4
  %sp1405 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1090
  %dup41406 = load i256, ptr %sp1405, align 16
  %sp1407 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1404
  store i256 %dup41406, ptr %sp1407, align 16
  br label %OP480.PUSH2, !annotation !5

OP480.PUSH2:                                      ; preds = %OP479.DUP4
  br label %OP481.JUMP, !annotation !6

OP481.JUMP:                                       ; preds = %OP480.PUSH2
  %stack_len1408 = load i64, ptr %len.addr, align 8
  br label %OP217.JUMPDEST

OP482.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1409 = load i64, ptr %gas.remaining.addr, align 8
  %1091 = sub i64 %gas.remaining1409, 45
  %1092 = icmp ult i64 %gas.remaining1409, 45
  store i64 %1091, ptr %gas.remaining.addr, align 8
  br i1 %1092, label %return, label %OP482.JUMPDEST.contd, !prof !2, !annotation !3

OP482.JUMPDEST.contd:                             ; preds = %OP482.JUMPDEST
  %stack_len1410 = load i64, ptr %len.addr, align 8
  %1093 = icmp ult i64 %stack_len1410, 4
  %1094 = icmp ugt i64 %stack_len1410, 1023
  %1095 = or i1 %1093, %1094
  %1096 = select i1 %1093, i8 91, i8 92
  br i1 %1095, label %return, label %OP482.JUMPDEST.contd1411, !prof !2

OP482.JUMPDEST.contd1411:                         ; preds = %OP482.JUMPDEST.contd
  br label %OP483.SWAP3, !annotation !5

OP483.SWAP3:                                      ; preds = %OP482.JUMPDEST.contd1411
  %stack_len1412 = load i64, ptr %len.addr, align 8
  %1097 = sub i64 %stack_len1412, 1
  %sp1413 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1097
  %swap.a1414 = load i256, ptr %sp1413, align 16
  %1098 = sub i64 %stack_len1412, 4
  %sp1415 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1098
  %swap.b1416 = load i256, ptr %sp1415, align 16
  store i256 %swap.a1414, ptr %sp1415, align 16
  store i256 %swap.b1416, ptr %sp1413, align 16
  br label %OP484.POP, !annotation !5

OP484.POP:                                        ; preds = %OP483.SWAP3
  %stack_len1417 = load i64, ptr %len.addr, align 8
  %1099 = add i64 %stack_len1417, -1
  store i64 %1099, ptr %len.addr, align 8
  br label %OP485.DUP3, !annotation !5

OP485.DUP3:                                       ; preds = %OP484.POP
  %stack_len1418 = load i64, ptr %len.addr, align 8
  %1100 = add i64 %stack_len1418, 1
  store i64 %1100, ptr %len.addr, align 8
  %1101 = sub i64 %stack_len1418, 3
  %sp1419 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1101
  %dup31420 = load i256, ptr %sp1419, align 16
  %sp1421 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1418
  store i256 %dup31420, ptr %sp1421, align 16
  br label %OP486.DUP3, !annotation !5

OP486.DUP3:                                       ; preds = %OP485.DUP3
  %stack_len1422 = load i64, ptr %len.addr, align 8
  %1102 = add i64 %stack_len1422, 1
  store i64 %1102, ptr %len.addr, align 8
  %1103 = sub i64 %stack_len1422, 3
  %sp1423 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1103
  %dup31424 = load i256, ptr %sp1423, align 16
  %sp1425 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1422
  store i256 %dup31424, ptr %sp1425, align 16
  br label %OP487.SUB, !annotation !5

OP487.SUB:                                        ; preds = %OP486.DUP3
  %stack_len1426 = load i64, ptr %len.addr, align 8
  %1104 = add i64 %stack_len1426, -1
  store i64 %1104, ptr %len.addr, align 8
  %1105 = add i64 %stack_len1426, -1
  %sp1427 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1105
  %a1428 = load i256, ptr %sp1427, align 16
  %1106 = add i64 %stack_len1426, -2
  %sp1429 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1106
  %b1430 = load i256, ptr %sp1429, align 16
  %1107 = sub i256 %a1428, %b1430
  %1108 = add i64 %stack_len1426, -2
  %sp1431 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1108
  store i256 %1107, ptr %sp1431, align 16
  br label %OP488.SWAP1, !annotation !5

OP488.SWAP1:                                      ; preds = %OP487.SUB
  %stack_len1432 = load i64, ptr %len.addr, align 8
  %1109 = sub i64 %stack_len1432, 1
  %sp1433 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1109
  %swap.a1434 = load i256, ptr %sp1433, align 16
  %1110 = sub i64 %stack_len1432, 2
  %sp1435 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1110
  %swap.b1436 = load i256, ptr %sp1435, align 16
  store i256 %swap.a1434, ptr %sp1435, align 16
  store i256 %swap.b1436, ptr %sp1433, align 16
  br label %OP489.POP, !annotation !5

OP489.POP:                                        ; preds = %OP488.SWAP1
  %stack_len1437 = load i64, ptr %len.addr, align 8
  %1111 = add i64 %stack_len1437, -1
  store i64 %1111, ptr %len.addr, align 8
  br label %OP490.DUP2, !annotation !5

OP490.DUP2:                                       ; preds = %OP489.POP
  %stack_len1438 = load i64, ptr %len.addr, align 8
  %1112 = add i64 %stack_len1438, 1
  store i64 %1112, ptr %len.addr, align 8
  %1113 = sub i64 %stack_len1438, 2
  %sp1439 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1113
  %dup21440 = load i256, ptr %sp1439, align 16
  %sp1441 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1438
  store i256 %dup21440, ptr %sp1441, align 16
  br label %OP491.DUP2, !annotation !5

OP491.DUP2:                                       ; preds = %OP490.DUP2
  %stack_len1442 = load i64, ptr %len.addr, align 8
  %1114 = add i64 %stack_len1442, 1
  store i64 %1114, ptr %len.addr, align 8
  %1115 = sub i64 %stack_len1442, 2
  %sp1443 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1115
  %dup21444 = load i256, ptr %sp1443, align 16
  %sp1445 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1442
  store i256 %dup21444, ptr %sp1445, align 16
  br label %OP492.GT, !annotation !5

OP492.GT:                                         ; preds = %OP491.DUP2
  %stack_len1446 = load i64, ptr %len.addr, align 8
  %1116 = add i64 %stack_len1446, -1
  store i64 %1116, ptr %len.addr, align 8
  %1117 = add i64 %stack_len1446, -1
  %sp1447 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1117
  %a1448 = load i256, ptr %sp1447, align 16
  %1118 = add i64 %stack_len1446, -2
  %sp1449 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1118
  %b1450 = load i256, ptr %sp1449, align 16
  %1119 = icmp ugt i256 %a1448, %b1450
  %1120 = zext i1 %1119 to i256
  %1121 = add i64 %stack_len1446, -2
  %sp1451 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1121
  store i256 %1120, ptr %sp1451, align 16
  br label %OP493.ISZERO, !annotation !5

OP493.ISZERO:                                     ; preds = %OP492.GT
  %stack_len1452 = load i64, ptr %len.addr, align 8
  %1122 = add i64 %stack_len1452, -1
  %sp1453 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1122
  %a1454 = load i256, ptr %sp1453, align 16
  %1123 = icmp eq i256 %a1454, 0
  %1124 = zext i1 %1123 to i256
  %1125 = add i64 %stack_len1452, -1
  %sp1455 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1125
  store i256 %1124, ptr %sp1455, align 16
  br label %OP494.PUSH2, !annotation !5

OP494.PUSH2:                                      ; preds = %OP493.ISZERO
  br label %OP495.JUMPI, !annotation !6

OP495.JUMPI:                                      ; preds = %OP494.PUSH2
  %stack_len1456 = load i64, ptr %len.addr, align 8
  %1126 = add i64 %stack_len1456, -1
  store i64 %1126, ptr %len.addr, align 8
  %1127 = add i64 %stack_len1456, -1
  %sp1457 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1127
  %a1458 = load i256, ptr %sp1457, align 16
  %1128 = icmp ne i256 %a1458, 0
  br i1 %1128, label %OP500.JUMPDEST, label %OP496.PUSH2

OP496.PUSH2:                                      ; preds = %OP495.JUMPI
  %gas.remaining1459 = load i64, ptr %gas.remaining.addr, align 8
  %1129 = sub i64 %gas.remaining1459, 14
  %1130 = icmp ult i64 %gas.remaining1459, 14
  store i64 %1129, ptr %gas.remaining.addr, align 8
  br i1 %1130, label %return, label %OP496.PUSH2.contd, !prof !2, !annotation !3

OP496.PUSH2.contd:                                ; preds = %OP496.PUSH2
  %stack_len1460 = load i64, ptr %len.addr, align 8
  %1131 = icmp ugt i64 %stack_len1460, 1022
  br i1 %1131, label %return, label %OP496.PUSH2.contd1461, !prof !2, !annotation !4

OP496.PUSH2.contd1461:                            ; preds = %OP496.PUSH2.contd
  %1132 = add i64 %stack_len1460, 1
  store i64 %1132, ptr %len.addr, align 8
  %sp1462 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1460
  store i256 801, ptr %sp1462, align 16
  br label %OP497.PUSH2, !annotation !5

OP497.PUSH2:                                      ; preds = %OP496.PUSH2.contd1461
  br label %OP498.JUMP, !annotation !6

OP498.JUMP:                                       ; preds = %OP497.PUSH2
  %stack_len1463 = load i64, ptr %len.addr, align 8
  br label %OP431.JUMPDEST

OP499.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1464 = load i64, ptr %gas.remaining.addr, align 8
  %1133 = sub i64 %gas.remaining1464, 1
  %1134 = icmp ult i64 %gas.remaining1464, 1
  store i64 %1133, ptr %gas.remaining.addr, align 8
  br i1 %1134, label %return, label %OP499.JUMPDEST.contd, !prof !2, !annotation !3

OP499.JUMPDEST.contd:                             ; preds = %OP499.JUMPDEST
  %stack_len1465 = load i64, ptr %len.addr, align 8
  br label %OP500.JUMPDEST, !annotation !5

OP500.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP499.JUMPDEST.contd, %OP495.JUMPI
  %gas.remaining1466 = load i64, ptr %gas.remaining.addr, align 8
  %1135 = sub i64 %gas.remaining1466, 19
  %1136 = icmp ult i64 %gas.remaining1466, 19
  store i64 %1135, ptr %gas.remaining.addr, align 8
  br i1 %1136, label %return, label %OP500.JUMPDEST.contd, !prof !2, !annotation !3

OP500.JUMPDEST.contd:                             ; preds = %OP500.JUMPDEST
  %stack_len1467 = load i64, ptr %len.addr, align 8
  %1137 = icmp ult i64 %stack_len1467, 4
  br i1 %1137, label %return, label %OP500.JUMPDEST.contd1468, !prof !2, !annotation !10

OP500.JUMPDEST.contd1468:                         ; preds = %OP500.JUMPDEST.contd
  br label %OP501.SWAP3, !annotation !5

OP501.SWAP3:                                      ; preds = %OP500.JUMPDEST.contd1468
  %stack_len1469 = load i64, ptr %len.addr, align 8
  %1138 = sub i64 %stack_len1469, 1
  %sp1470 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1138
  %swap.a1471 = load i256, ptr %sp1470, align 16
  %1139 = sub i64 %stack_len1469, 4
  %sp1472 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1139
  %swap.b1473 = load i256, ptr %sp1472, align 16
  store i256 %swap.a1471, ptr %sp1472, align 16
  store i256 %swap.b1473, ptr %sp1470, align 16
  br label %OP502.SWAP2, !annotation !5

OP502.SWAP2:                                      ; preds = %OP501.SWAP3
  %stack_len1474 = load i64, ptr %len.addr, align 8
  %1140 = sub i64 %stack_len1474, 1
  %sp1475 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1140
  %swap.a1476 = load i256, ptr %sp1475, align 16
  %1141 = sub i64 %stack_len1474, 3
  %sp1477 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1141
  %swap.b1478 = load i256, ptr %sp1477, align 16
  store i256 %swap.a1476, ptr %sp1477, align 16
  store i256 %swap.b1478, ptr %sp1475, align 16
  br label %OP503.POP, !annotation !5

OP503.POP:                                        ; preds = %OP502.SWAP2
  %stack_len1479 = load i64, ptr %len.addr, align 8
  %1142 = add i64 %stack_len1479, -1
  store i64 %1142, ptr %len.addr, align 8
  br label %OP504.POP, !annotation !5

OP504.POP:                                        ; preds = %OP503.POP
  %stack_len1480 = load i64, ptr %len.addr, align 8
  %1143 = add i64 %stack_len1480, -1
  store i64 %1143, ptr %len.addr, align 8
  br label %OP505.JUMP, !annotation !5

OP505.JUMP:                                       ; preds = %OP504.POP
  %stack_len1481 = load i64, ptr %len.addr, align 8
  %1144 = add i64 %stack_len1481, -1
  store i64 %1144, ptr %len.addr, align 8
  %1145 = add i64 %stack_len1481, -1
  %sp1482 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1145
  %a1483 = load i256, ptr %sp1482, align 16
  br label %dynamic_jump_table

OP506.JUMPDEST:                                   ; preds = %dynamic_jump_table, %OP207.JUMP
  %gas.remaining1484 = load i64, ptr %gas.remaining.addr, align 8
  %1146 = sub i64 %gas.remaining1484, 42
  %1147 = icmp ult i64 %gas.remaining1484, 42
  store i64 %1146, ptr %gas.remaining.addr, align 8
  br i1 %1147, label %return, label %OP506.JUMPDEST.contd, !prof !2, !annotation !3

OP506.JUMPDEST.contd:                             ; preds = %OP506.JUMPDEST
  %stack_len1485 = load i64, ptr %len.addr, align 8
  %1148 = icmp ult i64 %stack_len1485, 3
  %1149 = icmp ugt i64 %stack_len1485, 1019
  %1150 = or i1 %1148, %1149
  %1151 = select i1 %1148, i8 91, i8 92
  br i1 %1150, label %return, label %OP506.JUMPDEST.contd1486, !prof !2

OP506.JUMPDEST.contd1486:                         ; preds = %OP506.JUMPDEST.contd
  br label %OP507.PUSH0, !annotation !5

OP507.PUSH0:                                      ; preds = %OP506.JUMPDEST.contd1486
  %stack_len1487 = load i64, ptr %len.addr, align 8
  %1152 = add i64 %stack_len1487, 1
  store i64 %1152, ptr %len.addr, align 8
  %sp1488 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1487
  store i256 0, ptr %sp1488, align 16
  br label %OP508.PUSH1, !annotation !5

OP508.PUSH1:                                      ; preds = %OP507.PUSH0
  %stack_len1489 = load i64, ptr %len.addr, align 8
  %1153 = add i64 %stack_len1489, 1
  store i64 %1153, ptr %len.addr, align 8
  %sp1490 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1489
  store i256 64, ptr %sp1490, align 16
  br label %OP509.DUP3, !annotation !5

OP509.DUP3:                                       ; preds = %OP508.PUSH1
  %stack_len1491 = load i64, ptr %len.addr, align 8
  %1154 = add i64 %stack_len1491, 1
  store i64 %1154, ptr %len.addr, align 8
  %1155 = sub i64 %stack_len1491, 3
  %sp1492 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1155
  %dup31493 = load i256, ptr %sp1492, align 16
  %sp1494 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1491
  store i256 %dup31493, ptr %sp1494, align 16
  br label %OP510.ADD, !annotation !5

OP510.ADD:                                        ; preds = %OP509.DUP3
  %stack_len1495 = load i64, ptr %len.addr, align 8
  %1156 = add i64 %stack_len1495, -1
  store i64 %1156, ptr %len.addr, align 8
  %1157 = add i64 %stack_len1495, -1
  %sp1496 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1157
  %a1497 = load i256, ptr %sp1496, align 16
  %1158 = add i64 %stack_len1495, -2
  %sp1498 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1158
  %b1499 = load i256, ptr %sp1498, align 16
  %1159 = add i256 %a1497, %b1499
  %1160 = add i64 %stack_len1495, -2
  %sp1500 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1160
  store i256 %1159, ptr %sp1500, align 16
  br label %OP511.SWAP1, !annotation !5

OP511.SWAP1:                                      ; preds = %OP510.ADD
  %stack_len1501 = load i64, ptr %len.addr, align 8
  %1161 = sub i64 %stack_len1501, 1
  %sp1502 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1161
  %swap.a1503 = load i256, ptr %sp1502, align 16
  %1162 = sub i64 %stack_len1501, 2
  %sp1504 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1162
  %swap.b1505 = load i256, ptr %sp1504, align 16
  store i256 %swap.a1503, ptr %sp1504, align 16
  store i256 %swap.b1505, ptr %sp1502, align 16
  br label %OP512.POP, !annotation !5

OP512.POP:                                        ; preds = %OP511.SWAP1
  %stack_len1506 = load i64, ptr %len.addr, align 8
  %1163 = add i64 %stack_len1506, -1
  store i64 %1163, ptr %len.addr, align 8
  br label %OP513.PUSH2, !annotation !5

OP513.PUSH2:                                      ; preds = %OP512.POP
  %stack_len1507 = load i64, ptr %len.addr, align 8
  %1164 = add i64 %stack_len1507, 1
  store i64 %1164, ptr %len.addr, align 8
  %sp1508 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1507
  store i256 827, ptr %sp1508, align 16
  br label %OP514.PUSH0, !annotation !5

OP514.PUSH0:                                      ; preds = %OP513.PUSH2
  %stack_len1509 = load i64, ptr %len.addr, align 8
  %1165 = add i64 %stack_len1509, 1
  store i64 %1165, ptr %len.addr, align 8
  %sp1510 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1509
  store i256 0, ptr %sp1510, align 16
  br label %OP515.DUP4, !annotation !5

OP515.DUP4:                                       ; preds = %OP514.PUSH0
  %stack_len1511 = load i64, ptr %len.addr, align 8
  %1166 = add i64 %stack_len1511, 1
  store i64 %1166, ptr %len.addr, align 8
  %1167 = sub i64 %stack_len1511, 4
  %sp1512 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1167
  %dup41513 = load i256, ptr %sp1512, align 16
  %sp1514 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1511
  store i256 %dup41513, ptr %sp1514, align 16
  br label %OP516.ADD, !annotation !5

OP516.ADD:                                        ; preds = %OP515.DUP4
  %stack_len1515 = load i64, ptr %len.addr, align 8
  %1168 = add i64 %stack_len1515, -1
  store i64 %1168, ptr %len.addr, align 8
  %1169 = add i64 %stack_len1515, -1
  %sp1516 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1169
  %a1517 = load i256, ptr %sp1516, align 16
  %1170 = add i64 %stack_len1515, -2
  %sp1518 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1170
  %b1519 = load i256, ptr %sp1518, align 16
  %1171 = add i256 %a1517, %b1519
  %1172 = add i64 %stack_len1515, -2
  %sp1520 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1172
  store i256 %1171, ptr %sp1520, align 16
  br label %OP517.DUP6, !annotation !5

OP517.DUP6:                                       ; preds = %OP516.ADD
  %stack_len1521 = load i64, ptr %len.addr, align 8
  %1173 = add i64 %stack_len1521, 1
  store i64 %1173, ptr %len.addr, align 8
  %1174 = sub i64 %stack_len1521, 6
  %sp1522 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1174
  %dup61523 = load i256, ptr %sp1522, align 16
  %sp1524 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1521
  store i256 %dup61523, ptr %sp1524, align 16
  br label %OP518.PUSH2, !annotation !5

OP518.PUSH2:                                      ; preds = %OP517.DUP6
  br label %OP519.JUMP, !annotation !6

OP519.JUMP:                                       ; preds = %OP518.PUSH2
  %stack_len1525 = load i64, ptr %len.addr, align 8
  br label %OP226.JUMPDEST

OP520.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1526 = load i64, ptr %gas.remaining.addr, align 8
  %1175 = sub i64 %gas.remaining1526, 27
  %1176 = icmp ult i64 %gas.remaining1526, 27
  store i64 %1175, ptr %gas.remaining.addr, align 8
  br i1 %1176, label %return, label %OP520.JUMPDEST.contd, !prof !2, !annotation !3

OP520.JUMPDEST.contd:                             ; preds = %OP520.JUMPDEST
  %stack_len1527 = load i64, ptr %len.addr, align 8
  %1177 = icmp ult i64 %stack_len1527, 3
  %1178 = icmp ugt i64 %stack_len1527, 1020
  %1179 = or i1 %1177, %1178
  %1180 = select i1 %1177, i8 91, i8 92
  br i1 %1179, label %return, label %OP520.JUMPDEST.contd1528, !prof !2

OP520.JUMPDEST.contd1528:                         ; preds = %OP520.JUMPDEST.contd
  br label %OP521.PUSH2, !annotation !5

OP521.PUSH2:                                      ; preds = %OP520.JUMPDEST.contd1528
  %stack_len1529 = load i64, ptr %len.addr, align 8
  %1181 = add i64 %stack_len1529, 1
  store i64 %1181, ptr %len.addr, align 8
  %sp1530 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1529
  store i256 840, ptr %sp1530, align 16
  br label %OP522.PUSH1, !annotation !5

OP522.PUSH1:                                      ; preds = %OP521.PUSH2
  %stack_len1531 = load i64, ptr %len.addr, align 8
  %1182 = add i64 %stack_len1531, 1
  store i64 %1182, ptr %len.addr, align 8
  %sp1532 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1531
  store i256 32, ptr %sp1532, align 16
  br label %OP523.DUP4, !annotation !5

OP523.DUP4:                                       ; preds = %OP522.PUSH1
  %stack_len1533 = load i64, ptr %len.addr, align 8
  %1183 = add i64 %stack_len1533, 1
  store i64 %1183, ptr %len.addr, align 8
  %1184 = sub i64 %stack_len1533, 4
  %sp1534 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1184
  %dup41535 = load i256, ptr %sp1534, align 16
  %sp1536 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1533
  store i256 %dup41535, ptr %sp1536, align 16
  br label %OP524.ADD, !annotation !5

OP524.ADD:                                        ; preds = %OP523.DUP4
  %stack_len1537 = load i64, ptr %len.addr, align 8
  %1185 = add i64 %stack_len1537, -1
  store i64 %1185, ptr %len.addr, align 8
  %1186 = add i64 %stack_len1537, -1
  %sp1538 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1186
  %a1539 = load i256, ptr %sp1538, align 16
  %1187 = add i64 %stack_len1537, -2
  %sp1540 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1187
  %b1541 = load i256, ptr %sp1540, align 16
  %1188 = add i256 %a1539, %b1541
  %1189 = add i64 %stack_len1537, -2
  %sp1542 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1189
  store i256 %1188, ptr %sp1542, align 16
  br label %OP525.DUP5, !annotation !5

OP525.DUP5:                                       ; preds = %OP524.ADD
  %stack_len1543 = load i64, ptr %len.addr, align 8
  %1190 = add i64 %stack_len1543, 1
  store i64 %1190, ptr %len.addr, align 8
  %1191 = sub i64 %stack_len1543, 5
  %sp1544 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1191
  %dup51545 = load i256, ptr %sp1544, align 16
  %sp1546 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %stack_len1543
  store i256 %dup51545, ptr %sp1546, align 16
  br label %OP526.PUSH2, !annotation !5

OP526.PUSH2:                                      ; preds = %OP525.DUP5
  br label %OP527.JUMP, !annotation !6

OP527.JUMP:                                       ; preds = %OP526.PUSH2
  %stack_len1547 = load i64, ptr %len.addr, align 8
  br label %OP226.JUMPDEST

OP528.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1548 = load i64, ptr %gas.remaining.addr, align 8
  %1192 = sub i64 %gas.remaining1548, 21
  %1193 = icmp ult i64 %gas.remaining1548, 21
  store i64 %1192, ptr %gas.remaining.addr, align 8
  br i1 %1193, label %return, label %OP528.JUMPDEST.contd, !prof !2, !annotation !3

OP528.JUMPDEST.contd:                             ; preds = %OP528.JUMPDEST
  %stack_len1549 = load i64, ptr %len.addr, align 8
  %1194 = icmp ult i64 %stack_len1549, 5
  br i1 %1194, label %return, label %OP528.JUMPDEST.contd1550, !prof !2, !annotation !10

OP528.JUMPDEST.contd1550:                         ; preds = %OP528.JUMPDEST.contd
  br label %OP529.SWAP4, !annotation !5

OP529.SWAP4:                                      ; preds = %OP528.JUMPDEST.contd1550
  %stack_len1551 = load i64, ptr %len.addr, align 8
  %1195 = sub i64 %stack_len1551, 1
  %sp1552 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1195
  %swap.a1553 = load i256, ptr %sp1552, align 16
  %1196 = sub i64 %stack_len1551, 5
  %sp1554 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1196
  %swap.b1555 = load i256, ptr %sp1554, align 16
  store i256 %swap.a1553, ptr %sp1554, align 16
  store i256 %swap.b1555, ptr %sp1552, align 16
  br label %OP530.SWAP3, !annotation !5

OP530.SWAP3:                                      ; preds = %OP529.SWAP4
  %stack_len1556 = load i64, ptr %len.addr, align 8
  %1197 = sub i64 %stack_len1556, 1
  %sp1557 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1197
  %swap.a1558 = load i256, ptr %sp1557, align 16
  %1198 = sub i64 %stack_len1556, 4
  %sp1559 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1198
  %swap.b1560 = load i256, ptr %sp1559, align 16
  store i256 %swap.a1558, ptr %sp1559, align 16
  store i256 %swap.b1560, ptr %sp1557, align 16
  br label %OP531.POP, !annotation !5

OP531.POP:                                        ; preds = %OP530.SWAP3
  %stack_len1561 = load i64, ptr %len.addr, align 8
  %1199 = add i64 %stack_len1561, -1
  store i64 %1199, ptr %len.addr, align 8
  br label %OP532.POP, !annotation !5

OP532.POP:                                        ; preds = %OP531.POP
  %stack_len1562 = load i64, ptr %len.addr, align 8
  %1200 = add i64 %stack_len1562, -1
  store i64 %1200, ptr %len.addr, align 8
  br label %OP533.POP, !annotation !5

OP533.POP:                                        ; preds = %OP532.POP
  %stack_len1563 = load i64, ptr %len.addr, align 8
  %1201 = add i64 %stack_len1563, -1
  store i64 %1201, ptr %len.addr, align 8
  br label %OP534.JUMP, !annotation !5

OP534.JUMP:                                       ; preds = %OP533.POP
  %stack_len1564 = load i64, ptr %len.addr, align 8
  %1202 = add i64 %stack_len1564, -1
  store i64 %1202, ptr %len.addr, align 8
  %1203 = add i64 %stack_len1564, -1
  %sp1565 = getelementptr inbounds i256, ptr %arg.stack.addr, i64 %1203
  %a1566 = load i256, ptr %sp1565, align 16
  br label %dynamic_jump_table

OP535.INVALID:                                    ; No predecessors!
  %stack_len1567 = load i64, ptr %len.addr, align 8
  br label %failure, !annotation !11

OP548.JUMPDEST:                                   ; preds = %dynamic_jump_table
  %gas.remaining1568 = load i64, ptr %gas.remaining.addr, align 8
  %1204 = sub i64 %gas.remaining1568, 1
  %1205 = icmp ult i64 %gas.remaining1568, 1
  store i64 %1204, ptr %gas.remaining.addr, align 8
  br i1 %1205, label %return, label %OP548.JUMPDEST.contd, !prof !2, !annotation !3

OP548.JUMPDEST.contd:                             ; preds = %OP548.JUMPDEST
  %stack_len1569 = load i64, ptr %len.addr, align 8
  br label %"OP549.UNKNOWN(0xfc)", !annotation !5

"OP549.UNKNOWN(0xfc)":                            ; preds = %OP548.JUMPDEST.contd
  br label %failure, !annotation !12

dynamic_jump_table:                               ; preds = %OP534.JUMP, %OP505.JUMP, %OP468.JUMP, %OP430.JUMP, %OP410.JUMP, %OP399.JUMP, %OP386.JUMP, %OP375.JUMP, %OP355.JUMP, %OP344.JUMP, %OP335.JUMP, %OP303.JUMP, %OP287.JUMP, %OP271.JUMP, %OP256.JUMP, %OP236.JUMP, %OP225.JUMP, %OP216.JUMP, %OP168.JUMP, %OP161.JUMP, %OP149.JUMP
  %1206 = phi i256 [ %a450, %OP149.JUMP ], [ %a489, %OP161.JUMP ], [ %a510, %OP168.JUMP ], [ %a661, %OP216.JUMP ], [ %a690, %OP225.JUMP ], [ %a716, %OP236.JUMP ], [ %a774, %OP256.JUMP ], [ %a822, %OP271.JUMP ], [ %a865, %OP287.JUMP ], [ %a909, %OP303.JUMP ], [ %a1000, %OP335.JUMP ], [ %a1029, %OP344.JUMP ], [ %a1056, %OP355.JUMP ], [ %a1116, %OP375.JUMP ], [ %a1153, %OP386.JUMP ], [ %a1188, %OP399.JUMP ], [ %a1215, %OP410.JUMP ], [ %a1275, %OP430.JUMP ], [ %a1380, %OP468.JUMP ], [ %a1483, %OP505.JUMP ], [ %a1566, %OP534.JUMP ]
  switch i256 %1206, label %return [
    i256 62, label %OP32.JUMPDEST
    i256 66, label %OP36.JUMPDEST
    i256 77, label %OP45.JUMPDEST
    i256 86, label %OP50.JUMPDEST
    i256 99, label %OP58.JUMPDEST
    i256 108, label %OP66.JUMPDEST
    i256 119, label %OP75.JUMPDEST
    i256 141, label %OP90.JUMPDEST
    i256 146, label %OP93.JUMPDEST
    i256 159, label %OP101.JUMPDEST
    i256 168, label %OP109.JUMPDEST
    i256 179, label %OP118.JUMPDEST
    i256 188, label %OP123.JUMPDEST
    i256 201, label %OP131.JUMPDEST
    i256 210, label %OP139.JUMPDEST
    i256 218, label %OP143.JUMPDEST
    i256 220, label %OP145.JUMPDEST
    i256 225, label %OP150.JUMPDEST
    i256 245, label %OP162.JUMPDEST
    i256 252, label %OP169.JUMPDEST
    i256 269, label %OP182.JUMPDEST
    i256 321, label %OP197.JUMPDEST
    i256 337, label %OP208.JUMPDEST
    i256 347, label %OP217.JUMPDEST
    i256 356, label %OP226.JUMPDEST
    i256 365, label %OP231.JUMPDEST
    i256 371, label %OP237.JUMPDEST
    i256 390, label %OP251.JUMPDEST
    i256 396, label %OP257.JUMPDEST
    i256 400, label %OP261.JUMPDEST
    i256 419, label %OP272.JUMPDEST
    i256 428, label %OP277.JUMPDEST
    i256 438, label %OP285.JUMPDEST
    i256 441, label %OP288.JUMPDEST
    i256 455, label %OP298.JUMPDEST
    i256 461, label %OP304.JUMPDEST
    i256 481, label %OP317.JUMPDEST
    i256 482, label %OP318.JUMPDEST
    i256 495, label %OP327.JUMPDEST
    i256 504, label %OP336.JUMPDEST
    i256 513, label %OP345.JUMPDEST
    i256 522, label %OP350.JUMPDEST
    i256 528, label %OP356.JUMPDEST
    i256 547, label %OP370.JUMPDEST
    i256 553, label %OP376.JUMPDEST
    i256 584, label %OP387.JUMPDEST
    i256 594, label %OP393.JUMPDEST
    i256 601, label %OP400.JUMPDEST
    i256 610, label %OP405.JUMPDEST
    i256 616, label %OP411.JUMPDEST
    i256 635, label %OP425.JUMPDEST
    i256 641, label %OP431.JUMPDEST
    i256 686, label %OP441.JUMPDEST
    i256 696, label %OP447.JUMPDEST
    i256 745, label %OP458.JUMPDEST
    i256 746, label %OP459.JUMPDEST
    i256 757, label %OP469.JUMPDEST
    i256 767, label %OP475.JUMPDEST
    i256 778, label %OP482.JUMPDEST
    i256 801, label %OP499.JUMPDEST
    i256 802, label %OP500.JUMPDEST
    i256 808, label %OP506.JUMPDEST
    i256 827, label %OP520.JUMPDEST
    i256 840, label %OP528.JUMPDEST
    i256 865, label %OP548.JUMPDEST
  ], !prof !13

suspend:                                          ; No predecessors!
  unreachable

failure:                                          ; preds = %"OP549.UNKNOWN(0xfc)", %OP535.INVALID
  %1207 = phi i8 [ 88, %OP535.INVALID ], [ 85, %"OP549.UNKNOWN(0xfc)" ]
  call void @llvm.assume(i1 true) #7
  br label %return

return:                                           ; preds = %failure, %dynamic_jump_table, %OP548.JUMPDEST, %OP528.JUMPDEST.contd, %OP528.JUMPDEST, %OP520.JUMPDEST.contd, %OP520.JUMPDEST, %OP506.JUMPDEST.contd, %OP506.JUMPDEST, %OP500.JUMPDEST.contd, %OP500.JUMPDEST, %OP499.JUMPDEST, %OP496.PUSH2.contd, %OP496.PUSH2, %OP482.JUMPDEST.contd, %OP482.JUMPDEST, %OP475.JUMPDEST.contd, %OP475.JUMPDEST, %OP469.JUMPDEST.contd, %OP469.JUMPDEST, %OP459.JUMPDEST.contd, %OP459.JUMPDEST, %OP458.JUMPDEST, %OP455.PUSH2.contd, %OP455.PUSH2, %OP447.JUMPDEST.contd, %OP447.JUMPDEST, %OP441.JUMPDEST.contd, %OP441.JUMPDEST, %OP440.REVERT.contd, %OP440.REVERT, %OP437.MSTORE, %OP434.MSTORE, %OP431.JUMPDEST.contd, %OP431.JUMPDEST, %OP425.JUMPDEST.contd, %OP425.JUMPDEST, %OP411.JUMPDEST.contd, %OP411.JUMPDEST, %OP407.MSTORE, %OP405.JUMPDEST.contd, %OP405.JUMPDEST, %OP400.JUMPDEST.contd, %OP400.JUMPDEST, %OP393.JUMPDEST.contd, %OP393.JUMPDEST, %OP387.JUMPDEST.contd, %OP387.JUMPDEST, %OP376.JUMPDEST.contd, %OP376.JUMPDEST, %OP370.JUMPDEST.contd, %OP370.JUMPDEST, %OP356.JUMPDEST.contd, %OP356.JUMPDEST, %OP352.MSTORE, %OP350.JUMPDEST.contd, %OP350.JUMPDEST, %OP345.JUMPDEST.contd, %OP345.JUMPDEST, %OP336.JUMPDEST.contd, %OP336.JUMPDEST, %OP327.JUMPDEST.contd, %OP327.JUMPDEST, %OP318.JUMPDEST.contd, %OP318.JUMPDEST, %OP317.JUMPDEST, %OP314.PUSH2.contd, %OP314.PUSH2, %OP304.JUMPDEST.contd, %OP304.JUMPDEST, %OP298.JUMPDEST.contd, %OP298.JUMPDEST, %OP288.JUMPDEST.contd, %OP288.JUMPDEST, %OP285.JUMPDEST.contd, %OP285.JUMPDEST, %OP284.REVERT.contd, %OP284.REVERT, %OP282.PUSH0.contd, %OP282.PUSH0, %OP277.JUMPDEST.contd, %OP277.JUMPDEST, %OP272.JUMPDEST.contd, %OP272.JUMPDEST, %OP261.JUMPDEST.contd, %OP261.JUMPDEST, %OP260.REVERT.contd, %OP260.REVERT, %OP257.JUMPDEST.contd, %OP257.JUMPDEST, %OP251.JUMPDEST.contd, %OP251.JUMPDEST, %OP237.JUMPDEST.contd, %OP237.JUMPDEST, %OP233.MSTORE, %OP231.JUMPDEST.contd, %OP231.JUMPDEST, %OP226.JUMPDEST.contd, %OP226.JUMPDEST, %OP217.JUMPDEST.contd, %OP217.JUMPDEST, %OP215.LOG1, %OP210.MLOAD, %OP208.JUMPDEST.contd, %OP208.JUMPDEST, %OP201.MLOAD, %OP199.SLOAD, %OP197.JUMPDEST.contd, %OP197.JUMPDEST, %OP191.SLOAD, %OP187.POP.contd, %OP187.POP, %OP186.SSTORE, %OP182.JUMPDEST.contd, %OP182.JUMPDEST, %OP173.SLOAD, %OP169.JUMPDEST.contd, %OP169.JUMPDEST, %OP162.JUMPDEST.contd, %OP162.JUMPDEST, %OP155.BLOCKHASH, %OP150.JUMPDEST.contd, %OP150.JUMPDEST, %OP147.SLOAD, %OP145.JUMPDEST.contd, %OP145.JUMPDEST, %OP144.STOP, %OP143.JUMPDEST, %OP139.JUMPDEST.contd, %OP139.JUMPDEST, %OP138.RETURN.contd, %OP138.RETURN, %OP133.MLOAD, %OP131.JUMPDEST.contd, %OP131.JUMPDEST, %OP125.MLOAD, %OP123.JUMPDEST.contd, %OP123.JUMPDEST, %OP118.JUMPDEST.contd, %OP118.JUMPDEST, %OP117.REVERT.contd, %OP117.REVERT, %OP115.PUSH0.contd, %OP115.PUSH0, %OP109.JUMPDEST.contd, %OP109.JUMPDEST, %OP108.RETURN.contd, %OP108.RETURN, %OP103.MLOAD, %OP101.JUMPDEST.contd, %OP101.JUMPDEST, %OP95.MLOAD, %OP93.JUMPDEST.contd, %OP93.JUMPDEST, %OP90.JUMPDEST.contd, %OP90.JUMPDEST, %OP75.JUMPDEST.contd, %OP75.JUMPDEST, %OP74.REVERT.contd, %OP74.REVERT, %OP72.PUSH0.contd, %OP72.PUSH0, %OP66.JUMPDEST.contd, %OP66.JUMPDEST, %OP65.RETURN.contd, %OP65.RETURN, %OP60.MLOAD, %OP58.JUMPDEST.contd, %OP58.JUMPDEST, %OP52.MLOAD, %OP50.JUMPDEST.contd, %OP50.JUMPDEST, %OP45.JUMPDEST.contd, %OP45.JUMPDEST, %OP44.REVERT.contd, %OP44.REVERT, %OP42.PUSH0.contd, %OP42.PUSH0, %OP36.JUMPDEST.contd, %OP36.JUMPDEST, %OP35.REVERT.contd, %OP35.REVERT, %OP32.JUMPDEST.contd, %OP32.JUMPDEST, %OP27.DUP1.contd, %OP27.DUP1, %OP22.DUP1.contd, %OP22.DUP1, %OP17.DUP1.contd, %OP17.DUP1, %OP8.PUSH0.contd, %OP8.PUSH0, %OP2.MSTORE, %OP0.PUSH1.contd, %OP0.PUSH1
  %1208 = phi i8 [ 80, %OP0.PUSH1 ], [ 92, %OP0.PUSH1.contd ], [ %8, %OP2.MSTORE ], [ 80, %OP8.PUSH0 ], [ 92, %OP8.PUSH0.contd ], [ 80, %OP17.DUP1 ], [ %54, %OP17.DUP1.contd ], [ 80, %OP22.DUP1 ], [ %72, %OP22.DUP1.contd ], [ 80, %OP27.DUP1 ], [ %90, %OP27.DUP1.contd ], [ 80, %OP32.JUMPDEST ], [ 92, %OP32.JUMPDEST.contd ], [ %111, %OP35.REVERT ], [ 16, %OP35.REVERT.contd ], [ 80, %OP36.JUMPDEST ], [ 92, %OP36.JUMPDEST.contd ], [ 80, %OP42.PUSH0 ], [ 92, %OP42.PUSH0.contd ], [ %134, %OP44.REVERT ], [ 16, %OP44.REVERT.contd ], [ 80, %OP45.JUMPDEST ], [ %141, %OP45.JUMPDEST.contd ], [ 80, %OP50.JUMPDEST ], [ %149, %OP50.JUMPDEST.contd ], [ %152, %OP52.MLOAD ], [ 80, %OP58.JUMPDEST ], [ %165, %OP58.JUMPDEST.contd ], [ %168, %OP60.MLOAD ], [ %184, %OP65.RETURN ], [ 2, %OP65.RETURN.contd ], [ 80, %OP66.JUMPDEST ], [ 92, %OP66.JUMPDEST.contd ], [ 80, %OP72.PUSH0 ], [ 92, %OP72.PUSH0.contd ], [ %207, %OP74.REVERT ], [ 16, %OP74.REVERT.contd ], [ 80, %OP75.JUMPDEST ], [ %214, %OP75.JUMPDEST.contd ], [ 80, %OP90.JUMPDEST ], [ 92, %OP90.JUMPDEST.contd ], [ 80, %OP93.JUMPDEST ], [ %249, %OP93.JUMPDEST.contd ], [ %252, %OP95.MLOAD ], [ 80, %OP101.JUMPDEST ], [ %265, %OP101.JUMPDEST.contd ], [ %268, %OP103.MLOAD ], [ %284, %OP108.RETURN ], [ 2, %OP108.RETURN.contd ], [ 80, %OP109.JUMPDEST ], [ 92, %OP109.JUMPDEST.contd ], [ 80, %OP115.PUSH0 ], [ 92, %OP115.PUSH0.contd ], [ %307, %OP117.REVERT ], [ 16, %OP117.REVERT.contd ], [ 80, %OP118.JUMPDEST ], [ %314, %OP118.JUMPDEST.contd ], [ 80, %OP123.JUMPDEST ], [ %322, %OP123.JUMPDEST.contd ], [ %325, %OP125.MLOAD ], [ 80, %OP131.JUMPDEST ], [ %338, %OP131.JUMPDEST.contd ], [ %341, %OP133.MLOAD ], [ %357, %OP138.RETURN ], [ 2, %OP138.RETURN.contd ], [ 80, %OP139.JUMPDEST ], [ 92, %OP139.JUMPDEST.contd ], [ 80, %OP143.JUMPDEST ], [ 1, %OP144.STOP ], [ 80, %OP145.JUMPDEST ], [ %370, %OP145.JUMPDEST.contd ], [ %373, %OP147.SLOAD ], [ 80, %OP150.JUMPDEST ], [ %384, %OP150.JUMPDEST.contd ], [ %395, %OP155.BLOCKHASH ], [ 80, %OP162.JUMPDEST ], [ %412, %OP162.JUMPDEST.contd ], [ 80, %OP169.JUMPDEST ], [ 92, %OP169.JUMPDEST.contd ], [ %433, %OP173.SLOAD ], [ 80, %OP182.JUMPDEST ], [ 91, %OP182.JUMPDEST.contd ], [ %456, %OP186.SSTORE ], [ 80, %OP187.POP ], [ %463, %OP187.POP.contd ], [ %469, %OP191.SLOAD ], [ 80, %OP197.JUMPDEST ], [ %481, %OP197.JUMPDEST.contd ], [ %484, %OP199.SLOAD ], [ %488, %OP201.MLOAD ], [ 80, %OP208.JUMPDEST ], [ %503, %OP208.JUMPDEST.contd ], [ %506, %OP210.MLOAD ], [ %522, %OP215.LOG1 ], [ 80, %OP217.JUMPDEST ], [ %531, %OP217.JUMPDEST.contd ], [ 80, %OP226.JUMPDEST ], [ %550, %OP226.JUMPDEST.contd ], [ 80, %OP231.JUMPDEST ], [ %559, %OP231.JUMPDEST.contd ], [ %565, %OP233.MSTORE ], [ 80, %OP237.JUMPDEST ], [ %576, %OP237.JUMPDEST.contd ], [ 80, %OP251.JUMPDEST ], [ 91, %OP251.JUMPDEST.contd ], [ 80, %OP257.JUMPDEST ], [ 92, %OP257.JUMPDEST.contd ], [ %619, %OP260.REVERT ], [ 16, %OP260.REVERT.contd ], [ 80, %OP261.JUMPDEST ], [ %626, %OP261.JUMPDEST.contd ], [ 80, %OP272.JUMPDEST ], [ %651, %OP272.JUMPDEST.contd ], [ 80, %OP277.JUMPDEST ], [ %660, %OP277.JUMPDEST.contd ], [ 80, %OP282.PUSH0 ], [ 92, %OP282.PUSH0.contd ], [ %680, %OP284.REVERT ], [ 16, %OP284.REVERT.contd ], [ 80, %OP285.JUMPDEST ], [ 91, %OP285.JUMPDEST.contd ], [ 80, %OP288.JUMPDEST ], [ %693, %OP288.JUMPDEST.contd ], [ 80, %OP298.JUMPDEST ], [ 91, %OP298.JUMPDEST.contd ], [ 80, %OP304.JUMPDEST ], [ %722, %OP304.JUMPDEST.contd ], [ 80, %OP314.PUSH2 ], [ 92, %OP314.PUSH2.contd ], [ 80, %OP317.JUMPDEST ], [ 80, %OP318.JUMPDEST ], [ %758, %OP318.JUMPDEST.contd ], [ 80, %OP327.JUMPDEST ], [ 91, %OP327.JUMPDEST.contd ], [ 80, %OP336.JUMPDEST ], [ %792, %OP336.JUMPDEST.contd ], [ 80, %OP345.JUMPDEST ], [ %811, %OP345.JUMPDEST.contd ], [ 80, %OP350.JUMPDEST ], [ %820, %OP350.JUMPDEST.contd ], [ %826, %OP352.MSTORE ], [ 80, %OP356.JUMPDEST ], [ %837, %OP356.JUMPDEST.contd ], [ 80, %OP370.JUMPDEST ], [ 91, %OP370.JUMPDEST.contd ], [ 80, %OP376.JUMPDEST ], [ %877, %OP376.JUMPDEST.contd ], [ 80, %OP387.JUMPDEST ], [ %902, %OP387.JUMPDEST.contd ], [ 80, %OP393.JUMPDEST ], [ 91, %OP393.JUMPDEST.contd ], [ 80, %OP400.JUMPDEST ], [ %925, %OP400.JUMPDEST.contd ], [ 80, %OP405.JUMPDEST ], [ %934, %OP405.JUMPDEST.contd ], [ %940, %OP407.MSTORE ], [ 80, %OP411.JUMPDEST ], [ %951, %OP411.JUMPDEST.contd ], [ 80, %OP425.JUMPDEST ], [ 91, %OP425.JUMPDEST.contd ], [ 80, %OP431.JUMPDEST ], [ 92, %OP431.JUMPDEST.contd ], [ %994, %OP434.MSTORE ], [ %1001, %OP437.MSTORE ], [ %1007, %OP440.REVERT ], [ 16, %OP440.REVERT.contd ], [ 80, %OP441.JUMPDEST ], [ %1014, %OP441.JUMPDEST.contd ], [ 80, %OP447.JUMPDEST ], [ %1024, %OP447.JUMPDEST.contd ], [ 80, %OP455.PUSH2 ], [ 92, %OP455.PUSH2.contd ], [ 80, %OP458.JUMPDEST ], [ 80, %OP459.JUMPDEST ], [ %1050, %OP459.JUMPDEST.contd ], [ 80, %OP469.JUMPDEST ], [ %1074, %OP469.JUMPDEST.contd ], [ 80, %OP475.JUMPDEST ], [ %1084, %OP475.JUMPDEST.contd ], [ 80, %OP482.JUMPDEST ], [ %1096, %OP482.JUMPDEST.contd ], [ 80, %OP496.PUSH2 ], [ 92, %OP496.PUSH2.contd ], [ 80, %OP499.JUMPDEST ], [ 80, %OP500.JUMPDEST ], [ 91, %OP500.JUMPDEST.contd ], [ 80, %OP506.JUMPDEST ], [ %1151, %OP506.JUMPDEST.contd ], [ 80, %OP520.JUMPDEST ], [ %1180, %OP520.JUMPDEST.contd ], [ 80, %OP528.JUMPDEST ], [ 91, %OP528.JUMPDEST.contd ], [ 80, %OP548.JUMPDEST ], [ 89, %dynamic_jump_table ], [ %1207, %failure ]
  ret i8 %1208
}

; Function Attrs: noinline norecurse nosync nounwind speculatable willreturn
define private i8 @__revmc_ir_builtin_mstore(i256 noundef %0, i256 noundef %1, ptr noalias nocapture noundef nonnull %2) #1 {
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
  br i1 %12, label %OP2.MSTORE.return, label %OP2.MSTORE.contd, !prof !2

OP2.MSTORE.contd:                                 ; preds = %resize
  br label %contd

OP2.MSTORE.return:                                ; preds = %resize
  ret i8 %11

contd:                                            ; preds = %OP2.MSTORE.contd, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %13 = call i256 @llvm.bswap.i256(i256 %1)
  store i256 %13, ptr %slot, align 16
  ret i8 0
}

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_resize_memory(ptr noalias nocapture noundef align 8 dereferenceable(88), i64 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i256 @llvm.bswap.i256(i256) #3

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define private i256 @__revmc_ir_builtin_calldataload(i256 noundef %0, ptr noundef %1) #4 {
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
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_do_return(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) #2

; Function Attrs: norecurse nosync nounwind speculatable willreturn
define private i8 @__revmc_ir_builtin_mload(i256 noundef %0, ptr noalias nocapture noundef nonnull writeonly %1, ptr noalias nocapture noundef nonnull %2) #4 {
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
  br i1 %12, label %OP52.MLOAD.return, label %OP52.MLOAD.contd, !prof !2

OP52.MLOAD.contd:                                 ; preds = %resize
  br label %contd

OP52.MLOAD.return:                                ; preds = %resize
  ret i8 %11

contd:                                            ; preds = %OP52.MLOAD.contd, %entry
  %ecx.memory.buffer.ptr.shared.addr = getelementptr inbounds i8, ptr %ecx.memory, i64 8
  %ecx.memory.buffer.ptr.shared = load ptr, ptr %ecx.memory.buffer.ptr.shared.addr, align 8
  %ecx.memory.buffer.ptr = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr.shared, i64 %ecx.memory.last_checkpoint
  %slot = getelementptr inbounds i8, ptr %ecx.memory.buffer.ptr, i64 %5
  %slot.value = load i256, ptr %slot, align 16
  %13 = call i256 @llvm.bswap.i256(i256 %slot.value)
  store i256 %13, ptr %1, align 16
  ret i8 0
}

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sload(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32), i8 noundef) #2

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_blockhash(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8 dereferenceable(32)) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i160 @llvm.bswap.i160(i160) #3

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_sstore(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef readonly align 8 dereferenceable(64), i8 noundef) #2

; Function Attrs: nofree norecurse nosync nounwind speculatable willreturn
declare i8 @__revmc_builtin_log(ptr noalias nocapture noundef align 8 dereferenceable(88), ptr noalias nocapture noundef align 8, i8 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #6

attributes #0 = { norecurse nosync nounwind speculatable willreturn "frame-pointer"="all" "target-cpu"="skylake" }
attributes #1 = { noinline norecurse nosync nounwind speculatable willreturn "target-cpu"="skylake" }
attributes #2 = { nofree norecurse nosync nounwind speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { norecurse nosync nounwind speculatable willreturn "target-cpu"="skylake" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #7 = { cold }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"branch_weights", i32 1, i32 20000}
!3 = !{!"check OutOfGas"}
!4 = !{!"check StackOverflow"}
!5 = !{!"normal exit"}
!6 = !{!"skipped"}
!7 = !{!"return Revert"}
!8 = !{!"return Return"}
!9 = !{!"return Stop"}
!10 = !{!"check StackUnderflow"}
!11 = !{!"fail InvalidFEOpcode"}
!12 = !{!"fail OpcodeNotFound"}
!13 = !{!"branch_weights", i32 1, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000, i32 20000}
