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
### double func(double x)
*			-

### double task(double x1, double x2, double epsilon)
* 		- mov	eax, DWORD PTR -24[rbp]
  		- movsx	rdx, eax
  		+ movsx	rdx, DWORD PTR -24[rbp]
  		И так 4 раза по функции


### double check_accuracy(double epsilon)
* 		-    

##    Регистры:
### double task(double x1, double x2, double epsilon)
* 		

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
