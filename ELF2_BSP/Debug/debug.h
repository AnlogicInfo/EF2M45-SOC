#ifndef ART_DEBUG_H
#define ART_DEBUG_H

#include <assert.h>
#include "platform.h"


#define assert_param(e) assert(e)

void __aeabi_assert(const char *expr,const char *file,int line);




#endif
