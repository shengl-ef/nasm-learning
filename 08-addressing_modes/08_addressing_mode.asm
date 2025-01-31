							; 以下程序说明了上面讨论的一些概念。它将名称"Zara Ali"存储在内存的数据部分，然后以 编程方式将其值更改为另一个名称"Nuha Ali"，并显示这两个名称。

section .text
   global _start					; Must be declared for linker (ld)
_start:							; tell linker entry point

							; write the name 'Zara ali'
   mov edx, 9						; message length
   mov ecx, name					; message to write
   mov ebx, 1						; file descriptor (stdout)
   mov eax, 4						; system_call number (sys_write = 4)
   int 0x80						; call kernel

   mov [name], dword 'Nuha'				; changed the name to nuha ali
   			
							; writing the name 'Nuha Ali'
   mov edx, 8						; message length
   mov ecx, name					; message to write
   mov ebx, 1						; file descriptor (stdout)
   mov eax, 4						; system call number (sys_write = 4)
   int 0x80						; call kernel

   mov eax, 1						; system call number (sys_exit)
   int 0x80						; call kernel

section .data
name db 'Zara Ali'
