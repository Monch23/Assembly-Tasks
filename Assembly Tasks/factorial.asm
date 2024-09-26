section .data
	a dq 5
	i dq 1
	res_print db "%d", 10, 0
section .text
	global main
	extern printf
main:
	push rbp
	mov rbp, rsp
	mov rax, 0
    
    xor rbx, rbx
    xor rdx, rdx

    mov rax, [a]
    mov rbx, [i]

cmp:
    cmp rbx, 5
    je end
    mul rbx
    inc rbx
    jmp cmp

end:
	mov rsi, rax
	mov rax, 0
	mov rdi, res_print
	call printf

	mov rsp, rbp
	pop rbp
	ret
