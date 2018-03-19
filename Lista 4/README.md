# ASK: Lista 4

## Zadanie 1
Poniżej podano wartości typu long leżące pod wskazanymi adresami i w rejestrach:

| Adres | Wartość | Rejestr | Wartość |
| ----- | :-----: | ------- | :-----: |
| 0x100 | 0xFF    | %rax    | 0x100   |
| 0x108 | 0xAB    | %rcx    | 1       |
| 0x110 | 0x13    | %rdx    | 3       |
| 0x118 | 0x11    |

Oblicz wartość poniższych operandów:

1. %rax  
 `R[%rax] => 0x100`
2. 0x110  
 `M[0x110] => 0x13`
3. $0x108  
 `0x108`
4. (%rax)  
 `M[R[%rax]] => 0xFF`
5. 8(%rax)  
 `M[8 + R[%rax]] => 0xAB`
6. 21(%rax,%rdx)  
 `M[0x015 + R[%rax] + R[%rdx]] => 0x11`
7. 0xFC(,%rcx,4)  
 `M[0x0FC + R[%rcx]*4] => M[0x100] => 0xFF`
8. (%rax,%rdx,8)  
 `M[R[%rax]+R[%rdx]*8] => M[0x100+0x018] => 0x11`
9. 265(%rcx,%rdx,2)  
 `M[0x101+R[%rcx]+R[%rdx]*2] => 0xAB`

## Zadanie 2
Każdą z poniższych instrukcji wykonujemy w stanie maszyny opisanym tabelką z zadania 1.
Wskaż miejsce, w którym zostanie umieszczony wynik działania instrukcji, oraz obliczoną wartość

1. addq %rcx, (%rax)  
 `0x100 => M[0x100]`
2. subq 16(%rax), %rdx  
 `0x010 => R[%rdx]`
3. shrq $4, %rax  
 `0x010 => R[%rax]`
4. incq 16(%rax)  
 `0x14 => M[0x110]`
5. decq %rcx  
 `0x0 => R[%rcx]`
6. imulq 8(%rax)  
 `0xAB00 => R[%rdx]:R[%rax]`
7. leaq 7(%rcx,%rcx,8), %rdx

 ```C
 7 + R[%rcx] + R[%rcx]*8 => R[%rdx]
 0x010 => R[%rdx]
 ```

8. leaq 0xA(,%rdx,4), %rdx  

 ```C
 0xA + R[%rdx]*4 => R[%rdx]
 0x16 => R[%rdx]
 ```

## Zadanie 3
Zaimplementuj w asemblerze x86-64 funkcję konwertującą liczbę typu « uint32_t » między formatem little-endian i big-endian . Argument funkcji jest przekazany w rejestrze %edi, a wynik zwracany w rejestrze %eax

```C
ror  $8, %dx
ror  $16, %edx
ror  $8, %dx
mov  %edx, %eax
```

Podaj wyrażenie w języku C, które kompilator optymalizujący przetłumaczy do instrukcji ror lub rol.

```C
unsigned long lrotl(unsigned int value,unsigned int rotation)
{
return (value<<rotation) | (value>>(32 - rotation));
}
```

>gcc -S -Og prog.c

```assembly
lrotl:
.LFB0:
    .cfi_startproc
    movl    %edi, %eax
    movl    %esi, %ecx
    roll    %cl, %eax
    ret
    .cfi_endproc
.LFE0:
    .size    lrotl, .-lrotl
    .globl   main
    .type    main, @function
```

## Zadanie 4

Zaimplementuj w asemblerze x86-64 funkcję liczącą wyrażenie « x + y ». Argumenty i wynik funkcji są 128-bitowymi liczbami całkowitymi ze znakiem i nie mieszczą się w rejestrach maszynowych. Zatem « x » jest przekazywany przez rejestry %rdi (starsze 64 bity) i %rsi (młodsze 64 bity), analogicznie argument « y » jest przekazywany przez %rdx i %rcx , a wynik jest zwracany w rejestrach %rdx i %rax . Należy użyć instrukcji set!

```C
add   %rsi, %rcx
setc  %rbx
add   %rdi, %rdx
add   %rbx, %rdx
mov   %rcx, %rax
```

Jak uprościłby się kod, gdyby można było użyć instrukcji adc ?

```C
add   %rsi, %rcx
adc   %rdi, %rdx
mov   %rcx, %rax
```

