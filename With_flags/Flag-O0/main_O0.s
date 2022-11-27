	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC1:
	.string	"%lf"
.LC2:
	.string	"Epsilon: %*.*lf"
.LC5:
	.string	"\nTime: %d ms"
.LC6:
	.string	"\nResult: x =  %*.*lf\n"
.LC7:
	.string	"r"
.LC8:
	.string	"Error opening file!"
.LC9:
	.string	"w"
.LC10:
	.string	"%*.*lf\n"
	.align 8
.LC11:
	.string	"Random input or Direct (ans: 1, !=1):"
.LC12:
	.string	"%d"
	.align 8
.LC17:
	.string	"Input epsilon: (%*.*lf <= value <= %*.*lf):"
	.align 8
.LC18:
	.string	"Epsilon: %*.*lf\nResult: x = %*.*lf\n"
.LC19:
	.string	"random_out.txt"
.LC20:
	.string	"%lf\n"
	.align 8
.LC21:
	.string	"Also the result was added to \"random_out.txt\"."
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	pxor	xmm0, xmm0
	movsd	QWORD PTR -64[rbp], xmm0
	cmp	DWORD PTR -84[rbp], 2
	jne	.L2
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, -64[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_sscanf@PLT
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	call	check_accuracy@PLT
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	mov	edx, 8
	mov	esi, 1
	lea	rdi, .LC2[rip]
	mov	eax, 1
	call	printf@PLT
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -68[rbp], 0
	jmp	.L3
.L4:
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	add	DWORD PTR -68[rbp], 1
.L3:
	cmp	DWORD PTR -68[rbp], 24999999
	jle	.L4
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	movsd	QWORD PTR -104[rbp], xmm0
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	strlen@PLT
	sub	eax, 2
	movsd	xmm0, QWORD PTR -104[rbp]
	mov	edx, eax
	mov	esi, 1
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	jmp	.L11
.L2:
	cmp	DWORD PTR -84[rbp], 3
	jne	.L6
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	cmp	QWORD PTR -40[rbp], 0
	jne	.L7
	lea	rdi, .LC8[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L7:
	lea	rdx, -64[rbp]
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	call	check_accuracy@PLT
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	ecx, 8
	mov	edx, 1
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L11
.L6:
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -72[rbp], 0
	lea	rax, -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -72[rbp]
	cmp	eax, 1
	jne	.L8
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC13[rip]
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC14[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC15[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0
	jmp	.L9
.L8:
	movsd	xmm0, QWORD PTR .LC16[rip]
	mov	rax, QWORD PTR .LC15[rip]
	movapd	xmm1, xmm0
	mov	r8d, 3
	mov	ecx, 1
	movq	xmm0, rax
	mov	edx, 8
	mov	esi, 1
	lea	rdi, .LC17[rip]
	mov	eax, 2
	call	printf@PLT
	lea	rax, -64[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L9:
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	call	check_accuracy@PLT
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR -56[rbp]
	movapd	xmm1, xmm0
	mov	r8d, 8
	mov	ecx, 1
	movq	xmm0, rax
	mov	edx, 8
	mov	esi, 1
	lea	rdi, .LC18[rip]
	mov	eax, 2
	call	printf@PLT
	mov	eax, DWORD PTR -72[rbp]
	cmp	eax, 1
	jne	.L10
	lea	rsi, .LC9[rip]
	lea	rdi, .LC19[rip]
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC20[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rdi, .LC21[rip]
	mov	eax, 0
	call	printf@PLT
.L10:
	mov	eax, 0
.L11:
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC13:
	.long	4290772992
	.long	1105199103
	.align 8
.LC14:
	.long	371865828
	.long	1062232643
	.align 8
.LC15:
	.long	3794832442
	.long	1044740494
	.align 8
.LC16:
	.long	3539053052
	.long	1062232653
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
