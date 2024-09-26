section .data
    scan_fmt dd " %d", 0
    one equ 1
    odd_print db "The number is odd", 10, 0
    even_print db "The number is even", 10, 0
    zero_print db "The number is neither even, nor odd", 10, 0
section .bss
    number resq 1
section .text
    
    global main
    extern scanf
    extern printf
main:

    push rbp
    mov rbp, rsp
    
    mov rax, 0
    mov rdi, scan_fmt
    mov esi, number
    call scanf


    mov rbx, [number]
    cmp rbx, 0
    je zero
    
    mov rbx, [number]
    AND rbx, one  ;rbx = rbx & 1
    cmp rbx, one  ;cmp 1, 1 
    je odd
    
    mov r8, [number]
    AND r8, one
    cmp rax, one
    jz even

zero:
    mov rax, 0
    mov rdi, zero_print
    call printf
    jmp end
even:
    mov rax, 0
    mov rdi, even_print
    call printf
    jmp end  

odd:
    mov rax, 0
    mov rdi, odd_print
    call printf
    jmp end

end:
    mov rsp, rbp
    pop rbp
    ret






