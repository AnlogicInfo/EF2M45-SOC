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
#ifndef __REG_SPIM_H__
#define __REG_SPIM_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//ctrlr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     reserved_1 :  4; /* 3: 0,                           rsvd*/
        uint32_t                            frf :  2; /* 5: 4,  Frame Format. Selects which serial protocol transfers the data.00 每- Motorola SPI01 每- Texas Instruments SSP10 每- National Semiconductors Microwire11 每- ReservedDependencies: When SSI_HC_FRF=1, FRF is read-only and its value is set bySSI_DFLT_FRF.Reset Value: SSI_DFLT_FRF*/
        uint32_t                           scph :  1; /* 6: 6, Serial Clock Phase. Valid when the frame format (FRF) is set to Motorola SPI. Theserial clock phase selects the relationship of the serial clock with the slave selectsignal.When SCPH = 0, data are captured on the first edge of the serial clock. WhenSCPH = 1, the serial clock starts toggling one cycle after the slave select line isactivated, and data are captured on the second edge of the serial clock.0: Serial clock toggles in middle of first data bit1: Serial clock toggles at start of first data bitDependencies: When SSI_HC_FRF=1, SCPH bit is a read-only bit, with its valueset by SSI_DFLT_SCPH.Reset Value: SSI_DFLT_SCPH*/
        uint32_t                          scpol :  1; /* 7: 7, Serial Clock Polarity. Valid when the frame format (FRF) is set to Motorola SPI.Used to select the polarity of the inactive serial clock, which is held inactive whenthe DW_apb_ssi master is not actively transferring data on the serial bus.0 每 Inactive state of serial clock is low1 每 Inactive state of serial clock is highDependencies: When SSI_HC_FRF=1, SCPOL bit is a read-only bit with its valueset by SSI_DFLT_SCPOL.Reset Value: SSI_DFLT_SCPOL*/
        uint32_t                           tmod :  2; /* 9: 8, Transfer Mode. Selects the mode of transfer for serial communication. This fielddoes not affect the transfer duplicity. Only indicates whether the receive or transmitdata are valid.In transmit-only mode, data received from the external device is not valid and is notstored in the receive FIFO memory; it is overwritten on the next transfer.In receive-only mode, transmitted data are not valid. After the first write to thetransmit FIFO, the same word is retransmitted for the duration of the transfer.In transmit-and-receive mode, both transmit and receive data are valid. The transfercontinues until the transmit FIFO is empty. Data received from the external deviceare stored into the receive FIFO memory, where it can be accessed by the hostprocessor.In eeprom-read mode, receive data is not valid while control data is beingtransmitted. When all control data is sent to the EEPROM, receive data becomesvalid and transmit data becomes invalid. All data in the transmit FIFO is consideredcontrol data in this mode. This transfer mode is only valid when the DW_apb_ssi isconfigured as a master device.00 每- Transmit &amp; Receive01 每- Transmit Only10 每- Receive Only11 每- EEPROM ReadWhen SSI_SPI_MODE is set to "Dual" or "Quad" mode and SPI_FRF is not set to2'b00.There are only two valid combinations:10 每- Read01 每- WriteReset Value: 0x0*/
        uint32_t                         slv_oe :  1; /*10:10, Slave Output Enable. Relevant only when the DW_apb_ssi is configured as aserial-slave device. When configured as a serial master, this bit field has nofunctionality. This bit enables or disables the setting of the ssi_oe_n output from theDW_apb_ssi serial slave. When SLV_OE = 1, the ssi_oe_n output can never beactive. When the ssi_oe_n output controls the tri-state buffer on the txd output fromthe slave, a high impedance state is always present on the slave txd output whenSLV_OE = 1.This is useful when the master transmits in broadcast mode (master transmits datato all slave devices). Only one slave may respond with data on the master rxd line.This bit is enabled after reset and must be disabled by software (when broadcastmode is used), if you do not want this device to respond with data.0 每- Slave txd is enabled1 每- Slave txd is disabled*/
        uint32_t                            srl :  1; /*11:11, Shift Register Loop. Used for testing purposes only. When internally active,connects the transmit shift register output to the receive shift register input. Can beused in both serial-slave and serial-master modes.0 每 Normal Mode Operation1 每 Test Mode OperationWhen the DW_apb_ssi is configured as a slave in loopback mode, the ss_in_n andssi_clk signals must be provided by an external source. In this mode, the slavecannot generate these signals because there is nothing to which to loop back.Reset Value: 0x0*/
        uint32_t                            cfs :  4; /*15:12, Control Frame Size. Selects the length of the control word for the Microwire frameformat. For the field decode, refer to Table 6-4 on page 125.Reset Value: 0x0*/
        uint32_t                            dfs :  5; /*20:16, Data Frame Size in 32-bit modeUsed to select the data frame size in 32-bit mode. These bits are only valid whenSSI_MAX_XFER_SIZE is configured to 32. When the data frame size isprogrammed to be less than 32 bits, the receive data is automatically right-justifiedby the receive logic, with the upper bits of the receive FIFO zero-padded. You areresponsible for making sure the transmit data is right-justified before writing into thetransmit FIFO. The transmit logic ignores the upper unused bits when transmittingthe data. For the field decode value, refer to Table 6-3 on page 124.Note: When SSI_SPI_MODE is set to "Dual" or "Quad" mode and SPI_FRF is notset to 2'b00.← DFS value should be multiple of 2 if SPI_FRF = 01, and← DFS value should be multiple of 4 if SPI_FRF = 10.Reset Value: 0x7*/
        uint32_t                     reserved_0 : 11; /*31:21,                           rsvd*/
    } bit_field;
} T_SPIM_CTRLR0;

