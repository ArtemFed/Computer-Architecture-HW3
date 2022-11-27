	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.p2align 4
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
	.p2align 4
	.globl	task
	.type	task, @function
task:
	movapd	xmm4, xmm1
	movapd	xmm3, xmm1
	movsd	xmm5, QWORD PTR .LC0[rip]
	movq	xmm6, QWORD PTR .LC1[rip]
	mulsd	xmm4, xmm1
	mulsd	xmm4, xmm1
	mulsd	xmm3, xmm4
	subsd	xmm3, xmm4
	subsd	xmm3, xmm5
	movapd	xmm4, xmm3
	andpd	xmm4, xmm6
	comisd	xmm4, xmm2
	jbe	.L4
	.p2align 4,,10
	.p2align 3
.L6:
	movapd	xmm7, xmm0
	movapd	xmm4, xmm1
	mulsd	xmm7, xmm0
	subsd	xmm4, xmm0
	mulsd	xmm4, xmm3
	mulsd	xmm7, xmm0
	mulsd	xmm0, xmm7
	subsd	xmm0, xmm7
	subsd	xmm0, xmm5
	subsd	xmm3, xmm0
	movapd	xmm0, xmm1
	divsd	xmm4, xmm3
	subsd	xmm1, xmm4
	movapd	xmm4, xmm1
	movapd	xmm3, xmm1
	mulsd	xmm4, xmm1
	mulsd	xmm4, xmm1
	mulsd	xmm3, xmm4
	subsd	xmm3, xmm4
	subsd	xmm3, xmm5
	movapd	xmm4, xmm3
	andpd	xmm4, xmm6
	comisd	xmm4, xmm2
	ja	.L6
.L4:
	movapd	xmm0, xmm1
	ret
	.size	task, .-task
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Incorrect Epsilon: %lf. Expected value from %*.*lf to %lf. It will be replaced by %*.*lf\n"
	.text
	.p2align 4
	.globl	check_accuracy
	.type	check_accuracy, @function
check_accuracy:
	sub	rsp, 24
	mov	rdi, QWORD PTR stdin[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	fflush@PLT
	movsd	xmm1, QWORD PTR .LC2[rip]
	movsd	xmm0, QWORD PTR 8[rsp]
	comisd	xmm1, xmm0
	ja	.L18
	movsd	xmm2, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm2
	ja	.L19
	add	rsp, 24
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	movapd	xmm3, xmm1
	mov	ecx, 8
	mov	edx, 1
	movsd	xmm2, QWORD PTR .LC3[rip]
	mov	r9d, 8
	mov	r8d, 1
	mov	edi, 1
	mov	eax, 4
	lea	rsi, .LC4[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR .LC2[rip]
	add	rsp, 24
	movq	xmm0, rax
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	movapd	xmm3, xmm2
	mov	r9d, 3
	mov	r8d, 1
	mov	ecx, 8
	mov	edx, 1
	mov	edi, 1
	mov	eax, 4
	lea	rsi, .LC4[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR .LC3[rip]
	add	rsp, 24
	movq	xmm0, rax
	ret
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
