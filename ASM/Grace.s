global _main
%macro MAIN 0
_main:
	push		rax
	mov			rdi, kids_name
	mov			rsi, access
	call		_fopen
	cmp			eax, 0
	je			.end
	mov			rdi, rax
	push		rdi
	mov			rax, 0
	mov			rsi, code
	mov			rdx, 0x0a
	mov			rcx, 0x22
	mov			rbx, code
	; push		rbx
	call		_fprintf
	pop			rdi
	call		_fclose
	; xor			eax, eax
.end:
	pop			rbx
	ret
%endmacro

%define KID		kids_name: db "Grace_kid.s", 0
%define CODE	code: db "#1: %c, #2: %c, #3: %s", 0

section .data
KID
CODE
access:	db		"w", 0

section .text
;
; This is a comment.
;
extern _fprintf
extern _fopen
extern _fclose

MAIN
