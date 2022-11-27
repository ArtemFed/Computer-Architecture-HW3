	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	func
	.type	func, @function
func:
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm0, xmm1
	subsd	xmm0, xmm1
	subsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.size	func, .-func
	.globl	task
	.type	task, @function
task:
	sub	rsp, 40
	movsd	QWORD PTR 16[rsp], xmm0
	movsd	QWORD PTR [rsp], xmm1
	movsd	QWORD PTR 32[rsp], xmm2
	movapd	xmm0, xmm1
	call	func
	movsd	QWORD PTR 8[rsp], xmm0
.L3:
	movsd	xmm0, QWORD PTR [rsp]
	call	func
	andpd	xmm0, XMMWORD PTR .LC1[rip]
	comisd	xmm0, QWORD PTR 32[rsp]
	jbe	.L6
	movsd	xmm3, QWORD PTR [rsp]
	movsd	xmm7, QWORD PTR 16[rsp]
	subsd	xmm3, xmm7
	movapd	xmm5, xmm3
	mulsd	xmm5, QWORD PTR 8[rsp]
	movsd	QWORD PTR 16[rsp], xmm5
	movapd	xmm0, xmm7
	call	func
	movsd	xmm6, QWORD PTR 8[rsp]
	subsd	xmm6, xmm0
	movsd	xmm5, QWORD PTR 16[rsp]
	divsd	xmm5, xmm6
	movsd	xmm4, QWORD PTR [rsp]
	subsd	xmm4, xmm5
	movsd	QWORD PTR 24[rsp], xmm4
	movapd	xmm0, xmm4
	call	func
	movsd	QWORD PTR 8[rsp], xmm0
	movsd	xmm3, QWORD PTR [rsp]
	movsd	QWORD PTR 16[rsp], xmm3
	movsd	xmm4, QWORD PTR 24[rsp]
	movsd	QWORD PTR [rsp], xmm4
	jmp	.L3
.L6:
	movsd	xmm0, QWORD PTR [rsp]
	add	rsp, 40
	ret
	.size	task, .-task
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Incorrect Epsilon: %lf. Expected value from %*.*lf to %lf. It will be replaced by %*.*lf\n"
	.text
	.globl	check_accuracy
	.type	check_accuracy, @function
check_accuracy:
	sub	rsp, 24
	movsd	QWORD PTR 8[rsp], xmm0
	mov	rdi, QWORD PTR stdin[rip]
	call	fflush@PLT
	movsd	xmm0, QWORD PTR .LC2[rip]
	comisd	xmm0, QWORD PTR 8[rsp]
	ja	.L16
	movsd	xmm5, QWORD PTR 8[rsp]
	comisd	xmm5, QWORD PTR .LC3[rip]
	ja	.L17
.L10:
	movsd	xmm0, QWORD PTR 8[rsp]
	add	rsp, 24
	ret
.L16:
	movapd	xmm3, xmm0
	mov	r9d, 8
	mov	r8d, 1
	movsd	xmm2, QWORD PTR .LC3[rip]
	movapd	xmm1, xmm0
	mov	ecx, 8
	mov	edx, 1
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 4
	call	__printf_chk@PLT
	mov	rax, QWORD PTR .LC2[rip]
	mov	QWORD PTR 8[rsp], rax
	jmp	.L10
.L17:
	mov	rax, QWORD PTR .LC3[rip]
	movq	xmm3, rax
	mov	r9d, 3
	mov	r8d, 1
	movq	xmm2, rax
	movsd	xmm1, QWORD PTR .LC2[rip]
	mov	ecx, 8
	mov	edx, 1
	movapd	xmm0, xmm5
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 4
	call	__printf_chk@PLT
	mov	rax, QWORD PTR .LC3[rip]
	mov	QWORD PTR 8[rsp], rax
	jmp	.L10
	.size	check_accuracy, .-check_accuracy
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1074003968
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC2:
	.long	3794832442
	.long	1044740494
	.align 8
.LC3:
	.long	3539053052
	.long	1062232653
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
