section .data
	scan_fmt db " %d %d %d", 0
	print_fmt db "Result is %d", 10, 0
section .bss
	x resq 1
	y resq 1
	z resq 1
section .text
	global main
	extern printf
	extern scanf
main:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rdi, scan_fmt
	mov rsi, x
	mov rdx, y
	mov rcx, z
	call scanf
	
	mov rax, [x]
	mov rbx, [y]
	
	call adder
	mov rbx, [z]
	call adder

	mov rsi, rax
	mov rax, 0
	mov rdi, print_fmt
	call printf

	mov rsp, rbp
	pop rbp
	ret

	global adder
adder:
	push rbp
	mov rbp, rsp

	add rax, rbx

	mov rsp, rbp
	pop rbp
	ret
