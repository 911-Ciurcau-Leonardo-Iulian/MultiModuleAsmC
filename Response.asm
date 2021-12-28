bits 32

global _Response
;    char* Response(int)
;    one parameter: Value: int, 0 or 1
;    returns the address of the string to be printed, "Yes\n" if Value is 1, "No\n" otherwise
;    return value in eax: integer
;    uses/modifies eax
segment data use32
    yes db "Yes", 0xA, 0    ; 0xA = '\n'
    no db "No", 0xA, 0
segment code use32
_Response:
    push ebp
    mov ebp, esp ; new stack frame
    mov eax, [ebp + 8] ; eax = Value
    test eax, eax
    jz _No
    ; _Yes:
    mov eax, yes
    jmp _End
    _No:
    mov eax, no
    _End:
    mov esp, ebp
    pop ebp
    ret
    
    