section .data
	i dq 1
	res_print dd "%d ", 10, 0
section .bss
	result resq 1
section .text
	global main
	extern printf
main:
	push rbp
	mov rbp, rsp
	
	mov rbx, [i]

comp:
	mov [result], rbx
	cmp rbx, 100
	jl res

res:
	mov rax, 0
	mov edi, res_print
	mov rsi, qword[result]
	call printf

	add rbx, 2
	cmp rbx, 100
	jl comp

	mov rsp, rbp
	pop rbp
        mov rax, 0
        syscall
	ret 
