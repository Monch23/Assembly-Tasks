section .data
	print_fmt db "The number is Armstrong number", 10, 0
    print_fmt_false db "The number is not an Armstrong number", 10, 0

	scan_fmt db " %d", 0
section .bss
	number resq 1
    digit_count resq 1
    arr resq 10
section .text
	global main
	extern scanf
	extern printf

main:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rdi, scan_fmt
	mov rsi, number
	call scanf

	mov rax, [number]
    mov rbx, 0
    mov rcx, 10

getPow:
	inc rbx
	mov rdx, 0	
	div rcx
    mov [arr + rbx * 8 - 8], rdx
	cmp rax, 0
	jg getPow
    ;jmp print
    mov [digit_count], rbx
    
    mov r10, 0
    
    mov rcx, [digit_count]

adder:
     mov rdi, [arr + rcx * 8 - 8]
     call power

     add r10, rax
     loop adder
        
print:
    cmp r10, [number]
    jne false
    
true:
	mov rax, 0
	mov rdi, print_fmt
	mov rsi, r10
	call printf
    jmp exit

false:
    mov rax, 0
    mov rdi, print_fmt_false
    call printf
exit:
	mov rsp, rbp
	pop rbp
	ret

    global power
power:

    push rbp
    mov rbp, rsp

    mov r11, rcx

    mov rcx, [digit_count]   
    mov rax, 1
mult:
    
    mul rdi
    loop mult
    add rcx, r11
    mov rsp, rbp
    pop rbp
    ret


