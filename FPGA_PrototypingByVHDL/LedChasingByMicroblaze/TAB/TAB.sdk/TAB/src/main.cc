

#include "gpio_cores.h"


void led_check(GpoCore *led_p, int n) {
   int i;

   for (i = 0; i < n; i++) {
      led_p->write(1, i);
      sleep_ms(200);
      led_p->write(0, i);
      sleep_ms(200);
   }
}

void led_return_check(GpoCore *led_p, int n) {
   int j;

   for (j = n; 0 < j; j--) {
      led_p->write(1, j);
      sleep_ms(200);
      led_p->write(0, j);
      sleep_ms(200);
   }
}




// instantiate switch, led
GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));
GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));

int main() {

   while (1) {

      led_check(&led, 16);
      sleep_ms(1000);
      led_return_check(&led, 16);

   } //while
} //main
