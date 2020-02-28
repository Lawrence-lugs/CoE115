 #include <24FJ64GB002.h>
 #use delay(clock=3500000)
 void main(void)
 {
 SETUP_ADC_PORTS (NO_ANALOGS);
 set_tris_b(0x0000);
 while (true)
 {
 OUTPUT_B(0xFFFF);
 delay_ms(1000);
 OUTPUT_B(0x0000);
 delay_ms(1000);
 }
 }