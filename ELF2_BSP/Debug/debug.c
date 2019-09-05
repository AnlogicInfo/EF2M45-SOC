
#include "log.h"
#include "debug.h"



void __aeabi_assert(const char *expr,const char *file,int line)
{
//	GLOBAL_INT_STOP();
    __disable_irq();
	printf("Assertion Failed: file %s, line %d, %s\n",file,line,expr);

	while(1);
}




