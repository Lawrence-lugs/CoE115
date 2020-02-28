.include "p24FJ64GB002.inc"
.global __reset
config __CONFIG2,(OSCIOFNC_ON & POSCMOD_NONE & FCKSM_CSDCMD & FNOSC_FRCPLL & PLL96MHZ_OFF & PLLDIV_NODIV)
config __CONFIG1,(FWDTEN_OFF & JTAGEN_OFF)
config __CONFIG3,(SOSCSEL_IO)
config __CONFIG4, (RTCOSC_LPRC)
    
    
.bss
i: .space 2
j: .space 2
viewport: .space 2
.text
__reset:
mov #__SP_init, W15
mov #__SPLIM_init,W0
mov W0, SPLIM     
    
;configure analog to digital pins into only digital io pins
mov #0xFFFF, W0
mov W0,AD1PCFG
    
clr i
clr viewport
clr j
mov #0x0000, W0
mov W0, TRISB
mov #0x0001, W0
mov W0, TRISA
    
init:
    clr LATA
    call wait_5ms
    clr LATB
    call delay15ms
    call wait_5ms
    mov #0x0003, W1 ;8bit1
    call lcd_send4bits
    call delay4_1ms
    mov #0x0003, W1 ;8bit2
    call lcd_send4bits
    call delay100us
    mov #0x0003, W1 ;8bit3
    call lcd_send4bits
    mov #0x0002, W1 ;4bit
    call lcd_send4bits
    mov #0x0002, W1 ;Fset NF
    mov #0x000C, W2
    call lcd_send8bits
    mov #0x0000, W1 ;display off
    mov #0x0008, W2
    call lcd_send8bits
    mov #0x0000, W1 ;clear display
    mov #0x0001, W2
    call lcd_send8bits
    mov #0x0000, W1 ;entry mode set 00 06
    mov #0x0006, W2
    call lcd_send8bits
    mov #0x0000, W1 ;display on set 00,0F
    mov #0x000F, W2
    call lcd_send8bits
    
    ;//-//
    mov #0x0004, W1
    mov #0x0008, W2
    call lcd_send8bits
    mov #0x0010, W1
    mov #0x0014, W2
    call lcd_send8bits
    
    ;/---/
    mov #0x0010, W1
    mov #0x001E, W2
    call lcd_send8bits
    
    ;/---/
    mov #0x0010, W1
    mov #0x0014, W2
    call lcd_send8bits
    
    ;/---/
    mov #0x0011, W1
    mov #0x001f, W2
    call lcd_send8bits
    
    ;/---/
    mov #0x0010, W1
    mov #0x0014, W2
    call lcd_send8bits
    
    ;/---/
    mov #0x0010, W1
    mov #0x001e, W2
    call lcd_send8bits
    
    ;/---/
    mov #0x0010, W1
    mov #0x001a, W2
    call lcd_send8bits
    
    ;/---/
    mov #0x0011, W1
    mov #0x001b, W2
    call lcd_send8bits
    
    ;set ddram
    mov #0x0008, W1
    mov #0x0000, W2
    call lcd_send8bits
    
    ;set ddram
    mov #0x0010, W1
    mov #0x0011, W2
    call lcd_send8bits
    
    done:
    goto done
    
    
lcd_send4bits:
    mov W1, LATB
    bset LATB,#5
    call wait_5ms ;make sure of enable pulse time
    call wait_5ms
    bclr LATB,#5
    call wait_5ms ;make sure of send cooldown time
    call wait_5ms
    clr LATB
    return
    
lcd_send8bits:
    mov W1, LATB
    bset LATB,#5
    call delay100us ;make sure of enable pulse time
    call delay100us
    call delay100us
    call delay100us
    call delay100us
    bclr LATB,#5
    call delay100us ;make sure of send cooldown time
    mov W2, LATB
    bset LATB,#5
    call delay100us ;make sure of enable pulse time
    call delay100us
    call delay100us
    call delay100us
    call delay100us
    bclr LATB,#5
    call delay100us ;make sure of send cooldown time
    clr LATB
    return
    
wait_5ms:
    mov #0x0001,W0
    mov W0,i
    mov #0x1A10,W0
    mov W0,j
    loop5ms:
	dec j
	bra nz, loop5ms
	dec i
	bra nz, loop5ms
	nop
	nop
	return
    
delay15ms:
    mov #0x0001,W0
    mov W0,i
    mov #0x4E20,W0
    mov W0,j
    loop15ms:
	dec j
	bra nz, loop15ms
	dec i
	bra nz, loop15ms
	nop
	nop
	return
    
delay100us:
    mov #0x0001,W0
    mov W0,i
    mov #0x0081,W0
    mov W0,j
    loop100us:
	dec j
	bra nz, loop100us
	dec i
	bra nz, loop100us
	nop
	nop
	return
    
delay4_1ms:
    mov #0x0001,W0
    mov W0,i
    mov #0x1555,W0
    mov W0,j
    loop4_1ms:
	dec j
	bra nz, loop4_1ms
	dec i
	bra nz, loop4_1ms
	nop
	nop
	nop
	nop
	nop
	nop
	return