//ctrlr1
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            ndf : 16; /*15: 0, Number of Data Frames. When TMOD = 10 or TMOD = 11, this register field sets thenumber of data frames to be continuously received by the DW_apb_ssi. TheDW_apb_ssi continues to receive serial data until the number of data frames receivedis equal to this register value plus 1, which enables you to receive up to 64 KB of datain a continuous transfer.When the DW_apb_ssi is configured as a serial slave, the transfer continues for aslong as the slave is selected. Therefore, this register serves no purpose and is notpresent when the DW_apb_ssi is configured as a serial slave.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_SPIM_CTRLR1;

//ssienr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         ssi_en :  1; /* 0: 0, SSI Enable. Enables and disables all DW_apb_ssi operations. When disabled, all serialtransfers are halted immediately. Transmit and receive FIFO buffers are cleared whenthe device is disabled. It is impossible to program some of the DW_apb_ssi controlregisters when enabled. When disabled, the ssi_sleep output is set (after delay) toinform the system that it is safe to remove the ssi_clk, thus saving power consumption inthe system.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_SPIM_SSIENR;

//mwcr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          mwmod :  1; /* 0: 0, Microwire Transfer Mode. Defines whether the Microwire transfer is sequential ornon-sequential. When sequential mode is used, only one control word is needed totransmit or receive a block of data words. When non-sequential mode is used, theremust be a control word for each data word that is transmitted or received.0 每 non-sequential transfer1 每 sequential transferReset Value: 0x0*/
        uint32_t                            mod :  1; /* 1: 1, Microwire Control. Defines the direction of the data word when the Microwire serialprotocol is used. When this bit is set to 0, the data word is received by the DW_apb_ssiMacroCell from the external serial device. When this bit is set to 1, the data word istransmitted from the DW_apb_ssi MacroCell to the external serial device.Reset Value: 0x0*/
        uint32_t                            mhs :  1; /* 2: 2, Microwire Handshaking. Relevant only when the DW_apb_ssi is configured as aserial-master device. When configured as a serial slave, this bit field has no functionality.Used to enable and disable the ※busy/ready§ handshaking interface for the Microwireprotocol. When enabled, the DW_apb_ssi checks for a ready status from the targetslave, after the transfer of the last data/control bit, before clearing the BUSY status in theSR register.0: handshaking interface is disabled1: handshaking interface is enabledReset Value: 0x0*/
        uint32_t                     reserved_0 : 29; /*31: 3,                             NA*/
    } bit_field;
} T_SPIM_MWCR;

//ser
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            ser :  1; /* 0: 0, Slave Select Enable Flag. Each bit in this register corresponds to aslave select line (ss_x_n) from the DW_apb_ssi master. When a bitin this register is set (1), the corresponding slave select line from themaster is activated when a serial transfer begins. It should be notedthat setting or clearing bits in this register have no effect on thecorresponding slave select outputs until a transfer is started. Beforebeginning a transfer, you should enable the bit in this register thatcorresponds to the slave device with which the master wants tocommunicate.When not operating in broadcast mode, only one bit in this fieldshould be set.1: Selected0: Not SelectedReset Value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_SPIM_SER;

//baudr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          sckdv : 16; /*15: 0, SSI Clock Divider. The LSB for this field is always set to 0 and is unaffected by a writeoperation, which ensures an even value is held in this register. If the value is 0, theserial output clock (sclk_out) is disabled. The frequency of the sclk_out is derivedfrom the following equation:Fsclk_out = Fssi_clk/SCKDVwhere SCKDV is any even value between 2 and 65534. For example:for Fssi_clk = 3.6864MHz and SCKDV =2Fsclk_out = 3.6864/2 = 1.8432MHzReset Value: 0x0*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_SPIM_BAUDR;

//txftlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            tft :  5; /* 4: 0, Transmit FIFO Threshold. Controls the level of entries (or below) at which thetransmit FIFO controller triggers an interrupt. The FIFO depth is configurablein the range 2-256; this register is sized to the number of address bitsneeded to access the FIFO.If you attempt to set bits [7:0] of this register to a value greater than or equalto the depth of the FIFO, this field is not written and retains its current value.When the number of transmit FIFO entries is less than or equal to this value,the transmit FIFO empty interrupt is triggered. For field decode, refer toTable 6-5.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_SPIM_TXFTLR;

//rxftlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            rft :  5; /* 4: 0, Receive FIFO Threshold. Controls the level of entries (or above) atwhich the receive FIFO controller triggers an interrupt. The FIFOdepth is configurable in the range 2-256. This register is sized tothe number of address bits needed to access the FIFO. If youattempt to set this value greater than the depth of the FIFO, thisfield is not written and retains its current value.When the number of receive FIFO entries is greater than or equalto this value + 1, the receive FIFO full interrupt is triggered. For fielddecode, refer to Table 6-6.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_SPIM_RXFTLR;

//txflr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txtfl :  6; /* 5: 0, Transmit FIFO Level. Contains the number of valid data entries in thetransmit FIFO.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_SPIM_TXFLR;

//rxflr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rxtfl :  6; /* 5: 0, Receive FIFO Level. Contains the number of valid data entries in thereceive FIFO.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_SPIM_RXFLR;

//sr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           busy :  1; /* 0: 0, SSI Busy Flag. When set, indicates that a serial transfer is in progress; when clearedindicates that the DW_apb_ssi is idle or disabled.0 每 DW_apb_ssi is idle or disabled1 每 DW_apb_ssi is actively transferring dataReset Value: 0x0*/
        uint32_t                           tfnf :  1; /* 1: 1, Transmit FIFO Not Full. Set when the transmit FIFO contains one or more empty locations,and is cleared when the FIFO is full.0 每 Transmit FIFO is full1 每 Transmit FIFO is not fullReset Value: 0x1*/
        uint32_t                            tfe :  1; /* 2: 2, Transmit FIFO Empty. When the transmit FIFO is completely empty, this bit is set. Whenthe transmit FIFO contains one or more valid entries, this bit is cleared. This bit field doesnot request an interrupt.0 每 Transmit FIFO is not empty1 每 Transmit FIFO is emptyReset Value: 0x1*/
        uint32_t                           rfne :  1; /* 3: 3, Receive FIFO Not Empty. Set when the receive FIFO contains one or more entries and iscleared when the receive FIFO is empty. This bit can be polled by software to completelyempty the receive FIFO.0 每 Receive FIFO is empty1 每 Receive FIFO is not emptyReset Value: 0x0*/
        uint32_t                            rff :  1; /* 4: 4, Receive FIFO Full. When the receive FIFO is completely full, this bit is set. When thereceive FIFO contains one or more empty location, this bit is cleared.0 每 Receive FIFO is not full1 每 Receive FIFO is fullReset Value: 0x0*/
        uint32_t                            txe :  1; /* 5: 5, Transmission Error. Set if the transmit FIFO is empty when a transfer is started. This bit canbe set only when the DW_apb_ssi is configured as a slave device. Data from the previoustransmission is resent on the txd line. This bit is cleared when read.0 每 No error1 每 Transmission errorReset Value: 0x0*/
        uint32_t                           dcol :  1; /* 6: 6, Data Collision Error. Relevant only when the DW_apb_ssi is configured as a master device.This bit is set if the ss_in_n input is asserted by another master,while the DW_apb_ssi master is in the middle of the transfer. This informs the processorthat the last data transfer was halted before completion. This bit is cleared when read.0 每 No error1 每 Transmit data collision errorReset Value: 0x0*/
        uint32_t                     reserved_0 : 25; /*31: 7,                             NA*/
    } bit_field;
} T_SPIM_SR;

