global _main

section .data
code: db	"global _main%1$c%1$csection .data%1$ccode: db	%2$c%3$s%2$c, 0%1$c%1$csection .text%1$c;%1$c; This is a comment.%1$c;%1$cextern _printf%1$c_print_code:%1$c	lea		rdi, [rel code]%1$c	mov		rsi, 0x0a%1$c	mov		rdx, 0x22%1$c	lea		rcx, [rel code]%1$c	call	_printf%1$c	ret%1$c%1$c_main:%1$c	;%1$c	; This is another comment.%1$c	;%1$c	call	_print_code%1$c	xor		eax, eax%1$c	ret%1$c", 0

section .text
;
; This is a comment.
;
extern _printf
_print_code:
	lea		rdi, [rel code]
	mov		rsi, 0x0a
	mov		rdx, 0x22
	lea		rcx, [rel code]
	call	_printf
	ret

_main:
	;
	; This is another comment.
	;
	call	_print_code
	xor		eax, eax
	ret
