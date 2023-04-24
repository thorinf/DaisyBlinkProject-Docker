/** Daisy Blink Example
 *
 *  This example blinks the Daisy Seed's LED
 *  once per second, as explained in the
 *  C++ Getting Started guide for the Daisy.
*/
#include "daisy_seed.h"

using namespace daisy;
DaisySeed hardware;

int main()
{
    hardware.Init();

    bool led_state = false;

    while (true)
    {
        hardware.SetLed(led_state);
        led_state = !led_state;
        hardware.DelayMs(500);
    }
}