//imr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txeim :  1; /* 0: 0, Transmit FIFO Empty Interrupt Mask0 每 ssi_txe_intr interrupt is masked1 每 ssi_txe_intr interrupt is not maskedReset Value: 0x1*/
        uint32_t                          txoim :  1; /* 1: 1, Transmit FIFO Overflow Interrupt Mask0 每 ssi_txo_intr interrupt is masked1 每 ssi_txo_intr interrupt is not maskedReset Value: 0x1*/
        uint32_t                          rxuim :  1; /* 2: 2, Receive FIFO Underflow Interrupt Mask0 每 ssi_rxu_intr interrupt is masked1 每 ssi_rxu_intr interrupt is not maskedReset Value: 0x1*/
        uint32_t                          rxoim :  1; /* 3: 3, Receive FIFO Overflow Interrupt Mask0 每 ssi_rxo_intr interrupt is masked1 每 ssi_rxo_intr interrupt is not maskedReset Value: 0x1*/
        uint32_t                          rxfim :  1; /* 4: 4, Receive FIFO Full Interrupt Mask0 每 ssi_rxf_intr interrupt is masked1 每 ssi_rxf_intr interrupt is not maskedReset Value: 0x1*/
        uint32_t                          mstim :  1; /* 5: 5, Multi-Master Contention Interrupt Mask. This bit field is not present if the DW_apb_ssiis configured as a serial-slave device.0 每 ssi_mst_intr interrupt is masked1 每 ssi_mst_intr interrupt is not maskedReset Value: 0x1*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_SPIM_IMR;

//isr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txeis :  1; /* 0: 0, Transmit FIFO Empty Interrupt Status0 = ssi_txe_intr interrupt is not active after masking1 = ssi_txe_intr interrupt is active after maskingReset Value: 0x0*/
        uint32_t                          txois :  1; /* 1: 1, Transmit FIFO Overflow Interrupt Status0 = ssi_txo_intr interrupt is not active after masking1 = ssi_txo_intr interrupt is active after maskingReset Value: 0x0*/
        uint32_t                          rxuis :  1; /* 2: 2, Receive FIFO Underflow Interrupt Status0 = ssi_rxu_intr interrupt is not active after masking1 = ssi_rxu_intr interrupt is active after maskingReset Value: 0x0*/
        uint32_t                          rxois :  1; /* 3: 3, Receive FIFO Overflow Interrupt Status0 = ssi_rxo_intr interrupt is not active after masking1 = ssi_rxo_intr interrupt is active after maskingReset Value: 0x0*/
        uint32_t                          rxfis :  1; /* 4: 4, Receive FIFO Full Interrupt Status0 = ssi_rxf_intr interrupt is not active after masking1 = ssi_rxf_intr interrupt is full after maskingReset Value: 0x0*/
        uint32_t                          mstis :  1; /* 5: 5, Multi-Master Contention Interrupt Status. This bit field is not present if theDW_apb_ssi is configured as a serial-slave device.0 = ssi_mst_intr interrupt not active after masking1 = ssi_mst_intr interrupt is active after maskingReset Value: 0x0*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_SPIM_ISR;

//risr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txeir :  1; /* 0: 0, Transmit FIFO Empty Raw Interrupt Status0 = ssi_txe_intr interrupt is not active prior to masking1 = ssi_txe_intr interrupt is active prior maskingReset Value: 0x0*/
        uint32_t                          txoir :  1; /* 1: 1, Transmit FIFO Overflow Raw Interrupt Status0 = ssi_txo_intr interrupt is not active prior to masking1 = ssi_txo_intr interrupt is active prior maskingReset Value: 0x0*/
        uint32_t                          rxuir :  1; /* 2: 2, Receive FIFO Underflow Raw Interrupt Status0 = ssi_rxu_intr interrupt is not active prior to masking1 = ssi_rxu_intr interrupt is active prior to maskingReset Value: 0x0*/
        uint32_t                          rxoir :  1; /* 3: 3, Receive FIFO Overflow Raw Interrupt Status0 = ssi_rxo_intr interrupt is not active prior to masking1 = ssi_rxo_intr interrupt is active prior maskingReset Value: 0x0*/
        uint32_t                          rxfir :  1; /* 4: 4, Receive FIFO Full Raw Interrupt Status0 = ssi_rxf_intr interrupt is not active prior to masking1 = ssi_rxf_intr interrupt is active prior to maskingReset Value: 0x0*/
        uint32_t                          mstir :  1; /* 5: 5, Multi-Master Contention Raw Interrupt Status. This bit field is not present if theDW_apb_ssi is configured as a serial-slave device.0 = ssi_mst_intr interrupt is not active prior to masking1 = ssi_mst_intr interrupt is active prior maskingReset Value: 0x0*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_SPIM_RISR;

//txoicr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         txoicr :  1; /* 0: 0, Clear Transmit FIFO Overflow Interrupt. This register reflects the status of theinterrupt. A read from this register clears the ssi_txo_intr interrupt; writing has noeffect.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_SPIM_TXOICR;

//rxoicr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         rxoicr :  1; /* 0: 0, Clear Receive FIFO Overflow Interrupt. This register reflects the status of the interrupt.A read from this register clears the ssi_rxo_intr interrupt; writing has no effect.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_SPIM_RXOICR;

//rxuicr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         rxuicr :  1; /* 0: 0, Clear Receive FIFO Underflow Interrupt. This register reflects the status of the interrupt.A read from this register clears the ssi_rxu_intr interrupt; writing has no effect.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_SPIM_RXUICR;

//msticr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         msticr :  1; /* 0: 0, Clear Multi-Master Contention Interrupt. This register reflects the status of the interrupt.A read from this register clears the ssi_mst_intr interrupt; writing has no effect.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_SPIM_MSTICR;

//icr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            icr :  1; /* 0: 0, Clear Interrupts. This register is set if any of the interrupts below are active. A readclears the ssi_txo_intr, ssi_rxu_intr, ssi_rxo_intr, and the ssi_mst_intr interrupts.Writing to this register has no effect.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_SPIM_ICR;

//dmacr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rdmae :  1; /* 0: 0, Receive DMA Enable. This bit enables/disables the receive FIFO DMA channel0 = Receive DMA disabled1 = Receive DMA enabledReset Value: 0x0*/
        uint32_t                          tdmae :  1; /* 1: 1, Transmit DMA Enable. This bit enables/disables the transmit FIFO DMA channel.0 = Transmit DMA disabled1 = Transmit DMA enabledReset Value: 0x0*/
        uint32_t                     reserved_0 : 30; /*31: 2,                             NA*/
    } bit_field;
} T_SPIM_DMACR;

//dmatdlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         dmatdl :  5; /* 4: 0, Transmit Data Level. This bit field controls the level at which a DMArequest is made by the transmit logic. It is equal to the watermark level;that is, the dma_tx_req signal is generated when the number of validdata entries in the transmit FIFO is equal to or below this field value, andTDMAE = 1. Refer to Table 6-2 for the field decode.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_SPIM_DMATDLR;

//dmardlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         dmardl :  5; /* 4: 0, Receive Data Level. This bit field controls the level at which a DMA requestis made by the receive logic. The watermark level = DMARDL+1; that is,dma_rx_req is generated when the number of valid data entries in thereceive FIFO is equal to or above this field value + 1, and RDMAE=1. Referto Table 6-8 for the field decode.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_SPIM_DMARDLR;

//idr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         idcode : 32; /*31: 0, Identification Code. This register contains the peripherals identification code, which iswritten into the register at configuration time using coreConsultant.Reset Value: N/A*/
    } bit_field;
} T_SPIM_IDR;

//ssi_comp_version
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               ssi_comp_version : 32; /*31: 0, Contains the hex representation of the Synopsys component version.Consists of ASCII value for each number in the version, followed by *. Forexample 32_30_31_2A represents the version 2.01*.Reset Value: See the releases table in the AMBA 2 release notes*/
    } bit_field;
} T_SPIM_SSI_COMP_VERSION;

//dr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                             dr : 32; /*31: 0, Data Register. When writing to this register, you must right-justify the data. Readdata are automatically right-justified. If SSI_MAX_XFER_SIZE configurationparameter is set to 32, all 32 bits are valid. Otherwise, only 16 bits ([15:0]) of theregister are valid.Read = Receive FIFO bufferWrite = Transmit FIFO bufferReset Value: 0x0*/
    } bit_field;
} T_SPIM_DR;

//rxsample_dly
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            rsd :  8; /* 7: 0,                             NA*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_SPIM_RXSAMPLE_DLY;

//Registers Mapping to the same address

typedef struct
{
    volatile                   T_SPIM_CTRLR0                         ctrlr0; /*  0x0,    RW, 0x00070000,                             NA*/
    volatile                   T_SPIM_CTRLR1                         ctrlr1; /*  0x4,    RW, 0x00000000,                             NA*/
    volatile                   T_SPIM_SSIENR                         ssienr; /*  0x8,    RW, 0x00000000,                             NA*/
    volatile                     T_SPIM_MWCR                           mwcr; /*  0xc,    RW, 0x00000000,                             NA*/
    volatile                      T_SPIM_SER                            ser; /* 0x10,    RW, 0x00000000,                             NA*/
    volatile                    T_SPIM_BAUDR                          baudr; /* 0x14,    RW, 0x00000000,                             NA*/
    volatile                   T_SPIM_TXFTLR                         txftlr; /* 0x18,    RW, 0x00000000,                             NA*/
    volatile                   T_SPIM_RXFTLR                         rxftlr; /* 0x1c,    RW, 0x00000000,                             NA*/
    volatile                    T_SPIM_TXFLR                          txflr; /* 0x20,    RO, 0x00000000,                             NA*/
    volatile                    T_SPIM_RXFLR                          rxflr; /* 0x24,    RO, 0x00000000,                             NA*/
    volatile                       T_SPIM_SR                             sr; /* 0x28,    RO, 0x00000006,                             NA*/
    volatile                      T_SPIM_IMR                            imr; /* 0x2c,    RW, 0x0000003F,                             NA*/
    volatile                      T_SPIM_ISR                            isr; /* 0x30,    RO, 0x00000000,                             NA*/
    volatile                     T_SPIM_RISR                           risr; /* 0x34,    RO, 0x00000000,                             NA*/
    volatile                   T_SPIM_TXOICR                         txoicr; /* 0x38,    RO, 0x00000000,                             NA*/
    volatile                   T_SPIM_RXOICR                         rxoicr; /* 0x3c,    RO, 0x00000000,                             NA*/
    volatile                   T_SPIM_RXUICR                         rxuicr; /* 0x40,    RO, 0x00000000,                             NA*/
    volatile                   T_SPIM_MSTICR                         msticr; /* 0x44,    RO, 0x00000000,                             NA*/
    volatile                      T_SPIM_ICR                            icr; /* 0x48,    RO, 0x00000000,                             NA*/
    volatile                    T_SPIM_DMACR                          dmacr; /* 0x4c,    RW, 0x00000000,                             NA*/
    volatile                  T_SPIM_DMATDLR                        dmatdlr; /* 0x50,    RW, 0x00000000,                             NA*/
    volatile                  T_SPIM_DMARDLR                        dmardlr; /* 0x54,    RW, 0x00000000,                             NA*/
    volatile                      T_SPIM_IDR                            idr; /* 0x58,    RO, 0x0000F1F1,                             NA*/
    volatile         T_SPIM_SSI_COMP_VERSION               ssi_comp_version; /* 0x5c,    RO, 0x3430302A,                             NA*/
    volatile                       T_SPIM_DR                             dr; /* 0x60,    RW, 0x00000000,                             NA*/
    volatile                        uint32_t                 reserved_0[35];
    volatile             T_SPIM_RXSAMPLE_DLY                   rxsample_dly; /* 0xf0,    RW, 0x00000000,                             NA*/
} T_HWP_SPIM_T;

#define hwp_spim ((T_HWP_SPIM_T*)REG_SPIM_BASE)


__STATIC_INLINE uint32_t spim_ctrlr0_get(void)
{
    return hwp_spim->ctrlr0.val;
}

__STATIC_INLINE void spim_ctrlr0_set(uint32_t value)
{
    hwp_spim->ctrlr0.val = value;
}

__STATIC_INLINE void spim_ctrlr0_pack(uint8_t dfs, uint8_t cfs, uint8_t srl, uint8_t slv_oe, uint8_t tmod, uint8_t scpol, uint8_t scph, uint8_t frf)
{
    hwp_spim->ctrlr0.val = (((uint32_t)dfs << 16) | ((uint32_t)cfs << 12) | ((uint32_t)srl << 11) | ((uint32_t)slv_oe << 10) | ((uint32_t)tmod << 8) | ((uint32_t)scpol << 7) | ((uint32_t)scph << 6) | ((uint32_t)frf << 4));
}

__STATIC_INLINE void spim_ctrlr0_unpack(uint8_t* dfs, uint8_t* cfs, uint8_t* srl, uint8_t* slv_oe, uint8_t* tmod, uint8_t* scpol, uint8_t* scph, uint8_t* frf)
{
    T_SPIM_CTRLR0 localVal = hwp_spim->ctrlr0;

    *dfs = localVal.bit_field.dfs;
    *cfs = localVal.bit_field.cfs;
    *srl = localVal.bit_field.srl;
    *slv_oe = localVal.bit_field.slv_oe;
    *tmod = localVal.bit_field.tmod;
    *scpol = localVal.bit_field.scpol;
    *scph = localVal.bit_field.scph;
    *frf = localVal.bit_field.frf;
}

