//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may     
// only be used by a person authorised under and to the extent permitted       
// by a subsisting licensing agreement from FASTASIC Limited.              
//                                                                             
//            (C) COPYRIGHT 2015-2017 FASTASIC Limited.                  
//                ALL RIGHTS RESERVED                                          
//                                                                             
// This entire notice must be reproduced on all copies of this file            
// and copies of this file may only be made by a person if such person is      
// permitted to do so under the terms of a subsisting license agreement        
// from FASTASIC Limited.                                                  
//-----------------------------------------------------------------------------
#ifndef __REG_UART_H__
#define __REG_UART_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//rbr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  rbr_lsb_8bits :  8; /* 7: 0, Data byte received on the serial input port (sin) in UART mode, or the serial infrared input (sir_in) in infrared mode. The data in this register is valid only if the Data Ready (DR) bit in the Line Status Register (LSR) is set.
        uint32_t                 rbr_msb_9thbit :  1; /* 8: 8, Data byte received on the serial input port (sin) in UART mode for the MSB 9th bit. 
        uint32_t                     reserved_0 : 23; /*31: 9,                             NA*/
    } bit_field;
} T_UART_RBR;

//thr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  thr_lsb_8bits :  8; /* 7: 0, Data to be transmitted on the serial output port (sout) in UART mode or the serial infrared output (sir_out_n) in infrared mode. Data should only be written to the THR when the THR Empty (THRE) bit (LSR[5]) is set.
        uint32_t                 thr_msb_9thbit :  1; /* 8: 8, Data to be transmitted on the serial output port (sout) in UART mode for the MSB 9th bit. 
        uint32_t                     reserved_0 : 23; /*31: 9,                             NA*/
    } bit_field;
} T_UART_THR;

//dll
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t              divisor_latch_low :  8; /* 7: 0, Lower 8 bits of a 16-bit, read/write, Divisor Latch register that contains the baud rate divisor for the UART.
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_DLL;

//dlh
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t             divisor_latch_high :  8; /* 7: 0, Upper 8-bits of a 16-bit, read/write, Divisor Latch register that contains the baud rate divisor for the UART.
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_DLH;

//ier
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          erbfi :  1; /* 0: 0, Enable Received Data Available Interrupt. This is used to enable/disable the generation of Received Data Available Interrupt and the Character Timeout Interrupt (if in FIFO mode and FIFOs enabled). These are the second highest priority interrupts.
        uint32_t                          etbei :  1; /* 1: 1, Enable Transmit Holding Register Empty Interrupt. This is used to enable/disable the generation of Transmitter Holding Register Empty Interrupt. This is the third highest priority interrupt.
        uint32_t                           elsi :  1; /* 2: 2, Enable Receiver Line Status Interrupt. This is used to enable/disable the generation of Receiver Line Status Interrupt. This is the highest priority interrupt.
        uint32_t                          edssi :  1; /* 3: 3, Enable Modem Status Interrupt. This is used to enable/disable the generation of Modem Status Interrupt. This is the fourth highest priority interrupt.
        uint32_t                     reserved_1 :  3; /* 6: 4,                             NA*/
        uint32_t                          ptime :  1; /* 7: 7, Programmable THRE Interrupt Mode Enable that can be written to only when THRE_MODE_USER = Enabled, always readable. This is used to enable/disable the generation of THRE Interrupt.
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_IER;

//iir
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            iid :  4; /* 3: 0, Interrupt ID. This indicates the highest priority pending interrupt which can be one of the following types:
        uint32_t                     reserved_1 :  2; /* 5: 4,                             NA*/
        uint32_t                         fifose :  2; /* 7: 6, FIFOs Enabled. This is used to indicate whether the FIFOs are enabled or disabled.
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_IIR;

//fcr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          fifoe :  1; /* 0: 0, FIFO Enable. This enables/disables the transmit (XMIT) and receive (RCVR) FIFOs. Whenever the value of this bit is changed both the XMIT and RCVR controller portion of FIFOs is reset.*/
        uint32_t                         rfifor :  1; /* 1: 1, RCVR FIFO Reset. This resets the control portion of the receive FIFO and treats the FIFO as empty. This also de-asserts the DMA RX request and single signals when additional DMA handshaking signals are selected (DMA_EXTRA = YES).
        uint32_t                         xfifor :  1; /* 2: 2, XMIT FIFO Reset. This resets the control portion of the transmit FIFO and treats the FIFO as empty. This also de-asserts the DMA TX request and single signals when additional DMA handshaking signals are selected (DMA_EXTRA = YES).
        uint32_t                           dmam :  1; /* 3: 3, DMA Mode. This determines the DMA signalling mode used for the dma_tx_req_n and dma_rx_req_n output signals when additional DMA handshaking signals are not selected (DMA_EXTRA = No).
        uint32_t                            tet :  2; /* 5: 4, TX Empty Trigger. Writes have no effect when THRE_MODE_USER = Disabled. This is used to select the empty threshold level at which the THRE Interrupts are generated when the mode is active. It also determines when the dma_tx_req_n signal is asserted when in certain modes of operation.The following trigger levels are supported:
        uint32_t                           rcvr :  2; /* 7: 6, RCVR Trigger. This is used to select the trigger level in the receiver FIFO at which the Received Data Available Interrupt is generated. In auto flow control mode, this trigger is used to determine when the rts_n signal is de-asserted only when RTC_FCT is disabled. It also determines when the dma_rx_req_n signal is asserted in certain modes of operation. The following trigger levels are supported:
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_FCR;

//lcr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            dls :  2; /* 1: 0, Data Length Select. If UART_16550_COMPATIBLE = NO, then writable only when UART is not busy (USR[0] is 0); otherwise always writable and readable. When DLS_E in LCR_EXT is set to 0, this register is used to select the number of data bits per character that the peripheral transmits and receives. The number of bits that may be selected are as follows:
        uint32_t                           stop :  1; /* 2: 2, Number of stop bits. If UART_16550_COMPATIBLE = NO, then writeable only when UART is not busy (USR[0] is 0); otherwise always writable, always readable. This is used to select the number of stop bits per character that the peripheral transmits and receives. If set to 0, one stop bit is transmitted in the serial data.
        uint32_t                            pen :  1; /* 3: 3, Parity Enable. If UART_16550_COMPATIBLE = NO, then writeable only when UART is not busy (USR[0] is 0); otherwise always writable, always readable. This bit is used to enable and disable parity generation and detection in transmitted and received serial character respectively.
        uint32_t                            eps :  1; /* 4: 4, Even Parity Select. If UART_16550_COMPATIBLE = NO, then writeable only when UART is not busy (USR[0] is 0); otherwise always writable, always readable. This is used to select between even and odd parity, when parity is enabled (PEN set to 1). If set to 1, an even number of logic 1s is transmitted or checked. If set to 0, an odd number of logic 1s is transmitted or checked.*/
        uint32_t                   stick_parity :  1; /* 5: 5, Stick Parity. If UART_16550_COMPATIBLE = NO, then writeable only when UART is not busy (USR[0] is 0); otherwise always writable, always readable. This bit is used to force parity value. When PEN, EPS, and Stick Parity are set to 1, the parity bit is transmitted and checked as logic 0. If PEN and Stick Parity are set to 1 and EPS is a logic 0, then parity bit is transmitted and checked as a logic 1. If this bit is set to 0, Stick Parity is disabled.*/
        uint32_t                         break_ :  1; /* 6: 6, Break Control Bit.This is used to cause a break condition to be transmitted to the receiving device. If set to 1, the serial output is forced to the spacing (logic 0) state. When not in Loopback Mode, as determined by MCR[4], the sout line is forced low until the Break bit is cleared. If SIR_MODE = Enabled and active (MCR[6] set to 1) the sir_out_n line is continuously pulsed. When in Loopback Mode, the break condition is internally looped back to the receiver and the sir_out_n line is forced low.*/
        uint32_t                           dlab :  1; /* 7: 7, Divisor Latch Access Bit. If UART_16550_COMPATIBLE = NO, then writeable only when UART is not busy (USR[0] is 0); otherwise always writable, always readable. This bit is used to enable reading and writing of the Divisor Latch register (DLL and DLH/LPDLL and LPDLH) to set the baud rate of the UART. This bit must be cleared after initial baud rate setup in order to access other registers.*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_LCR;

//mcr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            dtr :  1; /* 0: 0, Data Terminal Ready. This is used to directly control the Data Terminal Ready (dtr_n) output. The value written to this location is inverted and driven out on dtr_n, that is:
        uint32_t                            rts :  1; /* 1: 1, Request to Send. This is used to directly control the Request to Send (rts_n) output. The Request To Send (rts_n) output is used to inform the modem or data set that the UART is ready to exchange data.
        uint32_t                           out1 :  1; /* 2: 2, OUT1. This is used to directly control the user-designated Output1 (out1_n) output. The value written to this location is inverted and driven out on out1_n, that is:
        uint32_t                           out2 :  1; /* 3: 3, OUT2. This is used to directly control the user-designated Output2 (out2_n) output. The value written to this location is inverted and driven out on out2_n, that is:
        uint32_t                       loopback :  1; /* 4: 4, LoopBack Bit. This is used to put the UART into a diagnostic mode for test purposes. 
        uint32_t                           afce :  1; /* 5: 5, Auto Flow Control Enable. Writeable only when AFCE_MODE = Enabled, always readable. When FIFOs are enabled and the Auto Flow Control Enable (AFCE) bit is set, Auto Flow Control features are enabled.
        uint32_t                           sire :  1; /* 6: 6, SIR Mode Enable. Writeable only when SIR_MODE = Enabled, always readable. This is used to enable/disable the IrDA SIR Mode features.
        uint32_t                     reserved_0 : 25; /*31: 7,                             NA*/
    } bit_field;
} T_UART_MCR;

