section .data
	number dq 125, 10, 0
section .bss
	bit_1 resq 1
	bit_2 resq 1
	bit_3 resq 1
section .text
	global main
main:
	
	;xor rdx, rdx
	mov rax, [number] ; rax
	mov rcx, 10 ; rcx

	xor rdx, rdx ; rdx	
	div rcx ; RAX = RAX / RCX  -->  RDX = 5  -->  RAX = 12	
	add rdx, 48
	mov [bit_1], rdx

	xor rdx, rdx
	div rcx
	add rdx, 48
	mov [bit_2], rdx
	
	xor rdx, rdx
	div rcx
	add rdx, 48
	mov [bit_3], rdx
	
	xor rdx, rdx
	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, bit_3
	mov rdx, 1
	syscall
	
	xor rdx, rdx
	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, bit_2
	mov rdx, 1
	syscall
	
	xor rdx, rdx
	mov rax, 1 ; write
	mov rdi, 1 ; stdout
	mov rsi, bit_1
	mov rdx, 1
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
