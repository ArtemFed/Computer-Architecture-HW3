# Модификация была произведена только вручнею

# __main_mod.s__

##    Бесполезные переприсваивания:
*		- mov	rax, QWORD PTR [rax]
		- mov	rsi, rax
		+ mov	rsi, QWORD PTR [rax]
		И так 3 раза по файлу
*		- mov	rax, QWORD PTR [rax]
		- mov	rdi, rax
		+ mov	rdi, QWORD PTR [rax]
*		- mov	rdx, QWORD PTR -32[rbp]
		- mov	rax, QWORD PTR -40[rbp]
		- mov	rsi, rdx
		- mov	rdi, rax
		+ mov	rsi, QWORD PTR -32[rbp]
		+ mov	rdi, QWORD PTR -40[rbp]
* 		- mov	eax, edx
  		- mov	esi, eax
  		+ mov	esi, edx
* 		- mov	rax, QWORD PTR -16[rbp]
  		- mov	rdi, rax
  		+ mov rdi, QWORD PTR -16[rbp]
* 		- mov	rax, QWORD PTR -24[rbp]
  		- mov	rdi, rax
  		+ mov rdi, QWORD PTR -24[rbp]
* 		- mov	eax, DWORD PTR -48[rbp]
  		- mov	esi, eax
  		+ mov esi, DWORD PTR -48[rbp]
* 		- mov	eax, DWORD PTR -48[rbp]
  		- mov	edi, eax
  		+ mov edi, DWORD PTR -48[rbp]

##    Регистры:
* DWORD PTR -4[rbp] => r13d

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
### int task(const char *str)
* 		- mov	eax, DWORD PTR -24[rbp]
  		- movsx	rdx, eax
  		+ movsx	rdx, DWORD PTR -24[rbp]
  		И так 4 раза по функции
* 		- mov	eax, DWORD PTR -40[rbp]
  		- mov	esi, eax
  		+ mov	rdi, DWORD PTR -40[rbp]

### int task_random(int length)
* 		- sub	eax, edx
  		- mov	edx, eax
  		- mov	eax, edx
  		- add	eax, 33
  		- mov	edx, eax
  		+ add	edx, 33      

##    Регистры:
### int task(const char *str)
* 		DWORD PTR -24[rbp] => r12d

### int task_random(int length)
* 		DWORD PTR -4[rbp] => r12d

##    Просто удалено
* 		cdq, cdqe и endbr64
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
