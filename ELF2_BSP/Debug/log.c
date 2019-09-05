#include <stdio.h>
#include <stdint.h>
#include "log.h"
#include "platform.h"
#include "SEGGER_RTT.h"
#include "uart.h"
//#include "uart.h"

#if (RUN_VERIFICATION == 1)

void simu_pass()
{
	*(volatile uint32_t *)SIM_REPORT_BASE = 0x10;
}

void simu_fail()
{
	*(volatile uint32_t *)SIM_REPORT_BASE = 0x20;
}

void simu_finish()
{
	*(volatile uint32_t *)SIM_REPORT_BASE = 0x30;
}

#endif

//
// C library retargetting
//


struct __FILE { int handle; /* Add whatever you need here */ };
FILE __stdout;
int fputc(int ch, FILE *f)
{
	#if (RUN_VERIFICATION == 1)
  *(uint32_t *)SIM_PRINT_BASE = ch;
	#else
		#if (PRINT_TO_RTT == 0)
		HAL_UART_WriteChar_Polling(ch);
		#endif
		
		#if (PRINT_TO_RTT == 1)
		SEGGER_RTT_Write(0,&ch,1);
		#endif
	#endif
  return ch;
}

