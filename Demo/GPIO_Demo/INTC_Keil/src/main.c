#include "segger_rtt.h"
#include "test_demo.h"
int main() 
{   
 
    SEGGER_RTT_printf(0,"Hello World 20180808~\n");
    test_demo();
    while(1);
}
