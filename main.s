.include "p24fj64gb002.inc"
.global __reset
    
.bss
i: .space 1
j: .space 1
k: .space 1
h: .space 1
 
.text
__reset:
    mov #__SP_init, W15
    mov #__SPLIM_init, W0
    mov W0, SPLIM
    
    mov #0xF9,W4
    mov #254,W1
    mov #247,W2
    mov W4,i
    clr.b j
    clr.b k
    
addctr:
    inc.b i
    clr.b j
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b h
    goto ctrloop
incnew:
    inc.b h
    MOV #20,W0
    cp.b h
    BRA GTU,addctr
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b k
    clr.b j
    goto ctrloop
increment:
    inc.b j
    MOV W2,W0
    cp.b j
    BRA GTU,incnew
    clr.b k
    goto ctrloop
ctrloop:
    inc.b k
    MOV W1,W0
    cp.b k
    BRA GTU,increment
    goto ctrloop
.end
    