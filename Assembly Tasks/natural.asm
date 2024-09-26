section .data
	print_natural db "The number is natural", 10, 0
	print_not db "The number is not natural", 10, 0
	scan_fmt db " %d", 0
section .bss
	number resq 1
section .text
	global main
	extern printf
	extern scanf
main:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rdi, scan_fmt
	mov rsi, number
	call scanf

	

	mov rcx, [number]
	;sub rcx, 1

	cmp rcx, 1
	je print
	cmp rcx, 2
	je print
	sub rcx, 1

comp:
	mov rdx, 0

	mov rax, [number]
	div rcx ; rax = rax / rcx --> number = number / number -1
	cmp rdx, 0
	je notNat
	dec rcx
	cmp rcx, 1
	je print
	jmp comp
	
notNat:
	mov rax, 0
	mov rdi, print_not
	call printf
	jmp exit
	
print:
	mov rax, 0
	mov rdi, print_natural
	call printf
exit:	
	mov rsp, rbp
	pop rbp
	mov rax, 0
	ret


