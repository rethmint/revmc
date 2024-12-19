	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ## -- Begin function factorial
LCPI0_0:
	.quad	32                              ## 0x20
	.quad	0                               ## 0x0
	.section	__TEXT,__const
	.p2align	5, 0x0
LCPI0_1:
	.space	32
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_factorial
	.p2align	4, 0x90
_factorial:                             ## @factorial
## %bb.0:                               ## %entry
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 168
	mov	qword ptr [rbp - 144], r9       ## 8-byte Spill
	mov	r12, qword ptr [rdi + 8]
	mov	qword ptr [rbp - 96], r12       ## 8-byte Spill
	sub	r12, 10
	mov	qword ptr [rbp - 104], rdi      ## 8-byte Spill
	mov	qword ptr [rdi + 8], r12
	jb	LBB0_14
## %bb.1:                               ## %OP0.PUSH0.contd1
	mov	rbx, rsi
	mov	rsi, qword ptr [r8 + 72]
	mov	rdx, qword ptr [r8 + 80]
	lea	rdi, [rbp - 208]
	call	l___revmc_ir_builtin_calldataload
	mov	r9, qword ptr [rbp - 184]
	mov	r14, qword ptr [rbp - 192]
	mov	r15, qword ptr [rbp - 208]
	mov	r13, qword ptr [rbp - 200]
	mov	qword ptr [rbx + 16], r14
	mov	qword ptr [rbx + 24], r9
	mov	qword ptr [rbx], r15
	mov	qword ptr [rbx + 8], r13
	mov	qword ptr [rbx + 48], 0
	mov	qword ptr [rbx + 56], 0
	mov	qword ptr [rbx + 32], 0
	mov	qword ptr [rbx + 40], 0
	mov	r8, qword ptr [rbp - 96]        ## 8-byte Reload
	add	r8, -30
	cmp	r12, 20
	jb	LBB0_10
## %bb.2:                               ## %OP5.DUP3.lr.ph
	mov	qword ptr [rbp - 64], rbx       ## 8-byte Spill
	lea	rax, [rbx + 32]
	mov	qword ptr [rbp - 120], rax      ## 8-byte Spill
	mov	rax, r15
	shl	rax, 6
	lea	rax, [rax + 2*r15]
	mov	rcx, r8
	sub	rcx, rax
	mov	qword ptr [rbp - 128], rcx      ## 8-byte Spill
	sub	r12, rax
	mov	qword ptr [rbp - 136], r12      ## 8-byte Spill
	mov	eax, 1
	mov	qword ptr [rbp - 48], rax       ## 8-byte Spill
	xor	r11d, r11d
	xor	eax, eax
	xor	edi, edi
	xor	ecx, ecx
	mov	qword ptr [rbp - 112], rcx      ## 8-byte Spill
	xor	ecx, ecx
	mov	qword ptr [rbp - 56], rcx       ## 8-byte Spill
	xor	edx, edx
	xor	ecx, ecx
	.p2align	4, 0x90
LBB0_3:                                 ## %OP5.DUP3
                                        ## =>This Inner Loop Header: Depth=1
	mov	r10, qword ptr [rbp - 112]      ## 8-byte Reload
	mov	r12, r9
	mov	rbx, r14
	mov	rsi, r15
	or	rsi, r14
	mov	r9, r13
	or	r9, r12
	mov	r14, rsi
	or	r14, r9
	je	LBB0_6
## %bb.4:                               ## %OP9.SWAP1
                                        ##   in Loop: Header=BB0_3 Depth=1
	cmp	r8, 46
	jb	LBB0_11
