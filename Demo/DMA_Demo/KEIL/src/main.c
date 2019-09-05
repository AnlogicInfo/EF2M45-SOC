#include "segger_rtt.h"
#include "test_gpio.h"
int main() 
{	
 
    SEGGER_RTT_printf(0,"CPU start....\n");
		test_gpio();
		while(1);
}