__STATIC_INLINE uint8_t spim_dfs_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.dfs;
}

__STATIC_INLINE void spim_dfs_setf(uint8_t dfs)
{
    hwp_spim->ctrlr0.bit_field.dfs = dfs;
}

__STATIC_INLINE uint8_t spim_cfs_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.cfs;
}

__STATIC_INLINE void spim_cfs_setf(uint8_t cfs)
{
    hwp_spim->ctrlr0.bit_field.cfs = cfs;
}

__STATIC_INLINE uint8_t spim_srl_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.srl;
}

__STATIC_INLINE void spim_srl_setf(uint8_t srl)
{
    hwp_spim->ctrlr0.bit_field.srl = srl;
}

__STATIC_INLINE uint8_t spim_slv_oe_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.slv_oe;
}

__STATIC_INLINE void spim_slv_oe_setf(uint8_t slv_oe)
{
    hwp_spim->ctrlr0.bit_field.slv_oe = slv_oe;
}

__STATIC_INLINE uint8_t spim_tmod_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.tmod;
}

__STATIC_INLINE void spim_tmod_setf(uint8_t tmod)
{
    hwp_spim->ctrlr0.bit_field.tmod = tmod;
}

__STATIC_INLINE uint8_t spim_scpol_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.scpol;
}

__STATIC_INLINE void spim_scpol_setf(uint8_t scpol)
{
    hwp_spim->ctrlr0.bit_field.scpol = scpol;
}

__STATIC_INLINE uint8_t spim_scph_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.scph;
}

__STATIC_INLINE void spim_scph_setf(uint8_t scph)
{
    hwp_spim->ctrlr0.bit_field.scph = scph;
}

__STATIC_INLINE uint8_t spim_frf_getf(void)
{
    return hwp_spim->ctrlr0.bit_field.frf;
}

__STATIC_INLINE void spim_frf_setf(uint8_t frf)
{
    hwp_spim->ctrlr0.bit_field.frf = frf;
}

__STATIC_INLINE uint32_t spim_ctrlr1_get(void)
{
    return hwp_spim->ctrlr1.val;
}

__STATIC_INLINE void spim_ctrlr1_set(uint32_t value)
{
    hwp_spim->ctrlr1.val = value;
}

__STATIC_INLINE void spim_ctrlr1_pack(uint16_t ndf)
{
    hwp_spim->ctrlr1.val = (((uint32_t)ndf << 0));
}

__STATIC_INLINE void spim_ctrlr1_unpack(uint16_t* ndf)
{
    T_SPIM_CTRLR1 localVal = hwp_spim->ctrlr1;

    *ndf = localVal.bit_field.ndf;
}

__STATIC_INLINE uint16_t spim_ndf_getf(void)
{
    return hwp_spim->ctrlr1.bit_field.ndf;
}

__STATIC_INLINE void spim_ndf_setf(uint16_t ndf)
{
    hwp_spim->ctrlr1.bit_field.ndf = ndf;
}

__STATIC_INLINE uint32_t spim_ssienr_get(void)
{
    return hwp_spim->ssienr.val;
}

__STATIC_INLINE void spim_ssienr_set(uint32_t value)
{
    hwp_spim->ssienr.val = value;
}

__STATIC_INLINE void spim_ssienr_pack(uint8_t ssi_en)
{
    hwp_spim->ssienr.val = (((uint32_t)ssi_en << 0));
}

__STATIC_INLINE void spim_ssienr_unpack(uint8_t* ssi_en)
{
    T_SPIM_SSIENR localVal = hwp_spim->ssienr;

    *ssi_en = localVal.bit_field.ssi_en;
}

__STATIC_INLINE uint8_t spim_ssi_en_getf(void)
{
    return hwp_spim->ssienr.bit_field.ssi_en;
}

__STATIC_INLINE void spim_ssi_en_setf(uint8_t ssi_en)
{
    hwp_spim->ssienr.bit_field.ssi_en = ssi_en;
}

__STATIC_INLINE uint32_t spim_mwcr_get(void)
{
    return hwp_spim->mwcr.val;
}

__STATIC_INLINE void spim_mwcr_set(uint32_t value)
{
    hwp_spim->mwcr.val = value;
}

__STATIC_INLINE void spim_mwcr_pack(uint8_t mhs, uint8_t mod, uint8_t mwmod)
{
    hwp_spim->mwcr.val = (((uint32_t)mhs << 2) | ((uint32_t)mod << 1) | ((uint32_t)mwmod << 0));
}

__STATIC_INLINE void spim_mwcr_unpack(uint8_t* mhs, uint8_t* mod, uint8_t* mwmod)
{
    T_SPIM_MWCR localVal = hwp_spim->mwcr;

    *mhs = localVal.bit_field.mhs;
    *mod = localVal.bit_field.mod;
    *mwmod = localVal.bit_field.mwmod;
}

__STATIC_INLINE uint8_t spim_mhs_getf(void)
{
    return hwp_spim->mwcr.bit_field.mhs;
}

__STATIC_INLINE void spim_mhs_setf(uint8_t mhs)
{
    hwp_spim->mwcr.bit_field.mhs = mhs;
}

__STATIC_INLINE uint8_t spim_mod_getf(void)
{
    return hwp_spim->mwcr.bit_field.mod;
}

__STATIC_INLINE void spim_mod_setf(uint8_t mod)
{
    hwp_spim->mwcr.bit_field.mod = mod;
}

__STATIC_INLINE uint8_t spim_mwmod_getf(void)
{
    return hwp_spim->mwcr.bit_field.mwmod;
}

__STATIC_INLINE void spim_mwmod_setf(uint8_t mwmod)
{
    hwp_spim->mwcr.bit_field.mwmod = mwmod;
}

__STATIC_INLINE uint32_t spim_ser_get(void)
{
    return hwp_spim->ser.val;
}

__STATIC_INLINE void spim_ser_set(uint32_t value)
{
    hwp_spim->ser.val = value;
}

__STATIC_INLINE void spim_ser_pack(uint8_t ser)
{
    hwp_spim->ser.val = (((uint32_t)ser << 0));
}

__STATIC_INLINE void spim_ser_unpack(uint8_t* ser)
{
    T_SPIM_SER localVal = hwp_spim->ser;

    *ser = localVal.bit_field.ser;
}

__STATIC_INLINE uint8_t spim_ser_getf(void)
{
    return hwp_spim->ser.bit_field.ser;
}

__STATIC_INLINE void spim_ser_setf(uint8_t ser)
{
    hwp_spim->ser.bit_field.ser = ser;
}

__STATIC_INLINE uint32_t spim_baudr_get(void)
{
    return hwp_spim->baudr.val;
}

