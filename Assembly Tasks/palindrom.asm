section .rodata
	scan_fmt db "%d", 0
	print_fmt_pal db "%d is palindrom number", 10 , 0
	print_fmt_nopal db "%d is not a palindrom number", 10 , 0

section .text
	global main
	extern printf
	extern scanf
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	
	mov rax, 0
	mov rdi, scan_fmt
	lea rsi, [rbp - 16]
	call scanf

	mov rax, [rbp - 16]
	call digitGetter
	
	cmp r8, r10
	jne print_nopal	
print:
	mov rax, 0
	mov rdi, print_fmt_pal
	call printf
	jmp exit
print_nopal:
	mov rax, 0
	mov rdi, print_fmt_nopal
	call printf
exit:
	add rsp, 16
	pop rbp
	ret

	global digitGetter
digitGetter:

	push rbp
	mov rbp, rsp
	
	mov rcx, 10
	mov rdx, 0
	div rcx
	mov dword[rbp - 12], edx
	movsx r8, dword[rbp - 12]

	mov rdx, 0
	div rcx
	mov dword[rbp - 8], edx
	movsx r9, dword[rbp - 8]
	
	mov rdx, 0
	div rcx
	mov dword[rbp - 4], edx
	movsx r10, dword[rbp - 4]

	;add r8, r9
	;add r8, r10
	;mov rax, r8

	mov rsp, rbp
	pop rbp
	ret
