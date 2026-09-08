#ifndef HAL_H
#define HAL_H

typedef struct {
    int led_on;
} Hardware;

Hardware hal_init();

void hal_toggle_led(Hardware *hardware);

#endif