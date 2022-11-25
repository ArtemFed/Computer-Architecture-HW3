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
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	DWORD PTR -84[rbp], edi	# argc, argc
	mov	QWORD PTR -96[rbp], rsi	# argv, argv
# ./main.c:17:     double epsilon = 0;
	pxor	xmm0, xmm0
	movsd	QWORD PTR -64[rbp], xmm0	# epsilon
# ./main.c:18:     if (argc == 2) {
	cmp	DWORD PTR -84[rbp], 2
	jne	.L2
# ./main.c:19:         sscanf(argv[1], "%lf", &epsilon);
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	# mov	rax, QWORD PTR [rax]
	lea	rdx, -64[rbp]
	lea	rsi, .LC1[rip]
	# mov	rdi, rax
	mov	rdi, QWORD PTR [rax]
	mov	eax, 0
	call	__isoc99_sscanf@PLT
# ./main.c:20:         epsilon = check_accuracy(epsilon);
	# mov	rax, QWORD PTR -64[rbp]
	# movq	xmm0, rax
	movq	xmm0, QWORD PTR -64[rbp]
	call	check_accuracy@PLT
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax	# epsilon init
# ./main.c:21:         printf("Epsilon: %*.*lf", 1, 8, epsilon);
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	mov	edx, 8
	mov	esi, 1
	lea	rdi, .LC2[rip]
	mov	eax, 1
	call	printf@PLT
# ./main.c:23:         time_t t_start = clock();
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax # t_start init
# ./main.c:24:         for (int i = 0; i < 10000000; ++i) {
	mov	DWORD PTR -4[rbp], 0	# i = 0
	jmp	.L3
.L4:
# ./main.c:25:             task(a, b, epsilon);
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
# ./main.c:24:         for (int i = 0; i < 10000000; ++i) {
	add	DWORD PTR -4[rbp], 1	# ++i
.L3:
	cmp	DWORD PTR -4[rbp], 9999999
	jle	.L4
# ./main.c:27:         time_t t_end = clock();
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax	# t_end init
# ./main.c:29:         printf("\nTime: %d ms", (int) (difftime(t_end, t_start)) / 1000);
	mov rsi, QWORD PTR -48[rbp]
	mov rdi, QWORD PTR -56[rbp]
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov esi, edx
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:30:         printf("\nResult: x =  %*.*lf\n", 1, ((int) strlen(argv[1])) - 2 , task(a, b, epsilon));
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	movsd	QWORD PTR -104[rbp], xmm0 # %sfp
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov rdi, QWORD PTR [rax]
	call	strlen@PLT
	sub	eax, 2
	movsd	xmm0, QWORD PTR -104[rbp]
	mov	edx, eax
	mov	esi, 1
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
# ./main.c:31:         return 0;
	mov	eax, 0
	jmp	.L11
.L2:
# ./main.c:34:     if (argc == 3) {
	cmp	DWORD PTR -84[rbp], 3
	jne	.L6
# ./main.c:35:         FILE *input_stream = fopen(argv[1], "r");
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	# mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	# mov	rdi, rax
	mov rdi, QWORD PTR [rax]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax	# input_stream init
# ./main.c:36:         if (input_stream == NULL) {
	cmp	QWORD PTR -32[rbp], 0
	jne	.L7
# ./main.c:37:             printf("Error opening file!\n");
	lea	rdi, .LC8[rip]
	call	puts@PLT
# ./main.c:38:             return 0;
	mov	eax, 0
	jmp	.L11
.L7:
# ./main.c:40:         fscanf(input_stream, "%lf", &epsilon);
	lea	rdx, -64[rbp]
	# mov	rax, QWORD PTR -32[rbp]
	lea	rsi, .LC1[rip]
	# mov	rdi, rax
	mov rdi, QWORD PTR -32[rbp]
	mov	eax, 0
	call	__isoc99_fscanf@PLT
# ./main.c:41:         fclose(input_stream);
	mov rdi, QWORD PTR -32[rbp]
	call	fclose@PLT
