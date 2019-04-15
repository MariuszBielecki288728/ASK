
				
	.global insert_sort 				
	.type  insert_sort, @function 	
	.section .text
insert_sort: 	
	# rdi, rsi, rdx, rcx, r8, r9
	key = %rdx
	i_pos = %rcx
	j_pos = %r8
	first = %rdi
	last = %rsi
	aux = %r9

	mov first, i_pos
if_for:
	lea 8(i_pos), i_pos
	cmp i_pos, last
	jl exit_for
for:
	movq (i_pos), key
	lea -8(i_pos), j_pos
if_while:
	cmp first, j_pos
	jl if_for
	movq (j_pos), aux
	cmp aux, key
	jge if_for
while:
	movq aux, 8(j_pos)
	lea -8(j_pos), j_pos
	movq key, 8(j_pos)
	jmp if_while
exit_for:
	ret

	.size insert_sort, .-insert_sort 
