//////////////////////////////////////////////////////////////////////////////
//  Copyright (C) by fastasic.
//  This module is a confidential and proprietary property of fastasic
//  and a possession or use of this module requires written permission 
//  from fastasic.
//----------------------------------------------------------------------------
// Author           :  
// Company          : ANLOGIC
// ---------------------------------------------------------------------------
// Description      :C:\projects\wedl\wedf\utility\fr.pl -f .\timer_regmap.xlsx -ral -cheader -ctest
// Simulation Notes :
// Synthesis Notes  :
// Application Note :
// Simulator        :
// Parameters       :
// Terms & concepts :
// Bugs             :
// Open issues and future enhancements :
// References       :
// Revision History :
// ---------------------------------------------------------------------------
//
//////////////////////////////////////////////////////////////////////////////
#ifndef __TIMER_REG_TEST_H__
#define __TIMER_REG_TEST_H__
//Auto-gen by fr
#include "wedvp_reg_test_general_macro.h"

WEDVP_REG_DEF_S timer_timer1loadcount;
WEDVP_REG_DEF_S timer_timer1currentvalue;
WEDVP_REG_DEF_S timer_timer1controlreg;
WEDVP_REG_DEF_S timer_timer1eoi;
WEDVP_REG_DEF_S timer_timer1intstatus;
WEDVP_REG_DEF_S timer_timer2loadcount;
WEDVP_REG_DEF_S timer_timer2currentvalue;
WEDVP_REG_DEF_S timer_timer2controlreg;
WEDVP_REG_DEF_S timer_timer2eoi;
WEDVP_REG_DEF_S timer_timer2ntstatus;
WEDVP_REG_DEF_S timer_timersintstatus;
WEDVP_REG_DEF_S timer_timerseoi;
WEDVP_REG_DEF_S timer_timersrawintstatus;
WEDVP_REG_DEF_S timer_timerscomponentversion;

void timer_define_and_initial(uint32_t addr_base);
uint32_t timer_initial_test(void);
uint32_t timer_access_test(void);
uint32_t timer_mem_test(void);
uint32_t timer_all_test(uint32_t addr_base);
#endif


