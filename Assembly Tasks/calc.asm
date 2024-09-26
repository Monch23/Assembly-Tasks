section .data

	scan_num dd " %d", 0 
	scan_op db " %c", 0 
	scan_num2 dd " %d", 0
	res_print dd "The result is %d", 10, 0

section .bss

	num resd 1
	num2 resd 1
	op resb 1
	result resd 1

section .text

	global main
	extern printf
	extern scanf
main:
	push rbp
	mov rbp, rsp	

	mov rax, 0
	mov rdi, scan_num
	mov rsi, num
	call scanf

	mov rax, 0
	mov rdi, scan_op
	mov rsi, op
	call scanf

	mov rax, 0
	mov rdi, scan_num2
	mov rsi, num2
	call scanf

	mov eax, dword[num]
	mov ecx, dword[num2]
	movsx ebx, byte[op]

	cmp ebx, 43
	je add

	cmp ebx, 45
	je sub

	cmp ebx, 42
	je mul
	
	cmp ebx, 47
	je div

add:
	add eax, ecx
	mov dword[result], eax	
	jmp end

sub:	
	sub eax, ecx
	mov dword[result], eax	
	jmp end
mul:
	imul eax, ecx
	mov dword[result], eax	
	jmp end

div:
	div ecx
	mov dword[result], eax
	jmp end		

end:
	mov rax, 0
	mov rdi, res_print
	mov esi, dword[result]
	call printf

	mov rsp, rbp
	pop rbp
	ret
