/**************************************************************************//**
 * @file     elf2.h
 * @brief    CMSIS Cortex-M3 Core Peripheral Access Layer Header File for
 *           Device elf2
 * @version  V5.00
 * @date     02. March 2016
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

#ifndef ELF2_H      /* ToDo: replace 'elf2' with your device name */
#define ELF2_H

#ifdef __cplusplus
extern "C" {
#endif

/* ToDo: replace 'ANLOGIC' with vendor name; add your doxyGen comment   */
/** @addtogroup ANLOGIC
  * @{
  */


/* ToDo: replace 'elf2' with device name; add your doxyGen comment   */
/** @addtogroup elf2
  * @{
  */


/** @addtogroup Configuration_of_CMSIS
  * @{
  */



/* =========================================================================================================================== */
/* ================                                Interrupt Number Definition                                ================ */
/* =========================================================================================================================== */

typedef enum IRQn
{
    /* =======================================  ARM Cortex-M3 Specific Interrupt Numbers  ======================================== */

    /* ToDo: use this Cortex interrupt numbers if your device is a Cortex-M3 / Cortex-M4 / Cortex-M7 device */
    Reset_IRQn                = -15,              /*!< -15  Reset Vector, invoked on Power up and warm reset                     */
    NonMaskableInt_IRQn       = -14,              /*!< -14  Non maskable Interrupt, cannot be stopped or preempted               */
    HardFault_IRQn            = -13,              /*!< -13  Hard Fault, all classes of Fault                                     */
    MemoryManagement_IRQn     = -12,              /*!< -12  Memory Management, MPU mismatch, including Access Violation
                                                          and No Match                                                         */
    BusFault_IRQn             = -11,              /*!< -11  Bus Fault, Pre-Fetch-, Memory Access Fault, other address/memory
                                                          related Fault                                                        */
    UsageFault_IRQn           = -10,              /*!< -10  Usage Fault, i.e. Undef Instruction, Illegal State Transition        */
    SVCall_IRQn               =  -5,              /*!< -5 System Service Call via SVC instruction                                */
    DebugMonitor_IRQn         =  -4,              /*!< -4 Debug Monitor                                                          */
    PendSV_IRQn               =  -2,              /*!< -2 Pendable request for system service                                    */
    SysTick_IRQn              =  -1,              /*!< -1 System Tick Timer                                                      */	

    /* ===========================================  elf2 Specific Interrupt Numbers  ========================================= */
    /* ToDo: add here your device specific external interrupt numbers
         according the interrupt handlers defined in startup_Device.s
         eg.: Interrupt for Timer#1       TIM1_IRQHandler   ->   TIM1_IRQn */
    WDT_IRQn                      =   0,      /*!< Watchdog Interrupt                 */
    EXT_IRQn                      =   1,      /*!< EXT Interrupt                      */
    RTC_IRQn                      =   2,      /*!< RTC Interrupt                      */
    DMAC_IRQn                     =   3,      /*!< DMAC Interrupt                     */
    QSPI_IRQn                     =   4,      /*!< QSPI Interrupt                     */
    ADCC0_IRQn                    =   5,      /*!< ADCC0 Interrupt                    */
    ADCC1_IRQn                    =   6,      /*!< ADCC1 Interrupt                    */
    ADCC2_IRQn                    =   7,      /*!< ADCC2 Interrupt                    */
    ADCC3_IRQn                    =   8,      /*!< ADCC0 Interrupt                    */
    ADCC4_IRQn                    =   9,      /*!< ADCC1 Interrupt                    */
    ADCC5_IRQn                    =   10,      /*!< ADCC2 Interrupt                    */
    TIMER_IRQn                    =   11,      /*!< TIMER Interrupt                    */
    I2C0_IRQn                     =   12,      /*!< I2C0 Interrupt                     */
    I2C1_IRQn                     =   13,      /*!< I2C1 Interrupt                     */
    SPIM_IRQn                     =   14,      /*!< SPIM Interrupt                     */
    UART_IRQn                     =   15,     /*!< UART Interrupt                     */
    GPIO_IRQn                     =   16,     /*!< GPIO Interrupt                     */
    I2S_IRQn                      =   17,     /*!< I2S Interrupt                      */
} IRQn_Type;


/* =========================================================================================================================== */
/* ================                           Processor and Core Peripheral Section                           ================ */
/* =========================================================================================================================== */

/* ===========================  Configuration of the ARM Cortex-M4 Processor and Core Peripherals  =========================== */
/* ToDo: set the defines according your Device */
/* ToDo: define the correct core revision
         __CM0_REV if your device is a Cortex-M0 device
         __CM3_REV if your device is a Cortex-M3 device
         __CM4_REV if your device is a Cortex-M4 device
         __CM7_REV if your device is a Cortex-M7 device */
#define __CM3_REV                 0x0201    /*!< Core Revision r2p1 */
/* ToDo: define the correct core features for the elf2 */
#define __MPU_PRESENT             1         /*!< Set to 1 if MPU is present */
#define __VTOR_PRESENT            1         /*!< Set to 1 if VTOR is present */
#define __NVIC_PRIO_BITS          3         /*!< Number of Bits used for Priority Levels */
#define __Vendor_SysTickConfig    0         /*!< Set to 1 if different SysTick Config is used */
#define __FPU_PRESENT             0         /*!< Set to 1 if FPU is present */
#define __FPU_DP                  0         /*!< Set to 1 if FPU is double precision FPU (default is single precision FPU) */
#define __ICACHE_PRESENT          0         /*!< Set to 1 if I-Cache is present */
#define __DCACHE_PRESENT          0         /*!< Set to 1 if D-Cache is present */
#define __DTCM_PRESENT            0         /*!< Set to 1 if DTCM is present */


/** @} */ /* End of group Configuration_of_CMSIS */


/* ToDo: include the correct core_cm3.h file
         core_cm0.h if your device is a CORTEX-M0 device
         core_cm3.h if your device is a CORTEX-M3 device
         core_cm4.h if your device is a CORTEX-M4 device
         core_cm7.h if your device is a CORTEX-M4 device */
#include <core_cm3.h>                           /*!< ARM Cortex-M3 processor and core peripherals */
/* ToDo: include your system_elf2.h file
         replace 'elf2' with your device name */
#include "system_elf2.h"                    /*!< elf2 System */


/* ========================================  Start of section using anonymous unions  ======================================== */
#if   defined (__CC_ARM)
  #pragma push
  #pragma anon_unions
#elif defined (__ICCARM__)
  #pragma language=extended
#elif defined(__ARMCC_VERSION) && (__ARMCC_VERSION >= 6010050)
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wc11-extensions"
  #pragma clang diagnostic ignored "-Wreserved-id-macro"
#elif defined (__GNUC__)
  /* anonymous unions are enabled by default */
#elif defined (__TMS470__)
  /* anonymous unions are enabled by default */
#elif defined (__TASKING__)
  #pragma warning 586
#elif defined (__CSMC__)
  /* anonymous unions are enabled by default */
#else
  #warning Not supported compiler type
#endif


/* =========================================================================================================================== */
/* ================                            Device Specific Peripheral Section                             ================ */
/* =========================================================================================================================== */


/** @addtogroup Device_Peripheral_peripherals
  * @{
  */

/* ToDo: add here your device specific peripheral access structure typedefs
         following is an example for a timer */

/* =========================================================================================================================== */
/* ================                                            TMR                                            ================ */
/* =========================================================================================================================== */


/**
  * @brief Timer (TMR)
  */

typedef struct
{                                               /*!< (@ 0x40000000) TIM Structure                                              */
  __IOM uint32_t   TimerLoad;                   /*!< (@ 0x00000004) Timer Load                                                 */
  __IM  uint32_t   TimerValue;                  /*!< (@ 0x00000008) Timer Counter Current Value                                */
  __IOM uint32_t   TimerControl;                /*!< (@ 0x0000000C) Timer Control                                              */
  __OM  uint32_t   TimerIntClr;                 /*!< (@ 0x00000010) Timer Interrupt Clear                                      */
  __IM  uint32_t   TimerRIS;                    /*!< (@ 0x00000014) Timer Raw Interrupt Status                                 */
  __IM  uint32_t   TimerMIS;                    /*!< (@ 0x00000018) Timer Masked Interrupt Status                              */
  __IM  uint32_t   RESERVED[1];
  __IOM uint32_t   TimerBGLoad;                 /*!< (@ 0x00000020) Background Load Register                                   */
} ELF2_TMR_TypeDef;

/*@}*/ /* end of group elf2_Peripherals */


/* =========================================  End of section using anonymous unions  ========================================= */
#if   defined (__CC_ARM)
  #pragma pop
#elif defined (__ICCARM__)
  /* leave anonymous unions enabled */
#elif (__ARMCC_VERSION >= 6010050)
  #pragma clang diagnostic pop
#elif defined (__GNUC__)
  /* anonymous unions are enabled by default */
#elif defined (__TMS470__)
  /* anonymous unions are enabled by default */
#elif defined (__TASKING__)
  #pragma warning restore
#elif defined (__CSMC__)
  /* anonymous unions are enabled by default */
#else
  #warning Not supported compiler type
#endif


/* =========================================================================================================================== */
/* ================                          Device Specific Peripheral Address Map                           ================ */
/* =========================================================================================================================== */


/* ToDo: add here your device peripherals base addresses
         following is an example for timer */
/** @addtogroup Device_Peripheral_peripheralAddr
  * @{
  */

/* Peripheral and SRAM base address */
#define ELF2_FLASH_BASE       (0x00000000UL)                              /*!< (FLASH     ) Base Address */
#define ELF2_SRAM_BASE        (0x20000000UL)                              /*!< (SRAM      ) Base Address */
#define ELF2_PERIPH_BASE      (0x40000000UL)                              /*!< (Peripheral) Base Address */

/* Peripheral memory map */
#define ELF2TIM0_BASE         (ELF2_PERIPH_BASE)          /*!< (Timer0    ) Base Address */
#define ELF2TIM1_BASE         (ELF2_PERIPH_BASE + 0x0800) /*!< (Timer1    ) Base Address */
#define ELF2TIM2_BASE         (ELF2_PERIPH_BASE + 0x1000) /*!< (Timer2    ) Base Address */

/** @} */ /* End of group Device_Peripheral_peripheralAddr */


/* =========================================================================================================================== */
/* ================                                  Peripheral declaration                                   ================ */
/* =========================================================================================================================== */


/* ToDo: add here your device peripherals pointer definitions
         following is an example for timer */
/** @addtogroup Device_Peripheral_declaration
  * @{
  */

#define ELF2_TIM0        ((ELF2_TMR_TypeDef *) ELF2TIM0_BASE)
#define ELF2_TIM1        ((ELF2_TMR_TypeDef *) ELF2TIM0_BASE)
#define ELF2_TIM2        ((ELF2_TMR_TypeDef *) ELF2TIM0_BASE)


/** @} */ /* End of group elf2 */

/** @} */ /* End of group ANLOGIC */

#ifdef __cplusplus
}
#endif

#endif  /* elf2_H */
