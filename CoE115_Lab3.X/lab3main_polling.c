/*
 * File:   lab3main.c
 * Author: lafqu
 *
 * Created on February 27, 2020, 8:44 PM
 */


#include "xc.h"

#pragma config FWDTEN = OFF
#pragma config JTAGEN = OFF
#pragma config POSCMOD = NONE
#pragma config OSCIOFNC = ON
#pragma config FCKSM = CSDCMD
#pragma config FNOSC = FRCPLL
#pragma config PLL96MHZ = OFF
#pragma config PLLDIV = NODIV
#pragma config SOSCSEL = IO

int main(void) {
    
    //config ports
    AD1PCFG = 0xFFFF;
    TRISA = 0x000F;
    TRISB = 0xFE08; //E = 1110, 8 = 1000, 12-4578
    LATB = 0xFFFF;
    
    //config pullups
    CNPU1 = CNPU1 | 0x000C; // 2,3
    CNPU2 = CNPU2 | 0x6000; //14,13
    
    LATBbits.LATB2 = 0;
    
    while(1){
        if(!PORTAbits.RA2)
            LATBbits.LATB4 = 0;
        else
            LATBbits.LATB4 = 1;
    }
    return 0;
}
