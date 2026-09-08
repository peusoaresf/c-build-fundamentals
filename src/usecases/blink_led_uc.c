#include <stdio.h>
#include "blink_led_uc.h"

void delay() {
    for (int i = 0; i < 1000000000; i++) {}
}

char* get_led_status(Hardware *hardware) {
    return hardware->led_on ? "ON" : "OFF";
}

void blink_led_uc(Hardware *hardware) {
    do {
        printf("LED %s\n", get_led_status(hardware));
        delay();
        hal_toggle_led(hardware);
    } while (1);
}