;-----------------------------------------------
section .data
;-----------------------------------------------
section .bss
;-----------------------------------------------
section .text

global double_int

double_int:
    ; returns 2*input
    ;
    ; Inputs:
    ;   rdi
    ;
    ; Returns:
    ;   rax: rdi*2
    ;
    mov rax, rdi
    shl rax, 1
    ret