//lsr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                             dr :  1; /* 0: 0, Data Ready bit. This is used to indicate that the receiver contains at least one character in the RBR or the receiver FIFO.
        uint32_t                             oe :  1; /* 1: 1, Overrun error bit. This is used to indicate the occurrence of an overrun error. This occurs if a new data character was received before the previous data was read.
        uint32_t                             pe :  1; /* 2: 2, Parity Error bit. This is used to indicate the occurrence of a parity error in the receiver if the Parity Enable (PEN) bit (LCR[3]) is set.
        uint32_t                             fe :  1; /* 3: 3, Framing Error bit. This is used to indicate the occurrence of a framing error in the receiver. A framing error occurs when the receiver does not detect a valid STOP bit in the received data.
        uint32_t                             bi :  1; /* 4: 4, Break Interrupt bit. This is used to indicate the detection of a break sequence on the serial input data.
        uint32_t                           thre :  1; /* 5: 5, Transmit Holding Register Empty bit. If THRE_MODE_USER = Disabled or THRE mode is disabled (IER[7] set to 0) and regardless of FIFO's being implemented/enabled or not, this bit indicates that the THR or TX FIFO is empty.
        uint32_t                           temt :  1; /* 6: 6, Transmitter Empty bit. If in FIFO mode (FIFO_MODE != NONE) and FIFOs enabled (FCR[0] set to 1), this bit is set whenever the Transmitter Shift Register and the FIFO are both empty. If in non-FIFO mode or FIFOs are disabled, this bit is set whenever the Transmitter Holding Register and the Transmitter Shift Register are both empty.*/
        uint32_t                            rfe :  1; /* 7: 7, Receiver FIFO Error bit. This bit is only relevant when FIFO_MODE != NONE AND FIFOs are enabled (FCR[0] set to 1). This is used to indicate if there is at least one parity error, framing error, or break indication in the FIFO.
        uint32_t                      addr_rcvd :  1; /* 8: 8, Address Received bit. If 9-bit data mode (LCR_EXT[0]=1) is enabled, this bit is used to indicate that the 9th bit of
        uint32_t                     reserved_0 : 23; /*31: 9,                             NA*/
    } bit_field;
} T_UART_LSR;

