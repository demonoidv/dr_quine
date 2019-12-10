global _main

%macro CALL_SNPRINTF 4-5
	lea		rdi, [%1]
	mov		rsi, %2
	lea		rdx, [%3]
	%if		%0 = 4
		mov		rcx, %4
	%else
		lea		rcx, [%4]
		lea		r8, [%5]
	%endif
	call	_snprintf
%endmacro

section .data
code: db "global _main%1$c%1$c%%macro CALL_SNPRINTF 4-5%1$c	lea		rdi, [%%1]%1$c	mov		rsi, %%2%1$c	lea		rdx, [%%3]%1$c	%%if		%%0 = 4%1$c		mov		rcx, %%4%1$c	%%else%1$c		lea		rcx, [%%4]%1$c		lea		r8, [%%5]%1$c	%%endif%1$c	call	_snprintf%1$c%%endmacro%1$c%1$csection .data%1$ccode: db %2$c%3$s%2$c, 0%1$cfirst_src_name: db %2$cSully.s%2$c, 0%1$cprog_name_fmt: db %2$cSully_%%d%2$c, 0%1$csrc_name_fmt: db %2$cSully_%%d.s%2$c, 0%1$clink_fmt: db %2$c/usr/bin/gcc -Wall -Werror -Wextra -o %%s %%s%2$c, 0%1$casm_fmt: db %2$c/usr/bin/nasm -f macho64 -o %%s %%s%2$c, 0%1$cfile_access: db %2$cw%2$c, 0%1$ccurrent_file: db __FILE__, 0%1$cnb: dq %4$d%1$c%1$csection .bss%1$clink_buff: resb 128%1$casm_buff: resb 128%1$cprog_name_buff: resb 64%1$csrc_name_buff: resb 64%1$cargs: resq 2%1$cfile_ptr: resq 1%1$c%1$csection .text%1$cextern _fprintf, _snprintf, _fopen, _fclose, _system, _execv, _strcmp%1$c_main:%1$cdefault rel%1$c	push			rdi%1$c	mov				r15, [nb]%1$c	lea				rdi, [current_file]%1$c	lea				rsi, [first_src_name]%1$c	call			_strcmp%1$c	cmp				rax, 0%1$c	je				.setup%1$c	cmp				r15, 0%1$c	jle				.success%1$c	dec				r15%1$c.setup:%1$c	CALL_SNPRINTF	prog_name_buff, 64, prog_name_fmt, r15%1$c	CALL_SNPRINTF	src_name_buff, 64, src_name_fmt, r15%1$c	CALL_SNPRINTF	asm_buff, 64, asm_fmt, prog_name_buff, src_name_buff%1$c	CALL_SNPRINTF	link_buff, 64, link_fmt, prog_name_buff, prog_name_buff%1$c	lea				rdi, [src_name_buff]%1$c	lea				rsi, [file_access]%1$c	call			_fopen%1$c	cmp				rax, 0%1$c	je				.failed%1$c	mov				[file_ptr], rax%1$c	mov				rdi, [file_ptr]%1$c	lea				rsi, [code]%1$c	mov				rdx, 0x0a%1$c	mov				rcx, 0x22%1$c	lea				r8, [code]%1$c	mov				r9, r15%1$c	call			_fprintf%1$c	mov				rdi, [file_ptr]%1$c	call			_fclose%1$c	lea				rdi, [asm_buff]%1$c	call			_system%1$c	lea				rdi, [link_buff]%1$c	call			_system%1$c	lea				r14, [prog_name_buff]%1$c	mov				[args], r14%1$c	lea				rdi, [prog_name_buff]%1$c	lea				rsi, [args]%1$c	call			_execv%1$c.failed:%1$c	mov				eax, 1%1$c.end:%1$c	pop				rdi%1$c	ret%1$c.success:%1$c	xor				eax, eax%1$c	jmp				.end%1$c", 0
first_src_name: db "Sully.s", 0
prog_name_fmt: db "Sully_%d", 0
src_name_fmt: db "Sully_%d.s", 0
link_fmt: db "/usr/bin/gcc -Wall -Werror -Wextra -o %s %s", 0
asm_fmt: db "/usr/bin/nasm -f macho64 -o %s %s", 0
file_access: db "w", 0
current_file: db __FILE__, 0
nb: dq 5

section .bss
link_buff: resb 128
asm_buff: resb 128
prog_name_buff: resb 64
src_name_buff: resb 64
args: resq 2
file_ptr: resq 1

section .text
extern _fprintf, _snprintf, _fopen, _fclose, _system, _execv, _strcmp
_main:
default rel
	push			rdi
	mov				r15, [nb]
	lea				rdi, [current_file]
	lea				rsi, [first_src_name]
	call			_strcmp
	cmp				rax, 0
	je				.setup
	cmp				r15, 0
	jle				.success
	dec				r15
.setup:
	CALL_SNPRINTF	prog_name_buff, 64, prog_name_fmt, r15
	CALL_SNPRINTF	src_name_buff, 64, src_name_fmt, r15
	CALL_SNPRINTF	asm_buff, 64, asm_fmt, prog_name_buff, src_name_buff
	CALL_SNPRINTF	link_buff, 64, link_fmt, prog_name_buff, prog_name_buff
	lea				rdi, [src_name_buff]
	lea				rsi, [file_access]
	call			_fopen
	cmp				rax, 0
	je				.failed
	mov				[file_ptr], rax
	mov				rdi, [file_ptr]
	lea				rsi, [code]
	mov				rdx, 0x0a
	mov				rcx, 0x22
	lea				r8, [code]
	mov				r9, r15
	call			_fprintf
	mov				rdi, [file_ptr]
	call			_fclose
	lea				rdi, [asm_buff]
	call			_system
	lea				rdi, [link_buff]
	call			_system
	lea				r14, [prog_name_buff]
	mov				[args], r14
	lea				rdi, [prog_name_buff]
	lea				rsi, [args]
	call			_execv
.failed:
	mov				eax, 1
.end:
	pop				rdi
	ret
.success:
	xor				eax, eax
	jmp				.end