# ./main.c:43:         epsilon = check_accuracy(epsilon);
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rax
	call	check_accuracy@PLT
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax	# epsilon init
# ./main.c:45:         FILE *output_stream = fopen(argv[2], "w");
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	# mov	rax, QWORD PTR [rax]
	lea	rsi, .LC9[rip]
	# mov	rdi, rax
	mov rdi, QWORD PTR [rax]
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax	# output_stream init
# ./main.c:46:         fprintf(output_stream, "%*.*lf\n", 1, 8, task(a, b, epsilon));
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	mov	ecx, 8
	mov	edx, 1
	lea	rsi, .LC10[rip]
	mov	rdi, QWORD PTR -40[rbp]
	mov	eax, 1
	call	fprintf@PLT
# ./main.c:47:         fclose(output_stream);
	mov	rdi, QWORD PTR -40[rbp]
	call	fclose@PLT
# ./main.c:48:         return 0;
	mov	eax, 0
	jmp	.L11
.L6:
# ./main.c:50:     printf("Random input or Direct (ans: 1, !=1):");
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
# ./main.c:51:     int answer = 0;
	mov	DWORD PTR -68[rbp], 0	# answer = 0 init
# ./main.c:52:     scanf("%d", &answer);
	lea	rax, -68[rbp]
	mov	rsi, rax
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
# ./main.c:54:     if (answer == 1) {
	mov	eax, DWORD PTR -68[rbp]	# answer.6_25, answer
	cmp	eax, 1
	jne	.L8
# ./main.c:55:         srand(clock());
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
# ./main.c:56:         epsilon = (double) (rand()) / RAND_MAX * (0.001 - 0.00000001) + 0.00000001;
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
# ./main.c:59:         printf("Input epsilon: (%*.*lf <= value <= %*.*lf):", 1, 8, min_size, 1, 3, max_size);
	movsd	xmm0, QWORD PTR .LC16[rip]
	# mov	rax, QWORD PTR .LC15[rip]
	movapd	xmm1, xmm0
	mov	r8d, 3
	mov	ecx, 1
	# movq	xmm0, rax
	movq	xmm0, QWORD PTR .LC15[rip]
	mov	edx, 8
	mov	esi, 1
	lea	rdi, .LC17[rip]
	mov	eax, 2
	call	printf@PLT
# ./main.c:60:         scanf("%lf", &epsilon);
	lea	rax, -64[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L9:
# ./main.c:62:     epsilon = check_accuracy(epsilon);
	# mov	rax, QWORD PTR -64[rbp]
	# movq	xmm0, rax
	movq	xmm0, QWORD PTR -64[rbp]
	call	check_accuracy@PLT
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax	# epsilon re init
# ./main.c:63:     double result = task(a, b, epsilon);
	movsd	xmm1, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rax, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	task@PLT
	# movq	rax, xmm0
	# mov	QWORD PTR -16[rbp], rax	# result init
	mov	QWORD PTR -16[rbp], xmm0	# result init
# ./main.c:64:     printf("Epsilon: %*.*lf\nResult: x = %*.*lf\n", 1, 8, epsilon, 1, 8, result);
	# mov	rax, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR -16[rbp]
	movapd	xmm1, xmm0
	mov	r8d, 8
	mov	ecx, 1
	# movq	xmm0, rax
	movq	xmm0, QWORD PTR -64[rbp]
	mov	edx, 8
	mov	esi, 1
	lea	rdi, .LC18[rip]
	mov	eax, 2
	call	printf@PLT
# ./main.c:65:     if (answer == 1) {
	mov	eax, DWORD PTR -68[rbp]
	cmp	eax, 1
	jne	.L10
# ./main.c:66:         FILE *rand_out_stream = fopen("random_out.txt", "w");
	lea	rsi, .LC9[rip]
	lea	rdi, .LC19[rip]
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax	# rand_out_stream init
# ./main.c:67:         fprintf(rand_out_stream, "%lf\n", result);
	mov	rdx, QWORD PTR -16[rbp]
	# mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC20[rip]
	# mov	rdi, rax
	mov	rdi, QWORD PTR -24[rbp]
	mov	eax, 1
	call	fprintf@PLT
# ./main.c:68:         fclose(rand_out_stream);
	mov	rdi, QWORD PTR -24[rbp]
	call	fclose@PLT
# ./main.c:69:         printf("Also the result was added to \"random_out.txt\".");
	lea	rdi, .LC21[rip]
	mov	eax, 0
	call	printf@PLT
.L10:
# ./main.c:71:     return 0;
	mov	eax, 0
.L11:
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
	