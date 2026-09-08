#include <stdio.h>
#include "hal.h"

Hardware hal_init() {
    printf("Initializing hardware simulator..\n");

    return (Hardware) {
        .led_on = 0
    };
}

void hal_toggle_led(Hardware *hardware) {
    hardware->led_on = !hardware->led_on;
}