//msr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           dcts :  1; /* 0: 0, Delta Clear to Send. This is used to indicate that the modem control line cts_n has changed since the last time the MSR was read.
        uint32_t                           ddsr :  1; /* 1: 1, Delta Data Set Ready. This is used to indicate that the modem control line dsr_n has changed since the last time the MSR was read.
        uint32_t                           teri :  1; /* 2: 2, Trailing Edge of Ring Indicator. This is used to indicate that a change on the input ri_n (from an active-low to an inactive-high state) has occurred since the last time the MSR was read.
        uint32_t                           ddcd :  1; /* 3: 3, Delta Data Carrier Detect. This is used to indicate that the modem control line dcd_n has changed since the last time the MSR was read.
        uint32_t                            cts :  1; /* 4: 4, Clear to Send. This is used to indicate the current state of the modem control line cts_n. This bit is the complement of cts_n. When the Clear to Send input (cts_n) is asserted it is an indication that the modem or data set is ready to exchange data with the DW_apb_uart.
        uint32_t                            dsr :  1; /* 5: 5, Data Set Ready. This is used to indicate the current state of the modem control line dsr_n. This bit is the complement of dsr_n. When the Data Set Ready input (dsr_n) is asserted it is an indication that the modem or data set is ready to establish communications with the DW_apb_uart.
        uint32_t                             ri :  1; /* 6: 6, Ring Indicator. This is used to indicate the current state of the modem control line ri_n. This bit is the complement of ri_n. When the Ring Indicator input (ri_n) is asserted it is an indication that a telephone ringing signal has been received by the modem or data set.
        uint32_t                            dcd :  1; /* 7: 7, Data Carrier Detect. This is used to indicate the current state of the modem control line dcd_n. This bit is the complement of dcd_n. When the Data Carrier Detect input (dcd_n) is asserted it is an indication that the carrier has been detected by the modem or data set.
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_MSR;

//scr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     scratchpad :  8; /* 7: 0, This register is for programmers to use as a temporary storage space.*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_SCR;

//far
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               fifo_access_mode :  1; /* 0: 0, Writes have no effect when FIFO_ACCESS = No, always readable. This register is use to enable a FIFO access mode for testing, so that the receive FIFO can be written by the master and the transmit FIFO can be read by the master when FIFOs are implemented and enabled. When FIFOs are not implemented or not enabled it allows the RBR to be written by the master and the THR to be read by the master.
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_UART_FAR;

//tfr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t             transmit_fifo_read :  8; /* 7: 0, Transmit FIFO Read. These bits are only valid when FIFO access mode is enabled (FAR[0] is set to 1).
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_UART_TFR;

//rfw
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           rfwd :  8; /* 7: 0, Receive FIFO Write Data. These bits are only valid when FIFO access mode is enabled (FAR[0] is set to 1). When FIFOs are implemented and enabled, the data that is written to the RFWD is pushed into the receive FIFO. Each consecutive write pushes the new data to the next write location in the receive FIFO. When FIFOs are not implemented or not enabled, the data that is written to the RFWD is pushed into the RBR.*/
        uint32_t                           rfpe :  1; /* 8: 8, Receive FIFO Parity Error. These bits are only valid when FIFO access mode is enabled (FAR[0] is set to 1). When FIFOs are implemented and enabled, this bit is used to write parity error detection information to the receive FIFO. When FIFOs are not implemented or not enabled, this bit is used to write parity error detection information to the RBR.*/
        uint32_t                           rffe :  1; /* 9: 9, Receive FIFO Framing Error. These bits are only valid when FIFO access mode is enabled (FAR[0] is set to 1). When FIFOs are implemented and enabled, this bit is used to write framing error detection information to the receive FIFO. When FIFOs are not implemented or not enabled, this bit is used to write framing error detection information to the RBR.*/
        uint32_t                     reserved_0 : 22; /*31:10,                             NA*/
    } bit_field;
} T_UART_RFW;

//usr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           busy :  1; /* 0: 0, UART Busy. This bit is valid only when UART_16550_COMPATIBLE = NO and indicates that a serial transfer is in progress; when cleared, indicates that the DW_apb_uart is idle or inactive.
        uint32_t                           tfnf :  1; /* 1: 1, Transmit FIFO Not Full. This bit is only valid when FIFO_STAT = YES. This is used to indicate that the transmit FIFO in not full.
        uint32_t                            tfe :  1; /* 2: 2, Transmit FIFO Empty. This bit is only valid when FIFO_STAT = YES. This is used to indicate that the transmit FIFO is completely empty.
        uint32_t                           rfne :  1; /* 3: 3, Receive FIFO Not Empty. This bit is only valid when FIFO_STAT = YES. This is used toindicate that the receive FIFO contains one or more entries.
        uint32_t                            rff :  1; /* 4: 4, Receive FIFO Full. This bit is only valid when FIFO_STAT = YES. This is used to indicate that the receive FIFO is completely full.
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_UART_USR;

//htx
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        halt_tx :  1; /* 0: 0, This register is use to halt transmissions for testing, so that the transmit FIFO can be filled by the master when FIFOs are implemented and enabled.
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_UART_HTX;

//dlf
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            dlf :  5; /* 4: 0, uart float part of baud dividor*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_UART_DLF;

//cpr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 apb_data_width :  2; /* 1: 0, 00 �C 8 bits
        uint32_t                     reserved_2 :  2; /* 3: 2,                             NA*/
        uint32_t                      afce_mode :  1; /* 4: 4,           0 �C FALSE
        uint32_t                      thre_mode :  1; /* 5: 5,           0 �C FALSE
        uint32_t                       sir_mode :  1; /* 6: 6,           0 �C FALSE
        uint32_t                    sir_lp_mode :  1; /* 7: 7,           0 �C FALSE
        uint32_t                       new_feat :  1; /* 8: 8,           0 �C FALSE
        uint32_t                    fifo_access :  1; /* 9: 9,           0 �C FALSE
        uint32_t                      fifo_stat :  1; /*10:10,           0 �C FALSE
        uint32_t                         shadow :  1; /*11:11,           0 �C FALSE
        uint32_t        uart_add_encoded_params :  1; /*12:12,           0 �C FALSE
        uint32_t                      dma_extra :  1; /*13:13,           0 �C FALSE
        uint32_t                     reserved_1 :  2; /*15:14,                             NA*/
        uint32_t                      fifo_mode :  8; /*23:16, 0x00 = 0
        uint32_t                     reserved_0 :  8; /*31:24,                             NA*/
    } bit_field;
} T_UART_CPR;

