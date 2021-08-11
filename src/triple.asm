;-----------------------------------------------
section .data
;-----------------------------------------------
section .bss
;-----------------------------------------------
section .text

global triple_int

triple_int:
    ; returns 3*input
    ;
    ; Inputs:
    ;   rdi
    ;
    ; Returns:
    ;   rax: rdi*3
    ;
    mov r8, 3
    mov rax, rdi
    mul r8
    ret