## %bb.5:                               ## %OP9.SWAP1.contd24
                                        ##   in Loop: Header=BB0_3 Depth=1
	add	r11, 1
	adc	rax, 0
	adc	rdi, 0
	adc	r10, 0
	mov	qword ptr [rbp - 96], r8        ## 8-byte Spill
	mov	rsi, qword ptr [rbp - 64]       ## 8-byte Reload
	mov	qword ptr [rsi + 32], r11
	mov	qword ptr [rsi + 40], rax
	mov	qword ptr [rsi + 48], rdi
	mov	qword ptr [rsi + 56], r10
	mov	r9, rdx
	imul	r9, rax
	mulx	r14, rdx, r11
	mov	qword ptr [rbp - 152], rdx      ## 8-byte Spill
	add	r14, r9
	imul	rcx, r11
	mov	r8, qword ptr [rbp - 48]        ## 8-byte Reload
	mov	rdx, r8
	mov	qword ptr [rbp - 88], r15       ## 8-byte Spill
	mulx	r15, r9, rdi
	mov	rdx, r11
	mov	qword ptr [rbp - 80], r13       ## 8-byte Spill
	mulx	r13, rdx, r8
	mov	qword ptr [rbp - 160], rdx      ## 8-byte Spill
	add	rcx, r14
	mov	rdx, rax
	mov	qword ptr [rbp - 72], rbx       ## 8-byte Spill
	mulx	rbx, r14, r8
	mov	rdx, r10
	mov	qword ptr [rbp - 112], r10      ## 8-byte Spill
	imul	r8, r10
	add	r8, r15
	mov	qword ptr [rbp - 168], r12      ## 8-byte Spill
	mov	r12, qword ptr [rbp - 56]       ## 8-byte Reload
	mov	r15, r12
	imul	r15, rdi
	add	r15, r8
	add	r9, qword ptr [rbp - 152]       ## 8-byte Folded Reload
	adc	r15, rcx
	add	r14, r13
	adc	rbx, 0
	mov	rdx, r11
	mulx	r8, r10, r12
	add	r10, r14
	adc	r8, rbx
	setb	cl
	movzx	ebx, cl
	mov	rdx, rax
	mulx	rcx, rdx, r12
	mov	r12, qword ptr [rbp - 168]      ## 8-byte Reload
	add	rdx, r8
	adc	rcx, rbx
	add	rdx, r9
	adc	rcx, r15
	mov	r15, qword ptr [rbp - 88]       ## 8-byte Reload
	add	r15, -1
	mov	r13, qword ptr [rbp - 80]       ## 8-byte Reload
	adc	r13, -1
	mov	r14, qword ptr [rbp - 72]       ## 8-byte Reload
	adc	r14, -1
	mov	r9, r12
	adc	r9, -1
	mov	qword ptr [rsi], r15
	mov	qword ptr [rsi + 8], r13
	mov	qword ptr [rsi + 16], r14
	mov	qword ptr [rsi + 24], r9
	mov	rsi, qword ptr [rbp - 160]      ## 8-byte Reload
	mov	r8, qword ptr [rbp - 96]        ## 8-byte Reload
	add	r8, -66
	mov	rbx, r8
	mov	qword ptr [rbp - 48], rsi       ## 8-byte Spill
	mov	qword ptr [rbp - 56], r10       ## 8-byte Spill
	add	rbx, 20
	jae	LBB0_3
	jmp	LBB0_12
LBB0_6:                                 ## %OP22.JUMPDEST
	sete	al
	movzx	eax, al
	vxorps	xmm0, xmm0, xmm0
	mov	rbx, qword ptr [rbp - 64]       ## 8-byte Reload
	vmovups	xmmword ptr [rbx + 104], xmm0
	mov	qword ptr [rbx + 96], rax
	mov	qword ptr [rbx + 120], 0
	mov	rdi, qword ptr [rbp - 48]       ## 8-byte Reload
	mov	qword ptr [rbx + 64], rdi
	mov	rsi, qword ptr [rbp - 56]       ## 8-byte Reload
	mov	qword ptr [rbx + 72], rsi
	mov	qword ptr [rbx + 80], rdx
	mov	qword ptr [rbx + 88], rcx
	mov	r8, qword ptr [rbp - 136]       ## 8-byte Reload
	add	r8, -38
	mov	rax, qword ptr [rbp - 104]      ## 8-byte Reload
	mov	qword ptr [rax + 8], r8
	cmp	qword ptr [rbp - 128], 18       ## 8-byte Folded Reload
	mov	r9b, 80
	jb	LBB0_9
## %bb.7:                               ## %OP23.SWAP2
	mov	qword ptr [rbx], rdi
	mov	qword ptr [rbx + 8], rsi
	mov	qword ptr [rbx + 16], rdx
	mov	qword ptr [rbx + 24], rcx
	vxorps	xmm0, xmm0, xmm0
	mov	rax, qword ptr [rbp - 120]      ## 8-byte Reload
	vmovups	ymmword ptr [rax + 32], ymm0
	vmovups	ymmword ptr [rax], ymm0
	mov	r14, qword ptr [rbp - 144]      ## 8-byte Reload
	mov	r8, r14
	vzeroupper
	call	l___revmc_ir_builtin_mstore
	test	al, al
	jne	LBB0_16
## %bb.8:                               ## %OP28.PUSH1
	vmovaps	xmm0, xmmword ptr [rip + LCPI0_0] ## xmm0 = [32,0]
	vmovups	ymmword ptr [rbx], ymm0
	vxorps	xmm0, xmm0, xmm0
	vmovups	ymmword ptr [rbx + 32], ymm0
	mov	rdi, r14
	mov	rsi, rbx
	mov	edx, 2
	vzeroupper
	call	___revmc_builtin_do_return
	mov	r9b, 2
	test	al, al
	jne	LBB0_16
LBB0_9:                                 ## %return
	mov	eax, r9d
	add	rsp, 168
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB0_10:
	mov	esi, 1
	xor	r10d, r10d
	xor	edx, edx
	xor	ecx, ecx
	jmp	LBB0_13
