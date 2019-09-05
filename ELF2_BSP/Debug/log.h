#ifndef LOG_H_
#define LOG_H_

#include <stdio.h>
#include "platform.h"
#include <stdint.h>

#define PRINTF_OMIT		0			// when release software, set 1 to omit all printf logs
#define PRINT_TO_RTT	1			// 1: print to segger rtt   0: print to uart1


#if (RUN_VERIFICATION == 1)
#define SIM_REPORT_BASE                 0x40000ff0
#define SIM_PRINT_BASE                  (SIM_REPORT_BASE+4)
#else

#endif



#if (PRINTF_OMIT == 0)
int fputc(int ch, FILE *f);
#if (RUN_VERIFICATION == 1)
		#define printf(...) 	\
					do{							\
						printf(__VA_ARGS__);	\
						*(uint32_t *)SIM_REPORT_BASE = 0x7;\
					}while(0)
#endif
					
#else
		#define printf(...);			
					
#endif
					

				
#if (RUN_VERIFICATION == 1)
void simu_pass(void);
void simu_fail(void);
void simu_finish(void);
#else
#define simu_pass()
#define simu_fail()
#define simu_finish()

#endif

#endif
