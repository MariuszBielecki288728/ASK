	.global lcm_gcd 				
	.type  lcm_gcd, @function 	
	.section .text
lcm_gcd: 	
	# rdi, rsi, rdx, rcx, r8, r9
	mov %rdi, %r8
	mov %rsi, %r9
if:
	cmp $0, %rsi
	je gcd_end

loop:	# euclides
	mov %rdi, %rax
	mov $0, %rdx
	div %rsi
	mov %rsi, %rdi
	mov %rdx, %rsi
	jmp if

gcd_end:
	mov %r8, %rax
	mov $0, %rdx
	div %rdi
	mul %r9 # lcm = (a*b)/gcd(a,b)
	mov %rdi, %rdx
	ret

	.size lcm_gcd, .-lcm_gcd 
