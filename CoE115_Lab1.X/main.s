.include "p24FJ64GB002.inc"
.global __reset
config __CONFIG2,(OSCIOFNC_ON & POSCMOD_NONE & FCKSM_CSDCMD & FNOSC_FRCPLL & PLL96MHZ_OFF & PLLDIV_NODIV)
config __CONFIG1,(FWDTEN_OFF & JTAGEN_OFF)
config __CONFIG3,(SOSCSEL_IO)
config __CONFIG4, (RTCOSC_LPRC)
    
    
.bss
i: .space 2
j: .space 2
.text
__reset:
mov #__SP_init, W15
mov #__SPLIM_init,W0
mov W0, SPLIM     
    
;configure analog to digital pins into only digital io pins
MOV #0x1FFF, W0
MOV W0,AD1PCFG
    
clr i
clr j
mov #0x0000, W0
mov W0, TRISA
mov #0xFFFF, W0
mov W0, TRISB

clr LATA
    
mov #0x0001, W1
mov #0x0003, W2
mov #0x0008, W3
mov #0x0005, W4
mov #0x0009, W5
    
mov #0x0000, W6
mov #0x000F, W7
mov #0x0000, W9
    
init:
    mov W7, PORTA
    call delaystart
    call delaystart
    call delaystart
    call delaystart
    call delaystart
    call delaystart
    mov W6, PORTA
    call delaystart
    call delaystart
    call delaystart
    call delaystart
    call delaystart
    call delaystart
    
    clr PORTA
p1:
    mov W1, PORTA
    call delay
    mov W6, PORTA
    call delay
    mov #0x0000, W0
    cp.b W9,W0
    bra GTU,p5
    goto p2
p2:
    mov W2, PORTA
    call delay
    mov W6, PORTA
    call delay
    mov #0x0000, W0 ;W9 is 0 if forward 1 if backward
    cp.b W9,W0
    bra GTU,p1
    goto p3
p3:
    mov W3, PORTA
    call delay
    mov W6, PORTA
    call delay
    mov #0x0000, W0 ;W9 is 0 if forward 1 if backward
    cp.b W9,W0
    bra GTU,p2
    goto p4
p4:
    mov W4, PORTA
    call delay
    mov W6, PORTA
    call delay
    mov #0x0000, W0 ;W9 is 0 if forward 1 if backward
    cp.b W9,W0
    bra GTU,p3
    goto p5
p5:
    mov W5, PORTA
    call delay
    mov W6, PORTA
    call delay
    mov #0x0000, W0 ;W9 is 0 if forward 1 if backward
    cp.b W9,W0
    bra GTU,p4
    goto p1
    
delay:
    mov #0x0007,W0
    mov W0,i

    mov #0x1FF0,W0
    mov W0,j
    loop:
	;poll button
	btss PORTB,#0
	goto buttonpressed
	dec j
	bra nz, loop
	dec i
	bra nz, loop
	return
	
delaystart:
    mov #0x0007,W0
    mov W0,i

    mov #0x1FF0,W0
    mov W0,j
    loopstart:
	dec j
	bra nz, loopstart
	dec i
	bra nz, loopstart
	return
	
buttonpressed:
    ;reverse order
    XOR #0x0001,W9
    redo:
    ;poll button
    call db
    btss PORTB,#0
    goto redo
    call db
    return
    
db:
    mov #0x0001,W0
    mov W0,i

    mov #0xF3F0,W0
    mov W0,j
    loopdb:
	dec j
	bra nz, loopstart
	dec i
	bra nz, loopstart
	return
    
    
    
    
    
.end




