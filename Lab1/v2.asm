.model tiny
.org 100h

start: 
; setting com port options (lcr)
mov ax, 11011011b ; 1-2 - word length, 3 - stop bits amount, 4-6 - parity, 7 - break state, 8 - frequency divider 
mov dx, 3EBh
out dx, ax  
; setting speed to 9600 dits/s 
mov ax, 00h  
mov dx, 3E8h  ; dll (3e8(com3) + 00)
out dx, al
mov al, 0Ch
mov dx, 3E9h  ; dim (3e8(com3) + 01)
out dx, al 
; write data
mov al, 'g'
mov dx, 3E8h  ; com3
out dx, al
; read data
xor ax, ax
mov dx, 2E8h  ;com4
in ax, dx  ; ax - symbol  
; print data
mov ah, 02h
xchg al, dl 
int 21h 

ret
end start 
 
