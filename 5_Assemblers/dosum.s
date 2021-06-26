        .section ".rodata"

## string for format
scanfFormat:
	.asciz "%d"

printfFormat:
        .asciz "%d\n"
### --------------------------------------------------------------------

        .section ".data"

### --------------------------------------------------------------------

        .section ".bss"

### --------------------------------------------------------------------

	.section ".text"
    .equ IMIN, -4
    .equ IMAX, -8
	.globl  main
	.type   main,@function

main:

	pushl   %ebp
	movl    %esp, %ebp

input:
    subl    $4, %esp
    subl    $4, %esp
    leal    IMIN(%ebp), %eax
    pushl   %eax
    pushl   $scanfFormat
    call    scanf
    addl    $8, %esp
    
    leal    IMAX(%ebp), %eax
    pushl   %eax
    pushl   $scanfFormat
    call    scanf
    addl    $8, %esp

    pushl   IMIN(%ebp)
    pushl   IMAX(%ebp)
    call    sum
    addl    $8, %esp

    pushl   %eax
    pushl   $printfFormat
    call    printf

    add     $8, %esp
    
    movl    $0, %eax
	movl    %ebp, %esp
	popl    %ebp
	ret

sum:
        pushl   %ebp
        movl    %esp, %ebp

        ## get parameter
        movl    8(%esp), %eax
        movl    12(%esp), %ebx
        
        ## make min in %eax, max in %ebx
        cmpl    %ebx, %eax
        jle     aismin

        ## when %eax >= %ebx -> swap
        movl    %eax, %edx
        movl    %ebx, %eax
        movl    %edx, %ebx

        ## initialize i to %ecx, sum to %edx
        movl    %eax, %ecx
        movl    $0, %edx
        jmp     sumloop

sumloop:
        ## keep in loop only i <= max(a,b)
        cmpl    %ebx, %ecx
        jg      endloop

        ## sum += i
        addl    %ecx, %edx

        incl    %ecx
        jmp     sumloop

endloop:
        movl    %edx, %eax
        movl    %ebp, %esp
        popl    %ebp
        ret

aismin:
        movl    %eax, %ecx
        movl    $0, %edx
        jmp     sumloop