LBB0_11:                                ## %OP9.SWAP1.return.loopexit_crit_edge
	xor	eax, eax
	or	rsi, r9
	sete	al
	mov	qword ptr [rbp - 88], rax       ## 8-byte Spill
	xor	eax, eax
	mov	qword ptr [rbp - 80], rax       ## 8-byte Spill
	add	r8, -46
	xor	eax, eax
	mov	qword ptr [rbp - 72], rax       ## 8-byte Spill
	xor	r12d, r12d
	mov	rsi, qword ptr [rbp - 48]       ## 8-byte Reload
	mov	r10, qword ptr [rbp - 56]       ## 8-byte Reload
LBB0_12:                                ## %return.loopexit.sink.split
	mov	rbx, qword ptr [rbp - 64]       ## 8-byte Reload
	mov	rax, qword ptr [rbp - 88]       ## 8-byte Reload
	mov	qword ptr [rbx + 96], rax
	mov	rax, qword ptr [rbp - 80]       ## 8-byte Reload
	mov	qword ptr [rbx + 104], rax
	mov	rax, qword ptr [rbp - 72]       ## 8-byte Reload
	mov	qword ptr [rbx + 112], rax
	mov	qword ptr [rbx + 120], r12
LBB0_13:                                ## %return.loopexit
	mov	r9b, 80
	mov	qword ptr [rbx + 64], rsi
	mov	qword ptr [rbx + 72], r10
	mov	qword ptr [rbx + 80], rdx
	mov	qword ptr [rbx + 88], rcx
	mov	rax, qword ptr [rbp - 104]      ## 8-byte Reload
	mov	qword ptr [rax + 8], r8
	jmp	LBB0_9
LBB0_16:                                ## %select.false
	mov	r9d, eax
	jmp	LBB0_9
LBB0_14:
	mov	r9b, 80
	jmp	LBB0_9
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function __revmc_ir_builtin_calldataload
l___revmc_ir_builtin_calldataload:      ## @__revmc_ir_builtin_calldataload
## %bb.0:                               ## %entry
	push	rbp
	mov	rbp, rsp
	push	r14
	push	rbx
	mov	rbx, rdi
	test	rdx, rdx
	je	LBB1_2
## %bb.1:                               ## %then
	cmp	rdx, 32
	mov	eax, 32
	cmovb	rax, rdx
	mov	r14, rsp
	lea	rdi, [r14 - 32]
	mov	rsp, rdi
	vxorps	xmm0, xmm0, xmm0
	vmovups	ymmword ptr [r14 - 32], ymm0
	mov	rdx, rax
	vzeroupper
	call	_memcpy
	mov	rax, qword ptr [r14 - 8]
	mov	rcx, qword ptr [r14 - 16]
	mov	rdx, qword ptr [r14 - 32]
	mov	rsi, qword ptr [r14 - 24]
	movbe	qword ptr [rbx + 24], rdx
	movbe	qword ptr [rbx + 16], rsi
	movbe	qword ptr [rbx + 8], rcx
	movbe	qword ptr [rbx], rax
	jmp	LBB1_3
LBB1_2:                                 ## %contd
	vxorps	xmm0, xmm0, xmm0
	vmovups	ymmword ptr [rbx], ymm0
LBB1_3:                                 ## %contd
	mov	rax, rbx
	lea	rsp, [rbp - 16]
	pop	rbx
	pop	r14
	pop	rbp
	vzeroupper
	ret
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function __revmc_ir_builtin_mstore
l___revmc_ir_builtin_mstore:            ## @__revmc_ir_builtin_mstore
## %bb.0:                               ## %entry
	push	rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	mov	r14, qword ptr [r8 + 40]
	mov	rax, qword ptr [r14 + 16]
	mov	rbx, qword ptr [r14 + 48]
	sub	rax, rbx
	cmp	rax, 31
	jbe	LBB2_1
LBB2_2:                                 ## %contd
	mov	rax, qword ptr [r14 + 8]
	movbe	qword ptr [rax + rbx + 24], rdi
	movbe	qword ptr [rax + rbx + 16], rsi
	movbe	qword ptr [rax + rbx + 8], rdx
	movbe	qword ptr [rax + rbx], rcx
	xor	eax, eax
LBB2_3:                                 ## %common.ret
                                        ## kill: def $al killed $al killed $eax
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB2_1:                                 ## %resize
	mov	r15, rsi
	mov	esi, 32
	mov	r12, rdi
	mov	rdi, r8
	mov	r13, rcx
	mov	rbp, rdx
	call	___revmc_builtin_resize_memory
	mov	rdi, r12
	mov	rsi, r15
	mov	rdx, rbp
	mov	rcx, r13
                                        ## kill: def $al killed $al def $eax
	test	al, al
	je	LBB2_2
	jmp	LBB2_3
                                        ## -- End function
.subsections_via_symbols
