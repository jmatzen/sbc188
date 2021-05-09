; objdump -D -b binary -mi386 -Maddr16,data16 [file]

	bits 16
	cpu 186


UMCS_REG: equ 0ffa0h
UMCS_VAL: equ 0f038h

LMCS_REG: equ 0ffa2h
LMCS_VAL: equ 07f8h

PACS_REG: equ 0ffa4h
PACS_VAL: equ 007eh ; 10001 110 peripheral base at 400H, 2 ws

MPCS_REG: equ 0ffa8h
MPCS_VAL: equ 81b8h

TIMER1_CTRL: equ    0ff5eh
TIMER1_MAX_CNT: equ 0ff5ah

        org 0ff00h

initialize:
        mov dx, UMCS_REG
        mov ax, UMCS_VAL
    	out dx, ax
        mov dx, LMCS_REG
        mov ax, LMCS_VAL
        out dx, ax
        mov dx, PACS_REG
        mov ax, PACS_VAL
        out dx, ax
        mov dx, MPCS_REG
        mov ax, MPCS_VAL
        out dx, ax


        mov dx, TIMER1_MAX_CNT
        mov ax, 13
        out dx, ax
        mov dx, TIMER1_CTRL
        mov ax, 1100000000000001b
        out dx, ax

foo:    jmp foo
        
        times (256-16) - ($-$$) db 90h


        jmp initialize