//ucv
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t         uart_component_version : 32; /*31: 0, ASCII value for each number in the version, followed by *.
    } bit_field;
} T_UART_UCV;

//ctr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  peripheral_id : 32; /*31: 0, This register contains the peripherals identification code.
    } bit_field;
} T_UART_CTR;

//Registers Mapping to the same address
typedef union
{
    T_UART_RBR                   rbr; /*RO   ,Receive Buffer                */
    T_UART_THR                   thr; /*RW   ,Transmit Holding              */
    T_UART_DLL                   dll; /*RW   ,Divisor Latch Low             */
}T_UART_RBR_THR_DLL;
typedef union
{
    T_UART_DLH                   dlh; /*RW   ,Divisor Latch High            */
    T_UART_IER                   ier; /*RW   ,Interrupt Enable              */
}T_UART_DLH_IER;
typedef union
{
    T_UART_IIR                   iir; /*RO   ,Interrupt Identity            */
    T_UART_FCR                   fcr; /*RW   ,FIFO Control                  */
}T_UART_IIR_FCR;

typedef struct
{
    volatile              T_UART_RBR_THR_DLL                    rbr_thr_dll; /*  0x0,  NULL, 0x00000000,      union type of rbr_thr_dll*/
    volatile                  T_UART_DLH_IER                        dlh_ier; /*  0x4,  NULL, 0x00000000,          union type of dlh_ier*/
    volatile                  T_UART_IIR_FCR                        iir_fcr; /*  0x8,  NULL, 0x00000000,          union type of iir_fcr*/
    volatile                      T_UART_LCR                            lcr; /*  0xc,    RW, 0x00000000,                   Line Control*/
    volatile                      T_UART_MCR                            mcr; /* 0x10,    RW, 0x00000000,                  Modem Control*/
    volatile                      T_UART_LSR                            lsr; /* 0x14,    RO, 0x00000060,                    Line Status*/
    volatile                      T_UART_MSR                            msr; /* 0x18,    RO, 0x00000060,                   Modem Status*/
    volatile                      T_UART_SCR                            scr; /* 0x1c,    RW, 0x00000000,                     Scratchpad*/
    volatile                        uint32_t                 reserved_0[20];
    volatile                      T_UART_FAR                            far; /* 0x70,    RO, 0x00000000,                    FIFO Access*/
    volatile                      T_UART_TFR                            tfr; /* 0x74,    RO, 0x00000000,             Transmit FIFO Read*/
    volatile                      T_UART_RFW                            rfw; /* 0x78,    RW, 0x00000000,             Receive FIFO Write*/
    volatile                      T_UART_USR                            usr; /* 0x7c,    RO, 0x00000006,                    UART Status*/
    volatile                        uint32_t                  reserved_1[9];
    volatile                      T_UART_HTX                            htx; /* 0xa4,    RW, 0x00000000,                        Halt TX*/
    volatile                        uint32_t                  reserved_2[6];
    volatile                      T_UART_DLF                            dlf; /* 0xc0,    RW, 0x00000000,        UART float baud dividor*/
    volatile                        uint32_t                 reserved_3[12];
    volatile                      T_UART_CPR                            cpr; /* 0xf4,    RO, 0x00000000,            Component Parameter*/
    volatile                      T_UART_UCV                            ucv; /* 0xf8,    RO, 0x3430302A,         UART Component Version*/
    volatile                      T_UART_CTR                            ctr; /* 0xfc,    RO, 0x44570110,                 Component Type*/
} T_HWP_UART_T;

#define hwp_uart ((T_HWP_UART_T*)REG_UART_BASE)


__STATIC_INLINE uint32_t uart_rbr_get(void)
{
    return hwp_uart->rbr_thr_dll.rbr.val;
}

__STATIC_INLINE void uart_rbr_unpack(uint8_t* rbr_msb_9thbit, uint8_t* rbr_lsb_8bits)
{
    T_UART_RBR localVal = hwp_uart->rbr_thr_dll.rbr;

    *rbr_msb_9thbit = localVal.bit_field.rbr_msb_9thbit;
    *rbr_lsb_8bits = localVal.bit_field.rbr_lsb_8bits;
}

__STATIC_INLINE uint8_t uart_rbr_msb_9thbit_getf(void)
{
    return hwp_uart->rbr_thr_dll.rbr.bit_field.rbr_msb_9thbit;
}

__STATIC_INLINE uint8_t uart_rbr_lsb_8bits_getf(void)
{
    return hwp_uart->rbr_thr_dll.rbr.bit_field.rbr_lsb_8bits;
}

__STATIC_INLINE uint32_t uart_thr_get(void)
{
    return hwp_uart->rbr_thr_dll.thr.val;
}

__STATIC_INLINE void uart_thr_set(uint32_t value)
{
    hwp_uart->rbr_thr_dll.thr.val = value;
}

__STATIC_INLINE void uart_thr_pack(uint8_t thr_msb_9thbit, uint8_t thr_lsb_8bits)
{
    hwp_uart->rbr_thr_dll.thr.val = (((uint32_t)thr_msb_9thbit << 8) | ((uint32_t)thr_lsb_8bits << 0));
}

__STATIC_INLINE uint32_t uart_dll_get(void)
{
    return hwp_uart->rbr_thr_dll.dll.val;
}

__STATIC_INLINE void uart_dll_set(uint32_t value)
{
    hwp_uart->rbr_thr_dll.dll.val = value;
}

__STATIC_INLINE void uart_dll_pack(uint8_t divisor_latch_low)
{
    hwp_uart->rbr_thr_dll.dll.val = (((uint32_t)divisor_latch_low << 0));
}

__STATIC_INLINE void uart_dll_unpack(uint8_t* divisor_latch_low)
{
    T_UART_DLL localVal = hwp_uart->rbr_thr_dll.dll;

    *divisor_latch_low = localVal.bit_field.divisor_latch_low;
}

__STATIC_INLINE uint8_t uart_divisor_latch_low_getf(void)
{
    return hwp_uart->rbr_thr_dll.dll.bit_field.divisor_latch_low;
}

__STATIC_INLINE void uart_divisor_latch_low_setf(uint8_t divisor_latch_low)
{
    hwp_uart->rbr_thr_dll.dll.bit_field.divisor_latch_low = divisor_latch_low;
}

__STATIC_INLINE uint32_t uart_dlh_get(void)
{
    return hwp_uart->dlh_ier.dlh.val;
}

__STATIC_INLINE void uart_dlh_set(uint32_t value)
{
    hwp_uart->dlh_ier.dlh.val = value;
}

__STATIC_INLINE void uart_dlh_pack(uint8_t divisor_latch_high)
{
    hwp_uart->dlh_ier.dlh.val = (((uint32_t)divisor_latch_high << 0));
}

