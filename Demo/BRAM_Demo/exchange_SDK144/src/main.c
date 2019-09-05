#include "segger_rtt.h"
#include "test_gpio.h"
int main() 
{   
 
    SEGGER_RTT_printf(0,"Hello World 20180504~\n");
        test_gpio();
        while(1);
}
