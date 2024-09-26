section .data
	scan_fmt db " %ld", 0
	print_fmt db "Lowest element is %d", 10, 0
section .bss
	arr resq 5
section .text
	global main
main:
	extern printf
	extern scanf

	push rbp
	mov rbp, rsp

	mov rbx, 0
elem_send:

	cmp rbx, 5
	je null

	mov rax, 0
	mov rdi, scan_fmt
	lea rsi, [arr + rbx * 8]
	call scanf

	inc rbx
	jmp elem_send
	
null:
	mov rax, [arr]
	mov rbx, 0

getLowest:
	inc rbx
	cmp rbx, 5
	je exit
	
	cmp rax, [arr + rbx * 8]
	jg comp
	
	jmp getLowest

comp:
	mov rax, [arr + rbx * 8]
	jmp getLowest
exit:
	;mov rsi, rax
	;mov rax, 0
	mov rsi, rax
	mov rdi, print_fmt
	mov rax, 0
	call printf
	mov rsp, rbp
	pop rbp
	ret
