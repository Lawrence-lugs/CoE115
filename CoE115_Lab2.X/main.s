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
    
    
    ;set viewport to 16, slowly decrement as you write characters
    mov #0x0010, W0
    mov W0, viewport
    
    ;screen trackers
    mov #0x0008,W5
    mov #0x000c,W7
    mov #0x0000,W6 ;add things to w6 to move the screen forward
    
    pos1:
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    goto end
	
    pos2:
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits
    goto end
    
    pos3:
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits
    goto end
	
    pos4:
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits
    goto end

    pos5:
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits
    goto end

pos6:
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits
    goto end	
    
    pos7:     
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits
    goto end

    pos8:     
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits
    goto end

    pos9:     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    goto end

    pos10:     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits     
    goto end

    pos11:     
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits    
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits      
    goto end
    
    pos12:     
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits    
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits      
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits      
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits    
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    goto end

    pos13:     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits      
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits    
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits      
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits    
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits     
    goto end

    pos14:     
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits    
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits      
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits    
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits         
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits      
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits    
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits      
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits    
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits      
    goto end

    pos15:             
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits    
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits    
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits      
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits    
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits   
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits    
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits      
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits    
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits     
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     

    pos16:             
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits   
    ;w
    mov #0x0017, W1
    mov #0x0017, W2
    call lcd_send8bits    
    ;r
    mov #0x0017, W1
    mov #0x0012, W2
    call lcd_send8bits    
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits      
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits    
    ;c
    mov #0x0016, W1
    mov #0x0013, W2
    call lcd_send8bits     
    ;e
    mov #0x0016, W1
    mov #0x0015, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits
    ;R
    mov #0x0015, W1
    mov #0x0012, W2
    call lcd_send8bits
    ;o
    mov #0x0016, W1
    mov #0x001F, W2
    call lcd_send8bits
    ;m
    mov #0x0016, W1
    mov #0x001D, W2
    call lcd_send8bits
    ;a
    mov #0x0016, W1
    mov #0x0011, W2
    call lcd_send8bits    
    ;n
    mov #0x0016, W1
    mov #0x001e, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;L
    mov #0x0014, W1
    mov #0x001C, W2
    call lcd_send8bits     
    ;move down
    mov #0x000c, W1
    mov #0x0000, W2
    call lcd_send8bits
    call delay15ms
    call delay15ms
    ;0
    mov #0x0013, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits   
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits    
    ;-
    mov #0x0012, W1
    mov #0x001d, W2
    call lcd_send8bits     
    ;1
    mov #0x0013, W1
    mov #0x0011, W2
    call lcd_send8bits      
    ;3
    mov #0x0013, W1
    mov #0x0013, W2
    call lcd_send8bits    
    ;8
    mov #0x0013, W1
    mov #0x0018, W2
    call lcd_send8bits     
    ;5
    mov #0x0013, W1
    mov #0x0015, W2
    call lcd_send8bits
    ;9
    mov #0x0013, W1
    mov #0x0019, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;[]
    mov #0x0012, W1
    mov #0x0010, W2
    call lcd_send8bits     
    ;2
    mov #0x0013, W1
    mov #0x0012, W2
    call lcd_send8bits      
    goto end  
    
    
    end:
    
	pollbutton:
	btss PORTA, #0 ;if port A is 0, increment W6
	goto buttonpressed
	sub W11,#1,W9
	bra nz, pollbutton ;proceed to view2 if button was once pressed
	mov #0x0000, W1 ;clear display if going to view2
	mov #0x0001, W2
	call lcd_send8bits
	call delay15ms
	goto view2
    
	buttonpressed:
	mov #0x0001,W11
	add W6,#1,W6
	call delaylongms
	mov #0x0000, W1 ;clear display
	mov #0x0001, W2
	call lcd_send8bits
	call delay15ms
	
	
	
	next0:
	sub W6,#0,W9
	
	bra nz,next1
	goto pos1
	next1:
	sub W6,#1,W9
	 
	bra nz,next2
	goto pos2
	next2:
	sub W6,#2,W9
	 
	bra nz,next3
	goto pos3
	next3:
	sub W6,#3,W9
	 
	bra nz,next4
	goto pos4
	next4:
	sub W6,#4,W9
	 
	bra nz,next5
	goto pos5
	next5:
	sub W6,#5,W9
	 
	bra nz,next6
	goto pos6
	next6:
	sub W6,#6,W9
	 
	bra nz,next7
	goto pos7
	next7:
	sub W6,#7,W9
	 
	bra nz,next8
	goto pos8
	next8:
	sub W6,#8,W9
	 
	bra nz,next9
	goto pos9
	next9:
	sub W6,#9,W9
	 
	bra nz,next10
	goto pos10
	next10:
	sub W6,#10,W9
	 
	bra nz,next11
	goto pos11
	next11:
	sub W6,#11,W9
	 
	bra nz,next12
	goto pos12
	next12:
	sub W6,#12,W9
	 
	bra nz,next13
	goto pos13
	next13:
	sub W6,#13,W9
	 
	bra nz,next14
	goto pos14
	next14:
	sub W6,#14,W9
	 
	bra nz,next15
	goto pos15
	next15:
	sub W6,#15,W9
	
	bra nz,next16
	goto pos16
	next16:
	mov #0x0000,W6
	goto next0
	
