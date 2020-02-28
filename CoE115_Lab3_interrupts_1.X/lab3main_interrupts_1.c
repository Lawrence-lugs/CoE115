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

#define DEBOUNCEMAX 100

//define interrupt handler and toggle function
void __attribute__ ((interrupt)) _CNInterrupt(void);
void led1_toggle(void);

int row1_isPressed;

int main(void) {
    
    //config ports
    AD1PCFG = 0xFFFF;
    TRISA = 0x000F;
    TRISB = 0xFE08; //E = 1110, 8 = 1000, 12-4578
    LATB = 0xFFFF;
    
    //config pullups
    CNPU1 = CNPU1 | 0x000C; // 2,3
    CNPU2 = CNPU2 | 0x6000; //14,13
    
    //enable change notification interrupt
    CNEN1 = CNEN1 | 0x000C; //monitor RA0 pin 2 (100)
    CNEN2 = CNEN2 | 0x6000; //14,13
    IEC1bits.CNIE = 1; //change notification interrupt enable
    IFS1bits.CNIF = 0; //clear interrupt flag
    
    //initial begin
    LATBbits.LATB2 = 0;
    while(1){
        if(row1_isPressed){
            led1_toggle();
            row1_isPressed = 0; //clear pressed flag
        }
    }
    return 0;
    //end
}

void __attribute__ ((interrupt)) _CNInterrupt(void) {
    
    int debounceCounter = 0;
    if(!PORTAbits.RA2){ //if RA0 is low, (button is pressed)
        while((!PORTAbits.RA2) && (debounceCounter < DEBOUNCEMAX)){ //
            debounceCounter++;
        }
        if(debounceCounter == DEBOUNCEMAX) //it's an actual press
            row1_isPressed = 1;
        else //was a glitch probs
            row1_isPressed = 0;
    }
    IFS1bits.CNIF = 0; //clear interrupt flag
}

void led1_toggle(void){
    LATBbits.LATB4 = !LATBbits.LATB4; //toggle led
    return;
}