# Модификация была произведена только вручнею

# __main_mod.s__

##    Бесполезные переприсваивания:
*		- mov	rax, QWORD PTR [rax]
		  lea	rdx, -64[rbp]
		  lea	rsi, .LC1[rip]
		- mov	rdi, rax
		+ mov rdi, QWORD PTR [rax]
*		- mov	rax, QWORD PTR -64[rbp]
		- movq	xmm0, rax
		+ movq	xmm0, QWORD PTR -64[rbp]
*		- mov	rdx, QWORD PTR -48[rbp]
		- mov	rax, QWORD PTR -56[rbp]
		- mov	rsi, rdx
		- mov	rdi, rax
		+ mov rsi, QWORD PTR -48[rbp]
		+ mov rdi, QWORD PTR -56[rbp]
*		- mov	eax, edx
		- mov	esi, eax
		+ mov esi, edx
*		- mov	rax, QWORD PTR [rax]
		- mov	rdi, rax
		+ mov rdi, QWORD PTR [rax]
*		- mov	rax, QWORD PTR [rax]
		  lea	rsi, .LC7[rip]
		- mov	rdi, rax
		+ mov rdi, QWORD PTR [rax]
*		- mov	rax, QWORD PTR -32[rbp]
		  lea	rsi, .LC1[rip]
		- mov	rdi, rax
		+ mov rdi, QWORD PTR -32[rbp]
*		- mov	rax, QWORD PTR -32[rbp]
		- mov	rdi, rax
		+ mov rdi, QWORD PTR -32[rbp]
*		- mov	rax, QWORD PTR [rax]
		  lea	rsi, .LC9[rip]
		- mov	rdi, rax
		+ mov rdi, QWORD PTR [rax]
*		- mov	rax, QWORD PTR -40[rbp]
		  mov	ecx, 8
		  mov	edx, 1
		  lea	rsi, .LC10[rip]
		- mov	rdi, rax
		+ mov rdi, QWORD PTR -40[rbp]
		Так 2 раза
*		- mov	rax, QWORD PTR .LC15[rip]
		  movapd	xmm1, xmm0
		  mov	r8d, 3
		  mov	ecx, 1
		- movq	xmm0, rax
		+ movq	xmm0, QWORD PTR .LC15[rip]
*		- mov	rax, QWORD PTR -64[rbp]
		- movq	xmm0, rax
		+ movq 	xmm0, QWORD PTR -64[rbp]
*		- movq	rax, xmm0
		- mov	QWORD PTR -16[rbp], rax
		+ mov	QWORD PTR -16[rbp], xmm0
*		- mov	rax, QWORD PTR -64[rbp]
		  movsd	xmm0, QWORD PTR -16[rbp]
		  movapd	xmm1, xmm0
		  mov	r8d, 8
		  mov	ecx, 1
		- movq	xmm0, rax
		+ movq	xmm0, QWORD PTR -64[rbp]
*		- mov	rax, QWORD PTR -24[rbp]
		- mov	rdi, rax
		Так 2 раза
##    Регистры:
* r12d => -4[rbp] = i в for

##    Просто удалено
      .section	.note.gnu.property,"a"
      .align 8
      .long	 1f - 0f
      .long	 4f - 1f
      .long	 5
    0:
      .string	 "GNU"
    1:
      .align 8
      .long	 0xc0000002
      .long	 3f - 2f
    2:
      .long	 0x3
    3:
      .align 8
    4:
    

# __lib_mod.s__
##    Бесполезные переприсваивания:

### double check_accuracy(double epsilon)
* 	- mov	rax, QWORD PTR -8[rbp]
	- movq	xmm0, rax
	+ movq	xmm0, QWORD PTR -8[rbp]
	Так 2 раза

##    Просто удалено
*     .section	.note.gnu.property,"a"
      .align 8
      .long	 1f - 0f
      .long	 4f - 1f
      .long	 5
    	0:
      	.string	 "GNU"
    	1:
      	.align 8
      	.long	 0xc0000002
      	.long	 3f - 2f
    	2:
      	.long	 0x3
    	3:
      	.align 8
    	4:
