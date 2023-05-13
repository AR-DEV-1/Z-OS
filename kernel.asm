; Set up stack pointer
mov sp, 0x7c00

; Load kernel to memory
mov bx, 0x8000
mov es, bx
mov bx, 0x0
mov ah, 0x02
mov al, 0x01
mov ch, 0x00
mov cl, 0x02
mov dh, 0x00
int 0x13

; Jump to kernel entry point
jmp 0x8000

; Kernel entry point
[BITS 16]
[ORG 0x8000]

start:
    ; Clear screen
    xor ah, ah
    int 0x10
    
    ; Display message
    mov si, msg
    call print_string
    
    ; Halt system
    cli
    hlt
    
print_string:
    ; Print string character by character
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print_string
done:
    ret
    
msg db 'Welcome to Z-OS!', 0

times 510-($-$$) db 0
dw 0xAA55


