	.file	"lib.c"
	.intel_syntax noprefix
	.text
	.globl	func
	.type	func, @function
func:
	endbr64	
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -8[rbp], xmm0
# ./lib.c:8:     return x * x * x * x - x * x * x - 2.5;
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC0[rip]
	subsd	xmm0, xmm1
# ./lib.c:9: }
	pop	rbp
	ret	
	.size	func, .-func
	.globl	task
	.type	task, @function
task:
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	QWORD PTR -24[rbp], xmm0	# x1, x1
	movsd	QWORD PTR -32[rbp], xmm1	# x2, x2
	movsd	QWORD PTR -40[rbp], xmm2	# epsilon, epsilon
# ./lib.c:13:     double fb = func(x2), mid = 0;
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	func
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax	# fb init
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0	# mid init
# ./lib.c:14:     while (fabs(func(x2)) > epsilon)
	jmp	.L4
.L5:
# ./lib.c:16:         mid = x2 - (x2 - x1) * fb / (fb - func(x1));
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -48[rbp], xmm0 # %sfp init
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	call	func
	movsd	xmm1, QWORD PTR -8[rbp]
	movapd	xmm3, xmm1
	subsd	xmm3, xmm0
	movapd	xmm0, xmm3
	movsd	xmm1, QWORD PTR -48[rbp]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0	# mid 
# ./lib.c:17:         x1 = x2;
	movsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
# ./lib.c:18:         x2 = mid;
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -32[rbp], xmm0	# x2
# ./lib.c:19:         fb = func(x2);
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	func
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
.L4:
# ./lib.c:14:     while (fabs(func(x2)) > epsilon)
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	func
	movq	xmm1, QWORD PTR .LC2[rip]
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -40[rbp]	# _7, epsilon
	ja	.L5
# ./lib.c:21:     return x2;
	movsd	xmm0, QWORD PTR -32[rbp]
# ./lib.c:22: }
	leave	
	ret	
	.size	task, .-task
	.section	.rodata
	.align 8
.LC5:
	.string	"Incorrect Epsilon: %lf. Expected value from %*.*lf to %lf. It will be replaced by %*.*lf\n"
	.text
	.globl	check_accuracy
	.type	check_accuracy, @function
check_accuracy:
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	movsd	QWORD PTR -8[rbp], xmm0	# epsilon
# ./lib.c:25:     fflush(stdin);
	mov rdi, QWORD PTR stdin[rip]
	call	fflush@PLT
# ./lib.c:26:     if (epsilon < min_size) {
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, QWORD PTR -8[rbp]
	jbe	.L15
# ./lib.c:27:         printf("Incorrect Epsilon: %lf. Expected value from %*.*lf to %lf. It will be replaced by %*.*lf\n", epsilon, 1, 8, min_size, max_size, 1, 8, min_size);
	movsd	xmm2, QWORD PTR .LC3[rip]
	movsd	xmm1, QWORD PTR .LC4[rip]
	movsd	xmm0, QWORD PTR .LC3[rip]
	movapd	xmm3, xmm2
	mov	r8d, 8
	mov	ecx, 1
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	mov	edx, 8
	mov	esi, 1
	movq	xmm0, QWORD PTR -8[rbp]
	lea	rdi, .LC5[rip]
	mov	eax, 4
	call	printf@PLT
# ./lib.c:28:         return min_size;
	movsd	xmm0, QWORD PTR .LC3[rip]
	jmp	.L10
.L15:
# ./lib.c:29:     } else if (epsilon > max_size) {
	movsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	jbe	.L16
# ./lib.c:30:         printf("Incorrect Epsilon: %lf. Expected value from %*.*lf to %lf. It will be replaced by %*.*lf\n", epsilon, 1, 8, min_size, max_size, 1, 3, max_size);
	movsd	xmm2, QWORD PTR .LC4[rip]
	movsd	xmm1, QWORD PTR .LC4[rip]
	movsd	xmm0, QWORD PTR .LC3[rip]
	movapd	xmm3, xmm2
	mov	r8d, 3
	mov	ecx, 1
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	mov	edx, 8
	mov	esi, 1
	movq	xmm0, QWORD PTR -8[rbp]
	lea	rdi, .LC5[rip]
	mov	eax, 4
	call	printf@PLT
# ./lib.c:31:         return max_size;
	movsd	xmm0, QWORD PTR .LC4[rip]
	jmp	.L10
.L16:
# ./lib.c:33:     return epsilon;
	movsd	xmm0, QWORD PTR -8[rbp]
.L10:
# ./lib.c:34: }
	leave	
	ret	
	.size	check_accuracy, .-check_accuracy
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1074003968
	.align 16
.LC2:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC3:
	.long	3794832442
	.long	1044740494
	.align 8
.LC4:
	.long	3539053052
	.long	1062232653
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	
