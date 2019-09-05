#ifndef _INTC_H_
#define _INTC_H_

#include "system.h"

void intc_init(void);
void int_set_priority(IRQn_Type type, uint8_t pri);


#endif // _INTC_H_
