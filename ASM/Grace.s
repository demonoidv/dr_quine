global _main
%define MAIN(x)\
_main:\
	mov		rdi, code\
	mov		rsi, 0x0a\
	mov		rdx, 0x22\
	mov		rcx, code\
	call	_printf\
	xor		eax, eax\
	ret\

%define KID: db		"Grace_kid.s", 0
%define CODE: db	"", 0

section .data
KID
CODE

section .text
;
; This is a comment.
;
extern _printf

MAIN()
