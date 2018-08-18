	.file	"filtro.c"
	.text
	.globl	multiplica
	.type	multiplica, @function
multiplica:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	multiplica, .-multiplica
	.section	.rodata
.LC0:
	.string	"Digite o tamanho do filtro: "
.LC1:
	.string	"%d"
.LC2:
	.string	"Digita alguma coisa mahhh!"
.LC3:
	.string	"r"
.LC4:
	.string	"sinal.txt"
.LC5:
	.string	"Error opening file! \n"
.LC6:
	.string	"%d "
.LC7:
	.string	"\n \t %d "
.LC8:
	.string	"Time elapsed: %.2f s \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$216, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time
	movq	%rax, -184(%rbp)
	movq	$0, -192(%rbp)
	movw	$3, -188(%rbp)
.L5:
	movl	$.LC0, %edi
	call	puts
	leaq	-192(%rbp), %rax
	movl	$6000, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	poll
	testl	%eax, %eax
	je	.L3
	leaq	-208(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	nop
	movl	$10, %edi
	call	putchar
	movl	-208(%rbp), %eax
	movl	$10, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -200(%rbp)
	movl	-208(%rbp), %eax
	movq	%rsp, %rdx
	movq	%rdx, %r13
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -176(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, -224(%rbp)
	movq	$0, -216(%rbp)
	cltq
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -168(%rbp)
	movl	-200(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -160(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -240(%rbp)
	movq	$0, -232(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -256(%rbp)
	movq	$0, -248(%rbp)
	cltq
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -152(%rbp)
	movl	$0, -204(%rbp)
	jmp	.L6
.L3:
	movl	$.LC2, %edi
	call	puts
	jmp	.L5
.L7:
	movl	-204(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	addl	$1, -204(%rbp)
.L6:
	movl	-208(%rbp), %eax
	cmpl	%eax, -204(%rbp)
	jl	.L7
	movl	$10, %edi
	call	putchar
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	call	fopen
	movq	%rax, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	.L8
	movl	$.LC5, %edi
	call	perror
	movl	$-1, %r12d
	movl	$0, %eax
	jmp	.L9
.L8:
	movl	$0, -204(%rbp)
	jmp	.L10
.L11:
	movq	-144(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	je	.L10
	movl	-204(%rbp), %ebx
	leal	1(%rbx), %eax
	movl	%eax, -204(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, %edx
	movslq	%ebx, %rax
	movl	%edx, -128(%rbp,%rax,4)
.L10:
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	feof
	testl	%eax, %eax
	je	.L11
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, -204(%rbp)
	jmp	.L12
.L13:
	movl	-204(%rbp), %eax
	cltq
	movl	-128(%rbp,%rax,4), %eax
	movl	%eax, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -204(%rbp)
.L12:
	cmpl	$9, -204(%rbp)
	jle	.L13
	movl	$10, %edi
	call	putchar
	movl	-208(%rbp), %ecx
	movq	-152(%rbp), %rdx
	movq	-168(%rbp), %rax
	movl	-200(%rbp), %edi
	leaq	-128(%rbp), %rsi
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	multiplica
	movl	$10, %edi
	call	putchar
	movl	$0, -204(%rbp)
	jmp	.L14
.L15:
	movq	-152(%rbp), %rax
	movl	-204(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -204(%rbp)
.L14:
	movl	-208(%rbp), %eax
	movl	$10, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	-204(%rbp), %eax
	jg	.L15
	movl	$0, %edi
	call	time
	movq	%rax, -136(%rbp)
	movq	-184(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	difftime
	cvtsd2ss	%xmm0, %xmm1
	movss	%xmm1, -196(%rbp)
	movl	$10, %edi
	call	putchar
	cvtss2sd	-196(%rbp), %xmm0
	movl	$.LC8, %edi
	movl	$1, %eax
	call	printf
	movl	$1, %eax
.L9:
	movq	%r13, %rsp
	cmpl	$1, %eax
	jne	.L18
	movl	$0, %r12d
.L18:
	movl	%r12d, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L19
	call	__stack_chk_fail
.L19:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
