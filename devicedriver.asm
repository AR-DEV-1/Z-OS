section .text
global driver_main

; This is the interrupt service routine for the device
; It simply prints a message to the console
isr:
    mov eax, 0x100 ; the IO port address of the device
    in al, dx      ; read from the port
    mov eax, 0x0B8000 ; the memory-mapped console address
    mov bx, 0x0F00 ; white on black text color
    mov byte [eax], 'D' ; print 'D'
    mov byte [eax+1], bl ; set the color
    mov byte [eax+2], 'e' ; print 'e'
    mov byte [eax+3], bl ; set the color
    mov byte [eax+4], 'v' ; print 'v'
    mov byte [eax+5], bl ; set the color
    mov byte [eax+6], 'i' ; print 'i'
    mov byte [eax+7], bl ; set the color
    mov byte [eax+8], 'c' ; print 'c'
    mov byte [eax+9], bl ; set the color
    mov byte [eax+10], 'e' ; print 'e'
    mov byte [eax+11], bl ; set the color
    mov byte [eax+12], ' ' ; print a space
    mov byte [eax+13], bl ; set the color
    mov byte [eax+14], 'D' ; print 'D'
    mov byte [eax+15], bl ; set the color
    mov byte [eax+16], 'r' ; print 'r'
    mov byte [eax+17], bl ; set the color
    mov byte [eax+18], 'i' ; print 'i'
    mov byte [eax+19], bl ; set the color
    mov byte [eax+20], 'v' ; print 'v'
    mov byte [eax+21], bl ; set the color
    mov byte [eax+22], 'e' ; print 'e'
    mov byte [eax+23], bl ; set the color
    iret ; return from the interrupt

; This is the entry point for the driver
; It installs the interrupt service routine for the device
driver_main:
    mov eax, isr ; the address of the interrupt service routine
    mov edx, 0x100 ; the IO port address of the device
    mov cl, 4 ; interrupt priority
    mov byte [edx], cl ; set the interrupt priority
    mov eax, [edx+4] ; get the current interrupt vector
    mov [edx+8], eax ; save the old interrupt vector
    mov dword [edx+4], isr ; set the new interrupt vector
    ret ; return from driver_main

