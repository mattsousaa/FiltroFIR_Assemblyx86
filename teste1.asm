section .data
  
section .bss

	filtro: resb 8
	sinal: resb 8
	saida: resb 8
	t_filtro: resb 4
	t_saida: resb 4
	z: resb 4

section .text

;Comandos para compilação no terminal:
;gcc -c filtro.c
;nasm -f elf64 teste1.asm -o teste1.o
;gcc filtro.o teste1.o -o app
;./app

;rdi = filtro, rsi = sinal, rdx = saida, ecx = t_filtro, r8d = t_saida

global multiplica
	
multiplica:

	mov [filtro], rdi		;
	mov [sinal], rsi		;
	mov [saida], rdx		; RECEBE OS PARÂMETROS
	mov [t_filtro], ecx		;
	mov [t_saida], r8d		;

	mov rcx, 0	
	mov ecx, [t_saida]		; PRIMEIRO CONTADOR, i
	mov rdx, 0				; x = 0

FOR1:						; FOR PRINCIPAL
	
	push rcx				; SALVA i
	push rdx				; SALVA x


	push rax				;
	push rbx				;
	mov rbx, 0				;
	mov rax, [saida]		; SAIDA[x] = 0
	mov [rax + rdx], ebx	;
	pop rbx					;
	pop rax					;

	mov rax, rdx			; z = x

	mov rcx, 0				;
	mov ecx, [t_filtro]		; SEGUNDO CONTADOR, j
	mov rbx, 0				; y = 0

	jmp continua

ret_continua:


	pop rdx					; RESGATA x
	pop rcx					; RESGATA i

	add rdx, 4				; x++

	loop FOR1

	jmp fim


continua:

FOR2:						;saida[x] += filtro[y]*sinal[z]


	mov [z], eax			; SALVA O z

	push rcx				; SALVA O SEGUNDO CONTADOR				
	push rbx				; SALVA y

	mov rcx, [filtro]		; rax = FILTRO[y]		
	mov rax, [rcx + rbx]	;


	mov rbx, 0				;
	mov ebx, [z] 			;
	mov rcx, [sinal]		; rcx = SINAL[z]
	mov rcx, [rcx + rbx]	;

	push rdx				; SALVA x		

	imul rcx				; rax = filtro[y]*sinal[z]			
	
	pop rdx					; RESGATA x

	mov rcx, [saida]		;
	add [rcx + rdx], rax	; saida[x] = rax

	pop rbx					; RESGATA y
	pop rcx					; RESGATA O SEGUNDO CONTADOR

	mov rax, 0				;
	mov eax, [z]			; RESGATA z

	add rbx, 4				; y++
	add rax, 4				; z++

	loop FOR2

	jmp ret_continua


fim:

	ret 					;fim do programa