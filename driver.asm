; nasm -f elf64 driver.asm && ld driver.o -o driver
; use the above to compile and link

; ./driver
; use the above to run the program 

; file descriptor passes to kernal so kernal accesses file through call system 

SECTION .data

    ; [name] then db for define bytes 
    
    msg     db      "What is your name: "
    msgn    db      10, "Hello, "            ; 10 for newline or 0Ah 

SECTION .bss
    
    name: RESB 64 ; reserve 64 bytes for name variable 
    
    
    ; make a conditional incase 64 bytes is overloaded 
    
SECTION .text
    
    global _start
 
_start:
    
    call _msg         ; call function 
    call _getName     ; call function 
    call _msgn        ; call function 
    call _printName   ; call function 
 
    mov     rax, 60   ; exit 
    mov     rdi, 0    ; error code 0 for exit with success
    
    syscall           ; _
    
_getName:

    mov     rax, 0    ; syscall read input by moving 0 into rax 
    mov     rdi, 0    ; file descriptor 0 is stdin 
    mov     rsi, name ; load memory address into rsi of name 
    mov     rdx, 16   ; tell register how many bytes to allocate 
    
    syscall           ; _
    
    ret               ; return to where function was called 
    
_msg: 

    mov     rax, 1    ; syscall write output by moving 1 into rax 
    mov     rdi, 1    ; file descriptor 1 is stdout
    mov     rsi, msg  ; load memory address into rsi of msg 
    mov     rdx, 19   ; tell register how many bytes to allocate 
    
    syscall           ; _ 
    
    ret               ; return to where function was called 
    
_msgn: 

    mov     rax, 1    ; syscall write output 1 into rax
    mov     rdi, 1    ; file descriptor 1 is stdout   
    mov     rsi, msgn ; load memory address into rsi of msgn 
    mov     rdx, 8    ; tell register how many bytes to allocate 
    
    syscall           ; _
    
    ret               ; return to where function was called 

_printName: 

    mov     rax, 1    ; syscall write output 1 into rax 
    mov     rdi, 1    ; file descriptor 1 is stdout
    mov     rsi, name ; load memory address into rsi of name  
    mov     rdx, 64   ; tell register how many bytes to allocate 
    
    syscall           ; _
    
    ret               ; return to where function was called 
