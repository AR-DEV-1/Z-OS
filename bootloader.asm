org 0x7c00 ; Set origin to 0x7c00

section .text ; Start of code section
    global _start ; Declare entry point label as global symbol

_start:
    ; Set up segment registers
    xor ax, ax ; Zero out AX register
    mov ds, ax ; DS segment = 0x0000
    mov es, ax ; ES segment = 0x0000
    mov ss, ax ; SS segment = 0x0000

    ; Set up stack pointer
    mov sp, 0x7c00 ; Stack pointer = 0x7c00

    ; Load next sector from disk into memory
    mov bx, 0x8000 ; Address to load next sector
    mov dh, 0x00 ; Head number (0)
    mov dl, 0x00 ; Drive number (0)
    mov ch, 0x00 ; Track number (0)
    mov cl, 0x02 ; Sector number (2)
    mov ah, 0x02 ; Read sector function
    mov al, 0x01 ; Read one sector
    int 0x13 ; Call BIOS interrupt

    ; Jump to loaded sector
    jmp 0x8000 ; Jump to loaded sector

    times 510-($-$$) db 0 ; Fill with zeros until 510th byte
    dw 0xaa55 ; Magic number indicating bootable device

