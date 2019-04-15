	.section .rodata
	scale: .double 0.5			
	.global approx_sqrt 				
	.type  approx_sqrt, @function
	.section .text
	 	
approx_sqrt: 

	x = %xmm0
	epsilon = %xmm1
	x_n = %xmm3
	x_n_ = %xmm4
	# xmm0, xmm1	ret to xmm0:xmm1
	movsd x, %xmm3
	mulsd epsilon, epsilon

LOOP:
	movsd x, %xmm2
	divsd x_n, %xmm2
	addsd x_n, %xmm2
	mulsd scale, %xmm2
	movsd x_n, x_n_
	movsd %xmm2, x_n

LOOP_COND:
	subsd x_n, x_n_ #%xmm4
	mulsd %xmm4, %xmm4
	ucomisd epsilon, %xmm4
	ja LOOP 
	
	movsd %xmm3, %xmm0
	ret


	.size approx_sqrt, .-approx_sqrt

