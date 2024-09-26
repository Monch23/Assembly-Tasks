section .data
  print db "Array is haotic !", 10, 0
  print_sort_alert db "Array is sorted from low to great !", 10, 0
  scan_fmt dq " %ld", 0
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
getElems: 
  cmp rbx, 5
  je mover
  mov rax, 0
  mov rdi, scan_fmt
  lea rsi, [arr + rbx * 8]
  call scanf
  
  inc rbx
  jmp getElems

mover:
  mov rbx, 0
  mov rcx, 1
sort:
    cmp rbx, 4
    je print_sorted

    mov rax, [arr + rbx * 8 ] ; arr [i]
    mov rdx, [arr + rcx * 8] ; arr [i+1]
    inc rbx
    inc rcx

    cmp rax, rdx
    jl sort
    jmp error

    error:
  mov rax, 0
  mov rdi, print
  call printf
  jmp exit

print_sorted:

  mov rax, 0
  mov rdi, print_sort_alert
  call printf

exit:

  mov rsp, rbp
  pop rbp
  ret
