.model small
.stack 100h

start:
   ; com port initializing
   xor ax, ax
   mov al, 10100011b
   mov dx, 00h
   int 14h
   ; writing data to port
   mov ah, 01h
   mov al, 'd'
   mov dx, 00h
   int 14h
   xor ax, ax
   ; reading data
   mov ah, 02h
   mov dx, 01h
   int 14h
   ; printing data
   mov ah, 02h
   mov dl, al
   int 21h
   ; exit
   mov ax,4C00h
   int 21h

end start