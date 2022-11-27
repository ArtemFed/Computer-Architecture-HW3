	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LC11:
	.string	"Random input or Direct (ans: 1, !=1):"
.LC12:
	.string	"%d"
.LC17:
	.string	"Input epsilon: (%*.*lf <= value <= %*.*lf):"
.LC18:
	.string	"Epsilon: %*.*lf\nResult: x = %*.*lf\n"
.LC19:
	.string	"random_out.txt"
.LC20:
	.string	"%lf\n"
.LC21:
	.string	"Also the result was added to \"random_out.txt\"."
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	push	r12
	push	rbp
	push	rbx
	mov	rbx, rsi
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	mov	QWORD PTR 32[rsp], 0x000000000
	cmp	edi, 2
	jne	.L2
	mov	rdi, QWORD PTR 8[rsi]
	lea	rdx, 32[rsp]
	mov	r12d, 25000000
	lea	rsi, .LC1[rip]
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	mov	ecx, 8
	mov	edx, 1
	mov	al, 1
	lea	rsi, .LC2[rip]
	mov	edi, 1
	movsd	QWORD PTR 32[rsp], xmm0
	call	__printf_chk@PLT
	call	clock@PLT
	mov	rbp, rax
.L3:
	mov	rax, QWORD PTR .LC3[rip]
	movsd	xmm2, QWORD PTR 32[rsp]
	movq	xmm1, rax
	mov	rax, QWORD PTR .LC4[rip]
	movq	xmm0, rax
	call	task@PLT
	dec	r12d
	jne	.L3
	call	clock@PLT
	mov	rsi, rbp
	mov	rdi, rax
	call	difftime@PLT
	mov	ecx, 1000
	mov	edi, 1
	lea	rsi, .LC5[rip]
	cvttsd2si	eax, xmm0
	cdq
	idiv	ecx
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rax, QWORD PTR .LC3[rip]
	movsd	xmm2, QWORD PTR 32[rsp]
	movq	xmm1, rax
	mov	rax, QWORD PTR .LC4[rip]
	movq	xmm0, rax
	call	task@PLT
	mov	rdi, QWORD PTR 8[rbx]
	xor	eax, eax
	or	rcx, -1
	mov	edx, 1
	lea	rsi, .LC6[rip]
	repnz scasb
	mov	edi, 1
	mov	al, 1
	not	rcx
	sub	ecx, 3
	call	__printf_chk@PLT
	jmp	.L4
.L2:
	cmp	edi, 3
	jne	.L5
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC7[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L6
	lea	rdi, .LC8[rip]
	call	puts@PLT
	jmp	.L4
.L6:
	lea	rdx, 32[rsp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC9[rip]
	movsd	QWORD PTR 32[rsp], xmm0
	call	fopen@PLT
	movsd	xmm2, QWORD PTR 32[rsp]
	movsd	xmm1, QWORD PTR .LC3[rip]
	movsd	xmm0, QWORD PTR .LC4[rip]
	mov	rbp, rax
	call	task@PLT
	mov	rdi, rbp
	mov	r8d, 8
	mov	al, 1
	mov	ecx, 1
	lea	rdx, .LC10[rip]
	mov	esi, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L5:
	lea	rsi, .LC11[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 28[rsp]
	lea	rdi, .LC12[rip]
	mov	DWORD PTR 28[rsp], 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 28[rsp], 1
	movsd	xmm0, QWORD PTR .LC15[rip]
	jne	.L7
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	cvtsi2sd	xmm1, eax
	divsd	xmm1, QWORD PTR .LC13[rip]
	mulsd	xmm1, QWORD PTR .LC14[rip]
	mov	rax, QWORD PTR .LC15[rip]
	movq	xmm0, rax
	addsd	xmm0, xmm1
	movsd	QWORD PTR 32[rsp], xmm0
	jmp	.L8
.L7:
	movsd	xmm1, QWORD PTR .LC16[rip]
	lea	rsi, .LC17[rip]
	mov	al, 2
	mov	edi, 1
	mov	r9d, 3
	mov	r8d, 1
	mov	ecx, 8
	mov	edx, 1
	call	__printf_chk@PLT
	lea	rsi, 32[rsp]
	lea	rdi, .LC1[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
.L8:
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	movsd	xmm1, QWORD PTR .LC3[rip]
	movapd	xmm2, xmm0
	movsd	QWORD PTR 32[rsp], xmm0
	movsd	xmm0, QWORD PTR .LC4[rip]
	call	task@PLT
	mov	r9d, 8
	mov	r8d, 1
	mov	ecx, 8
	movapd	xmm1, xmm0
	mov	edx, 1
	mov	edi, 1
	mov	al, 2
	movsd	QWORD PTR 8[rsp], xmm0
	movsd	xmm0, QWORD PTR 32[rsp]
	lea	rsi, .LC18[rip]
	call	__printf_chk@PLT
	cmp	DWORD PTR 28[rsp], 1
	jne	.L4
	lea	rsi, .LC9[rip]
	lea	rdi, .LC19[rip]
	call	fopen@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	mov	esi, 1
	lea	rdx, .LC20[rip]
	mov	rdi, rax
	mov	rbp, rax
	mov	al, 1
	movapd	xmm0, xmm1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	lea	rsi, .LC21[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	add	rsp, 48
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
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