__STATIC_INLINE void uart_dlh_unpack(uint8_t* divisor_latch_high)
{
    T_UART_DLH localVal = hwp_uart->dlh_ier.dlh;

    *divisor_latch_high = localVal.bit_field.divisor_latch_high;
}

__STATIC_INLINE uint8_t uart_divisor_latch_high_getf(void)
{
    return hwp_uart->dlh_ier.dlh.bit_field.divisor_latch_high;
}

__STATIC_INLINE void uart_divisor_latch_high_setf(uint8_t divisor_latch_high)
{
    hwp_uart->dlh_ier.dlh.bit_field.divisor_latch_high = divisor_latch_high;
}

__STATIC_INLINE uint32_t uart_ier_get(void)
{
    return hwp_uart->dlh_ier.ier.val;
}

__STATIC_INLINE void uart_ier_set(uint32_t value)
{
    hwp_uart->dlh_ier.ier.val = value;
}

__STATIC_INLINE void uart_ier_pack(uint8_t ptime, uint8_t edssi, uint8_t elsi, uint8_t etbei, uint8_t erbfi)
{
    hwp_uart->dlh_ier.ier.val = (((uint32_t)ptime << 7) | ((uint32_t)edssi << 3) | ((uint32_t)elsi << 2) | ((uint32_t)etbei << 1) | ((uint32_t)erbfi << 0));
}

__STATIC_INLINE void uart_ier_unpack(uint8_t* ptime, uint8_t* edssi, uint8_t* elsi, uint8_t* etbei, uint8_t* erbfi)
{
    T_UART_IER localVal = hwp_uart->dlh_ier.ier;

    *ptime = localVal.bit_field.ptime;
    *edssi = localVal.bit_field.edssi;
    *elsi = localVal.bit_field.elsi;
    *etbei = localVal.bit_field.etbei;
    *erbfi = localVal.bit_field.erbfi;
}

__STATIC_INLINE uint8_t uart_ptime_getf(void)
{
    return hwp_uart->dlh_ier.ier.bit_field.ptime;
}

__STATIC_INLINE void uart_ptime_setf(uint8_t ptime)
{
    hwp_uart->dlh_ier.ier.bit_field.ptime = ptime;
}

__STATIC_INLINE uint8_t uart_edssi_getf(void)
{
    return hwp_uart->dlh_ier.ier.bit_field.edssi;
}

__STATIC_INLINE void uart_edssi_setf(uint8_t edssi)
{
    hwp_uart->dlh_ier.ier.bit_field.edssi = edssi;
}

__STATIC_INLINE uint8_t uart_elsi_getf(void)
{
    return hwp_uart->dlh_ier.ier.bit_field.elsi;
}

__STATIC_INLINE void uart_elsi_setf(uint8_t elsi)
{
    hwp_uart->dlh_ier.ier.bit_field.elsi = elsi;
}

__STATIC_INLINE uint8_t uart_etbei_getf(void)
{
    return hwp_uart->dlh_ier.ier.bit_field.etbei;
}

__STATIC_INLINE void uart_etbei_setf(uint8_t etbei)
{
    hwp_uart->dlh_ier.ier.bit_field.etbei = etbei;
}

__STATIC_INLINE uint8_t uart_erbfi_getf(void)
{
    return hwp_uart->dlh_ier.ier.bit_field.erbfi;
}

__STATIC_INLINE void uart_erbfi_setf(uint8_t erbfi)
{
    hwp_uart->dlh_ier.ier.bit_field.erbfi = erbfi;
}

__STATIC_INLINE uint32_t uart_iir_get(void)
{
    return hwp_uart->iir_fcr.iir.val;
}

__STATIC_INLINE void uart_iir_unpack(uint8_t* fifose, uint8_t* iid)
{
    T_UART_IIR localVal = hwp_uart->iir_fcr.iir;

    *fifose = localVal.bit_field.fifose;
    *iid = localVal.bit_field.iid;
}

__STATIC_INLINE uint8_t uart_fifose_getf(void)
{
    return hwp_uart->iir_fcr.iir.bit_field.fifose;
}

__STATIC_INLINE uint8_t uart_iid_getf(void)
{
    return hwp_uart->iir_fcr.iir.bit_field.iid;
}

__STATIC_INLINE uint32_t uart_fcr_get(void)
{
    return hwp_uart->iir_fcr.fcr.val;
}

__STATIC_INLINE void uart_fcr_set(uint32_t value)
{
    hwp_uart->iir_fcr.fcr.val = value;
}

__STATIC_INLINE void uart_fcr_pack(uint8_t rcvr, uint8_t tet, uint8_t dmam, uint8_t xfifor, uint8_t rfifor, uint8_t fifoe)
{
    hwp_uart->iir_fcr.fcr.val = (((uint32_t)rcvr << 6) | ((uint32_t)tet << 4) | ((uint32_t)dmam << 3) | ((uint32_t)xfifor << 2) | ((uint32_t)rfifor << 1) | ((uint32_t)fifoe << 0));
}

__STATIC_INLINE uint32_t uart_lcr_get(void)
{
    return hwp_uart->lcr.val;
}

__STATIC_INLINE void uart_lcr_set(uint32_t value)
{
    hwp_uart->lcr.val = value;
}

__STATIC_INLINE void uart_lcr_pack(uint8_t dlab, uint8_t break_, uint8_t stick_parity, uint8_t eps, uint8_t pen, uint8_t stop, uint8_t dls)
{
    hwp_uart->lcr.val = (((uint32_t)dlab << 7) | ((uint32_t)break_ << 6) | ((uint32_t)stick_parity << 5) | ((uint32_t)eps << 4) | ((uint32_t)pen << 3) | ((uint32_t)stop << 2) | ((uint32_t)dls << 0));
}

__STATIC_INLINE void uart_lcr_unpack(uint8_t* dlab, uint8_t* break_, uint8_t* stick_parity, uint8_t* eps, uint8_t* pen, uint8_t* stop, uint8_t* dls)
{
    T_UART_LCR localVal = hwp_uart->lcr;

    *dlab = localVal.bit_field.dlab;
    *break_ = localVal.bit_field.break_;
    *stick_parity = localVal.bit_field.stick_parity;
    *eps = localVal.bit_field.eps;
    *pen = localVal.bit_field.pen;
    *stop = localVal.bit_field.stop;
    *dls = localVal.bit_field.dls;
}

