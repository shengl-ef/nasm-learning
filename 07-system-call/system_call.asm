section .data					; Data Segment 数据章节
   userMsg db 'Please enter a number: '		; Message Intro: Ask the user to enter a number, 字符串定义，请用户输入一个数字
   lenUserMsg equ $-userMsg			; The length of the message, 获取消息的长度
   dispMsg db 'You Have entered: '		; info of msg, 提示信息
   lenDispMsg equ $-dispMsg			; The length of the msg, 交互提示信息的长度

section .bss					; 变量 Uninitialized data
   num resb 5

section .text					; code Segment, 代码章节
   global _start

_start:						; User Prompt, 用户提示信息
   mov eax, 4					; 系统调用寄存器，操作4，查看头文件得知这里是system_write调用
						; system_write(usigned int, char*, size_t), 打印一条消息，需要给出字符串地址及长度
   mov ebx, 1					; 第一个参数ebx, 1
   mov ecx, userMsg				; 第二个参数,打印的字符串的地址
   mov edx, lenUserMsg				; 第三个参数,打印的字符串的长度
   int 80h					; 执行系统调用

						; Read and store user input, 读取并且存储用户输入
   mov eax, 3					; 系统调用3,函数是sys_read(unsigned int, const char*, size_t)
   mov ebx, 2					; 读取？1是写，2是读？
   mov ecx, num					; 把用户输入写入变量
   mov edx, 5					; 长度最多5个，是一个hardcode
   int 80h
     
						; Output the info message
   mov eax, 4
   mov ebx, 1
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h

   						; Output the number entered, 输出用户输入的数字
   mov eax, 4					; 系统调用，sys_write(同上)
   mov ebx, 1
   mov ecx, num
   mov edx, 5
   int 80h

						; Exit code, 退出
   mov eax, 1					; sys_exit操作
   mov ebx, 0
   int 80h
