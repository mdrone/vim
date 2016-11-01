:insert
# Hello World

.data
  helloworldstring:
    .ascii "Hello World\n"
.bss

.text

.global _start

_start:
  # load arguments for write
  movl $4, %eax
  movl $1, %ebx
  movl $helloworldstring, %ecx
  movl $12, %edx
  int $0x80

  # exit code 5
  movl $1, %eax
  movl $5, %ebx
  int $0x80
