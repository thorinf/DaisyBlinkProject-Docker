/** Basic Daisy Blink Example
 *
 *  This example blinks toggles the state of an LED every half a second.
 */
#include "daisy_seed.h"

using namespace daisy;

DaisySeed hw;

int main() {
  hw.Init();
  bool led_state = false;
  while (1) {
    /** Set the USR LED to the current state */
    hw.SetLed(led_state);
    /** Toggle the state from true/false, or vice versa */
    led_state = !led_state;
    /** Delay for the specified number of milliseconds */
    System::Delay(500);
  }
}