__STATIC_INLINE void spim_baudr_set(uint32_t value)
{
    hwp_spim->baudr.val = value;
}

__STATIC_INLINE void spim_baudr_pack(uint16_t sckdv)
{
    hwp_spim->baudr.val = (((uint32_t)sckdv << 0));
}

__STATIC_INLINE void spim_baudr_unpack(uint16_t* sckdv)
{
    T_SPIM_BAUDR localVal = hwp_spim->baudr;

    *sckdv = localVal.bit_field.sckdv;
}

__STATIC_INLINE uint16_t spim_sckdv_getf(void)
{
    return hwp_spim->baudr.bit_field.sckdv;
}

__STATIC_INLINE void spim_sckdv_setf(uint16_t sckdv)
{
    hwp_spim->baudr.bit_field.sckdv = sckdv;
}

__STATIC_INLINE uint32_t spim_txftlr_get(void)
{
    return hwp_spim->txftlr.val;
}

__STATIC_INLINE void spim_txftlr_set(uint32_t value)
{
    hwp_spim->txftlr.val = value;
}

__STATIC_INLINE void spim_txftlr_pack(uint8_t tft)
{
    hwp_spim->txftlr.val = (((uint32_t)tft << 0));
}

__STATIC_INLINE void spim_txftlr_unpack(uint8_t* tft)
{
    T_SPIM_TXFTLR localVal = hwp_spim->txftlr;

    *tft = localVal.bit_field.tft;
}

__STATIC_INLINE uint8_t spim_tft_getf(void)
{
    return hwp_spim->txftlr.bit_field.tft;
}

__STATIC_INLINE void spim_tft_setf(uint8_t tft)
{
    hwp_spim->txftlr.bit_field.tft = tft;
}

__STATIC_INLINE uint32_t spim_rxftlr_get(void)
{
    return hwp_spim->rxftlr.val;
}

__STATIC_INLINE void spim_rxftlr_set(uint32_t value)
{
    hwp_spim->rxftlr.val = value;
}

__STATIC_INLINE void spim_rxftlr_pack(uint8_t rft)
{
    hwp_spim->rxftlr.val = (((uint32_t)rft << 0));
}

__STATIC_INLINE void spim_rxftlr_unpack(uint8_t* rft)
{
    T_SPIM_RXFTLR localVal = hwp_spim->rxftlr;

    *rft = localVal.bit_field.rft;
}

__STATIC_INLINE uint8_t spim_rft_getf(void)
{
    return hwp_spim->rxftlr.bit_field.rft;
}

__STATIC_INLINE void spim_rft_setf(uint8_t rft)
{
    hwp_spim->rxftlr.bit_field.rft = rft;
}

__STATIC_INLINE uint32_t spim_txflr_get(void)
{
    return hwp_spim->txflr.val;
}

__STATIC_INLINE void spim_txflr_unpack(uint8_t* txtfl)
{
    T_SPIM_TXFLR localVal = hwp_spim->txflr;

    *txtfl = localVal.bit_field.txtfl;
}

__STATIC_INLINE uint8_t spim_txtfl_getf(void)
{
    return hwp_spim->txflr.bit_field.txtfl;
}

__STATIC_INLINE uint32_t spim_rxflr_get(void)
{
    return hwp_spim->rxflr.val;
}

__STATIC_INLINE void spim_rxflr_unpack(uint8_t* rxtfl)
{
    T_SPIM_RXFLR localVal = hwp_spim->rxflr;

    *rxtfl = localVal.bit_field.rxtfl;
}

__STATIC_INLINE uint8_t spim_rxtfl_getf(void)
{
    return hwp_spim->rxflr.bit_field.rxtfl;
}

__STATIC_INLINE uint32_t spim_sr_get(void)
{
    return hwp_spim->sr.val;
}

__STATIC_INLINE void spim_sr_unpack(uint8_t* dcol, uint8_t* txe, uint8_t* rff, uint8_t* rfne, uint8_t* tfe, uint8_t* tfnf, uint8_t* busy)
{
    T_SPIM_SR localVal = hwp_spim->sr;

    *dcol = localVal.bit_field.dcol;
    *txe = localVal.bit_field.txe;
    *rff = localVal.bit_field.rff;
    *rfne = localVal.bit_field.rfne;
    *tfe = localVal.bit_field.tfe;
    *tfnf = localVal.bit_field.tfnf;
    *busy = localVal.bit_field.busy;
}

__STATIC_INLINE uint8_t spim_dcol_getf(void)
{
    return hwp_spim->sr.bit_field.dcol;
}

__STATIC_INLINE uint8_t spim_txe_getf(void)
{
    return hwp_spim->sr.bit_field.txe;
}

__STATIC_INLINE uint8_t spim_rff_getf(void)
{
    return hwp_spim->sr.bit_field.rff;
}

__STATIC_INLINE uint8_t spim_rfne_getf(void)
{
    return hwp_spim->sr.bit_field.rfne;
}

__STATIC_INLINE uint8_t spim_tfe_getf(void)
{
    return hwp_spim->sr.bit_field.tfe;
}

__STATIC_INLINE uint8_t spim_tfnf_getf(void)
{
    return hwp_spim->sr.bit_field.tfnf;
}

__STATIC_INLINE uint8_t spim_busy_getf(void)
{
    return hwp_spim->sr.bit_field.busy;
}

__STATIC_INLINE uint32_t spim_imr_get(void)
{
    return hwp_spim->imr.val;
}

__STATIC_INLINE void spim_imr_set(uint32_t value)
{
    hwp_spim->imr.val = value;
}

__STATIC_INLINE void spim_imr_pack(uint8_t mstim, uint8_t rxfim, uint8_t rxoim, uint8_t rxuim, uint8_t txoim, uint8_t txeim)
{
    hwp_spim->imr.val = (((uint32_t)mstim << 5) | ((uint32_t)rxfim << 4) | ((uint32_t)rxoim << 3) | ((uint32_t)rxuim << 2) | ((uint32_t)txoim << 1) | ((uint32_t)txeim << 0));
}

__STATIC_INLINE void spim_imr_unpack(uint8_t* mstim, uint8_t* rxfim, uint8_t* rxoim, uint8_t* rxuim, uint8_t* txoim, uint8_t* txeim)
{
    T_SPIM_IMR localVal = hwp_spim->imr;

    *mstim = localVal.bit_field.mstim;
    *rxfim = localVal.bit_field.rxfim;
    *rxoim = localVal.bit_field.rxoim;
    *rxuim = localVal.bit_field.rxuim;
    *txoim = localVal.bit_field.txoim;
    *txeim = localVal.bit_field.txeim;
}

__STATIC_INLINE uint8_t spim_mstim_getf(void)
{
    return hwp_spim->imr.bit_field.mstim;
}

