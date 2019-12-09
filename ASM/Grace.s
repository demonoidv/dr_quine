global _main
%macro MAIN 0
_main:
default rel
	push		rdi
	lea			rdi, [kids_name]
	lea			rsi, [file_access]
	call		_fopen
	cmp			rax, 0
	je			.failed
	mov			[file_ptr], rax
	mov			rdi, [file_ptr]
	lea			rsi, [code]
	mov			rdx, 0x0a
	mov			rcx, 0x22
	lea			r8, [code]
	xor			eax, eax
	call		_fprintf
	cmp			rax, 0
	jle			.failed
	mov			rdi, [file_ptr]
	call		_fclose
	cmp			rax, 0
	jne			.failed
.end:
	pop			rdi
	ret
.failed:
	mov			rax, 1
	jmp			.end
%endmacro

%define KID		kids_name: db "Grace_kid.s", 0
%define CODE	code: db "global _main%1$c%%macro MAIN 0%1$c_main:%1$cdefault rel%1$c	push		rdi%1$c	lea			rdi, [kids_name]%1$c	lea			rsi, [file_access]%1$c	call		_fopen%1$c	cmp			rax, 0%1$c	je			.failed%1$c	mov			[file_ptr], rax%1$c	mov			rdi, [file_ptr]%1$c	lea			rsi, [code]%1$c	mov			rdx, 0x0a%1$c	mov			rcx, 0x22%1$c	lea			r8, [code]%1$c	xor			eax, eax%1$c	call		_fprintf%1$c	cmp			rax, 0%1$c	jle			.failed%1$c	mov			rdi, [file_ptr]%1$c	call		_fclose%1$c	cmp			rax, 0%1$c	jne			.failed%1$c.end:%1$c	pop			rdi%1$c	ret%1$c.failed:%1$c	mov			rax, 1%1$c	jmp			.end%1$c%%endmacro%1$c%1$c%%define KID		kids_name: db %2$cGrace_kid.s%2$c, 0%1$c%%define CODE	code: db %2$c%3$s%2$c, 0%1$c%1$csection .data%1$cKID%1$cCODE%1$cfile_access: db	%2$cw%2$c, 0%1$c%1$csection .bss%1$cfile_ptr resq 1%1$c%1$csection .text%1$c;%1$c; This is a comment.%1$c;%1$cextern _fprintf, _fopen, _fclose%1$c%1$cMAIN%1$c", 0

section .data
KID
CODE
file_access: db	"w", 0

section .bss
file_ptr resq 1

section .text
;
; This is a comment.
;
extern _fprintf, _fopen, _fclose

MAIN
