bits 32 ; assembling for the 32 bits architecture

global _Substring
; int Substring(char*, char*);
; two parameters: buff: a char pointer to the buffer, s: a char pointer to the substring
; returns 1 if s is a substring of buff, otherwise 0
; return value in eax: integer
; uses/modifies eax, ecx, edx

segment code use32
_Substring:
    push ebp
    mov ebp, esp
    
    mov edx, [ebp + 12] ; EDX <- the substring pointer 
    mov ecx, [ebp + 8] ; ECX <- the buffer pointer

    xor eax, eax ; make 0 EAX, sete works only for AL
    _main_loop:
        cmp BYTE [ecx], 0
        je _end
        push ecx ; save the buffer pointer for later
        ; keep advancing  
        _are_characters_equal:
            inc edx
            inc ecx
            mov al, [edx - 1] ; AL <- the current character of the substring
            cmp al, 0 ; if AL is '\0', then exit 
            je _end_are_characters_equal
            cmp al, [ecx - 1] 
            je _are_characters_equal
          
        _end_are_characters_equal:
        ; if the current character (the increment inside the loop will overshoot the element by 1) is '\0' from the substring pointer, it means we found a match
        cmp BYTE [edx - 1], 0
        sete al
        je _end
        pop ecx
        inc ecx
        mov edx, [ebp + 12]
        jmp _main_loop
        
    
    _end:      
    mov esp, ebp
    pop ebp
    ret