botline:
;move down
mov #0x000c, W1
mov #0x0000, W2
call lcd_send8bits
call delay15ms
return
	
pineapple:
;P
mov #0x0015, W1
mov #0x0010, W2
call lcd_send8bits
;i
mov #0x0016, W1
mov #0x0019, W2
call lcd_send8bits
;n
mov #0x0016, W1
mov #0x001e, W2
call lcd_send8bits
;e
mov #0x0016, W1
mov #0x0015, W2
call lcd_send8bits      
;a
mov #0x0016, W1
mov #0x0011, W2
call lcd_send8bits   
;p
mov #0x0017, W1
mov #0x0010, W2
call lcd_send8bits   
;p
mov #0x0017, W1
mov #0x0010, W2
call lcd_send8bits
;l
mov #0x0016, W1
mov #0x001c, W2
call lcd_send8bits      
;e
mov #0x0016, W1
mov #0x0015, W2
call lcd_send8bits      
return

meat:
;M
mov #0x0014, W1
mov #0x001d, W2
call lcd_send8bits
;e
mov #0x0016, W1
mov #0x0015, W2
call lcd_send8bits      
;a
mov #0x0016, W1
mov #0x0011, W2
call lcd_send8bits   
;t
mov #0x0017, W1
mov #0x0014, W2
call lcd_send8bits   
;<
mov #0x0013, W1
mov #0x001c, W2
call lcd_send8bits
;3
mov #0x0013, W1
mov #0x0013, W2
call lcd_send8bits      
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
return
    
kimchi:
;K
mov #0x0014, W1
mov #0x001b, W2
call lcd_send8bits
;i
mov #0x0016, W1
mov #0x0019, W2
call lcd_send8bits
;m
mov #0x0016, W1
mov #0x001D, W2
call lcd_send8bits
;c
mov #0x0016, W1
mov #0x0013, W2
call lcd_send8bits     
;h
mov #0x0016, W1
mov #0x0018, W2
call lcd_send8bits
;i
mov #0x0016, W1
mov #0x0019, W2
call lcd_send8bits
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
return

topline:
;move up
mov #0x0008, W1
mov #0x0000, W2
call lcd_send8bits
call delay15ms
return
    
Manager:
;M
mov #0x0014, W1
mov #0x001d, W2
call lcd_send8bits
;a
mov #0x0016, W1
mov #0x0011, W2
call lcd_send8bits   
;n
mov #0x0016, W1
mov #0x001e, W2
call lcd_send8bits    
;a
mov #0x0016, W1
mov #0x0011, W2
call lcd_send8bits   
;g
mov #0x0016, W1
mov #0x0017, W2
call lcd_send8bits   
;e
mov #0x0016, W1
mov #0x0015, W2
call lcd_send8bits      
;r
mov #0x0017, W1
mov #0x0012, W2
call lcd_send8bits    
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
;[]
mov #0x0012, W1
mov #0x0010, W2
call lcd_send8bits   
return
    
view2:
    mov #0x0000,W12
    s1:
    call botline
    call Manager
    call topline
    call pineapple
    call delaylongms2
    btss PORTA,#0
    goto s4
    goto s2
    s2:
    call botline
    call pineapple
    call topline
    call meat
    call delaylongms2
    btss PORTA,#0
    goto s1
    goto s3
    s3:
    call botline
    call meat
    call topline
    call kimchi
    call delaylongms2
    btss PORTA,#0
    goto s2
    goto s4
    s4:
    call botline
    call kimchi
    call topline
    call Manager
    call delaylongms2
    btss PORTA,#0
    goto s3
    goto s1
    
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
	
	
delaylongms:
    mov #0x0004,W0
    mov W0,i
    mov #0x4E20,W0
    mov W0,j
    looplongms:
	dec j
	bra nz, looplongms
	dec i
	bra nz, looplongms
	nop
	nop
	return
	
servicebutton:
    mov #0x0001,W12
    goto cont
    
servicebutton2:
    ;reset flags
    mov #0x0000,W11
    mov #0x0000,W6
    mov #0x0000,W12
    
    mov #0x0000, W1 ;clear display
    mov #0x0001, W2
    call lcd_send8bits
    call delay15ms
    call delaylongms
    goto pos1
	
delaylongms2:
    mov #0x000F,W0
    mov W0,i
    mov #0x4E20,W0
    mov W0,j
    looplongms2:
	;poll button
	btss PORTA,#0
	goto servicebutton
	sub W12,#0x0000,W9
	bra nz, servicebutton2
	cont:
	dec j
	bra nz, looplongms2
	dec i
	bra nz, looplongms2
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
    
    
;-------BONUS AREA-------
	
/*.include "p24FJ64GB002.inc"
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
*/
    

    
.end