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
.LC16:
	.string	"Input epsilon: (%*.*lf <= value <= %*.*lf):"
	.align 8
.LC17:
	.string	"Epsilon: %*.*lf\nResult: x = %*.*lf\n"
	.section	.rodata.str1.1
.LC18:
	.string	"random_out.txt"
.LC19:
	.string	"%lf\n"
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Also the result was added to \"random_out.txt\"."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r12
	push	rbp
	mov	rbp, rsi
	push	rbx
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	mov	QWORD PTR 32[rsp], 0x000000000
	cmp	edi, 2
	je	.L13
	cmp	edi, 3
	je	.L14
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
	je	.L15
	mov	edi, 1
	mov	r9d, 3
	mov	ecx, 8
	movsd	xmm1, QWORD PTR .LC15[rip]
	mov	r8d, 1
	mov	edx, 1
	mov	eax, 2
	movsd	xmm0, QWORD PTR .LC14[rip]
	lea	rsi, .LC16[rip]
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
	movsd	QWORD PTR 8[rsp], xmm0
	movsd	xmm0, QWORD PTR 32[rsp]
	mov	edx, 1
	lea	rsi, .LC17[rip]
	mov	edi, 1
	mov	eax, 2
	call	__printf_chk@PLT
	cmp	DWORD PTR 28[rsp], 1
	je	.L16
.L4:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L17
	add	rsp, 48
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	ret
.L14:
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC7[rip]
	call	fopen@PLT
	mov	r12, rax
	test	rax, rax
	je	.L18
	lea	rdx, 32[rsp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rdi, r12
	call	fclose@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	mov	rdi, QWORD PTR 16[rbp]
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
	mov	ecx, 1
	lea	rdx, .LC10[rip]
	mov	esi, 1
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L15:
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mulsd	xmm0, QWORD PTR .LC13[rip]
	addsd	xmm0, QWORD PTR .LC14[rip]
	movsd	QWORD PTR 32[rsp], xmm0
	jmp	.L8
.L16:
	lea	rsi, .LC9[rip]
	lea	rdi, .LC18[rip]
	call	fopen@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	mov	esi, 1
	lea	rdx, .LC19[rip]
	mov	rbp, rax
	mov	rdi, rax
	mov	eax, 1
	movapd	xmm0, xmm1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	lea	rsi, .LC20[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L4
.L13:
	mov	rdi, QWORD PTR 8[rsi]
	lea	rdx, 32[rsp]
	lea	rsi, .LC1[rip]
	mov	ebx, 25000000
	call	__isoc99_sscanf@PLT
	movsd	xmm0, QWORD PTR 32[rsp]
	call	check_accuracy@PLT
	mov	ecx, 8
	mov	edx, 1
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 1
	movsd	QWORD PTR 32[rsp], xmm0
	call	__printf_chk@PLT
	call	clock@PLT
	mov	r12, rax
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rax, QWORD PTR .LC3[rip]
	movsd	xmm2, QWORD PTR 32[rsp]
	movq	xmm1, rax
	mov	rax, QWORD PTR .LC4[rip]
	movq	xmm0, rax
	call	task@PLT
	sub	ebx, 1
	jne	.L3
	call	clock@PLT
	mov	rsi, r12
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
	mov	rdi, QWORD PTR 8[rbp]
	xor	eax, eax
	or	rcx, -1
	mov	edx, 1
	lea	rsi, .LC6[rip]
	repnz scasb
	mov	edi, 1
	mov	eax, 1
	not	rcx
	sub	ecx, 3
	call	__printf_chk@PLT
	jmp	.L4
.L18:
	lea	rdi, .LC8[rip]
	call	puts@PLT
	jmp	.L4
.L17:
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
	.long	374013290
	.long	1029726787
	.align 8
.LC14:
	.long	3794832442
	.long	1044740494
	.align 8
.LC15:
	.long	3539053052
	.long	1062232653
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
