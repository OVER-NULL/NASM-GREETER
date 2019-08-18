; nasm -f elf64 hw.asm && ld hw.o -o hw && ./hw 
; Or use the above to compile link and run 

SECTION .data
    
    msg     db      "What is your name: "
    msgn    db      10, "Hello, "            ; 10 for newline or 0Ah 

SECTION .bss
    
    name: RESB 64 ; reserve 64 bytes for name variable 
    
SECTION .text
    
    global _start
 
_start:
    
    call _msg         ;
    call _getName     ;
    call _msgn        ;
    call _printName   ;
 
    mov     rax, 60   ; exit 
    mov     rdi, 0    ; exit with success
    
    syscall ; _
    
_getName:

    mov     rax, 0    ; 
    mov     rdi, 0    ; 
    mov     rsi, name ; 
    mov     rdx, 16   ; 
    
    syscall           ;
    
    ret               ;
    
_msg: 

    mov     rax, 1    ;
    mov     rdi, 1    ;
    mov     rsi, msg  ;
    mov     rdx, 19   ;
    
    syscall           ; _ 
    
    ret               ; 
    
_msgn: 

    mov     rax, 1    ;
    mov     rdi, 1    ;
    mov     rsi, msgn ;
    mov     rdx, 8    ; 
    
    syscall 
    
    ret 


_printName: 

    mov     rax, 1    ;
    mov     rdi, 1    ;
    mov     rsi, name ;
    mov     rdx, 64   ; 
    
    syscall           ;
    
    ret               ;    