__STATIC_INLINE uint8_t uart_dlab_getf(void)
{
    return hwp_uart->lcr.bit_field.dlab;
}

__STATIC_INLINE void uart_dlab_setf(uint8_t dlab)
{
    hwp_uart->lcr.bit_field.dlab = dlab;
}

__STATIC_INLINE uint8_t uart_break__getf(void)
{
    return hwp_uart->lcr.bit_field.break_;
}

__STATIC_INLINE void uart_break__setf(uint8_t break_)
{
    hwp_uart->lcr.bit_field.break_ = break_;
}

__STATIC_INLINE uint8_t uart_stick_parity_getf(void)
{
    return hwp_uart->lcr.bit_field.stick_parity;
}

__STATIC_INLINE void uart_stick_parity_setf(uint8_t stick_parity)
{
    hwp_uart->lcr.bit_field.stick_parity = stick_parity;
}

__STATIC_INLINE uint8_t uart_eps_getf(void)
{
    return hwp_uart->lcr.bit_field.eps;
}

__STATIC_INLINE void uart_eps_setf(uint8_t eps)
{
    hwp_uart->lcr.bit_field.eps = eps;
}

__STATIC_INLINE uint8_t uart_pen_getf(void)
{
    return hwp_uart->lcr.bit_field.pen;
}

__STATIC_INLINE void uart_pen_setf(uint8_t pen)
{
    hwp_uart->lcr.bit_field.pen = pen;
}

__STATIC_INLINE uint8_t uart_stop_getf(void)
{
    return hwp_uart->lcr.bit_field.stop;
}

__STATIC_INLINE void uart_stop_setf(uint8_t stop)
{
    hwp_uart->lcr.bit_field.stop = stop;
}

__STATIC_INLINE uint8_t uart_dls_getf(void)
{
    return hwp_uart->lcr.bit_field.dls;
}

__STATIC_INLINE void uart_dls_setf(uint8_t dls)
{
    hwp_uart->lcr.bit_field.dls = dls;
}

__STATIC_INLINE uint32_t uart_mcr_get(void)
{
    return hwp_uart->mcr.val;
}

__STATIC_INLINE void uart_mcr_set(uint32_t value)
{
    hwp_uart->mcr.val = value;
}

__STATIC_INLINE void uart_mcr_pack(uint8_t afce, uint8_t loopback, uint8_t out2, uint8_t out1, uint8_t rts, uint8_t dtr)
{
    hwp_uart->mcr.val = (((uint32_t)afce << 5) | ((uint32_t)loopback << 4) | ((uint32_t)out2 << 3) | ((uint32_t)out1 << 2) | ((uint32_t)rts << 1) | ((uint32_t)dtr << 0));
}

__STATIC_INLINE void uart_mcr_unpack(uint8_t* sire, uint8_t* afce, uint8_t* loopback, uint8_t* out2, uint8_t* out1, uint8_t* rts, uint8_t* dtr)
{
    T_UART_MCR localVal = hwp_uart->mcr;

    *sire = localVal.bit_field.sire;
    *afce = localVal.bit_field.afce;
    *loopback = localVal.bit_field.loopback;
    *out2 = localVal.bit_field.out2;
    *out1 = localVal.bit_field.out1;
    *rts = localVal.bit_field.rts;
    *dtr = localVal.bit_field.dtr;
}

__STATIC_INLINE uint8_t uart_sire_getf(void)
{
    return hwp_uart->mcr.bit_field.sire;
}

__STATIC_INLINE uint8_t uart_afce_getf(void)
{
    return hwp_uart->mcr.bit_field.afce;
}

__STATIC_INLINE void uart_afce_setf(uint8_t afce)
{
    hwp_uart->mcr.bit_field.afce = afce;
}

__STATIC_INLINE uint8_t uart_loopback_getf(void)
{
    return hwp_uart->mcr.bit_field.loopback;
}

__STATIC_INLINE void uart_loopback_setf(uint8_t loopback)
{
    hwp_uart->mcr.bit_field.loopback = loopback;
}

__STATIC_INLINE uint8_t uart_out2_getf(void)
{
    return hwp_uart->mcr.bit_field.out2;
}

__STATIC_INLINE void uart_out2_setf(uint8_t out2)
{
    hwp_uart->mcr.bit_field.out2 = out2;
}

__STATIC_INLINE uint8_t uart_out1_getf(void)
{
    return hwp_uart->mcr.bit_field.out1;
}

__STATIC_INLINE void uart_out1_setf(uint8_t out1)
{
    hwp_uart->mcr.bit_field.out1 = out1;
}

__STATIC_INLINE uint8_t uart_rts_getf(void)
{
    return hwp_uart->mcr.bit_field.rts;
}

__STATIC_INLINE void uart_rts_setf(uint8_t rts)
{
    hwp_uart->mcr.bit_field.rts = rts;
}

__STATIC_INLINE uint8_t uart_dtr_getf(void)
{
    return hwp_uart->mcr.bit_field.dtr;
}

__STATIC_INLINE void uart_dtr_setf(uint8_t dtr)
{
    hwp_uart->mcr.bit_field.dtr = dtr;
}

__STATIC_INLINE uint32_t uart_lsr_get(void)
{
    return hwp_uart->lsr.val;
}

__STATIC_INLINE void uart_lsr_unpack(uint8_t* addr_rcvd, uint8_t* rfe, uint8_t* temt, uint8_t* thre, uint8_t* bi, uint8_t* fe, uint8_t* pe, uint8_t* oe, uint8_t* dr)
{
    T_UART_LSR localVal = hwp_uart->lsr;

    *addr_rcvd = localVal.bit_field.addr_rcvd;
    *rfe = localVal.bit_field.rfe;
    *temt = localVal.bit_field.temt;
    *thre = localVal.bit_field.thre;
    *bi = localVal.bit_field.bi;
    *fe = localVal.bit_field.fe;
    *pe = localVal.bit_field.pe;
    *oe = localVal.bit_field.oe;
    *dr = localVal.bit_field.dr;
}

__STATIC_INLINE uint8_t uart_addr_rcvd_getf(void)
{
    return hwp_uart->lsr.bit_field.addr_rcvd;
}

__STATIC_INLINE uint8_t uart_rfe_getf(void)
{
    return hwp_uart->lsr.bit_field.rfe;
}

