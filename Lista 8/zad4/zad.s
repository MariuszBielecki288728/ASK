	.global fibonacci 				
	.type  fibonacci, @function 
	.section .text	
fibonacci: 	
	push %rbp
	mov %rsp, %rbp
	# rdi, rsi, rdx, rcx, r8, r9
	cmp $0, %rdi
	jne base_2
	mov $0, %rax
	jmp RET
	ret
base_2:
	cmp $1, %rdi
	jne step
	mov $1, %rax
	jmp RET
	ret
step:
	
	push %rdi
	dec %rdi
	call fibonacci
	pop %rdi

	push %rax
	push %rdi
	lea -2(%rdi), %rdi
	call fibonacci
	pop %rdi
	pop %r9

	add %r9, %rax
RET:
	mov %rbp, %rsp
	pop %rbp
	ret


	.size fibonacci, .-fibonacci 
