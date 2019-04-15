	.global clz 				
	.type  clz, @function 	
	.section .text
clz: 	
	# rdi, rsi, rdx, r8, r8, r9
	#x>>32 == 0? x>>32+16 : x >> 32-16
	mov $32,%r9
	mov $32, %r8

	#edge case :/
	cmp $0, %rdi
	mov $64, %rax
	je RET

	
LOOP:
	

	mov %rdi, %rbx
	mov $64, %rcx
	sub %r8, %rcx
	shr %cl, %rbx

	shr %r9	
	
	cmp $0, %r9
	je FINAL
	
	
	cmp $0, %rbx
	jne SB
	jmp AD

AD:	add %r9, %r8
	jmp LOOP
SB:	sub %r9, %r8
	jmp LOOP

FINAL:
	cmp $0, %rbx
	mov %r8, %rax
	je RET
	lea -1(%r8), %rax
RET:
	ret
	
	.size clz, .-clz 
