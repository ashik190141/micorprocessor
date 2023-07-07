.model small
.stack 100h
.data
    msg1 db 10,13, 'Enter The String $'
    msg2 db 13,10, 'String is Palindrome $'
    msg3 db 13,10, 'String is not Palindrome $'
    str1 db 50 dup(0)                           ;used to store the user input string.
.code

main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    lea si, str1
    lea di, str1  ;both si,di pointing str1

    mov ah, 01h
next:
    int 21h
    cmp al, 0dh   ;whether it is the end of the string or not
    je terminate   ;wait untill user press enter.
    mov [di], al   ;store string into di by al 
    inc di
    jmp next

terminate:
    mov al, '$'
    mov [di], al

dothis:
    dec di
    mov al, [si]

    cmp [di], al      ;compare untill si<dl
    jne notpalindrome

    inc si
    cmp si, di
    jl dothis

palindrome:
    mov ah, 09h
    lea dx, msg2
    int 21h
    jmp xx

notpalindrome:
    mov ah, 09h
    lea dx, msg3
    int 21h

xx:
    mov ah, 4ch
    int 21h
main endp
end main