__STATIC_INLINE void spim_mstim_setf(uint8_t mstim)
{
    hwp_spim->imr.bit_field.mstim = mstim;
}

__STATIC_INLINE uint8_t spim_rxfim_getf(void)
{
    return hwp_spim->imr.bit_field.rxfim;
}

__STATIC_INLINE void spim_rxfim_setf(uint8_t rxfim)
{
    hwp_spim->imr.bit_field.rxfim = rxfim;
}

__STATIC_INLINE uint8_t spim_rxoim_getf(void)
{
    return hwp_spim->imr.bit_field.rxoim;
}

__STATIC_INLINE void spim_rxoim_setf(uint8_t rxoim)
{
    hwp_spim->imr.bit_field.rxoim = rxoim;
}

__STATIC_INLINE uint8_t spim_rxuim_getf(void)
{
    return hwp_spim->imr.bit_field.rxuim;
}

__STATIC_INLINE void spim_rxuim_setf(uint8_t rxuim)
{
    hwp_spim->imr.bit_field.rxuim = rxuim;
}

__STATIC_INLINE uint8_t spim_txoim_getf(void)
{
    return hwp_spim->imr.bit_field.txoim;
}

__STATIC_INLINE void spim_txoim_setf(uint8_t txoim)
{
    hwp_spim->imr.bit_field.txoim = txoim;
}

__STATIC_INLINE uint8_t spim_txeim_getf(void)
{
    return hwp_spim->imr.bit_field.txeim;
}

__STATIC_INLINE void spim_txeim_setf(uint8_t txeim)
{
    hwp_spim->imr.bit_field.txeim = txeim;
}

__STATIC_INLINE uint32_t spim_isr_get(void)
{
    return hwp_spim->isr.val;
}

__STATIC_INLINE void spim_isr_unpack(uint8_t* mstis, uint8_t* rxfis, uint8_t* rxois, uint8_t* rxuis, uint8_t* txois, uint8_t* txeis)
{
    T_SPIM_ISR localVal = hwp_spim->isr;

    *mstis = localVal.bit_field.mstis;
    *rxfis = localVal.bit_field.rxfis;
    *rxois = localVal.bit_field.rxois;
    *rxuis = localVal.bit_field.rxuis;
    *txois = localVal.bit_field.txois;
    *txeis = localVal.bit_field.txeis;
}

__STATIC_INLINE uint8_t spim_mstis_getf(void)
{
    return hwp_spim->isr.bit_field.mstis;
}

__STATIC_INLINE uint8_t spim_rxfis_getf(void)
{
    return hwp_spim->isr.bit_field.rxfis;
}

__STATIC_INLINE uint8_t spim_rxois_getf(void)
{
    return hwp_spim->isr.bit_field.rxois;
}

__STATIC_INLINE uint8_t spim_rxuis_getf(void)
{
    return hwp_spim->isr.bit_field.rxuis;
}

__STATIC_INLINE uint8_t spim_txois_getf(void)
{
    return hwp_spim->isr.bit_field.txois;
}

__STATIC_INLINE uint8_t spim_txeis_getf(void)
{
    return hwp_spim->isr.bit_field.txeis;
}

__STATIC_INLINE uint32_t spim_risr_get(void)
{
    return hwp_spim->risr.val;
}

__STATIC_INLINE void spim_risr_unpack(uint8_t* mstir, uint8_t* rxfir, uint8_t* rxoir, uint8_t* rxuir, uint8_t* txoir, uint8_t* txeir)
{
    T_SPIM_RISR localVal = hwp_spim->risr;

    *mstir = localVal.bit_field.mstir;
    *rxfir = localVal.bit_field.rxfir;
    *rxoir = localVal.bit_field.rxoir;
    *rxuir = localVal.bit_field.rxuir;
    *txoir = localVal.bit_field.txoir;
    *txeir = localVal.bit_field.txeir;
}

__STATIC_INLINE uint8_t spim_mstir_getf(void)
{
    return hwp_spim->risr.bit_field.mstir;
}

__STATIC_INLINE uint8_t spim_rxfir_getf(void)
{
    return hwp_spim->risr.bit_field.rxfir;
}

__STATIC_INLINE uint8_t spim_rxoir_getf(void)
{
    return hwp_spim->risr.bit_field.rxoir;
}

__STATIC_INLINE uint8_t spim_rxuir_getf(void)
{
    return hwp_spim->risr.bit_field.rxuir;
}

__STATIC_INLINE uint8_t spim_txoir_getf(void)
{
    return hwp_spim->risr.bit_field.txoir;
}

__STATIC_INLINE uint8_t spim_txeir_getf(void)
{
    return hwp_spim->risr.bit_field.txeir;
}

__STATIC_INLINE uint32_t spim_txoicr_get(void)
{
    return hwp_spim->txoicr.val;
}

__STATIC_INLINE void spim_txoicr_unpack(uint8_t* txoicr)
{
    T_SPIM_TXOICR localVal = hwp_spim->txoicr;

    *txoicr = localVal.bit_field.txoicr;
}

__STATIC_INLINE uint8_t spim_txoicr_getf(void)
{
    return hwp_spim->txoicr.bit_field.txoicr;
}

__STATIC_INLINE uint32_t spim_rxoicr_get(void)
{
    return hwp_spim->rxoicr.val;
}

__STATIC_INLINE void spim_rxoicr_unpack(uint8_t* rxoicr)
{
    T_SPIM_RXOICR localVal = hwp_spim->rxoicr;

    *rxoicr = localVal.bit_field.rxoicr;
}

__STATIC_INLINE uint8_t spim_rxoicr_getf(void)
{
    return hwp_spim->rxoicr.bit_field.rxoicr;
}

__STATIC_INLINE uint32_t spim_rxuicr_get(void)
{
    return hwp_spim->rxuicr.val;
}

__STATIC_INLINE void spim_rxuicr_unpack(uint8_t* rxuicr)
{
    T_SPIM_RXUICR localVal = hwp_spim->rxuicr;

    *rxuicr = localVal.bit_field.rxuicr;
}

__STATIC_INLINE uint8_t spim_rxuicr_getf(void)
{
    return hwp_spim->rxuicr.bit_field.rxuicr;
}

__STATIC_INLINE uint32_t spim_msticr_get(void)
{
    return hwp_spim->msticr.val;
}

__STATIC_INLINE void spim_msticr_unpack(uint8_t* msticr)
{
    T_SPIM_MSTICR localVal = hwp_spim->msticr;

    *msticr = localVal.bit_field.msticr;
}

__STATIC_INLINE uint8_t spim_msticr_getf(void)
{
    return hwp_spim->msticr.bit_field.msticr;
}

__STATIC_INLINE uint32_t spim_icr_get(void)
{
    return hwp_spim->icr.val;
}