__STATIC_INLINE uint8_t uart_temt_getf(void)
{
    return hwp_uart->lsr.bit_field.temt;
}

__STATIC_INLINE uint8_t uart_thre_getf(void)
{
    return hwp_uart->lsr.bit_field.thre;
}

__STATIC_INLINE uint8_t uart_bi_getf(void)
{
    return hwp_uart->lsr.bit_field.bi;
}

__STATIC_INLINE uint8_t uart_fe_getf(void)
{
    return hwp_uart->lsr.bit_field.fe;
}

__STATIC_INLINE uint8_t uart_pe_getf(void)
{
    return hwp_uart->lsr.bit_field.pe;
}

__STATIC_INLINE uint8_t uart_oe_getf(void)
{
    return hwp_uart->lsr.bit_field.oe;
}

__STATIC_INLINE uint8_t uart_dr_getf(void)
{
    return hwp_uart->lsr.bit_field.dr;
}

__STATIC_INLINE uint32_t uart_msr_get(void)
{
    return hwp_uart->msr.val;
}

__STATIC_INLINE void uart_msr_unpack(uint8_t* dcd, uint8_t* ri, uint8_t* dsr, uint8_t* cts, uint8_t* ddcd, uint8_t* teri, uint8_t* ddsr, uint8_t* dcts)
{
    T_UART_MSR localVal = hwp_uart->msr;

    *dcd = localVal.bit_field.dcd;
    *ri = localVal.bit_field.ri;
    *dsr = localVal.bit_field.dsr;
    *cts = localVal.bit_field.cts;
    *ddcd = localVal.bit_field.ddcd;
    *teri = localVal.bit_field.teri;
    *ddsr = localVal.bit_field.ddsr;
    *dcts = localVal.bit_field.dcts;
}

__STATIC_INLINE uint8_t uart_dcd_getf(void)
{
    return hwp_uart->msr.bit_field.dcd;
}

__STATIC_INLINE uint8_t uart_ri_getf(void)
{
    return hwp_uart->msr.bit_field.ri;
}

__STATIC_INLINE uint8_t uart_dsr_getf(void)
{
    return hwp_uart->msr.bit_field.dsr;
}

__STATIC_INLINE uint8_t uart_cts_getf(void)
{
    return hwp_uart->msr.bit_field.cts;
}

__STATIC_INLINE uint8_t uart_ddcd_getf(void)
{
    return hwp_uart->msr.bit_field.ddcd;
}

__STATIC_INLINE uint8_t uart_teri_getf(void)
{
    return hwp_uart->msr.bit_field.teri;
}

__STATIC_INLINE uint8_t uart_ddsr_getf(void)
{
    return hwp_uart->msr.bit_field.ddsr;
}

__STATIC_INLINE uint8_t uart_dcts_getf(void)
{
    return hwp_uart->msr.bit_field.dcts;
}

__STATIC_INLINE uint32_t uart_scr_get(void)
{
    return hwp_uart->scr.val;
}

__STATIC_INLINE void uart_scr_set(uint32_t value)
{
    hwp_uart->scr.val = value;
}

__STATIC_INLINE void uart_scr_pack(uint8_t scratchpad)
{
    hwp_uart->scr.val = (((uint32_t)scratchpad << 0));
}

__STATIC_INLINE void uart_scr_unpack(uint8_t* scratchpad)
{
    T_UART_SCR localVal = hwp_uart->scr;

    *scratchpad = localVal.bit_field.scratchpad;
}

__STATIC_INLINE uint8_t uart_scratchpad_getf(void)
{
    return hwp_uart->scr.bit_field.scratchpad;
}

__STATIC_INLINE void uart_scratchpad_setf(uint8_t scratchpad)
{
    hwp_uart->scr.bit_field.scratchpad = scratchpad;
}

__STATIC_INLINE uint32_t uart_far_get(void)
{
    return hwp_uart->far.val;
}

__STATIC_INLINE void uart_far_unpack(uint8_t* fifo_access_mode)
{
    T_UART_FAR localVal = hwp_uart->far;

    *fifo_access_mode = localVal.bit_field.fifo_access_mode;
}

__STATIC_INLINE uint8_t uart_fifo_access_mode_getf(void)
{
    return hwp_uart->far.bit_field.fifo_access_mode;
}

__STATIC_INLINE uint32_t uart_tfr_get(void)
{
    return hwp_uart->tfr.val;
}

__STATIC_INLINE void uart_tfr_unpack(uint8_t* transmit_fifo_read)
{
    T_UART_TFR localVal = hwp_uart->tfr;

    *transmit_fifo_read = localVal.bit_field.transmit_fifo_read;
}

__STATIC_INLINE uint8_t uart_transmit_fifo_read_getf(void)
{
    return hwp_uart->tfr.bit_field.transmit_fifo_read;
}

__STATIC_INLINE uint32_t uart_rfw_get(void)
{
    return hwp_uart->rfw.val;
}

__STATIC_INLINE void uart_rfw_set(uint32_t value)
{
    hwp_uart->rfw.val = value;
}

__STATIC_INLINE void uart_rfw_pack(uint8_t rffe, uint8_t rfpe, uint8_t rfwd)
{
    hwp_uart->rfw.val = (((uint32_t)rffe << 9) | ((uint32_t)rfpe << 8) | ((uint32_t)rfwd << 0));
}

__STATIC_INLINE uint32_t uart_usr_get(void)
{
    return hwp_uart->usr.val;
}

__STATIC_INLINE void uart_usr_unpack(uint8_t* rff, uint8_t* rfne, uint8_t* tfe, uint8_t* tfnf, uint8_t* busy)
{
    T_UART_USR localVal = hwp_uart->usr;

    *rff = localVal.bit_field.rff;
    *rfne = localVal.bit_field.rfne;
    *tfe = localVal.bit_field.tfe;
    *tfnf = localVal.bit_field.tfnf;
    *busy = localVal.bit_field.busy;
}

__STATIC_INLINE uint8_t uart_rff_getf(void)
{
    return hwp_uart->usr.bit_field.rff;
}

__STATIC_INLINE uint8_t uart_rfne_getf(void)
{
    return hwp_uart->usr.bit_field.rfne;
}

__STATIC_INLINE uint8_t uart_tfe_getf(void)
{
    return hwp_uart->usr.bit_field.tfe;
}

