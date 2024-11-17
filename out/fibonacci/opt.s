	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ## -- Begin function fibonacci
LCPI0_0:
	.long	1                               ## 0x1
	.long	0                               ## 0x0
	.long	0                               ## 0x0
	.long	0                               ## 0x0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fibonacci
	.p2align	4, 0x90
_fibonacci:                             ## @fibonacci
## %bb.0:                               ## %entry
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	mov	r10, qword ptr [rdx]
	mov	r11, qword ptr [rdi + 8]
	mov	rbx, r11
	mov	al, 80
	sub	rbx, 9
	mov	qword ptr [rdi + 8], rbx
	jb	LBB0_1
## %bb.2:                               ## %OP0.JUMPDEST.contd
	cmp	r10, 1022
	ja	LBB0_3
## %bb.4:                               ## %OP1.JUMPDEST
	mov	rcx, r10
	shl	rcx, 5
	lea	r8, [rsi + rcx]
	mov	qword ptr [rbp - 48], r8        ## 8-byte Spill
	vxorps	xmm0, xmm0, xmm0
	vmovups	ymmword ptr [rsi + rcx], ymm0
	lea	r9, [r10 + 2]
	add	r11, -29
	cmp	rbx, 20
	jb	LBB0_5
## %bb.6:                               ## %OP5.JUMPDEST.contd.lr.ph
	mov	qword ptr [rbp - 56], rdi       ## 8-byte Spill
	mov	qword ptr [rbp - 64], rdx       ## 8-byte Spill
	mov	qword ptr [rbp - 104], r10      ## 8-byte Spill
	lea	rax, [r10 - 1021]
	cmp	rax, -1020
	jb	LBB0_15
## %bb.7:                               ## %OP5.JUMPDEST.contd.lr.ph.split
	mov	qword ptr [rbp - 88], r9        ## 8-byte Spill
	mov	rax, r9
	shl	rax, 5
	add	rsi, rax
	mov	qword ptr [rbp - 80], rsi       ## 8-byte Spill
	mov	rax, qword ptr [rbp - 48]       ## 8-byte Reload
	mov	r9, qword ptr [rax - 8]
	mov	rdx, qword ptr [rax - 16]
	mov	rdi, qword ptr [rax - 32]
	mov	rax, qword ptr [rax - 24]
	mov	rcx, rdi
	shl	rcx, 6
	sub	rcx, rdi
	mov	qword ptr [rbp - 96], r11       ## 8-byte Spill
	sub	r11, rcx
	mov	qword ptr [rbp - 128], r11      ## 8-byte Spill
	sub	rbx, rcx
	mov	qword ptr [rbp - 136], rbx      ## 8-byte Spill
	mov	ecx, 1
	mov	qword ptr [rbp - 72], rcx       ## 8-byte Spill
	xor	r11d, r11d
	xor	ecx, ecx
	mov	qword ptr [rbp - 120], rcx      ## 8-byte Spill
	xor	ecx, ecx
	mov	qword ptr [rbp - 112], rcx      ## 8-byte Spill
	xor	r8d, r8d
	xor	r10d, r10d
	xor	ecx, ecx
	xor	esi, esi
	.p2align	4, 0x90
LBB0_8:                                 ## %OP5.JUMPDEST.contd
                                        ## =>This Inner Loop Header: Depth=1
	mov	r15, r8
	mov	r14, r11
	mov	r8, rdx
	mov	r11, rax
	mov	rax, rdi
	or	rax, rdx
	mov	rdx, r11
	or	rdx, r9
	or	rdx, rax
	je	LBB0_13
## %bb.9:                               ## %OP10.DUP2
                                        ##   in Loop: Header=BB0_8 Depth=1
	mov	rbx, qword ptr [rbp - 96]       ## 8-byte Reload
	cmp	rbx, 43
	jb	LBB0_16
## %bb.10:                              ## %OP10.DUP2.contd21
                                        ##   in Loop: Header=BB0_8 Depth=1
	mov	rax, r11
	mov	r11, qword ptr [rbp - 72]       ## 8-byte Reload
	mov	rdx, r8
	mov	r8, rsi
	mov	rsi, qword ptr [rbp - 48]       ## 8-byte Reload
	mov	qword ptr [rsi + 96], r11
	mov	qword ptr [rsi + 104], r10
	mov	qword ptr [rsi + 112], rcx
	mov	qword ptr [rsi + 120], r8
	add	r14, r11
	mov	r13, qword ptr [rbp - 120]      ## 8-byte Reload
	adc	r13, r10
	mov	r12, qword ptr [rbp - 112]      ## 8-byte Reload
	adc	r12, rcx
	adc	r15, r8
	mov	qword ptr [rsi], r11
	mov	qword ptr [rsi + 8], r10
	mov	qword ptr [rsi + 16], rcx
	mov	qword ptr [rsi + 24], r8
	mov	qword ptr [rbp - 152], rdi      ## 8-byte Spill
	add	rdi, -1
	mov	qword ptr [rbp - 168], rax      ## 8-byte Spill
	adc	rax, -1
	mov	qword ptr [rbp - 160], rdx      ## 8-byte Spill
	adc	rdx, -1
	mov	qword ptr [rbp - 144], r9       ## 8-byte Spill
	adc	r9, -1
	mov	qword ptr [rsi - 32], rdi
	mov	qword ptr [rsi - 24], rax
	mov	qword ptr [rsi - 16], rdx
	mov	qword ptr [rsi - 8], r9
	add	rbx, -63
	mov	qword ptr [rbp - 96], rbx       ## 8-byte Spill
	mov	qword ptr [rbp - 120], r10      ## 8-byte Spill
	mov	qword ptr [rbp - 112], rcx      ## 8-byte Spill
	mov	qword ptr [rbp - 72], r14       ## 8-byte Spill
	mov	r10, r13
	mov	rcx, r12
	mov	rsi, r15
	add	rbx, 20
	jae	LBB0_8
