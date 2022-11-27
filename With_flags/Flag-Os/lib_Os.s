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
	movapd	xmm5, xmm0
	movapd	xmm0, xmm1
	movapd	xmm3, xmm1
	call	func
	movq	xmm7, QWORD PTR .LC1[rip]
	movapd	xmm4, xmm0
.L3:
	movapd	xmm0, xmm3
	call	func
	andps	xmm0, xmm7
	comisd	xmm0, xmm2
	jbe	.L6
	movapd	xmm6, xmm3
	movapd	xmm0, xmm5
	subsd	xmm6, xmm5
	mulsd	xmm6, xmm4
	call	func
	subsd	xmm4, xmm0
	movapd	xmm1, xmm3
	divsd	xmm6, xmm4
	subsd	xmm1, xmm6
	movapd	xmm0, xmm1
	movapd	xmm6, xmm1
	call	func
	movapd	xmm5, xmm3
	movapd	xmm4, xmm0
	movapd	xmm3, xmm6
	jmp	.L3
.L6:
	movapd	xmm0, xmm3
	ret
	.size	task, .-task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Incorrect Epsilon: %lf. Expected value from %*.*lf to %lf. It will be replaced by %*.*lf\n"
	.text
	.globl	check_accuracy
	.type	check_accuracy, @function
check_accuracy:
	sub	rsp, 24
	mov	rdi, QWORD PTR stdin[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	fflush@PLT
	movsd	xmm1, QWORD PTR .LC2[rip]
	movsd	xmm0, QWORD PTR 8[rsp]
	movsd	xmm2, QWORD PTR .LC3[rip]
	comisd	xmm1, xmm0
	jbe	.L14
	movapd	xmm3, xmm1
	mov	ecx, 8
	mov	edx, 1
	mov	al, 4
	mov	r9d, 8
	mov	r8d, 1
	mov	edi, 1
	lea	rsi, .LC4[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR .LC2[rip]
	movq	xmm0, rax
	jmp	.L10
.L14:
	comisd	xmm0, xmm2
	jbe	.L10
	movapd	xmm3, xmm2
	mov	ecx, 8
	mov	edx, 1
	mov	al, 4
	mov	r9d, 3
	mov	r8d, 1
	mov	edi, 1
	lea	rsi, .LC4[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR .LC3[rip]
	movq	xmm0, rax
.L10:
	add	rsp, 24
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