__STATIC_INLINE uint8_t uart_tfnf_getf(void)
{
    return hwp_uart->usr.bit_field.tfnf;
}

__STATIC_INLINE uint8_t uart_busy_getf(void)
{
    return hwp_uart->usr.bit_field.busy;
}

__STATIC_INLINE uint32_t uart_htx_get(void)
{
    return hwp_uart->htx.val;
}

__STATIC_INLINE void uart_htx_set(uint32_t value)
{
    hwp_uart->htx.val = value;
}

__STATIC_INLINE void uart_htx_pack(uint8_t halt_tx)
{
    hwp_uart->htx.val = (((uint32_t)halt_tx << 0));
}

__STATIC_INLINE void uart_htx_unpack(uint8_t* halt_tx)
{
    T_UART_HTX localVal = hwp_uart->htx;

    *halt_tx = localVal.bit_field.halt_tx;
}

__STATIC_INLINE uint8_t uart_halt_tx_getf(void)
{
    return hwp_uart->htx.bit_field.halt_tx;
}

__STATIC_INLINE void uart_halt_tx_setf(uint8_t halt_tx)
{
    hwp_uart->htx.bit_field.halt_tx = halt_tx;
}

__STATIC_INLINE uint32_t uart_dlf_get(void)
{
    return hwp_uart->dlf.val;
}

__STATIC_INLINE void uart_dlf_set(uint32_t value)
{
    hwp_uart->dlf.val = value;
}

__STATIC_INLINE void uart_dlf_pack(uint8_t dlf)
{
    hwp_uart->dlf.val = (((uint32_t)dlf << 0));
}

__STATIC_INLINE void uart_dlf_unpack(uint8_t* dlf)
{
    T_UART_DLF localVal = hwp_uart->dlf;

    *dlf = localVal.bit_field.dlf;
}

__STATIC_INLINE uint8_t uart_dlf_getf(void)
{
    return hwp_uart->dlf.bit_field.dlf;
}

__STATIC_INLINE void uart_dlf_setf(uint8_t dlf)
{
    hwp_uart->dlf.bit_field.dlf = dlf;
}

__STATIC_INLINE uint32_t uart_cpr_get(void)
{
    return hwp_uart->cpr.val;
}

__STATIC_INLINE void uart_cpr_unpack(uint8_t* fifo_mode, uint8_t* dma_extra, uint8_t* uart_add_encoded_params, uint8_t* shadow, uint8_t* fifo_stat, uint8_t* fifo_access, uint8_t* new_feat, uint8_t* sir_lp_mode, uint8_t* sir_mode, uint8_t* thre_mode, uint8_t* afce_mode, uint8_t* apb_data_width)
{
    T_UART_CPR localVal = hwp_uart->cpr;

    *fifo_mode = localVal.bit_field.fifo_mode;
    *dma_extra = localVal.bit_field.dma_extra;
    *uart_add_encoded_params = localVal.bit_field.uart_add_encoded_params;
    *shadow = localVal.bit_field.shadow;
    *fifo_stat = localVal.bit_field.fifo_stat;
    *fifo_access = localVal.bit_field.fifo_access;
    *new_feat = localVal.bit_field.new_feat;
    *sir_lp_mode = localVal.bit_field.sir_lp_mode;
    *sir_mode = localVal.bit_field.sir_mode;
    *thre_mode = localVal.bit_field.thre_mode;
    *afce_mode = localVal.bit_field.afce_mode;
    *apb_data_width = localVal.bit_field.apb_data_width;
}

__STATIC_INLINE uint8_t uart_fifo_mode_getf(void)
{
    return hwp_uart->cpr.bit_field.fifo_mode;
}

__STATIC_INLINE uint8_t uart_dma_extra_getf(void)
{
    return hwp_uart->cpr.bit_field.dma_extra;
}

__STATIC_INLINE uint8_t uart_uart_add_encoded_params_getf(void)
{
    return hwp_uart->cpr.bit_field.uart_add_encoded_params;
}

__STATIC_INLINE uint8_t uart_shadow_getf(void)
{
    return hwp_uart->cpr.bit_field.shadow;
}

__STATIC_INLINE uint8_t uart_fifo_stat_getf(void)
{
    return hwp_uart->cpr.bit_field.fifo_stat;
}

__STATIC_INLINE uint8_t uart_fifo_access_getf(void)
{
    return hwp_uart->cpr.bit_field.fifo_access;
}

__STATIC_INLINE uint8_t uart_new_feat_getf(void)
{
    return hwp_uart->cpr.bit_field.new_feat;
}

__STATIC_INLINE uint8_t uart_sir_lp_mode_getf(void)
{
    return hwp_uart->cpr.bit_field.sir_lp_mode;
}

__STATIC_INLINE uint8_t uart_sir_mode_getf(void)
{
    return hwp_uart->cpr.bit_field.sir_mode;
}

__STATIC_INLINE uint8_t uart_thre_mode_getf(void)
{
    return hwp_uart->cpr.bit_field.thre_mode;
}

__STATIC_INLINE uint8_t uart_afce_mode_getf(void)
{
    return hwp_uart->cpr.bit_field.afce_mode;
}

__STATIC_INLINE uint8_t uart_apb_data_width_getf(void)
{
    return hwp_uart->cpr.bit_field.apb_data_width;
}

__STATIC_INLINE uint32_t uart_ucv_get(void)
{
    return hwp_uart->ucv.val;
}

__STATIC_INLINE void uart_ucv_unpack(uint32_t* uart_component_version)
{
    T_UART_UCV localVal = hwp_uart->ucv;

    *uart_component_version = localVal.bit_field.uart_component_version;
}

__STATIC_INLINE uint32_t uart_uart_component_version_getf(void)
{
    return hwp_uart->ucv.bit_field.uart_component_version;
}

__STATIC_INLINE uint32_t uart_ctr_get(void)
{
    return hwp_uart->ctr.val;
}

__STATIC_INLINE void uart_ctr_unpack(uint32_t* peripheral_id)
{
    T_UART_CTR localVal = hwp_uart->ctr;

    *peripheral_id = localVal.bit_field.peripheral_id;
}

__STATIC_INLINE uint32_t uart_peripheral_id_getf(void)
{
    return hwp_uart->ctr.bit_field.peripheral_id;
}
#endif

