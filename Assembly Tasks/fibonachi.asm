section .data
	index_print db "Input index -->", 10, 0
	scan_fmt db " %d", 0
	print_fmt db "The value of the inputed index is %d", 10, 0
section .bss
	number resq 1
section .text
	global main
main:
	extern scanf
	extern printf
	
	push rbp
	mov rbp, rsp
	
	mov rax, 0
	mov rdi, index_print
	call printf

	mov rax, 0
	mov rdi, scan_fmt
	mov rsi, number
	call scanf

zero:
	mov rcx, 0
	cmp rcx, [number]
	je print_zero	

	mov rbx, 1 ; a2
	mov rax, 0 ; a1
	mov rcx, 2 ; i
	mov rdx, 0 ; b

fib:
	cmp rcx, [number]
	jge print

	mov rdx, rax ; b = a1
	mov rax, rbx ; a1 = a2
	mov rbx, rax
	add rbx, rdx
	
	inc rcx
	jmp fib
	
print:
	add rax, rbx
	mov rsi, rax
	mov rdi, print_fmt
	call printf
	jmp exit
print_zero:
	mov rax, 0
	mov rdi, print_fmt
	mov rsi, 0
	call printf
	


exit:
	mov rsp, rbp
	pop rbp
	mov rax, 0
	ret
