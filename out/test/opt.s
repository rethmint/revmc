	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.intel_syntax noprefix
	.globl	_test                           ## -- Begin function test
	.p2align	4, 0x90
_test:                                  ## @test
## %bb.0:                               ## %entry
	push	rbp
	mov	rbp, rsp
	mov	al, 1
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
