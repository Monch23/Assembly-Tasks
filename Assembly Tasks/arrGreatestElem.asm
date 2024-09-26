section .data
	arr dq 12345, 200, 1230, 6666, 5
	size equ ( $ - arr ) / 8
	print_fmt db "Greatest value of array is %d", 10, 0
section .text
	global main
main:
	extern printf

	push rbp
	mov rbp, rsp

	mov rcx, 0 ; int i = 1
	mov r8, [ arr ] ; max = arr [ 0 ]
comp:
	inc rcx
	cmp rcx, size ; i < size
	je exit

	cmp r8, [arr + rcx * 8]
	jl change
	jmp comp

change:
	mov r8, [arr + rcx * 8]
	jmp comp
exit:
	mov rax, 0
	mov rdi, print_fmt
	mov rsi, r8 ;result
	call printf
	
	mov rsp, rbp
	pop rbp
	ret
