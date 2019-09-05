#include "segger_rtt.h"
#include "test_gpio.h"
#include "test_i2c.h"
int main() 
{	
 
  SEGGER_RTT_printf(0,"CPU start....\n");
	test_i2c0_oled();
	test_gpio();
	while(1);
}
