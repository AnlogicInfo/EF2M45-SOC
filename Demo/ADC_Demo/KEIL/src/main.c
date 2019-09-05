#include "segger_rtt.h"
#include "test_gpio.h"
#include "test_adc.h"
int main() 
{	
 
    SEGGER_RTT_printf(0,"CPU start....\n");
		test_adc_contiune_scan();
		test_gpio();
		while(1);
}
