;/**************************************************************************//**
; * @file     startup_elf2.s
; * @brief    CMSIS Cortex-M ARMv7-M based Core Device Startup File for
; *           Device elf2
; * @version  V5.00
; * @date     02. March 2016
; ******************************************************************************/
;/*
; * Copyright (c) 2009-2016 ARM Limited. All rights reserved.
; *
; * SPDX-License-Identifier: Apache-2.0
; *
; * Licensed under the Apache License, Version 2.0 (the License); you may
; * not use this file except in compliance with the License.
; * You may obtain a copy of the License at
; *
; * www.apache.org/licenses/LICENSE-2.0
; *
; * Unless required by applicable law or agreed to in writing, software
; * distributed under the License is distributed on an AS IS BASIS, WITHOUT
; * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; * See the License for the specific language governing permissions and
; * limitations under the License.
; */
;/*

;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000100

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts

                DCD     WDT_IRQHandler            ;  0:  WDT interrupt
                DCD     EXT_IRQHandler            ;  1:  EXT interrupt
                DCD     RTC_IRQHandler            ;  2:  RTC interrupt
                DCD     DMAC_IRQHandler           ;  3:  DMAC interrupt
                DCD     QSPI_IRQHandler           ;  4:  QSPI interrupt
                DCD     ADCC0_IRQHandler          ;  5:  ADCC0 interrupt
				DCD     ADCC1_IRQHandler          ;  6:  ADCC1 interrupt
				DCD     ADCC2_IRQHandler          ;  7:  ADCC2 interrupt
				DCD     ADCC3_IRQHandler          ;  8:  ADCC3 interrupt
				DCD     ADCC4_IRQHandler          ;  9:  ADCC4 interrupt
				DCD     ADCC5_IRQHandler          ;  10: ADCC5 interrupt
                DCD     TIMER_IRQHandler          ;  11: TIMER interrupt
                DCD     I2C0_IRQHandler           ;  12: I2C0 interrupt
                DCD     I2C1_IRQHandler           ;  13: I2C1 interrupt
                DCD     SPIM_IRQHandler           ;  14: SPIM interrupt
                DCD     UART_IRQHandler           ;  15: UART interrupt
				DCD     GPIO_IRQHandler           ;  16: GPIO interrupt
				DCD     I2S_IRQHandler            ;  17: I2S interrupt
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler\
                PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler\
                PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler\
                PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler\
                PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WDT_IRQHandler            [WEAK]
                EXPORT  EXT_IRQHandler            [WEAK]
                EXPORT  RTC_IRQHandler            [WEAK]
                EXPORT  DMAC_IRQHandler           [WEAK]
                EXPORT  QSPI_IRQHandler           [WEAK]
                EXPORT  ADCC0_IRQHandler          [WEAK]
                EXPORT  ADCC1_IRQHandler          [WEAK]
                EXPORT  ADCC2_IRQHandler          [WEAK]
                EXPORT  ADCC3_IRQHandler          [WEAK]
                EXPORT  ADCC4_IRQHandler          [WEAK]
                EXPORT  ADCC5_IRQHandler          [WEAK]
                EXPORT  TIMER_IRQHandler          [WEAK]
                EXPORT  I2C0_IRQHandler           [WEAK]
                EXPORT  I2C1_IRQHandler           [WEAK]
                EXPORT  SPIM_IRQHandler           [WEAK]
                EXPORT  UART_IRQHandler           [WEAK]
                EXPORT  GPIO_IRQHandler           [WEAK]
                EXPORT  I2S_IRQHandler            [WEAK]
WDT_IRQHandler
EXT_IRQHandler
RTC_IRQHandler
DMAC_IRQHandler
QSPI_IRQHandler
ADCC0_IRQHandler
ADCC1_IRQHandler
ADCC2_IRQHandler
ADCC3_IRQHandler
ADCC4_IRQHandler
ADCC5_IRQHandler
TIMER_IRQHandler
I2C0_IRQHandler
I2C1_IRQHandler
SPIM_IRQHandler
UART_IRQHandler
GPIO_IRQHandler
I2S_IRQHandler
                B       .
                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap

__user_initial_stackheap PROC
                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR
                ENDP

                ALIGN

                ENDIF


                END
