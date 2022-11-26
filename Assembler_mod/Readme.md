# Модификация была произведена только вручнею

# __main_mod.s__

##    Бесполезные переприсваивания:
*		- mov	rax, QWORD PTR [rax]
		- mov	rsi, rax
		+ mov	rsi, QWORD PTR [rax]


##    Регистры:
* 

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
* 	- mov	rax, QWORD PTR stdin[rip]
	  - mov	rdi, rax
    + mov rdi, QWORD PTR stdin[rip]
*   - mov	rax, QWORD PTR -8[rbp]
    - movq	xmm0, rax
    + movq	xmm0, QWORD PTR -8[rbp]
    Так 2 раза

##    Регистры:
### double task(double x1, double x2, double epsilon)
* 	r12d => -4[rbp] = i в for

### double check_accuracy(double epsilon)
* 		

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