__STATIC_INLINE void spim_icr_unpack(uint8_t* icr)
{
    T_SPIM_ICR localVal = hwp_spim->icr;

    *icr = localVal.bit_field.icr;
}

__STATIC_INLINE uint8_t spim_icr_getf(void)
{
    return hwp_spim->icr.bit_field.icr;
}

__STATIC_INLINE uint32_t spim_dmacr_get(void)
{
    return hwp_spim->dmacr.val;
}

__STATIC_INLINE void spim_dmacr_set(uint32_t value)
{
    hwp_spim->dmacr.val = value;
}

__STATIC_INLINE void spim_dmacr_pack(uint8_t tdmae, uint8_t rdmae)
{
    hwp_spim->dmacr.val = (((uint32_t)tdmae << 1) | ((uint32_t)rdmae << 0));
}

__STATIC_INLINE void spim_dmacr_unpack(uint8_t* tdmae, uint8_t* rdmae)
{
    T_SPIM_DMACR localVal = hwp_spim->dmacr;

    *tdmae = localVal.bit_field.tdmae;
    *rdmae = localVal.bit_field.rdmae;
}

__STATIC_INLINE uint8_t spim_tdmae_getf(void)
{
    return hwp_spim->dmacr.bit_field.tdmae;
}

__STATIC_INLINE void spim_tdmae_setf(uint8_t tdmae)
{
    hwp_spim->dmacr.bit_field.tdmae = tdmae;
}

__STATIC_INLINE uint8_t spim_rdmae_getf(void)
{
    return hwp_spim->dmacr.bit_field.rdmae;
}

__STATIC_INLINE void spim_rdmae_setf(uint8_t rdmae)
{
    hwp_spim->dmacr.bit_field.rdmae = rdmae;
}

__STATIC_INLINE uint32_t spim_dmatdlr_get(void)
{
    return hwp_spim->dmatdlr.val;
}

__STATIC_INLINE void spim_dmatdlr_set(uint32_t value)
{
    hwp_spim->dmatdlr.val = value;
}

__STATIC_INLINE void spim_dmatdlr_pack(uint8_t dmatdl)
{
    hwp_spim->dmatdlr.val = (((uint32_t)dmatdl << 0));
}

__STATIC_INLINE void spim_dmatdlr_unpack(uint8_t* dmatdl)
{
    T_SPIM_DMATDLR localVal = hwp_spim->dmatdlr;

    *dmatdl = localVal.bit_field.dmatdl;
}

__STATIC_INLINE uint8_t spim_dmatdl_getf(void)
{
    return hwp_spim->dmatdlr.bit_field.dmatdl;
}

__STATIC_INLINE void spim_dmatdl_setf(uint8_t dmatdl)
{
    hwp_spim->dmatdlr.bit_field.dmatdl = dmatdl;
}

__STATIC_INLINE uint32_t spim_dmardlr_get(void)
{
    return hwp_spim->dmardlr.val;
}

__STATIC_INLINE void spim_dmardlr_set(uint32_t value)
{
    hwp_spim->dmardlr.val = value;
}

__STATIC_INLINE void spim_dmardlr_pack(uint8_t dmardl)
{
    hwp_spim->dmardlr.val = (((uint32_t)dmardl << 0));
}

__STATIC_INLINE void spim_dmardlr_unpack(uint8_t* dmardl)
{
    T_SPIM_DMARDLR localVal = hwp_spim->dmardlr;

    *dmardl = localVal.bit_field.dmardl;
}

__STATIC_INLINE uint8_t spim_dmardl_getf(void)
{
    return hwp_spim->dmardlr.bit_field.dmardl;
}

__STATIC_INLINE void spim_dmardl_setf(uint8_t dmardl)
{
    hwp_spim->dmardlr.bit_field.dmardl = dmardl;
}

__STATIC_INLINE uint32_t spim_idr_get(void)
{
    return hwp_spim->idr.val;
}

__STATIC_INLINE void spim_idr_unpack(uint32_t* idcode)
{
    T_SPIM_IDR localVal = hwp_spim->idr;

    *idcode = localVal.bit_field.idcode;
}

__STATIC_INLINE uint32_t spim_idcode_getf(void)
{
    return hwp_spim->idr.bit_field.idcode;
}

__STATIC_INLINE uint32_t spim_ssi_comp_version_get(void)
{
    return hwp_spim->ssi_comp_version.val;
}

__STATIC_INLINE void spim_ssi_comp_version_unpack(uint32_t* ssi_comp_version)
{
    T_SPIM_SSI_COMP_VERSION localVal = hwp_spim->ssi_comp_version;

    *ssi_comp_version = localVal.bit_field.ssi_comp_version;
}

__STATIC_INLINE uint32_t spim_ssi_comp_version_getf(void)
{
    return hwp_spim->ssi_comp_version.bit_field.ssi_comp_version;
}

__STATIC_INLINE uint32_t spim_dr_get(void)
{
    return hwp_spim->dr.val;
}

__STATIC_INLINE void spim_dr_set(uint32_t value)
{
    hwp_spim->dr.val = value;
}

__STATIC_INLINE void spim_dr_pack(uint32_t dr)
{
    hwp_spim->dr.val = (((uint32_t)dr << 0));
}

__STATIC_INLINE void spim_dr_unpack(uint32_t* dr)
{
    T_SPIM_DR localVal = hwp_spim->dr;

    *dr = localVal.bit_field.dr;
}

__STATIC_INLINE uint32_t spim_dr_getf(void)
{
    return hwp_spim->dr.bit_field.dr;
}

__STATIC_INLINE void spim_dr_setf(uint32_t dr)
{
    hwp_spim->dr.bit_field.dr = dr;
}

__STATIC_INLINE uint32_t spim_rxsample_dly_get(void)
{
    return hwp_spim->rxsample_dly.val;
}

__STATIC_INLINE void spim_rxsample_dly_set(uint32_t value)
{
    hwp_spim->rxsample_dly.val = value;
}

__STATIC_INLINE void spim_rxsample_dly_pack(uint8_t rsd)
{
    hwp_spim->rxsample_dly.val = (((uint32_t)rsd << 0));
}

__STATIC_INLINE void spim_rxsample_dly_unpack(uint8_t* rsd)
{
    T_SPIM_RXSAMPLE_DLY localVal = hwp_spim->rxsample_dly;

    *rsd = localVal.bit_field.rsd;
}

__STATIC_INLINE uint8_t spim_rsd_getf(void)
{
    return hwp_spim->rxsample_dly.bit_field.rsd;
}

__STATIC_INLINE void spim_rsd_setf(uint8_t rsd)
{
    hwp_spim->rxsample_dly.bit_field.rsd = rsd;
}
#endif


