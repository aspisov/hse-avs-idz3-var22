	.file	"main3.c"
	.intel_syntax noprefix
	.text
	.globl	find_pi
	.type	find_pi, @function
find_pi:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	movsd	QWORD PTR -24[rbp], xmm0	# zeta
	movsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1
	movq	xmm0, rax
	call	sqrt@PLT	# Вызываю функцию sqrt с zeta * 6 в xmm0
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax	# локальная переменная pi
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret	# возврат
	.size	find_pi, .-find_pi
	.section	.rodata
	.align 8
.LC1:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\202\320\276\321\207\320\275\320\276\321\201\321\202\321\214 (\320\274\320\260\321\201\320\270\320\274\320\260\320\273\321\214\320\275\320\260\321\217 \321\202\320\276\321\207\320\275\320\276\321\201\321\202\321\214 0.000001): "
.LC2:
	.string	"%lf"
.LC7:
	.string	"%lf\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT	# Вызываю функцию printf с константой в rdi
	lea	rax, -32[rbp]	# &accuracy
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT	# Вызываю функцию scanf с константой в rdi и с адресом переменной в rsi
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0	# zeta
	mov	QWORD PTR -16[rbp], 1	# i
	jmp	.L4
.L8:
	mov	rax, QWORD PTR -16[rbp]	
	imul	rax, rax
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	movsd	xmm0, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -24[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	call	find_pi    # Вызываю функцию find_pi с zeta в xmm0, результат в xmm0
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC5[rip]	# PI
	subsd	xmm0, xmm1
	movq	xmm1, QWORD PTR .LC6[rip]
	andpd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]	# accuracy
	comisd	xmm0, xmm1
	ja	.L11
	add	QWORD PTR -16[rbp], 1
.L4:
	cmp	QWORD PTR -16[rbp], 999999
	jle	.L8
	jmp	.L7
.L11:
	nop
.L7:
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	call	find_pi    # Вызываю функцию find_pi с zeta в xmm0, результат в xmm0
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT	# Вызываю функцию printf с константой в rdi и результатом find_pi в xmm0
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1075314688
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	1413754136
	.long	1074340347
	.align 16
.LC6:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