## %bb.11:                              ## %OP5.JUMPDEST.return.loopexit.split.loop.exit_crit_edge
	mov	rax, qword ptr [rbp - 80]       ## 8-byte Reload
	mov	rcx, qword ptr [rbp - 152]      ## 8-byte Reload
	mov	qword ptr [rax], rcx
	mov	rcx, qword ptr [rbp - 168]      ## 8-byte Reload
	mov	qword ptr [rax + 8], rcx
	mov	rcx, qword ptr [rbp - 160]      ## 8-byte Reload
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 144]      ## 8-byte Reload
	mov	qword ptr [rax + 24], rcx
	mov	rdx, qword ptr [rbp - 64]       ## 8-byte Reload
	mov	al, 80
	mov	r9, qword ptr [rbp - 88]        ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 56]       ## 8-byte Reload
	mov	r11, qword ptr [rbp - 96]       ## 8-byte Reload
	jmp	LBB0_12
LBB0_13:                                ## %OP23.JUMPDEST
	vmovaps	xmm0, xmmword ptr [rip + LCPI0_0] ## xmm0 = [1,0,0,0]
	mov	rax, qword ptr [rbp - 80]       ## 8-byte Reload
	vmovups	ymmword ptr [rax], ymm0
	mov	r8, qword ptr [rbp - 48]        ## 8-byte Reload
	mov	qword ptr [r8 + 48], rcx
	mov	rdi, qword ptr [rbp - 72]       ## 8-byte Reload
	mov	qword ptr [r8 + 32], rdi
	mov	qword ptr [r8 + 40], r10
	mov	qword ptr [r8 + 56], rsi
	mov	rdx, qword ptr [rbp - 136]      ## 8-byte Reload
	add	rdx, -28
	mov	rax, qword ptr [rbp - 56]       ## 8-byte Reload
	mov	qword ptr [rax + 8], rdx
	cmp	qword ptr [rbp - 128], 8        ## 8-byte Folded Reload
	mov	rdx, qword ptr [rbp - 64]       ## 8-byte Reload
	mov	al, 80
	mov	r9, qword ptr [rbp - 88]        ## 8-byte Reload
	jb	LBB0_17
## %bb.14:                              ## %OP24.SWAP2
	mov	qword ptr [r8 - 32], rdi
	mov	qword ptr [r8 - 24], r10
	mov	qword ptr [r8 - 16], rcx
	mov	qword ptr [r8 - 8], rsi
	vxorps	xmm0, xmm0, xmm0
	vmovups	ymmword ptr [r8 + 32], ymm0
	mov	al, 1
	mov	r9, qword ptr [rbp - 104]       ## 8-byte Reload
LBB0_17:                                ## %return
	mov	qword ptr [rdx], r9
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
LBB0_5:
	mov	r14d, 1
	xor	r13d, r13d
	xor	r12d, r12d
	xor	r15d, r15d
LBB0_12:                                ## %return.loopexit.split.loop.exit
	mov	rcx, qword ptr [rbp - 48]       ## 8-byte Reload
	mov	qword ptr [rcx + 32], r14
	mov	qword ptr [rcx + 40], r13
	mov	qword ptr [rcx + 48], r12
	mov	qword ptr [rcx + 56], r15
	mov	qword ptr [rdi + 8], r11
	jmp	LBB0_17
LBB0_16:                                ## %return.loopexit.split.loop.exit109
	vxorps	xmm0, xmm0, xmm0
	mov	rax, qword ptr [rbp - 80]       ## 8-byte Reload
	vmovups	ymmword ptr [rax], ymm0
	mov	rax, qword ptr [rbp - 72]       ## 8-byte Reload
	mov	rdx, qword ptr [rbp - 48]       ## 8-byte Reload
	mov	qword ptr [rdx + 32], rax
	mov	qword ptr [rdx + 40], r10
	mov	qword ptr [rdx + 48], rcx
	mov	qword ptr [rdx + 56], rsi
	add	rbx, -43
	mov	rax, qword ptr [rbp - 56]       ## 8-byte Reload
	mov	qword ptr [rax + 8], rbx
	mov	rdx, qword ptr [rbp - 64]       ## 8-byte Reload
	mov	al, 80
	mov	r9, qword ptr [rbp - 88]        ## 8-byte Reload
	jmp	LBB0_17
LBB0_1:
	mov	r9, r10
	jmp	LBB0_17
LBB0_3:
	mov	al, 92
	mov	r9, r10
	jmp	LBB0_17
LBB0_15:                                ## %return.loopexit.split.loop.exit107
	vmovaps	xmm0, xmmword ptr [rip + LCPI0_0] ## xmm0 = [1,0,0,0]
	mov	rax, qword ptr [rbp - 48]       ## 8-byte Reload
	vmovups	ymmword ptr [rax + 32], ymm0
	mov	rax, qword ptr [rbp - 56]       ## 8-byte Reload
	mov	qword ptr [rax + 8], r11
	cmp	qword ptr [rbp - 104], 1        ## 8-byte Folded Reload
	mov	al, 92
	sbb	al, 0
	mov	rdx, qword ptr [rbp - 64]       ## 8-byte Reload
	jmp	LBB0_17
                                        ## -- End function
.subsections_via_symbols
