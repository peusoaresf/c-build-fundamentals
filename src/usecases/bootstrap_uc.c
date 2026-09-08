#include <stdio.h>
#include "hal.h"
#include "bootstrap_uc.h"
#include "blink_led_uc.h"

void bootstrap_uc() {
    printf("Bootstrapping systems..\n");

    Hardware hardware = hal_init();

    blink_led_uc(&hardware);
}