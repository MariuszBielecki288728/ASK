        .global _start

read = 0
write = 1
exit  = 60
        
        .section .text
_start:
        # read(0, const void *buf, size_t count)
read_:
        mov     $read,%rax
        mov     $0,%rdi
        mov     $buff,%rsi
        mov     $1,%rdx
        syscall
        cmp $0, %rax
        je exit_

        mov (buff), %r8
        cmp $92, %r8
        jle big_to_small
        jg small_to_big

big_to_small:
        cmp $64, %r8
        jle write_
        cmp $91, %r8
        jge write_
        add $32, %r8
        jmp write_
small_to_big:
        cmp $96, %r8
        jle write_
        cmp $123, %r8
        jge write_
        add $-32, %r8
write_:
        mov %r8, (buff)
        mov $write, %rax
        mov $1, %rdi
        mov $buff, %rsi
        mov $1, %rdx
        syscall
        jmp read_

exit_:
        mov     $exit, %rax
        mov     $1, %rdi
        syscall

        .section .bss
        .lcomm buff 1
