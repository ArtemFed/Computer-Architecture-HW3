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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC11:
	.string	"Random input or Direct (ans: 1, !=1):"
	.section	.rodata.str1.1
.LC12:
	.string	"%d"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Input epsilon: (%*.*lf <= value <= %*.*lf):"
	.align 8
.LC18:
	.string	"Epsilon: %*.*lf\nResult: x = %*.*lf\n"
	.section	.rodata.str1.1
.LC19:
	.string	"random_out.txt"
.LC20:
	.string	"%lf\n"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Also the result was added to \"random_out.txt\"."
	.text
	.globl	main
	.type	main, @function
main:
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 48
	mov	rbp, rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	mov	QWORD PTR 32[rsp], 0x000000000
	cmp	edi, 2
	je	.L12
	cmp	edi, 3
	je	.L13
	lea	rsi, .LC11[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	DWORD PTR 28[rsp], 0
	lea	rsi, 28[rsp]
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 28[rsp], 1
	je	.L14
	movsd	xmm1, QWORD PTR .LC16[rip]
	mov	r9d, 3
	mov	r8d, 1
	movsd	xmm0, QWORD PTR .LC15[rip]
	mov	ecx, 8
	mov	edx, 1
	lea	rsi, .LC17[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	lea	rsi, 32[rsp]
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L8:
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	movapd	xmm2, xmm0
	movsd	QWORD PTR 32[rsp], xmm0
	movsd	xmm1, QWORD PTR .LC3[rip]
	movsd	xmm0, QWORD PTR .LC4[rip]
	call	task@PLT
	movapd	xmm1, xmm0
	movsd	QWORD PTR 8[rsp], xmm0
	mov	r9d, 8
	mov	r8d, 1
	movsd	xmm0, QWORD PTR 32[rsp]
	mov	ecx, 8
	mov	edx, 1
	lea	rsi, .LC18[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	cmp	DWORD PTR 28[rsp], 1
	je	.L15
.L4:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L16
	mov	eax, 0
	add	rsp, 48
	pop	rbx
	pop	rbp
	pop	r12
	ret
.L12:
	lea	rdx, 32[rsp]
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC1[rip]
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	movsd	QWORD PTR 32[rsp], xmm0
	mov	ecx, 8
	mov	edx, 1
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	call	clock@PLT
	mov	r12, rax
	mov	ebx, 25000000
.L3:
	movsd	xmm2, QWORD PTR 32[rsp]
	mov	rax, QWORD PTR .LC3[rip]
	movq	xmm1, rax
	mov	rax, QWORD PTR .LC4[rip]
	movq	xmm0, rax
	call	task@PLT
	sub	ebx, 1
	jne	.L3
	call	clock@PLT
	mov	rdi, rax
	mov	rsi, r12
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edx, eax
	lea	rsi, .LC5[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	movsd	xmm2, QWORD PTR 32[rsp]
	movsd	xmm1, QWORD PTR .LC3[rip]
	movsd	xmm0, QWORD PTR .LC4[rip]
	call	task@PLT
	mov	rdi, QWORD PTR 8[rbp]
	mov	rcx, -1
	mov	eax, 0
	repnz scasb
	not	rcx
	sub	ecx, 3
	mov	edx, 1
	lea	rsi, .LC6[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	jmp	.L4
.L13:
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC7[rip]
	call	fopen@PLT
	mov	rbx, rax
	test	rax, rax
	je	.L17
	lea	rdx, 32[rsp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rdi, rbx
	call	fclose@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	movsd	QWORD PTR 32[rsp], xmm0
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC9[rip]
	call	fopen@PLT
	mov	rbx, rax
	movsd	xmm2, QWORD PTR 32[rsp]
	movsd	xmm1, QWORD PTR .LC3[rip]
	movsd	xmm0, QWORD PTR .LC4[rip]
	call	task@PLT
	mov	r8d, 8
	mov	ecx, 1
	lea	rdx, .LC10[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L4
.L17:
	lea	rdi, .LC8[rip]
	call	puts@PLT
	jmp	.L4
.L14:
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC13[rip]
	mulsd	xmm0, QWORD PTR .LC14[rip]
	addsd	xmm0, QWORD PTR .LC15[rip]
	movsd	QWORD PTR 32[rsp], xmm0
	jmp	.L8
.L15:
	lea	rsi, .LC9[rip]
	lea	rdi, .LC19[rip]
	call	fopen@PLT
	mov	rbx, rax
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rdx, .LC20[rip]
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	lea	rsi, .LC21[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L4
.L16:
	call	__stack_chk_fail@PLT
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
