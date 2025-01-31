section .text
   global _start					; must be declared for linker (gcc)

section .data
choice 		DB 	'y'
number 		DW	12345
neg_number	DW	-12334
big_number 	DQ 	11123334445556
real_number	DD	1.234
real_number2 	DQ	123.456

_start: 
   mov edx, 1
   mov ecx, choice
   mov ebx, 1
   mov eax, 4
   int 0x80

   mov edx, 2
   mov ecx, number
   mov ebx, 1
   mov eax, 4
   int 0x80

   mov edx, 2
   mov ecx, neg_number
   mov ebx, 1
   mov eax, 4
   int 0x80

   mov edx, 8
   mov ecx, big_number
   mov ebx, 1
   mov eax, 4
   int 0x80

   mov edx, 4
   mov ecx, real_number
   mov ebx, 1
   mov eax, 4
   int 0x80
   
   mov edx, 10
   mov ecx, real_number2
   mov ebx, 1
   mov eax, 4
   int 0x80

   mov eax, 1
   int 0x80
