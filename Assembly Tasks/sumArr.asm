section .data
	arr dq 1, 2, 3, 4, 5
	size equ ( $ - arr ) / 8
	print_fmt db "result = %d", 10, 0
section .text

	global main
main:
	extern printf

	push rbp
	mov rbp, rsp

	mov rcx, 0 ; incriment
	mov rsi, arr ; src to array's first element
	mov rbx, 0 ; accumulator

addition:

	cmp rcx, size
	jge exit
	add rbx, [rsi + rcx * 8]
	inc rcx
	jmp addition

exit:
	mov rax, 0
	mov rdi, print_fmt
	mov rsi, rbx
	call printf

	mov rsp, rbp
	pop rbp
	xor rax, rax
	ret
