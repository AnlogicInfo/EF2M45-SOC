/**************************************************************************//**
 * @file     system_elf2.c
 * @brief    CMSIS Cortex-M# Device Peripheral Access Layer Source File for
 *           Device elf2
 * @version  V5.00
 * @date     28. September 2016
 ******************************************************************************/
/*
 * Copyright (c) 2009-2016 ARM Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdint.h>
#include "elf2.h"
#include "platform.h"
#include "syscon.h"


#define CFG_SR_REG   (*((volatile uint32_t *)(0x4000b000)))


/*----------------------------------------------------------------------------
  Define clocks
 *----------------------------------------------------------------------------*/
/* ToDo: add here your necessary defines for device initialization
         following is an example for different system frequencies */
#define SYSTEM_CLOCK    AHB_CLK


/*----------------------------------------------------------------------------
  System Core Clock Variable
 *----------------------------------------------------------------------------*/
/* ToDo: initialize SystemCoreClock with the system core clock frequency value
         achieved after system intitialization.
         This means system core clock frequency after call to SystemInit() */
uint32_t SystemCoreClock = SYSTEM_CLOCK;  /* System Clock Frequency (Core Clock)*/



/*----------------------------------------------------------------------------
  Clock functions
 *----------------------------------------------------------------------------*/

void SystemCoreClockUpdate (void)            /* Get Core Clock Frequency      */
{
/* ToDo: add code to calculate the system frequency based upon the current
         register settings.
         This function can be used to retrieve the system core clock frequeny
         after user changed register sittings. */
  SystemCoreClock = SYSTEM_CLOCK;
}

static void delay(uint32_t n)
{
    uint32_t i;
    for(i=0;i<n;i++)
    {
        __NOP();__NOP();__NOP();__NOP();__NOP();__NOP();
    }
}

void SystemInit (void)
{
    while((CFG_SR_REG & 0x04000000)!= 0x04000000);          // wait fpga start
    delay(60000);                                           // wait clock stable
/* ToDo: add code to initialize the system
         do not use global variables because this function is called before
         reaching pre-main. RW section maybe overwritten afterwards. */
    SystemCoreClock = SYSTEM_CLOCK;
    
    //set sysclk (clock source)
    //HAL_SYSCON_HCLK_Src_Sel(clk_sel_pad);   //pad input
    //HAL_SYSCON_HCLK_Src_Sel(clk_sel_rcosc); //osc input      
    //HAL_SYSCON_HCLK_Src_Sel(clk_sel_pib);   //pib input
    HAL_SYSCON_HCLK_Src_Sel(clk_sel_pll);   //pll c0 input
    //set ahb clock divider
    HAL_SYSCON_Set_HClk_Div(SYSTEM_CLK/AHB_CLK);
    
    //set apb clock 0 divider
    HAL_SYSCON_Set_PClk0_Div(AHB_CLK/APB_CLK0);
    
    //set apb clock 1 divider
    HAL_SYSCON_Set_PClk1_Div(AHB_CLK/APB_CLK1);
    
    //set rtc clock
    #if (RTC_SRC_XTAL == 1)
    HAL_SYSCON_Set_RTC_Div(rtcclk_from_xtal,0);
    #else
    HAL_SYSCON_Set_RTC_Div(rtcclk_from_ahb,AHB_CLK/RTC_CLK);
    #endif

    #if (RUN_ON_FLASH == 1)
    // Redirect Interrupt Vectors
    __DMB();
    SCB->VTOR = 0x10000000;
    __DSB();
    #endif
    
}
