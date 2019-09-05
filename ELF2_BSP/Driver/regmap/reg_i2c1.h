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
#ifndef __REG_I2C1_H__
#define __REG_I2C1_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//ic_con
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    master_mode :  1; /* 0: 0, This bit controls whether the DW_apb_i2c master is enabled.0: master disabled1: master enabledReset value: IC_MASTER_MODE configuration parameterNOTE: Software should ensure that if this bit is written with＆1,＊ then bit 6 should also be written with a ＆1＊.*/
        uint32_t                          speed :  2; /* 2: 1, These bits control at which speed the DW_apb_i2c operates.Hardware protects against illegal values being programmedby software. register These bits must be programmedappropriately for slave mode also, as it is used to capturecorrect value of spike filter as per the speed mode.This register should be programmed only with a value in therange of 1 to IC_MAX_SPEED_MODE; otherwise, hardwareupdates this register with the value ofIC_MAX_SPEED_MODE.← 1: standard mode (0 to 100 Kb/s)← 2: fast mode (≒ 400 Kb/s) or fast mode plus (≒ 1000 Kb/s)← 3: high speed mode (≒ 3.4 Mb/s)NOTE: This field is not applicable in Ultra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: IC_MAX_SPEED_MODE configuration*/
        uint32_t             ic_10bitaddr_slave :  1; /* 3: 3, When acting as a slave, this bit controls whether theDW_apb_i2c responds to 7- or 10-bit addresses.0: 7-bit addressing. The DW_apb_i2c ignores transactionsthat involve 10-bit addressing; for 7-bit addressing, only thelower 7 bits of the IC_SAR register are compared.1: 10-bit addressing. The DW_apb_i2c responds to only10-bit addressing transfers that match the full 10 bits of theIC_SAR register.Reset value: IC_10BITADDR_SLAVE configurationparamete*/
        uint32_t            ic_10bitaddr_master :  1; /* 4: 4, If the I2C_DYNAMIC_TAR_UPDATE configuration parameteris set to ※No§ (0), this bit is named IC_10BITADDR_MASTERand controls whether the DW_apb_i2c starts its transfers in 7-or 10-bit addressing mode when acting as a master.If I2C_DYNAMIC_TAR_UPDATE is set to ※Yes§ (1), thefunction of this bit is handled by bit 12 of IC_TAR register, andbecomes a read-only copy calledIC_10BITADDR_MASTER_rd_only.0: 7-bit addressing1: 10-bit addressingDependencies: If I2C_DYNAMIC_TAR_UPDATE = 1, thenthis bit is read-only. If I2C_DYNAMIC_TAR_UPDATE = 0,then this bit can be read or write.Reset value: IC_10BITADDR_MASTER configurationparameter*/
        uint32_t                  ic_restart_en :  1; /* 5: 5, Determines whether RESTART conditions may be sent whenacting as a master. Some older slaves do not supporthandling RESTART conditions; however, RESTARTconditions are used in several DW_apb_i2c operations.0: disable1: enableWhen the RESTART is disabled, the DW_apb_i2c master isincapable of performing the following functions:← Sending a START BYTE← Performing any high-speed mode operation← Performing direction changes in combined format mode← Performing a read operation with a 10-bit addressBy replacing RESTART condition followed by a STOP and asubsequent START condition, split operations are brokendown into multiple DW_apb_i2c transfers. If the aboveoperations are performed, it will result in setting bit 6(TX_ABRT) of the IC_RAW_INTR_STAT register.Reset value: IC_RESTART_EN configuration paramete*/
        uint32_t               ic_slave_disable :  1; /* 6: 6, This bit controls whether I2C has its slave disabled, whichmeans once the presetn signal is applied, then this bit takeson the value of the configuration parameterIC_SLAVE_DISABLE. You have the choice of having theslave enabled or disabled after reset is applied, which meanssoftware does not have to configure the slave. By default, theslave is always enabled (in reset state as well). If you need todisable it after reset, set this bit to 1.If this bit is set (slave is disabled), DW_apb_i2c functions onlyas a master and does not perform any action that requires aslave.0: slave is enabled1: slave is disabledReset value: IC_SLAVE_DISABLE configuration parameterNOTE: Software should ensure that if this bit is written with＆0,＊ then bit 0 should also be written with a ＆0＊.*/
        uint32_t           stop_det_ifaddressed :  1; /* 7: 7, In slave mode:1＊b1 每 issues the STOP_DET interrupt only when it isaddressed.1＊b0 每 issues the STOP_DET irrespective of whether it＊saddressed or not.Dependencies: This register bit value is applicable in theslave mode only (MASTER_MODE = 1＊b0)Reset value: 1＊b0NOTE: During a general call address, this slave does notissue the STOP_DET interrupt ifSTOP_DET_IF_ADDRESSED = 1＊b1, even if the slaveresponds to the general call address by generating ACK.The STOP_DET interrupt is generated only when thetransmitted address matches the slave address (SAR).*/
        uint32_t                  tx_empty_ctrl :  1; /* 8: 8, This bit controls the generation of the TX_EMPTY interrupt,as described in the IC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t          rx_fifo_full_hld_ctrl :  1; /* 9: 9, This bit controls whether DW_apb_i2c should hold the buswhen the Rx FIFO is physically full to itsRX_BUFFER_DEPTH, as described in theIC_RX_FULL_HLD_BUS_EN parameter.Dependencies: This register bit value is applicable onlywhen the IC_RX_FULL_HLD_BUS_EN configurationparameter is set to 1. If IC_RX_FULL_HLD_BUS_EN = 0,then this bit is read-only. If IC_RX_FULL_HLD_BUS_EN = 1,then this bit can be read or write.This field is not applicable in Ultra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                     reserved_0 : 22; /*31:10,                             NA*/
    } bit_field;
} T_I2C1_IC_CON;

//ic_tar
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            tar : 10; /* 9: 0, This is the target address for any master transaction. Whentransmitting a General Call, these bits are ignored. To generate aSTART BYTE, the CPU needs to write only once into these bits.Reset value: IC_DEFAULT_TAR_SLAVE_ADDR configurationparameterIf the IC_TAR and IC_SAR are the same, loopback exists but theFIFOs are shared between master and slave, so full loopback is notfeasible. Only one direction loopback mode is supported (simplex),not duplex. A master cannot transmit to itself; it can transmit to onlya slave*/
        uint32_t                    gc_or_start :  1; /*10:10, If bit 11 (SPECIAL) is set to 1 and bit 13 (Device-ID) is set to 0, thenthis bit indicates whether a General Call or START byte command isto be performed by the DW_apb_i2c.← 0: General Call Address 每 after issuing a General Call, onlywrites may be performed. Attempting to issue a read commandresults in setting bit 6 (TX_ABRT) of the IC_RAW_INTR_STATregister. The DW_apb_i2c remains in General Call mode untilthe SPECIAL bit value (bit 11) is cleared.← 1: START BYTEReset value: 0x0*/
        uint32_t                        special :  1; /*11:11, This bit indicates whether software performs a Device-ID, GeneralCall or START BYTE command.← 0: ignore bit 10 GC_OR_START and use IC_TAR normally← 1: perform special I2C command as specified in Device-ID orGC_OR_START bitReset value: 0x0*/
        uint32_t                     reserved_0 : 20; /*31:12,                             NA*/
    } bit_field;
} T_I2C1_IC_TAR;

//ic_sar
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            sar : 10; /* 9: 0, The IC_SAR holds the slave address when the I2C is operating as a slave. For 7-bitaddressing, only IC_SAR[6:0] is used.This register can be written only when the I2C interface is disabled, which correspondsto IC_ENABLE[0] being set to 0. Writes at other times have no effect.NOTE: The default values cannot be any of the reserved address locations: that is,0x00 to 0x07, or 0x78 to 0x7f. The correct operation of the device is not guaranteed ifyou program the IC_SAR or IC_TAR to a reserved value. Refer to Table 3-1 on page44 for a complete list of these reserved values.Reset value: IC_DEFAULT_SLAVE_ADDR configuration parameter*/
        uint32_t                     reserved_0 : 22; /*31:10,                             NA*/
    } bit_field;
} T_I2C1_IC_SAR;

//ic_hs_maddr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         hs_mar :  3; /* 2: 0, This bit field holds the value of the I2C HS mode master code. HS-mode mastercodes are reserved 8-bit codes (00001xxx) that are not used for slave addressingor other purposes. Each master has its unique master code; up to eight highspeed mode masters can be present on the same I2C bus system. Valid valuesare from 0 to 7. This register goes away and becomes read-only returning 0＊s ifthe IC_MAX_SPEED_MODE configuration parameter is set to either Standard(1) or Fast (2).This register can be written only when the I2C interface is disabled, whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times have noeffect.Reset value: IC_HS_MASTER_CODE configuration parameter*/
        uint32_t                     reserved_0 : 29; /*31: 3,                             NA*/
    } bit_field;
} T_I2C1_IC_HS_MADDR;

//ic_data_cmd
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            dat :  8; /* 7: 0, This register contains the data to be transmitted or received on the I2C bus.If you are writing to this register and want to perform a read, bits 7:0 (DAT)are ignored by the DW_apb_i2c. However, when you read this register,these bits return the value of data received on the DW_apb_i2c interface.Reset value: 0x0*/
        uint32_t                            cmd :  1; /* 8: 8, This bit controls whether a read or a write is performed. This bit does notcontrol the direction when the DW_apb_i2c acts as a slave. It controls onlythe direction when it acts as a master.← 1 = Read← 0 = WriteWhen a command is entered in the TX FIFO, this bit distinguishes the writeand read commands. In slave-receiver mode, this bit is a ※don＊t care§because writes to this register are not required. In slave-transmitter mode, a※0§ indicates that the data in IC_DATA_CMD is to be transmitted.When programming this bit, you should remember the following: attemptingto perform a read operation after a General Call command has been sentresults in a TX_ABRT interrupt (bit 6 of the IC_RAW_INTR_STAT register),unless bit 11 (SPECIAL) in the IC_TAR register has been cleared.If a ※1§ is written to this bit after receiving a RD_REQ interrupt, then aTX_ABRT interrupt occurs.Dependencies: This field is not applicable in Ultra-Fast speed mode (IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                           stop :  1; /* 9: 9, This bit controls whether a STOP is issued after the byte is sent or received.This bit is available only if IC_EMPTYFIFO_HOLD_MASTER_EN isconfigured to 1.← 1 每 STOP is issued after this byte, regardless of whether or not theTx FIFO is empty. If the Tx FIFO is not empty, the master immediatelytries to start a new transfer by issuing a START and arbitrating for thebus.← 0 每 STOP is not issued after this byte, regardless of whether or not theTx FIFO is empty. If the Tx FIFO is not empty, the master continues thecurrent transfer by sending/receiving data bytes according to the value ofthe CMD bit. If the Tx FIFO is empty, the master holds the SCL line lowand stalls the bus until a new command is available in the Tx FIFO.*/
        uint32_t                        restart :  1; /*10:10, This bit controls whether a RESTART is issued before the byte is sent orreceived. This bit is available only if IC_EMPTYFIFO_HOLD_MASTER_ENis configured to 1.← 1 每 If IC_RESTART_EN is 1, a RESTART is issued before the data issent/received (according to the value of CMD), regardless of whether ornot the transfer direction is changing from the previous command; ifIC_RESTART_EN is 0, a STOP followed by a START is issued instead.← 0 每 If IC_RESTART_EN is 1, a RESTART is issued only if the transferdirection is changing from the previous command; if IC_RESTART_ENis 0, a STOP followed by a START is issued instead.*/
        uint32_t                first_data_byte :  1; /*11:11, Indicates the first data byte received after the address phase for receivetransfer in Master receiver or Slave receiver mode.Reset value: 0x0Dependencies: This Register bit value is applicable only whenFIRST_DATA_BYTE_STATUS=1.Note: In case of APB_DATA_WIDTH=8:1. You must perform two APB Reads to IC_DATA_CMD to get status on 11bit.2. To read the 11 bit, you must perform the first data byte read [7:0] (offset0x10) and then perform the second read[15:8](offset 0x11) to know thestatus of 11 bit (whether the data received in previous read is a first databyte).3. The 11th bit is an optional read field. You can ignore 2nd byte read [15:8](offset 0x11) if not interested in the FIRST_DATA_BYTE status.*/
        uint32_t                     reserved_0 : 20; /*31:12,                             NA*/
    } bit_field;
} T_I2C1_IC_DATA_CMD;

//ic_ss_scl_hcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    ss_scl_hcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place toensure proper I/O timing. This register sets the SCL clock high-period countfor standard speed. For more information, refer to ※IC_CLK FrequencyConfiguration§ on page 79.This register can be written only when the I2C interface is disabled whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times have noeffect.The minimum valid value is 6; hardware prevents values less than this beingwritten, and if attempted results in 6 being set. For designs withAPB_DATA_WIDTH = 8, the order of programming is important to ensure thecorrect operation of the DW_apb_i2c. The lower byte must be programmedfirst. Then the upper byte is programmed.When the configuration parameter IC_HC_COUNT_VALUES is set to 1, thisregister is read only.NOTE: This register must not be programmed to a value higher than 65525,because DW_apb_i2c uses a 16-bit counter to flag an I2C bus idle conditionwhen this counter reaches a value of IC_SS_SCL_HCNT + 10.Reset value: IC_SS_SCL_HIGH_COUNT configuration parameter*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C1_IC_SS_SCL_HCNT;

//ic_ss_scl_lcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    ss_scl_lcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place toensure proper I/O timing. This register sets the SCL clock low period countfor standard speed. For more information, refer to ※IC_CLK FrequencyConfiguration§ on page 79.This register can be written only when the I2C interface is disabled whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times have noeffect.The minimum valid value is 8; hardware prevents values less than this beingwritten, and if attempted, results in 8 being set. For designs withAPB_DATA_WIDTH = 8, the order of programming is important to ensure thecorrect operation of DW_apb_i2c. The lower byte must be programmed first,and then the upper byte is programmed.When the configuration parameter IC_HC_COUNT_VALUES is set to 1, thisregister is read only.Reset value: IC_SS_SCL_LOW_COUNT configuration parameter*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C1_IC_SS_SCL_LCNT;

//ic_fs_scl_hcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    fs_scl_hcnt : 16; /*15: 0,  This register must be set before any I2C bus transaction can take place toensure proper I/O timing. This register sets the SCL clock high-period countfor fast mode or fast mode plus. It is used in high-speed mode to send theMaster Code and START BYTE or General CALL. For more information,refer to ※IC_CLK Frequency Configuration§ on page 79.This register goes away and becomes read-only returning 0s ifIC_MAX_SPEED_MODE = standard. This register can be written only whenthe I2C interface is disabled, which corresponds to IC_ENABLE[0] being setto 0. Writes at other times have no effect.The minimum valid value is 6; hardware prevents values less than this beingwritten, and if attempted results in 6 being set. For designs withAPB_DATA_WIDTH == 8 the order of programming is important to ensurethe correct operation of the DW_apb_i2c. The lower byte must beprogrammed first. Then the upper byte is programmed.When the configuration parameter IC_HC_COUNT_VALUES is set to 1, thisregister is read only.Reset value: IC_FS_SCL_HIGH_COUNT configuration parameter*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C1_IC_FS_SCL_HCNT;

//ic_fs_scl_lcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    fs_scl_lcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place toensure proper I/O timing. This register sets the SCL clock low period countfor fast mode or fast mode plus. It is used in high-speed mode to send theMaster Code and START BYTE or General CALL. For more information, referto ※IC_CLK Frequency Configuration§ on page 79.This register goes away and becomes read-only returning 0s ifIC_MAX_SPEED_MODE = standard.This register can be written only when the I2C interface is disabled, whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times have noeffect.The minimum valid value is 8; hardware prevents values less than this beingwritten, and if attempted results in 8 being set. For designs withAPB_DATA_WIDTH = 8 the order of programming is important to ensure thecorrect operation of the DW_apb_i2c. The lower byte must be programmedfirst. Then the upper byte is programmed. If the value is less than 8 then thecount value gets changed to 8.When the configuration parameter IC_HC_COUNT_VALUES is set to 1, thisregister is read only.Reset value: IC_FS_SCL_LOW_COUNT configuration parameter*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C1_IC_FS_SCL_LCNT;

//ic_hs_scl_hcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    hs_scl_hcnt : 16; /*15: 0,  This register must be set before any I2C bus transaction can take place toensure proper I/O timing. This register sets the SCL clock high period countfor high speed. For more information, refer to ※IC_CLK FrequencyConfiguration§ on page 79.The SCL High time depends on the loading of the bus. For 100pF loading,the SCL High time is 60ns; for 400pF loading, the SCL High time is 120ns.This register goes away and becomes read-only returning 0s ifIC_MAX_SPEED_MODE != high.This register can be written only when the I2C interface is disabled, whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times have noeffect.The minimum valid value is 6; hardware prevents values less than this beingwritten, and if attempted results in 6 being set. For designs withAPB_DATA_WIDTH = 8 the order of programming is important to ensure thecorrect operation of the DW_apb_i2c. The lower byte must be programmedfirst. Then the upper byte is programmed.When the configuration parameter IC_HC_COUNT_VALUES is set to 1, thisregister is read only.Reset value: IC_HS_SCL_HIGH_COUNT configuration parameter*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C1_IC_HS_SCL_HCNT;

//ic_hs_scl_lcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    hs_scl_lcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place toensure proper I/O timing. This register sets the SCL clock low period countfor high speed. For more information, refer to ※IC_CLK FrequencyConfiguration§ on page 79.The SCL low time depends on the loading of the bus. For 100pF loading, theSCL low time is 160ns; for 400pF loading, the SCL low time is 320ns.This register goes away and becomes read-only returning 0s ifIC_MAX_SPEED_MODE != high.This register can be written only when the I2C interface is disabled, whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times have noeffect.The minimum valid value is 8; hardware prevents values less than this beingwritten, and if attempted results in 8 being set. For designs withAPB_DATA_WIDTH == 8 the order of programming is important to ensurethe correct operation of the DW_apb_i2c. The lower byte must beprogrammed first. Then the upper byte is programmed. If the value is lessthan 8 then the count value gets changed to 8.When the configuration parameter IC_HC_COUNT_VALUES is set to 1, thisregister is read only.Reset value: IC_HS_SCL_LOW_COUNT configuration parameter*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C1_IC_HS_SCL_LCNT;

//ic_intr_stat
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  rx_under_stat :  1; /* 0: 0, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                   rx_over_stat :  1; /* 1: 1, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                   rx_full_stat :  1; /* 2: 2, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                   tx_over_stat :  1; /* 3: 3, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                  tx_empty_stat :  1; /* 4: 4, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                    rd_req_stat :  1; /* 5: 5, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                   tx_abrt_stat :  1; /* 6: 6, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                   rx_done_stat :  1; /* 7: 7, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                  activity_stat :  1; /* 8: 8, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                  stop_det_stat :  1; /* 9: 9, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                 start_det_stat :  1; /*10:10, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t                  gen_call_stat :  1; /*11:11, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t               restart_det_stat :  1; /*12:12, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of thesebits.Dependencies: R_RX_DONE and R_RD_REQ are not applicable in UltraFast speed mode (IC_ULTRA_FAST_MODE = 1).Reset value: 0x0*/
        uint32_t               mst_on_hold_stat :  1; /*13:13, See ※IC_RAW_INTR_STAT§ on page 186 for a detailed description of this bit.Reset value: 0x0*/
        uint32_t          scl_stuck_at_low_stat :  1; /*14:14, See IC_RAW_INTR_STAT for a detailed description of this bit.Dependencies: This field is not applicable in Ultra-Fast speed mode (IC_ULTRA_FAST_MODE=1).Reset value: 0x0*/
        uint32_t                     reserved_0 : 17; /*31:15,                             NA*/
    } bit_field;
} T_I2C1_IC_INTR_STAT;

//ic_intr_mask
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  rx_under_mask :  1; /* 0: 0, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                   rx_over_mask :  1; /* 1: 1, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                   rx_full_mask :  1; /* 2: 2, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                   tx_over_mask :  1; /* 3: 3, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                  tx_empty_mask :  1; /* 4: 4, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                    rd_req_mask :  1; /* 5: 5, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                   tx_abrt_mask :  1; /* 6: 6, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                   rx_done_mask :  1; /* 7: 7, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                  activity_mask :  1; /* 8: 8, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                  stop_det_mask :  1; /* 9: 9, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                 start_det_mask :  1; /*10:10, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t                  gen_call_mask :  1; /*11:11, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t               restart_det_mask :  1; /*12:12, This bit masks the R_RESTART_DET interrupt status bit in theIC_INTR_STAT register.Dependencies: If IC_SLV_RESTART_DET_EN = 1, thenM_RESTART_DET is read/write. Otherwise M_RESTART_DET is read-only.Reset value: 14＊h8ff*/
        uint32_t               mst_on_hold_mask :  1; /*13:13, This bit masks the R_MST_ON_HOLD interrupt bit in the IC_INTR_STATregister.Dependencies: If I2C_DYNAMIC_TAR_UPDATE = 1 andIC_EMPTYFIFO_HOLD_MASTER_EN = 1, then M_MST_ON_HOLD isread/write. Otherwise M_MST_ON_HOLD is read-only.Reset value: 14＊h8ff*/
        uint32_t          scl_stuck_at_low_mask :  1; /*14:14, This bit masks the R_SCL_STUCK_AT_LOW interrupt bit in theIC_INTR_STAT registerThis bit is enabled only when IC_BUS_CLEAR_FEATURE = 1.Dependencies: This field is not applicable in Ultra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset Value: 0x1*/
        uint32_t                     reserved_0 : 17; /*31:15,                             NA*/
    } bit_field;
} T_I2C1_IC_INTR_MASK;

//ic_raw_intr_stat
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   rx_under_raw :  1; /* 0: 0, Set if the processor attempts to read the receive buffer when it is empty byreading from the IC_DATA_CMD register. If the module is disabled(IC_ENABLE[0]=0), this bit keeps its level until the master or slave statemachines go into idle, and when ic_en goes to 0, this interrupt is cleared.Reset value: 0x0*/
        uint32_t                    rx_over_raw :  1; /* 1: 1, Set if the receive buffer is completely filled to IC_RX_BUFFER_DEPTH andan additional byte is received from an external I2C device. The DW_apb_i2cacknowledges this, but any data bytes received after the FIFO is full are lost. Ifthe module is disabled (IC_ENABLE[0]=0), this bit keeps its level until themaster or slave state machines go into idle, and when ic_en goes to 0, thisinterrupt is cleared.NOTE: If the configuration parameter IC_RX_FULL_HLD_BUS_EN is enabledand bit 9 of the IC_CON register (RX_FIFO_FULL_HLD_CTRL) isprogrammed to HIGH, then the RX_OVER interrupt never occurs, because theRx FIFO never overflows.Reset value: 0x0*/
        uint32_t                    rx_full_raw :  1; /* 2: 2, Set when the receive buffer reaches or goes above the RX_TL threshold in theIC_RX_TL register. It is automatically cleared by hardware when buffer levelgoes below the threshold. If the module is disabled (IC_ENABLE[0]=0), theRX FIFO is flushed and held in reset; therefore the RX FIFO is not full. So thisbit is cleared once IC_ENABLE[0] is set to 0, regardless of the activity thatcontinues.Reset value: 0x0*/
        uint32_t                    tx_over_raw :  1; /* 3: 3, Set during transmit if the transmit buffer is filled to IC_TX_BUFFER_DEPTHand the processor attempts to issue another I2C command by writing to theIC_DATA_CMD register. When the module is disabled, this bit keeps its leveluntil the master or slave state machines go into idle, and when ic_en goes to0, this interrupt is cleared.Reset value: 0x0*/
        uint32_t                   tx_empty_raw :  1; /* 4: 4, The behavior of the TX_EMPTY interrupt status differs based on theTX_EMPTY_CTRL selection in the IC_CON register.← When TX_EMPTY_CTRL = 0:This bit is set to 1 when the transmit buffer is at or below the thresholdvalue set in the IC_TX_TL register.← When TX_EMPTY_CTRL = 1:This bit is set to 1 when the transmit buffer is at or below the thresholdvalue set in the IC_TX_TL register and the transmission of theaddress/data from the internal shift register for the most recently poppedcommand is completed.It is automatically cleared by hardware when the buffer level goes above thethreshold. When IC_ENABLE[0] is set to 0, the TX FIFO is flushed and held inreset. There the TX FIFO looks like it has no data within it, so this bit is setto 1, provided there is activity in the master or slave state machines. Whenthere is no longer any activity, then with ic_en=0, this bit is set to 0.Reset value: 0x0*/
        uint32_t                     rd_req_raw :  1; /* 5: 5, This bit is set to 1 when DW_apb_i2c is acting as a slave and another I2Cmaster is attempting to read data from DW_apb_i2c. The DW_apb_i2c holdsthe I2C bus in a wait state (SCL=0) until this interrupt is serviced, which meansthat the slave has been addressed by a remote master that is asking for datato be transferred. The processor must respond to this interrupt and then writethe requested data to the IC_DATA_CMD register. This bit is set to 0 just afterthe processor reads the IC_CLR_RD_REQ register.Dependencies: This field is not applicable in Ultra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                    tx_abrt_raw :  1; /* 6: 6, This bit indicates if DW_apb_i2c, as an I2C transmitter, is unable to completethe intended actions on the contents of the transmit FIFO. This situation canoccur both as an I2C master or an I2C slave, and is referred to as a ※transmitabort§.When this bit is set to 1, the IC_TX_ABRT_SOURCE register indicates thereason why the transmit abort takes places.NOTE: The DW_apb_i2c flushes/resets/empties only the TX_FIFO wheneverthere is a transmit abort caused by any of the events tracked by theIC_TX_ABRT_SOURCE register. The Tx FIFO remains in this flushed stateuntil the register IC_CLR_TX_ABRT is read. Once this read is performed, theTx FIFO is then ready to accept more data bytes from the APB interface. RXFIFO is flushed because of TX_ABRT is controlled by the coreConsultantparameter IC_AVOID_RX_FIFO_FLUSH_ON_TX_ABRT.Reset value: 0x0*/
        uint32_t                    rx_done_raw :  1; /* 7: 7, When the DW_apb_i2c is acting as a slave-transmitter, this bit is set to 1 if themaster does not acknowledge a transmitted byte. This occurs on the last byteof the transmission, indicating that the transmission is done.Dependencies: This field is not applicable in Ultra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                   activity_raw :  1; /* 8: 8, This bit captures DW_apb_i2c activity and stays set until it is cleared. Thereare four ways to clear it:← Disabling the DW_apb_i2c← Reading the IC_CLR_ACTIVITY register← Reading the IC_CLR_INTR register← System resetOnce this bit is set, it stays set unless one of the four methods is used to clearit. Even if the DW_apb_i2c module is idle, this bit remains set until cleared,indicating that there was activity on the bus.Reset value: 0x0*/
        uint32_t                   stop_det_raw :  1; /* 9: 9, Indicates whether a STOP condition has occurred on the I2C interfaceregardless of whether DW_apb_i2c is operating in slave or master mode.In Slave Mode:← If IC_CON[7]=1'b1 (STOP_DET_IFADDRESSED), the STOP_DETinterrupt is generated only if the slave is addressed.Note: During a general call address, this slave does not issue aSTOP_DET interrupt if STOP_DET_IF_ADDRESSED=1'b1, even if theslave responds to the general call address by generating ACK. TheSTOP_DET interrupt is generated only when the transmitted addressmatches the slave address (SAR).← If IC_CON[7]=1'b0 (STOP_DET_IFADDRESSED), the STOP_DETinterrupt is issued irrespective of whether it is being addressed.In Master Mode:← If IC_CON[10]=1＊b1 (STOP_DET_IF_MASTER_ACTIVE), the STOP_DETinterrupt is issued only if the master is active.← If IC_CON[10]=1＊b0 (STOP_DET_IFADDRESSED), the STOP_DETinterrupt is issued irrespective of whether the master is active.Reset value: 0x0*/
        uint32_t                  start_det_raw :  1; /*10:10, Indicates whether a START or RESTART condition has occurred on the I2Cinterface regardless of whether DW_apb_i2c is operating in slave or mastermode.Reset value: 0x0*/
        uint32_t                   gen_call_raw :  1; /*11:11, Set only when a General Call address is received and it is acknowledged. Itstays set until it is cleared either by disabling DW_apb_i2c or when the CPUreads bit 0 of the IC_CLR_GEN_CALL register. DW_apb_i2c stores thereceived data in the Rx buffer.Reset value: 0x0*/
        uint32_t                restart_det_raw :  1; /*12:12, Indicates whether a RESTART condition has occurred on the I2C interfacewhen DW_apb_i2c is operating in slave mode and the slave is the addressedslave.Enabled only when IC_SLV_RESTART_DET_EN = 1NOTE: However, in high-speed mode or during a START BYTE transfer, theRESTART comes before the address field as per the I2C protocol. In this case,the slave is not the addressed slave when the RESTART is issued, thereforeDW_apb_i2c does not generate the RESTART_DET interrupt.Reset value: 0x0*/
        uint32_t                mst_on_hold_raw :  1; /*13:13, Indicates whether a master is holding the bus and the Tx FIFO is empty.Enabled only when I2C_DYNAMIC_TAR_UPDATE = 1 andIC_EMPTYFIFO_HOLD_MASTER_EN = 1Reset value: 0X0*/
        uint32_t           scl_stuck_at_low_raw :  1; /*14:14, Indicates whether the SCL Line is stuck at low for theIC_SCL_STUCK_LOW_TIMOUT number of ic_clk periods.Enabled only when IC_BUS_CLEAR_FEATURE = 1Dependencies: This field is not applicable in Ultra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset Value: 0x0*/
        uint32_t                     reserved_0 : 17; /*31:15,                             NA*/
    } bit_field;
} T_I2C1_IC_RAW_INTR_STAT;

//ic_rx_tl
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rx_tl :  8; /* 7: 0, Receive FIFO Threshold LevelControls the level of entries (or above) that triggers the RX_FULL interrupt (bit 2 inIC_RAW_INTR_STAT register). The valid range is 0-255, with the additionalrestriction that hardware does not allow this value to be set to a value larger thanthe depth of the buffer. If an attempt is made to do that, the actual value set will bethe maximum depth of the buffer.A value of 0 sets the threshold for 1 entry, and a value of 255 sets the threshold for256 entries.Reset value: IC_RX_TL configuration parameter*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C1_IC_RX_TL;

//ic_tx_tl
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          tx_tl :  8; /* 7: 0, Transmit FIFO Threshold LevelControls the level of entries (or below) that trigger the TX_EMPTY interrupt (bit 4 inIC_RAW_INTR_STAT register). The valid range is 0-255, with the additionalrestriction that it may not be set to value larger than the depth of the buffer. If anattempt is made to do that, the actual value set will be the maximum depth of thebuffer.A value of 0 sets the threshold for 0 entries, and a value of 255 sets the threshold for255 entries.Reset value: IC_TX_TL configuration parameter*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C1_IC_TX_TL;

//ic_clr_intr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       clr_intr :  1; /* 0: 0, Read this register to clear the combined interrupt, all individual interrupts, and theIC_TX_ABRT_SOURCE register. This bit does not clear hardware clearableinterrupts but software clearable interrupts. Refer to Bit 9 of theIC_TX_ABRT_SOURCE register for an exception to clearingIC_TX_ABRT_SOURCE.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_INTR;

//ic_clr_rx_under
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_rx_under :  1; /* 0: 0, Read this register to clear the RX_UNDER interrupt (bit 0) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_RX_UNDER;

//ic_clr_rx_over
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_rx_over :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_RX_OVER;

//ic_clr_tx_over
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_tx_over :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_TX_OVER;

//ic_clr_rd_req
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     clr_rd_req :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_RD_REQ;

//ic_clr_tx_abrt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_tx_abrt :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_TX_ABRT;

//ic_clr_rx_done
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_rx_done :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_RX_DONE;

//ic_clr_activity
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_activity :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_ACTIVITY;

//ic_clr_stop_det
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_stop_det :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_STOP_DET;

//ic_clr_start_det
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  clr_start_det :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_START_DET;

//ic_clr_gen_call
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_gen_call :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of theIC_RAW_INTR_STAT register.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_GEN_CALL;

//ic_enable
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         enable :  1; /* 0: 0, Controls whether the DW_apb_i2c is enabled.← 0: Disables DW_apb_i2c (TX and RX FIFOs are held in an erased state)← 1: Enables DW_apb_i2cSoftware can disable DW_apb_i2c while it is active. However, it is importantthat care be taken to ensure that DW_apb_i2c is disabled properly. Arecommended procedure is described in ※Disabling DW_apb_i2c§ on page 62.When DW_apb_i2c is disabled, the following occurs:← The TX FIFO and RX FIFO get flushed.← Status bits in the IC_INTR_STAT register are still active until DW_apb_i2cgoes into IDLE state.If the module is transmitting, it stops as well as deletes the contents of thetransmit buffer after the current transfer is complete. If the module is receiving,the DW_apb_i2c stops the current transfer at the end of the current byte anddoes not acknowledge the transfer.In systems with asynchronous pclk and ic_clk when IC_CLK_TYPEparameter set to asynchronous (1), there is a two ic_clk delay when enablingor disabling the DW_apb_i2c.For a detailed description on how to disable DW_apb_i2c, refer to ※DisablingDW_apb_i2c§ on page 62.Reset value: 0x0*/
        uint32_t                          abort :  1; /* 1: 1, When set, the controller initiates the transfer abort.← 0: ABORT not initiated or ABORT done← 1: ABORT operation in progressThe software can abort the I2C transfer in master mode by setting this bit. Thesoftware can set this bit only when ENABLE is already set; otherwise, thecontroller ignores any write to ABORT bit. The software cannot clear theABORT bit once set. In response to an ABORT, the controller issues a STOPand flushes the Tx FIFO after completing the current transfer, then sets theTX_ABORT interrupt after the abort operation. The ABORT bit is clearedautomatically after the abort operation.For a detailed description on how to abort I2C transfers, refer to ※Aborting I2CTransfers§ on page 63.Reset value: 0x0*/
        uint32_t                     reserved_0 : 30; /*31: 2,                             NA*/
    } bit_field;
} T_I2C1_IC_ENABLE;

//ic_status
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       activity :  1; /* 0: 0, I2C Activity Status.Reset value: 0x0*/
        uint32_t                           tfnf :  1; /* 1: 1, Transmit FIFO Not Full. Set when the transmit FIFO contains one ormore empty locations, and is cleared when the FIFO is full.← 0: Transmit FIFO is full← 1: Transmit FIFO is not fullReset value: 0x1*/
        uint32_t                            tfe :  1; /* 2: 2, Transmit FIFO Completely Empty. When the transmit FIFO iscompletely empty, this bit is set. When it contains one or more validentries, this bit is cleared. This bit field does not request aninterrupt.← 0: Transmit FIFO is not empty← 1: Transmit FIFO is emptyReset value: 0x1*/
        uint32_t                           rfne :  1; /* 3: 3, Receive FIFO Not Empty. This bit is set when the receive FIFOcontains one or more entries; it is cleared when the receive FIFO isempty.← 0: Receive FIFO is empty← 1: Receive FIFO is not emptyReset value: 0x0*/
        uint32_t                            rff :  1; /* 4: 4, Receive FIFO Completely Full. When the receive FIFO iscompletely full, this bit is set. When the receive FIFO contains oneor more empty location, this bit is cleared.← 0: Receive FIFO is not full← 1: Receive FIFO is fullReset value: 0x0*/
        uint32_t                   mst_activity :  1; /* 5: 5, Master FSM Activity Status. When the Master Finite State Machine(FSM) is not in the IDLE state, this bit is set.← 0: Master FSM is in IDLE state so the Master part ofDW_apb_i2c is not Active← 1: Master FSM is not in IDLE state so the Master part ofDW_apb_i2c is ActiveNOTE: IC_STATUS[0]〞that is, ACTIVITY bit〞is the OR ofSLV_ACTIVITY and MST_ACTIVITY bits.Reset value: 0x0*/
        uint32_t                   slv_activity :  1; /* 6: 6, Slave FSM Activity Status. When the Slave Finite State Machine(FSM) is not in the IDLE state, this bit is set.← 0: Slave FSM is in IDLE state so the Slave part of DW_apb_i2cis not Active← 1: Slave FSM is not in IDLE state so the Slave part ofDW_apb_i2c is ActiveReset value: 0x0*/
        uint32_t         mst_hold_tx_fifo_empty :  1; /* 7: 7, If the IC_EMPTYFIFO_HOLD_MASTER_EN parameter is set to 1,the DW_apb_i2c master stalls the write transfer when Tx FIFO isempty, and the the last byte does not have the Stop bit set.This bit indicates the BUS hold when the master holds the busbecause of the Tx FIFO being empty, and the the previoustransferred command does not have the Stop bit set. (This kind ofBus hold is applicable if IC_EMPTYFIFO_HOLD_MASTER_EN isset to 1).Reset value: 0x0Dependencies: This Register bit value is applicable only whenIC_STAT_FOR_CLK_STRETCH=1*/
        uint32_t          mst_hold_rx_fifo_full :  1; /* 8: 8, This bit indicates the BUS Hold in Master mode due to Rx FIFO isFull and additional byte has been received (This kind of Bus hold isapplicable if IC_RX_FULL_HLD_BUS_EN is set to 1).Reset value: 0x0Dependencies: This Register bit value is applicable only whenIC_STAT_FOR_CLK_STRETCH=1*/
        uint32_t         slv_hold_tx_fifo_empty :  1; /* 9: 9, This bit indicates the BUS Hold in Slave mode for the Read requestwhen the Tx FIFO is empty. The Bus is in hold until the Tx FIFO hasdata to Transmit for the read request.Reset value: 0x0Dependencies: This Register bit value is applicable only whenIC_STAT_FOR_CLK_STRETCH=1.*/
        uint32_t          slv_hold_rx_fifo_full :  1; /*10:10, This bit indicates the BUS Hold in Slave mode due to the Rx FIFObeing Full and an additional byte being received (this kind of Bushold is applicable if IC_RX_FULL_HLD_BUS_EN is set to 1).Reset value: 0x0Dependencies: This Register bit value is applicable only whenIC_STAT_FOR_CLK_STRETCH=1.*/
        uint32_t        sda_stuck_not_recovered :  1; /*11:11, This bit indicates that an SDA stuck at low is not recovered after therecovery mechanism.This bit is enabled only when IC_BUS_CLEAR_FEATURE = 1.Reset Value: 0x0*/
        uint32_t                     reserved_1 :  4; /*15:12,                             NA*/
        uint32_t            smbus_quick_cmd_bit :  1; /*16:16, This bit indicates the R/W bit of the Quick command received. Thisbit will be cleared after the user has read this bit.Dependencies: Enabled only when IC_SMBUS=1 is set to 1.Reset Value: 0x0*/
        uint32_t         smbus_slave_addr_valid :  1; /*17:17, This bit indicates whether the SMBus Slave address (ic_sar[6:0]) isvalid or not.Dependencies: Enabled only when IC_SMBUS_ARP=1 is set to 1.Reset Value: 0x0*/
        uint32_t      smbus_slave_addr_resolved :  1; /*18:18, This bit indicates whether the SMBus Slave address (ic_sar[6:0]) isResolved by ARP Master.Dependencies: Enabled only when IC_SMBUS_ARP=1 is set to 1.Reset Value: 0x0*/
        uint32_t           smbus_suspend_status :  1; /*19:19, This bit indicates whether the status of the input signal isic_smbus_sus_in_n. This signal is asserted when the SMBusSuspend signal is asserted by the SMBus Host.Dependencies: Enabled only whenIC_SMBUS_SUSPEND_ALERT=1 is set to 1.Reset Value: 0x0*/
        uint32_t             smbus_alert_status :  1; /*20:20, This bit indicates whether the status of the input signal isic_smbus_alert_in_n. This signal is asserted when the SMBus Alertsignal is asserted by the SMBus Device.Dependencies: Enabled only whenIC_SMBUS_SUSPEND_ALERT=1 is set to 1.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 11; /*31:21,                             NA*/
    } bit_field;
} T_I2C1_IC_STATUS;

//ic_txflr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txflr :  5; /* 4: 0, Transmit FIFO Level. Contains the number of valid data entries in thetransmit FIFO.Reset value: 0x0*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_I2C1_IC_TXFLR;

//ic_rxflr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rxflr :  5; /* 4: 0, Receive FIFO Level. Contains the number of valid data entries in thereceive FIFO.Reset value: 0x0*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_I2C1_IC_RXFLR;

//ic_sda_hold
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 ic_sda_tx_hold : 16; /*15: 0, Sets the required SDA hold time in units of ic_clk period, whenDW_apb_i2c acts as a transmitter.Reset value: IC_DEFAULT_SDA_HOLD*/
        uint32_t                 ic_sda_rx_hold :  8; /*23:16, Sets the required SDA hold time in units of ic_clk period, whenDW_apb_i2c acts as a reciever.Reset value: IC_DEFAULT_SDA_HOLD*/
        uint32_t                     reserved_0 :  8; /*31:24,                             NA*/
    } bit_field;
} T_I2C1_IC_SDA_HOLD;

//ic_tx_abrt_source
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t              abrt_7baddr_noack :  1; /* 0: 0, ← 1: Master is in 7-bit addressing mode andthe address sent was not acknowledged byany slave.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t             abrt_10addr1_noack :  1; /* 1: 1, ← 1: Master is in 10-bit address mode and thefirst 10-bit address byte was notacknowledged by any slave.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t             abrt_10addr2_noack :  1; /* 2: 2, ← 1: Master is in 10-bit address mode and thesecond address byte of the 10-bit addresswas not acknowledged by any slave.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t              abrt_txdata_noack :  1; /* 3: 3, ← 1: This is a master-mode only bit. Masterhas received an acknowledgement for theaddress, but when it sent data byte(s)following the address, it did not receive anacknowledge from the remote slave(s).Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t               abrt_gcall_noack :  1; /* 4: 4, ← 1: DW_apb_i2c in master mode sent aGeneral Call and no slave on the busacknowledged the General Call.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                abrt_gcall_read :  1; /* 5: 5, ← 1: DW_apb_i2c in master mode sent aGeneral Call but the user programmed thebyte following the General Call to be a readfrom the bus (IC_DATA_CMD[9] is set to 1).Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                 abrt_hs_ackdet :  1; /* 6: 6, ← 1: Master is in High Speed mode and theHigh Speed Master code wasacknowledged (wrong behavior).Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t              abrt_sbyte_ackdet :  1; /* 7: 7, ← 1: Master has sent a START Byte and theSTART Byte was acknowledged (wrongbehavior).Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                abrt_hs_norstrt :  1; /* 8: 8, ← 1: The restart is disabled(IC_RESTART_EN bit (IC_CON[5]) = 0)and the user is trying to use the master totransfer data in High Speed mode.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t             abrt_sbyte_norstrt :  1; /* 9: 9,  To clear Bit 9, the source of theABRT_SBYTE_NORSTRT must be fixed first;restart must be enabled (IC_CON[5]=1), theSPECIAL bit must be cleared (IC_TAR[11]), orthe GC_OR_START bit must be cleared(IC_TAR[10]). Once the source of theABRT_SBYTE_NORSTRT is fixed, then thisbit can be cleared in the same manner asother bits in this register. If the source of theABRT_SBYTE_NORSTRT is not fixed beforeattempting to clear this bit, bit 9 clears for onecycle and then gets re-asserted.1: The restart is disabled (IC_RESTART_ENbit (IC_CON[5]) = 0) and the user is trying tosend a START Byte.Reset value: 0x0*/
        uint32_t            abrt_10b_rd_norstrt :  1; /*10:10, ← 1: The restart is disabled(IC_RESTART_EN bit (IC_CON[5]) = 0)and the master sends a read command in10-bit addressing mode.Dependencies: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1).Reset value: 0x0*/
        uint32_t                abrt_master_dis :  1; /*11:11, ← 1: User tries to initiate a Master operationwith the Master mode disabled.Reset value: 0x0*/
        uint32_t                       arb_lost :  1; /*12:12, ← 1: Master has lost arbitration, or ifIC_TX_ABRT_SOURCE[14] is also set,then the slave transmitter has lostarbitration.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t           abrt_slvflush_txfifo :  1; /*13:13, ← 1: Slave has received a read command andsome data exists in the TX FIFO so theslave issues a TX_ABRT interrupt to flushold data in TX FIFO.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t               abrt_slv_arblost :  1; /*14:14, ← 1: Slave lost the bus while transmitting datato a remote master.IC_TX_ABRT_SOURCE[12] is set at thesame time.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)NOTE: Even though the slave never ※owns§ thebus, something could go wrong on the bus.This is a fail safe check. For instance, during adata transmission at the low-to-high transitionof SCL, if what is on the data bus is not what issupposed to be transmitted, then DW_apb_i2cno longer own the bus.Dependency:Reset value: 0x0*/
        uint32_t                abrt_slvrd_intx :  1; /*15:15, 1: When the processor side responds to aslave mode request for data to be transmittedto a remote master and user writes a 1 in CMD(bit 8) of IC_DATA_CMD register.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t                 abrt_user_abrt :  1; /*16:16, This is a master-mode-only bit. Master hasdetected the transfer abort (IC_ENABLE[1]).Reset value: 0x0*/
        uint32_t          abrt_sda_stuck_at_low :  1; /*17:17, This is a master-mode-only bit. Master detectsthe SDA is Stuck at low for theIC_SDA_STUCK_AT_LOW_TIMEOUT valueof ic_clks.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t              abrt_device_noack :  1; /*18:18, This is a master-mode-only bit. Master initiatesthe DEVICE_ID transfer and the device ID sentis not acknowledged by any slave.Dependency: This field is not applicable inUltra-Fast speed mode(IC_ULTRA_FAST_MODE=1)Reset value: 0x0*/
        uint32_t      abrt_device_slvaddr_noack :  1; /*19:19, This is a master-mode-only bit. Master isinitiating the DEVICE_ID transfer and the slaveaddress sent was not acknowledged by anyslave.Reset value: 0x0*/
        uint32_t              abrt_device_write :  1; /*20:20, This is a master-mode-only bit. Master isinitiating the DEVICE_ID transfer and the TxFIFO consists of write commands.Reset Value: 0x0*/
        uint32_t                     reserved_0 :  2; /*22:21,                             NA*/
        uint32_t                   tx_flush_cnt :  9; /*31:23, This field indicates the number of Tx FIFO datacommands that are flushed due to TX_ABRTinterrupt. It is cleared whenever I2C isdisabled.Reset value: 0x0*/
    } bit_field;
} T_I2C1_IC_TX_ABRT_SOURCE;

//ic_slv_data_nack_only
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           nack :  1; /* 0: 0,  Generate NACK. This NACK generation only occurs when DW_apb_i2c is a slavereceiver. If this register is set to a value of 1, it can only generate a NACK after adata byte is received; hence, the data transfer is aborted and the data received isnot pushed to the receive buffer.When the register is set to a value of 0, it generates NACK/ACK, depending onnormal criteria.← 1 = generate NACK after data byte received← 0 = generate NACK/ACK normallyReset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_SLV_DATA_NACK_ONLY;

//ic_dma_cr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rdmae :  1; /* 0: 0, Receive DMA Enable. This bit enables/disables the receive FIFO DMA channel.← 0 = Receive DMA disabled← 1 = Receive DMA enabledReset value: 0x0*/
        uint32_t                          tdmae :  1; /* 1: 1, Transmit DMA Enable. This bit enables/disables the transmit FIFO DMA channel.← 0 = Transmit DMA disabled← 1 = Transmit DMA enabledReset value: 0x0*/
        uint32_t                     reserved_0 : 30; /*31: 2,                             NA*/
    } bit_field;
} T_I2C1_IC_DMA_CR;

//ic_dma_tdlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         dmatdl :  4; /* 3: 0, Transmit Data Level. This bit field controls the level at which a DMArequest is made by the transmit logic. It is equal to the watermark level;that is, the dma_tx_req signal is generated when the number of validdata entries in the transmit FIFO is equal to or below this field value,and TDMAE = 1.Reset value: 0x0*/
        uint32_t                     reserved_0 : 28; /*31: 4,                             NA*/
    } bit_field;
} T_I2C1_IC_DMA_TDLR;

//ic_dma_rdlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         dmardl :  4; /* 3: 0, Receive Data Level. This bit field controls the level at which a DMA requestis made by the receive logic. The watermark level = DMARDL+1; that is,dma_rx_req is generated when the number of valid data entries in thereceive FIFO is equal to or more than this field value + 1, and RDMAE = 1.For instance, when DMARDL is 0, then dma_rx_req is asserted when 1 ormore data entries are present in the receive FIFO.Reset value: 0x0*/
        uint32_t                     reserved_0 : 28; /*31: 4,                             NA*/
    } bit_field;
} T_I2C1_IC_DMA_RDLR;

//ic_sda_setup
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      sda_setup :  8; /* 7: 0, SDA Setup. It is recommended that if the required delay is 1000ns, then for anic_clk frequency of 10 MHz, IC_SDA_SETUP should be programmed to avalue of 11. IC_SDA_SETUP must be programmed with a minimum value of 2.Default Reset value: 0x64, but can be hardcoded by setting theIC_DEFAULT_SDA_SETUP configuration parameter.*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C1_IC_SDA_SETUP;

//ic_ack_general_call
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ack_gen_call :  1; /* 0: 0, ACK General Call. When set to 1, DW_apb_i2c responds with a ACK (byasserting ic_data_oe) when it receives a General Call. When set to 0, theDW_apb_i2c does not generate General Call interrupts.Default Reset value: 0x1, but can be hardcoded by setting theIC_DEFAULT_ACK_GENERAL_CALL configuration parameter.*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_ACK_GENERAL_CALL;

//ic_enable_status
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          ic_en :  1; /* 0: 0, ic_en Status. This bit always reflects the value driven on the outputport ic_en.← When read as 1, DW_apb_i2c is deemed to be in an enabledstate.← When read as 0, DW_apb_i2c is deemed completely inactive.NOTE: The CPU can safely read this bit anytime. When this bit isread as 0, the CPU can safely read SLV_RX_DATA_LOST (bit 2)and SLV_DISABLED_WHILE_BUSY (bit 1).Reset value: 0x0*/
        uint32_t        slv_disabled_while_busy :  1; /* 1: 1, Slave Disabled While Busy (Transmit, Receive). This bit indicates ifa potential or active Slave operation has been aborted due tosetting bit 0 of the IC_ENABLE register from 1 to 0. This bit is setwhen the CPU writes a 0 to bit 0 of IC_ENABLE while: (a)DW_apb_i2c is receiving the address byte of the Slave-Transmitteroperation from a remote master; OR, (b) address and data bytes ofthe Slave-Receiver operation from a remote master.When read as 1, DW_apb_i2c is deemed to have forced a NACKduring any part of an I2C transfer, irrespective of whether the I2Caddress matches the slave address set in DW_apb_i2c (IC_SARregister) OR if the transfer is completed before bit 0 of IC_ENABLEis set to 0, but has not taken effect.NOTE: If the remote I2C master terminates the transfer with aSTOP condition before the DW_apb_i2c has a chance to NACK atransfer, and bit 0 of IC_ENABLE has been set to 0, then this bitwill also be set to 1.When read as 0, DW_apb_i2c is deemed to have been disabledwhen there is master activity, or when the I2C bus is idle.NOTE: The CPU can safely read this bit when IC_EN (bit 0) is readas 0.Reset value: 0x0*/
        uint32_t               slv_rx_data_lost :  1; /* 2: 2, Slave Received Data Lost. This bit indicates if a Slave-Receiveroperation has been aborted with at least one data byte receivedfrom an I2C transfer due to setting IC_ENABLE[0] from 1 to 0.When read as 1, DW_apb_i2c is deemed to have been activelyengaged in an aborted I2C transfer (with matching address) andthe data phase of the I2C transfer has been entered, even though adata byte has been responded with a NACK.NOTE: If the remote I2C master terminates the transfer with aSTOP condition before the DW_apb_i2c has a chance to NACK atransfer, and IC_ENABLE[0] has been set to 0, then this bit is alsoset to 1.When read as 0, DW_apb_i2c is deemed to have been disabledwithout being actively involved in the data phase of a SlaveReceiver transfer.NOTE: The CPU can safely read this bit when IC_EN (bit 0) is readas 0.Reset value: 0x0*/
        uint32_t                     reserved_0 : 29; /*31: 3,                             NA*/
    } bit_field;
} T_I2C1_IC_ENABLE_STATUS;

//ic_fs_spklen
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      fs_spklen :  8; /* 7: 0, This register must be set before any I2C bus transaction can take place toensure stable operation. This register sets the duration, measured in ic_clkcycles, of the longest spike in the SCL or SDA lines that are filtered out bythe spike suppression logic; for more information, refer to ※SpikeSuppression§ on page 64.This register can be written only when the I2C interface is disabled, whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times haveno effect.The minimum valid value is 1; hardware prevents values less than thisbeing written, and if attempted, results in 1 being set.Reset value: IC_DEFAULT_FS_SPKLEN configuration parameter*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C1_IC_FS_SPKLEN;

//ic_hs_spklen
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      hs_spklen :  8; /* 7: 0, This register must be set before any I2C bus transaction can take place toensure stable operation. This register sets the duration, measured in ic_clkcycles, of the longest spike in the SCL or SDA lines that are filtered out bythe spike suppression logic; for more information, refer to ※SpikeSuppression§ on page 64.This register can be written only when the I2C interface is disabled, whichcorresponds to IC_ENABLE[0] being set to 0. Writes at other times haveno effect.The minimum valid value is 1; hardware prevents values less than thisbeing written, and if attempted, results in 1 being set.This register is implemented only if the component is configured to supportHS mode; that is, if the IC_MAX_SPEED_MODE parameter is set to 3.Reset value: IC_DEFAULT_HS_SPKLEN configuration parameter*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C1_IC_HS_SPKLEN;

//ic_clr_restart_det
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                clr_restart_det :  1; /* 0: 0, Read this register to clear the RESTART_DET interrupt (bit 12) ofthe IC_RAW_INTR_STAT register.Dependencies: This register is present only whenIC_SLV_RESTART_DET_EN = 1.Reset value: 0x0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C1_IC_CLR_RESTART_DET;

//ic_comp_param_1
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     reserved_0 : 32; /*31: 0,                             NA*/
    } bit_field;
} T_I2C1_IC_COMP_PARAM_1;

//ic_comp_version
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   comp_version : 32; /*31: 0,                             NA*/
    } bit_field;
} T_I2C1_IC_COMP_VERSION;

//ic_comp_type
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      comp_type : 32; /*31: 0,                             NA*/
    } bit_field;
} T_I2C1_IC_COMP_TYPE;

//Registers Mapping to the same address

typedef struct
{
    volatile                   T_I2C1_IC_CON                         ic_con; /*  0x0,    RW, 0x0000007F,                             NA*/
    volatile                   T_I2C1_IC_TAR                         ic_tar; /*  0x4,    RW, 0x00000055,                             NA*/
    volatile                   T_I2C1_IC_SAR                         ic_sar; /*  0x8,    RW, 0x00000055,                             NA*/
    volatile              T_I2C1_IC_HS_MADDR                    ic_hs_maddr; /*  0xc,    RW, 0x00000001,                             NA*/
    volatile              T_I2C1_IC_DATA_CMD                    ic_data_cmd; /* 0x10,    RW, 0x00000000,                             NA*/
    volatile           T_I2C1_IC_SS_SCL_HCNT                 ic_ss_scl_hcnt; /* 0x14,    RW, 0x00000190,                             NA*/
    volatile           T_I2C1_IC_SS_SCL_LCNT                 ic_ss_scl_lcnt; /* 0x18,    RW, 0x000001D6,                             NA*/
    volatile           T_I2C1_IC_FS_SCL_HCNT                 ic_fs_scl_hcnt; /* 0x1c,    RW, 0x0000003C,                             NA*/
    volatile           T_I2C1_IC_FS_SCL_LCNT                 ic_fs_scl_lcnt; /* 0x20,    RW, 0x00000082,                             NA*/
    volatile           T_I2C1_IC_HS_SCL_HCNT                 ic_hs_scl_hcnt; /* 0x24,    RW, 0x00000006,                             NA*/
    volatile           T_I2C1_IC_HS_SCL_LCNT                 ic_hs_scl_lcnt; /* 0x28,    RW, 0x00000010,                             NA*/
    volatile             T_I2C1_IC_INTR_STAT                   ic_intr_stat; /* 0x2c,    RO, 0x00000000,                             NA*/
    volatile             T_I2C1_IC_INTR_MASK                   ic_intr_mask; /* 0x30,    RW, 0x000008FF,                             NA*/
    volatile         T_I2C1_IC_RAW_INTR_STAT               ic_raw_intr_stat; /* 0x34,    RO, 0x00000000,                             NA*/
    volatile                 T_I2C1_IC_RX_TL                       ic_rx_tl; /* 0x38,    RW, 0x00000000,                             NA*/
    volatile                 T_I2C1_IC_TX_TL                       ic_tx_tl; /* 0x3c,    RW, 0x00000000,                             NA*/
    volatile              T_I2C1_IC_CLR_INTR                    ic_clr_intr; /* 0x40,    RO, 0x00000000,                             NA*/
    volatile          T_I2C1_IC_CLR_RX_UNDER                ic_clr_rx_under; /* 0x44,    RO, 0x00000000,                             NA*/
    volatile           T_I2C1_IC_CLR_RX_OVER                 ic_clr_rx_over; /* 0x48,    RO, 0x00000000,                             NA*/
    volatile           T_I2C1_IC_CLR_TX_OVER                 ic_clr_tx_over; /* 0x4c,    RO, 0x00000000,                             NA*/
    volatile            T_I2C1_IC_CLR_RD_REQ                  ic_clr_rd_req; /* 0x50,    RO, 0x00000000,                             NA*/
    volatile           T_I2C1_IC_CLR_TX_ABRT                 ic_clr_tx_abrt; /* 0x54,    RO, 0x00000000,                             NA*/
    volatile           T_I2C1_IC_CLR_RX_DONE                 ic_clr_rx_done; /* 0x58,    RO, 0x00000000,                             NA*/
    volatile          T_I2C1_IC_CLR_ACTIVITY                ic_clr_activity; /* 0x5c,    RO, 0x00000000,                             NA*/
    volatile          T_I2C1_IC_CLR_STOP_DET                ic_clr_stop_det; /* 0x60,    RO, 0x00000000,                             NA*/
    volatile         T_I2C1_IC_CLR_START_DET               ic_clr_start_det; /* 0x64,    RO, 0x00000000,                             NA*/
    volatile          T_I2C1_IC_CLR_GEN_CALL                ic_clr_gen_call; /* 0x68,    RO, 0x00000000,                             NA*/
    volatile                T_I2C1_IC_ENABLE                      ic_enable; /* 0x6c,    RW, 0x00000000,                             NA*/
    volatile                T_I2C1_IC_STATUS                      ic_status; /* 0x70,    RO, 0x00000006,                             NA*/
    volatile                 T_I2C1_IC_TXFLR                       ic_txflr; /* 0x74,    RO, 0x00000000,                             NA*/
    volatile                 T_I2C1_IC_RXFLR                       ic_rxflr; /* 0x78,    RO, 0x00000000,                             NA*/
    volatile              T_I2C1_IC_SDA_HOLD                    ic_sda_hold; /* 0x7c,    RW, 0x00000001,                             NA*/
    volatile        T_I2C1_IC_TX_ABRT_SOURCE              ic_tx_abrt_source; /* 0x80,    RO, 0x00000000,                             NA*/
    volatile    T_I2C1_IC_SLV_DATA_NACK_ONLY          ic_slv_data_nack_only; /* 0x84,    RW, 0x00000000,                             NA*/
    volatile                T_I2C1_IC_DMA_CR                      ic_dma_cr; /* 0x88,    RW, 0x00000000,                             NA*/
    volatile              T_I2C1_IC_DMA_TDLR                    ic_dma_tdlr; /* 0x8c,    RW, 0x00000000,                             NA*/
    volatile              T_I2C1_IC_DMA_RDLR                    ic_dma_rdlr; /* 0x90,    RW, 0x00000000,                             NA*/
    volatile             T_I2C1_IC_SDA_SETUP                   ic_sda_setup; /* 0x94,    RW, 0x00000064,                             NA*/
    volatile      T_I2C1_IC_ACK_GENERAL_CALL            ic_ack_general_call; /* 0x98,    RW, 0x00000001,                             NA*/
    volatile         T_I2C1_IC_ENABLE_STATUS               ic_enable_status; /* 0x9c,    RO, 0x00000000,                             NA*/
    volatile             T_I2C1_IC_FS_SPKLEN                   ic_fs_spklen; /* 0xa0,    RW, 0x00000005,                             NA*/
    volatile             T_I2C1_IC_HS_SPKLEN                   ic_hs_spklen; /* 0xa4,    RW, 0x00000001,                             NA*/
    volatile       T_I2C1_IC_CLR_RESTART_DET             ic_clr_restart_det; /* 0xa8,    RO, 0x00000000,                             NA*/
    volatile                        uint32_t                 reserved_0[18];
    volatile          T_I2C1_IC_COMP_PARAM_1                ic_comp_param_1; /* 0xf4,    RO, 0x00000000,                             NA*/
    volatile          T_I2C1_IC_COMP_VERSION                ic_comp_version; /* 0xf8,    RO, 0x3230302A,                             NA*/
    volatile             T_I2C1_IC_COMP_TYPE                   ic_comp_type; /* 0xfc,    RO, 0x44570140,                             NA*/
} T_HWP_I2C1_T;

#define hwp_i2c1 ((T_HWP_I2C1_T*)REG_I2C1_BASE)


__STATIC_INLINE uint32_t i2c1_ic_con_get(void)
{
    return hwp_i2c1->ic_con.val;
}

__STATIC_INLINE void i2c1_ic_con_set(uint32_t value)
{
    hwp_i2c1->ic_con.val = value;
}

__STATIC_INLINE void i2c1_ic_con_pack(uint8_t rx_fifo_full_hld_ctrl, uint8_t tx_empty_ctrl, uint8_t stop_det_ifaddressed, uint8_t ic_slave_disable, uint8_t ic_restart_en, uint8_t ic_10bitaddr_master, uint8_t ic_10bitaddr_slave, uint8_t speed, uint8_t master_mode)
{
    hwp_i2c1->ic_con.val = (((uint32_t)rx_fifo_full_hld_ctrl << 9) | ((uint32_t)tx_empty_ctrl << 8) | ((uint32_t)stop_det_ifaddressed << 7) | ((uint32_t)ic_slave_disable << 6) | ((uint32_t)ic_restart_en << 5) | ((uint32_t)ic_10bitaddr_master << 4) | ((uint32_t)ic_10bitaddr_slave << 3) | ((uint32_t)speed << 1) | ((uint32_t)master_mode << 0));
}

__STATIC_INLINE void i2c1_ic_con_unpack(uint8_t* rx_fifo_full_hld_ctrl, uint8_t* tx_empty_ctrl, uint8_t* stop_det_ifaddressed, uint8_t* ic_slave_disable, uint8_t* ic_restart_en, uint8_t* ic_10bitaddr_master, uint8_t* ic_10bitaddr_slave, uint8_t* speed, uint8_t* master_mode)
{
    T_I2C1_IC_CON localVal = hwp_i2c1->ic_con;

    *rx_fifo_full_hld_ctrl = localVal.bit_field.rx_fifo_full_hld_ctrl;
    *tx_empty_ctrl = localVal.bit_field.tx_empty_ctrl;
    *stop_det_ifaddressed = localVal.bit_field.stop_det_ifaddressed;
    *ic_slave_disable = localVal.bit_field.ic_slave_disable;
    *ic_restart_en = localVal.bit_field.ic_restart_en;
    *ic_10bitaddr_master = localVal.bit_field.ic_10bitaddr_master;
    *ic_10bitaddr_slave = localVal.bit_field.ic_10bitaddr_slave;
    *speed = localVal.bit_field.speed;
    *master_mode = localVal.bit_field.master_mode;
}

__STATIC_INLINE uint8_t i2c1_rx_fifo_full_hld_ctrl_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.rx_fifo_full_hld_ctrl;
}

__STATIC_INLINE void i2c1_rx_fifo_full_hld_ctrl_setf(uint8_t rx_fifo_full_hld_ctrl)
{
    hwp_i2c1->ic_con.bit_field.rx_fifo_full_hld_ctrl = rx_fifo_full_hld_ctrl;
}

__STATIC_INLINE uint8_t i2c1_tx_empty_ctrl_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.tx_empty_ctrl;
}

__STATIC_INLINE void i2c1_tx_empty_ctrl_setf(uint8_t tx_empty_ctrl)
{
    hwp_i2c1->ic_con.bit_field.tx_empty_ctrl = tx_empty_ctrl;
}

__STATIC_INLINE uint8_t i2c1_stop_det_ifaddressed_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.stop_det_ifaddressed;
}

__STATIC_INLINE void i2c1_stop_det_ifaddressed_setf(uint8_t stop_det_ifaddressed)
{
    hwp_i2c1->ic_con.bit_field.stop_det_ifaddressed = stop_det_ifaddressed;
}

__STATIC_INLINE uint8_t i2c1_ic_slave_disable_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.ic_slave_disable;
}

__STATIC_INLINE void i2c1_ic_slave_disable_setf(uint8_t ic_slave_disable)
{
    hwp_i2c1->ic_con.bit_field.ic_slave_disable = ic_slave_disable;
}

__STATIC_INLINE uint8_t i2c1_ic_restart_en_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.ic_restart_en;
}

__STATIC_INLINE void i2c1_ic_restart_en_setf(uint8_t ic_restart_en)
{
    hwp_i2c1->ic_con.bit_field.ic_restart_en = ic_restart_en;
}

__STATIC_INLINE uint8_t i2c1_ic_10bitaddr_master_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.ic_10bitaddr_master;
}

__STATIC_INLINE void i2c1_ic_10bitaddr_master_setf(uint8_t ic_10bitaddr_master)
{
    hwp_i2c1->ic_con.bit_field.ic_10bitaddr_master = ic_10bitaddr_master;
}

__STATIC_INLINE uint8_t i2c1_ic_10bitaddr_slave_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.ic_10bitaddr_slave;
}

__STATIC_INLINE void i2c1_ic_10bitaddr_slave_setf(uint8_t ic_10bitaddr_slave)
{
    hwp_i2c1->ic_con.bit_field.ic_10bitaddr_slave = ic_10bitaddr_slave;
}

__STATIC_INLINE uint8_t i2c1_speed_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.speed;
}

__STATIC_INLINE void i2c1_speed_setf(uint8_t speed)
{
    hwp_i2c1->ic_con.bit_field.speed = speed;
}

__STATIC_INLINE uint8_t i2c1_master_mode_getf(void)
{
    return hwp_i2c1->ic_con.bit_field.master_mode;
}

__STATIC_INLINE void i2c1_master_mode_setf(uint8_t master_mode)
{
    hwp_i2c1->ic_con.bit_field.master_mode = master_mode;
}

__STATIC_INLINE uint32_t i2c1_ic_tar_get(void)
{
    return hwp_i2c1->ic_tar.val;
}

__STATIC_INLINE void i2c1_ic_tar_set(uint32_t value)
{
    hwp_i2c1->ic_tar.val = value;
}

__STATIC_INLINE void i2c1_ic_tar_pack(uint8_t special, uint8_t gc_or_start, uint16_t tar)
{
    hwp_i2c1->ic_tar.val = (((uint32_t)special << 11) | ((uint32_t)gc_or_start << 10) | ((uint32_t)tar << 0));
}

__STATIC_INLINE void i2c1_ic_tar_unpack(uint8_t* special, uint8_t* gc_or_start, uint16_t* tar)
{
    T_I2C1_IC_TAR localVal = hwp_i2c1->ic_tar;

    *special = localVal.bit_field.special;
    *gc_or_start = localVal.bit_field.gc_or_start;
    *tar = localVal.bit_field.tar;
}

__STATIC_INLINE uint8_t i2c1_special_getf(void)
{
    return hwp_i2c1->ic_tar.bit_field.special;
}

__STATIC_INLINE void i2c1_special_setf(uint8_t special)
{
    hwp_i2c1->ic_tar.bit_field.special = special;
}

__STATIC_INLINE uint8_t i2c1_gc_or_start_getf(void)
{
    return hwp_i2c1->ic_tar.bit_field.gc_or_start;
}

__STATIC_INLINE void i2c1_gc_or_start_setf(uint8_t gc_or_start)
{
    hwp_i2c1->ic_tar.bit_field.gc_or_start = gc_or_start;
}

__STATIC_INLINE uint16_t i2c1_tar_getf(void)
{
    return hwp_i2c1->ic_tar.bit_field.tar;
}

__STATIC_INLINE void i2c1_tar_setf(uint16_t tar)
{
    hwp_i2c1->ic_tar.bit_field.tar = tar;
}

__STATIC_INLINE uint32_t i2c1_ic_sar_get(void)
{
    return hwp_i2c1->ic_sar.val;
}

__STATIC_INLINE void i2c1_ic_sar_set(uint32_t value)
{
    hwp_i2c1->ic_sar.val = value;
}

__STATIC_INLINE void i2c1_ic_sar_pack(uint16_t sar)
{
    hwp_i2c1->ic_sar.val = (((uint32_t)sar << 0));
}

__STATIC_INLINE void i2c1_ic_sar_unpack(uint16_t* sar)
{
    T_I2C1_IC_SAR localVal = hwp_i2c1->ic_sar;

    *sar = localVal.bit_field.sar;
}

__STATIC_INLINE uint16_t i2c1_sar_getf(void)
{
    return hwp_i2c1->ic_sar.bit_field.sar;
}

__STATIC_INLINE void i2c1_sar_setf(uint16_t sar)
{
    hwp_i2c1->ic_sar.bit_field.sar = sar;
}

__STATIC_INLINE uint32_t i2c1_ic_hs_maddr_get(void)
{
    return hwp_i2c1->ic_hs_maddr.val;
}

__STATIC_INLINE void i2c1_ic_hs_maddr_set(uint32_t value)
{
    hwp_i2c1->ic_hs_maddr.val = value;
}

__STATIC_INLINE void i2c1_ic_hs_maddr_pack(uint8_t hs_mar)
{
    hwp_i2c1->ic_hs_maddr.val = (((uint32_t)hs_mar << 0));
}

__STATIC_INLINE void i2c1_ic_hs_maddr_unpack(uint8_t* hs_mar)
{
    T_I2C1_IC_HS_MADDR localVal = hwp_i2c1->ic_hs_maddr;

    *hs_mar = localVal.bit_field.hs_mar;
}

__STATIC_INLINE uint8_t i2c1_hs_mar_getf(void)
{
    return hwp_i2c1->ic_hs_maddr.bit_field.hs_mar;
}

__STATIC_INLINE void i2c1_hs_mar_setf(uint8_t hs_mar)
{
    hwp_i2c1->ic_hs_maddr.bit_field.hs_mar = hs_mar;
}

__STATIC_INLINE uint32_t i2c1_ic_data_cmd_get(void)
{
    return hwp_i2c1->ic_data_cmd.val;
}

__STATIC_INLINE void i2c1_ic_data_cmd_set(uint32_t value)
{
    hwp_i2c1->ic_data_cmd.val = value;
}

__STATIC_INLINE void i2c1_ic_data_cmd_pack(uint8_t restart, uint8_t stop, uint8_t cmd, uint8_t dat)
{
    hwp_i2c1->ic_data_cmd.val = (((uint32_t)restart << 10) | ((uint32_t)stop << 9) | ((uint32_t)cmd << 8) | ((uint32_t)dat << 0));
}

__STATIC_INLINE void i2c1_ic_data_cmd_unpack(uint8_t* first_data_byte, uint8_t* dat)
{
    T_I2C1_IC_DATA_CMD localVal = hwp_i2c1->ic_data_cmd;

    *first_data_byte = localVal.bit_field.first_data_byte;
    *dat = localVal.bit_field.dat;
}

__STATIC_INLINE uint8_t i2c1_first_data_byte_getf(void)
{
    return hwp_i2c1->ic_data_cmd.bit_field.first_data_byte;
}

__STATIC_INLINE uint8_t i2c1_dat_getf(void)
{
    return hwp_i2c1->ic_data_cmd.bit_field.dat;
}

__STATIC_INLINE uint32_t i2c1_ic_ss_scl_hcnt_get(void)
{
    return hwp_i2c1->ic_ss_scl_hcnt.val;
}

__STATIC_INLINE void i2c1_ic_ss_scl_hcnt_set(uint32_t value)
{
    hwp_i2c1->ic_ss_scl_hcnt.val = value;
}

__STATIC_INLINE void i2c1_ic_ss_scl_hcnt_pack(uint16_t ss_scl_hcnt)
{
    hwp_i2c1->ic_ss_scl_hcnt.val = (((uint32_t)ss_scl_hcnt << 0));
}

__STATIC_INLINE void i2c1_ic_ss_scl_hcnt_unpack(uint16_t* ss_scl_hcnt)
{
    T_I2C1_IC_SS_SCL_HCNT localVal = hwp_i2c1->ic_ss_scl_hcnt;

    *ss_scl_hcnt = localVal.bit_field.ss_scl_hcnt;
}

__STATIC_INLINE uint16_t i2c1_ss_scl_hcnt_getf(void)
{
    return hwp_i2c1->ic_ss_scl_hcnt.bit_field.ss_scl_hcnt;
}

__STATIC_INLINE void i2c1_ss_scl_hcnt_setf(uint16_t ss_scl_hcnt)
{
    hwp_i2c1->ic_ss_scl_hcnt.bit_field.ss_scl_hcnt = ss_scl_hcnt;
}

__STATIC_INLINE uint32_t i2c1_ic_ss_scl_lcnt_get(void)
{
    return hwp_i2c1->ic_ss_scl_lcnt.val;
}

__STATIC_INLINE void i2c1_ic_ss_scl_lcnt_set(uint32_t value)
{
    hwp_i2c1->ic_ss_scl_lcnt.val = value;
}

__STATIC_INLINE void i2c1_ic_ss_scl_lcnt_pack(uint16_t ss_scl_lcnt)
{
    hwp_i2c1->ic_ss_scl_lcnt.val = (((uint32_t)ss_scl_lcnt << 0));
}

__STATIC_INLINE void i2c1_ic_ss_scl_lcnt_unpack(uint16_t* ss_scl_lcnt)
{
    T_I2C1_IC_SS_SCL_LCNT localVal = hwp_i2c1->ic_ss_scl_lcnt;

    *ss_scl_lcnt = localVal.bit_field.ss_scl_lcnt;
}

__STATIC_INLINE uint16_t i2c1_ss_scl_lcnt_getf(void)
{
    return hwp_i2c1->ic_ss_scl_lcnt.bit_field.ss_scl_lcnt;
}

__STATIC_INLINE void i2c1_ss_scl_lcnt_setf(uint16_t ss_scl_lcnt)
{
    hwp_i2c1->ic_ss_scl_lcnt.bit_field.ss_scl_lcnt = ss_scl_lcnt;
}

__STATIC_INLINE uint32_t i2c1_ic_fs_scl_hcnt_get(void)
{
    return hwp_i2c1->ic_fs_scl_hcnt.val;
}

__STATIC_INLINE void i2c1_ic_fs_scl_hcnt_set(uint32_t value)
{
    hwp_i2c1->ic_fs_scl_hcnt.val = value;
}

__STATIC_INLINE void i2c1_ic_fs_scl_hcnt_pack(uint16_t fs_scl_hcnt)
{
    hwp_i2c1->ic_fs_scl_hcnt.val = (((uint32_t)fs_scl_hcnt << 0));
}

__STATIC_INLINE void i2c1_ic_fs_scl_hcnt_unpack(uint16_t* fs_scl_hcnt)
{
    T_I2C1_IC_FS_SCL_HCNT localVal = hwp_i2c1->ic_fs_scl_hcnt;

    *fs_scl_hcnt = localVal.bit_field.fs_scl_hcnt;
}

__STATIC_INLINE uint16_t i2c1_fs_scl_hcnt_getf(void)
{
    return hwp_i2c1->ic_fs_scl_hcnt.bit_field.fs_scl_hcnt;
}

__STATIC_INLINE void i2c1_fs_scl_hcnt_setf(uint16_t fs_scl_hcnt)
{
    hwp_i2c1->ic_fs_scl_hcnt.bit_field.fs_scl_hcnt = fs_scl_hcnt;
}

__STATIC_INLINE uint32_t i2c1_ic_fs_scl_lcnt_get(void)
{
    return hwp_i2c1->ic_fs_scl_lcnt.val;
}

__STATIC_INLINE void i2c1_ic_fs_scl_lcnt_set(uint32_t value)
{
    hwp_i2c1->ic_fs_scl_lcnt.val = value;
}

__STATIC_INLINE void i2c1_ic_fs_scl_lcnt_pack(uint16_t fs_scl_lcnt)
{
    hwp_i2c1->ic_fs_scl_lcnt.val = (((uint32_t)fs_scl_lcnt << 0));
}

__STATIC_INLINE void i2c1_ic_fs_scl_lcnt_unpack(uint16_t* fs_scl_lcnt)
{
    T_I2C1_IC_FS_SCL_LCNT localVal = hwp_i2c1->ic_fs_scl_lcnt;

    *fs_scl_lcnt = localVal.bit_field.fs_scl_lcnt;
}

__STATIC_INLINE uint16_t i2c1_fs_scl_lcnt_getf(void)
{
    return hwp_i2c1->ic_fs_scl_lcnt.bit_field.fs_scl_lcnt;
}

__STATIC_INLINE void i2c1_fs_scl_lcnt_setf(uint16_t fs_scl_lcnt)
{
    hwp_i2c1->ic_fs_scl_lcnt.bit_field.fs_scl_lcnt = fs_scl_lcnt;
}

__STATIC_INLINE uint32_t i2c1_ic_hs_scl_hcnt_get(void)
{
    return hwp_i2c1->ic_hs_scl_hcnt.val;
}

__STATIC_INLINE void i2c1_ic_hs_scl_hcnt_set(uint32_t value)
{
    hwp_i2c1->ic_hs_scl_hcnt.val = value;
}

__STATIC_INLINE void i2c1_ic_hs_scl_hcnt_pack(uint16_t hs_scl_hcnt)
{
    hwp_i2c1->ic_hs_scl_hcnt.val = (((uint32_t)hs_scl_hcnt << 0));
}

__STATIC_INLINE void i2c1_ic_hs_scl_hcnt_unpack(uint16_t* hs_scl_hcnt)
{
    T_I2C1_IC_HS_SCL_HCNT localVal = hwp_i2c1->ic_hs_scl_hcnt;

    *hs_scl_hcnt = localVal.bit_field.hs_scl_hcnt;
}

__STATIC_INLINE uint16_t i2c1_hs_scl_hcnt_getf(void)
{
    return hwp_i2c1->ic_hs_scl_hcnt.bit_field.hs_scl_hcnt;
}

__STATIC_INLINE void i2c1_hs_scl_hcnt_setf(uint16_t hs_scl_hcnt)
{
    hwp_i2c1->ic_hs_scl_hcnt.bit_field.hs_scl_hcnt = hs_scl_hcnt;
}

__STATIC_INLINE uint32_t i2c1_ic_hs_scl_lcnt_get(void)
{
    return hwp_i2c1->ic_hs_scl_lcnt.val;
}

__STATIC_INLINE void i2c1_ic_hs_scl_lcnt_set(uint32_t value)
{
    hwp_i2c1->ic_hs_scl_lcnt.val = value;
}

__STATIC_INLINE void i2c1_ic_hs_scl_lcnt_pack(uint16_t hs_scl_lcnt)
{
    hwp_i2c1->ic_hs_scl_lcnt.val = (((uint32_t)hs_scl_lcnt << 0));
}

__STATIC_INLINE void i2c1_ic_hs_scl_lcnt_unpack(uint16_t* hs_scl_lcnt)
{
    T_I2C1_IC_HS_SCL_LCNT localVal = hwp_i2c1->ic_hs_scl_lcnt;

    *hs_scl_lcnt = localVal.bit_field.hs_scl_lcnt;
}

__STATIC_INLINE uint16_t i2c1_hs_scl_lcnt_getf(void)
{
    return hwp_i2c1->ic_hs_scl_lcnt.bit_field.hs_scl_lcnt;
}

__STATIC_INLINE void i2c1_hs_scl_lcnt_setf(uint16_t hs_scl_lcnt)
{
    hwp_i2c1->ic_hs_scl_lcnt.bit_field.hs_scl_lcnt = hs_scl_lcnt;
}

__STATIC_INLINE uint32_t i2c1_ic_intr_stat_get(void)
{
    return hwp_i2c1->ic_intr_stat.val;
}

__STATIC_INLINE void i2c1_ic_intr_stat_unpack(uint8_t* scl_stuck_at_low_stat, uint8_t* mst_on_hold_stat, uint8_t* restart_det_stat, uint8_t* gen_call_stat, uint8_t* start_det_stat, uint8_t* stop_det_stat, uint8_t* activity_stat, uint8_t* rx_done_stat, uint8_t* tx_abrt_stat, uint8_t* rd_req_stat, uint8_t* tx_empty_stat, uint8_t* tx_over_stat, uint8_t* rx_full_stat, uint8_t* rx_over_stat, uint8_t* rx_under_stat)
{
    T_I2C1_IC_INTR_STAT localVal = hwp_i2c1->ic_intr_stat;

    *scl_stuck_at_low_stat = localVal.bit_field.scl_stuck_at_low_stat;
    *mst_on_hold_stat = localVal.bit_field.mst_on_hold_stat;
    *restart_det_stat = localVal.bit_field.restart_det_stat;
    *gen_call_stat = localVal.bit_field.gen_call_stat;
    *start_det_stat = localVal.bit_field.start_det_stat;
    *stop_det_stat = localVal.bit_field.stop_det_stat;
    *activity_stat = localVal.bit_field.activity_stat;
    *rx_done_stat = localVal.bit_field.rx_done_stat;
    *tx_abrt_stat = localVal.bit_field.tx_abrt_stat;
    *rd_req_stat = localVal.bit_field.rd_req_stat;
    *tx_empty_stat = localVal.bit_field.tx_empty_stat;
    *tx_over_stat = localVal.bit_field.tx_over_stat;
    *rx_full_stat = localVal.bit_field.rx_full_stat;
    *rx_over_stat = localVal.bit_field.rx_over_stat;
    *rx_under_stat = localVal.bit_field.rx_under_stat;
}

__STATIC_INLINE uint8_t i2c1_scl_stuck_at_low_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.scl_stuck_at_low_stat;
}

__STATIC_INLINE uint8_t i2c1_mst_on_hold_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.mst_on_hold_stat;
}

__STATIC_INLINE uint8_t i2c1_restart_det_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.restart_det_stat;
}

__STATIC_INLINE uint8_t i2c1_gen_call_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.gen_call_stat;
}

__STATIC_INLINE uint8_t i2c1_start_det_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.start_det_stat;
}

__STATIC_INLINE uint8_t i2c1_stop_det_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.stop_det_stat;
}

__STATIC_INLINE uint8_t i2c1_activity_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.activity_stat;
}

__STATIC_INLINE uint8_t i2c1_rx_done_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.rx_done_stat;
}

__STATIC_INLINE uint8_t i2c1_tx_abrt_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.tx_abrt_stat;
}

__STATIC_INLINE uint8_t i2c1_rd_req_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.rd_req_stat;
}

__STATIC_INLINE uint8_t i2c1_tx_empty_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.tx_empty_stat;
}

__STATIC_INLINE uint8_t i2c1_tx_over_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.tx_over_stat;
}

__STATIC_INLINE uint8_t i2c1_rx_full_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.rx_full_stat;
}

__STATIC_INLINE uint8_t i2c1_rx_over_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.rx_over_stat;
}

__STATIC_INLINE uint8_t i2c1_rx_under_stat_getf(void)
{
    return hwp_i2c1->ic_intr_stat.bit_field.rx_under_stat;
}

__STATIC_INLINE uint32_t i2c1_ic_intr_mask_get(void)
{
    return hwp_i2c1->ic_intr_mask.val;
}

__STATIC_INLINE void i2c1_ic_intr_mask_set(uint32_t value)
{
    hwp_i2c1->ic_intr_mask.val = value;
}

__STATIC_INLINE void i2c1_ic_intr_mask_pack(uint8_t restart_det_mask, uint8_t gen_call_mask, uint8_t start_det_mask, uint8_t stop_det_mask, uint8_t activity_mask, uint8_t rx_done_mask, uint8_t tx_abrt_mask, uint8_t rd_req_mask, uint8_t tx_empty_mask, uint8_t tx_over_mask, uint8_t rx_full_mask, uint8_t rx_over_mask, uint8_t rx_under_mask)
{
    hwp_i2c1->ic_intr_mask.val = (((uint32_t)restart_det_mask << 12) | ((uint32_t)gen_call_mask << 11) | ((uint32_t)start_det_mask << 10) | ((uint32_t)stop_det_mask << 9) | ((uint32_t)activity_mask << 8) | ((uint32_t)rx_done_mask << 7) | ((uint32_t)tx_abrt_mask << 6) | ((uint32_t)rd_req_mask << 5) | ((uint32_t)tx_empty_mask << 4) | ((uint32_t)tx_over_mask << 3) | ((uint32_t)rx_full_mask << 2) | ((uint32_t)rx_over_mask << 1) | ((uint32_t)rx_under_mask << 0));
}

__STATIC_INLINE void i2c1_ic_intr_mask_unpack(uint8_t* scl_stuck_at_low_mask, uint8_t* mst_on_hold_mask, uint8_t* restart_det_mask, uint8_t* gen_call_mask, uint8_t* start_det_mask, uint8_t* stop_det_mask, uint8_t* activity_mask, uint8_t* rx_done_mask, uint8_t* tx_abrt_mask, uint8_t* rd_req_mask, uint8_t* tx_empty_mask, uint8_t* tx_over_mask, uint8_t* rx_full_mask, uint8_t* rx_over_mask, uint8_t* rx_under_mask)
{
    T_I2C1_IC_INTR_MASK localVal = hwp_i2c1->ic_intr_mask;

    *scl_stuck_at_low_mask = localVal.bit_field.scl_stuck_at_low_mask;
    *mst_on_hold_mask = localVal.bit_field.mst_on_hold_mask;
    *restart_det_mask = localVal.bit_field.restart_det_mask;
    *gen_call_mask = localVal.bit_field.gen_call_mask;
    *start_det_mask = localVal.bit_field.start_det_mask;
    *stop_det_mask = localVal.bit_field.stop_det_mask;
    *activity_mask = localVal.bit_field.activity_mask;
    *rx_done_mask = localVal.bit_field.rx_done_mask;
    *tx_abrt_mask = localVal.bit_field.tx_abrt_mask;
    *rd_req_mask = localVal.bit_field.rd_req_mask;
    *tx_empty_mask = localVal.bit_field.tx_empty_mask;
    *tx_over_mask = localVal.bit_field.tx_over_mask;
    *rx_full_mask = localVal.bit_field.rx_full_mask;
    *rx_over_mask = localVal.bit_field.rx_over_mask;
    *rx_under_mask = localVal.bit_field.rx_under_mask;
}

__STATIC_INLINE uint8_t i2c1_scl_stuck_at_low_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.scl_stuck_at_low_mask;
}

__STATIC_INLINE uint8_t i2c1_mst_on_hold_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.mst_on_hold_mask;
}

__STATIC_INLINE uint8_t i2c1_restart_det_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.restart_det_mask;
}

__STATIC_INLINE void i2c1_restart_det_mask_setf(uint8_t restart_det_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.restart_det_mask = restart_det_mask;
}

__STATIC_INLINE uint8_t i2c1_gen_call_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.gen_call_mask;
}

__STATIC_INLINE void i2c1_gen_call_mask_setf(uint8_t gen_call_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.gen_call_mask = gen_call_mask;
}

__STATIC_INLINE uint8_t i2c1_start_det_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.start_det_mask;
}

__STATIC_INLINE void i2c1_start_det_mask_setf(uint8_t start_det_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.start_det_mask = start_det_mask;
}

__STATIC_INLINE uint8_t i2c1_stop_det_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.stop_det_mask;
}

__STATIC_INLINE void i2c1_stop_det_mask_setf(uint8_t stop_det_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.stop_det_mask = stop_det_mask;
}

__STATIC_INLINE uint8_t i2c1_activity_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.activity_mask;
}

__STATIC_INLINE void i2c1_activity_mask_setf(uint8_t activity_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.activity_mask = activity_mask;
}

__STATIC_INLINE uint8_t i2c1_rx_done_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.rx_done_mask;
}

__STATIC_INLINE void i2c1_rx_done_mask_setf(uint8_t rx_done_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.rx_done_mask = rx_done_mask;
}

__STATIC_INLINE uint8_t i2c1_tx_abrt_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.tx_abrt_mask;
}

__STATIC_INLINE void i2c1_tx_abrt_mask_setf(uint8_t tx_abrt_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.tx_abrt_mask = tx_abrt_mask;
}

__STATIC_INLINE uint8_t i2c1_rd_req_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.rd_req_mask;
}

__STATIC_INLINE void i2c1_rd_req_mask_setf(uint8_t rd_req_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.rd_req_mask = rd_req_mask;
}

__STATIC_INLINE uint8_t i2c1_tx_empty_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.tx_empty_mask;
}

__STATIC_INLINE void i2c1_tx_empty_mask_setf(uint8_t tx_empty_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.tx_empty_mask = tx_empty_mask;
}

__STATIC_INLINE uint8_t i2c1_tx_over_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.tx_over_mask;
}

__STATIC_INLINE void i2c1_tx_over_mask_setf(uint8_t tx_over_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.tx_over_mask = tx_over_mask;
}

__STATIC_INLINE uint8_t i2c1_rx_full_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.rx_full_mask;
}

__STATIC_INLINE void i2c1_rx_full_mask_setf(uint8_t rx_full_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.rx_full_mask = rx_full_mask;
}

__STATIC_INLINE uint8_t i2c1_rx_over_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.rx_over_mask;
}

__STATIC_INLINE void i2c1_rx_over_mask_setf(uint8_t rx_over_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.rx_over_mask = rx_over_mask;
}

__STATIC_INLINE uint8_t i2c1_rx_under_mask_getf(void)
{
    return hwp_i2c1->ic_intr_mask.bit_field.rx_under_mask;
}

__STATIC_INLINE void i2c1_rx_under_mask_setf(uint8_t rx_under_mask)
{
    hwp_i2c1->ic_intr_mask.bit_field.rx_under_mask = rx_under_mask;
}

__STATIC_INLINE uint32_t i2c1_ic_raw_intr_stat_get(void)
{
    return hwp_i2c1->ic_raw_intr_stat.val;
}

__STATIC_INLINE void i2c1_ic_raw_intr_stat_unpack(uint8_t* scl_stuck_at_low_raw, uint8_t* mst_on_hold_raw, uint8_t* restart_det_raw, uint8_t* gen_call_raw, uint8_t* start_det_raw, uint8_t* stop_det_raw, uint8_t* activity_raw, uint8_t* rx_done_raw, uint8_t* tx_abrt_raw, uint8_t* rd_req_raw, uint8_t* tx_empty_raw, uint8_t* tx_over_raw, uint8_t* rx_full_raw, uint8_t* rx_over_raw, uint8_t* rx_under_raw)
{
    T_I2C1_IC_RAW_INTR_STAT localVal = hwp_i2c1->ic_raw_intr_stat;

    *scl_stuck_at_low_raw = localVal.bit_field.scl_stuck_at_low_raw;
    *mst_on_hold_raw = localVal.bit_field.mst_on_hold_raw;
    *restart_det_raw = localVal.bit_field.restart_det_raw;
    *gen_call_raw = localVal.bit_field.gen_call_raw;
    *start_det_raw = localVal.bit_field.start_det_raw;
    *stop_det_raw = localVal.bit_field.stop_det_raw;
    *activity_raw = localVal.bit_field.activity_raw;
    *rx_done_raw = localVal.bit_field.rx_done_raw;
    *tx_abrt_raw = localVal.bit_field.tx_abrt_raw;
    *rd_req_raw = localVal.bit_field.rd_req_raw;
    *tx_empty_raw = localVal.bit_field.tx_empty_raw;
    *tx_over_raw = localVal.bit_field.tx_over_raw;
    *rx_full_raw = localVal.bit_field.rx_full_raw;
    *rx_over_raw = localVal.bit_field.rx_over_raw;
    *rx_under_raw = localVal.bit_field.rx_under_raw;
}

__STATIC_INLINE uint8_t i2c1_scl_stuck_at_low_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.scl_stuck_at_low_raw;
}

__STATIC_INLINE uint8_t i2c1_mst_on_hold_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.mst_on_hold_raw;
}

__STATIC_INLINE uint8_t i2c1_restart_det_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.restart_det_raw;
}

__STATIC_INLINE uint8_t i2c1_gen_call_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.gen_call_raw;
}

__STATIC_INLINE uint8_t i2c1_start_det_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.start_det_raw;
}

__STATIC_INLINE uint8_t i2c1_stop_det_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.stop_det_raw;
}

__STATIC_INLINE uint8_t i2c1_activity_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.activity_raw;
}

__STATIC_INLINE uint8_t i2c1_rx_done_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.rx_done_raw;
}

__STATIC_INLINE uint8_t i2c1_tx_abrt_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.tx_abrt_raw;
}

__STATIC_INLINE uint8_t i2c1_rd_req_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.rd_req_raw;
}

__STATIC_INLINE uint8_t i2c1_tx_empty_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.tx_empty_raw;
}

__STATIC_INLINE uint8_t i2c1_tx_over_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.tx_over_raw;
}

__STATIC_INLINE uint8_t i2c1_rx_full_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.rx_full_raw;
}

__STATIC_INLINE uint8_t i2c1_rx_over_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.rx_over_raw;
}

__STATIC_INLINE uint8_t i2c1_rx_under_raw_getf(void)
{
    return hwp_i2c1->ic_raw_intr_stat.bit_field.rx_under_raw;
}

__STATIC_INLINE uint32_t i2c1_ic_rx_tl_get(void)
{
    return hwp_i2c1->ic_rx_tl.val;
}

__STATIC_INLINE void i2c1_ic_rx_tl_set(uint32_t value)
{
    hwp_i2c1->ic_rx_tl.val = value;
}

__STATIC_INLINE void i2c1_ic_rx_tl_pack(uint8_t rx_tl)
{
    hwp_i2c1->ic_rx_tl.val = (((uint32_t)rx_tl << 0));
}

__STATIC_INLINE void i2c1_ic_rx_tl_unpack(uint8_t* rx_tl)
{
    T_I2C1_IC_RX_TL localVal = hwp_i2c1->ic_rx_tl;

    *rx_tl = localVal.bit_field.rx_tl;
}

__STATIC_INLINE uint8_t i2c1_rx_tl_getf(void)
{
    return hwp_i2c1->ic_rx_tl.bit_field.rx_tl;
}

__STATIC_INLINE void i2c1_rx_tl_setf(uint8_t rx_tl)
{
    hwp_i2c1->ic_rx_tl.bit_field.rx_tl = rx_tl;
}

__STATIC_INLINE uint32_t i2c1_ic_tx_tl_get(void)
{
    return hwp_i2c1->ic_tx_tl.val;
}

__STATIC_INLINE void i2c1_ic_tx_tl_set(uint32_t value)
{
    hwp_i2c1->ic_tx_tl.val = value;
}

__STATIC_INLINE void i2c1_ic_tx_tl_pack(uint8_t tx_tl)
{
    hwp_i2c1->ic_tx_tl.val = (((uint32_t)tx_tl << 0));
}

__STATIC_INLINE void i2c1_ic_tx_tl_unpack(uint8_t* tx_tl)
{
    T_I2C1_IC_TX_TL localVal = hwp_i2c1->ic_tx_tl;

    *tx_tl = localVal.bit_field.tx_tl;
}

__STATIC_INLINE uint8_t i2c1_tx_tl_getf(void)
{
    return hwp_i2c1->ic_tx_tl.bit_field.tx_tl;
}

__STATIC_INLINE void i2c1_tx_tl_setf(uint8_t tx_tl)
{
    hwp_i2c1->ic_tx_tl.bit_field.tx_tl = tx_tl;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_intr_get(void)
{
    return hwp_i2c1->ic_clr_intr.val;
}

__STATIC_INLINE void i2c1_ic_clr_intr_unpack(uint8_t* clr_intr)
{
    T_I2C1_IC_CLR_INTR localVal = hwp_i2c1->ic_clr_intr;

    *clr_intr = localVal.bit_field.clr_intr;
}

__STATIC_INLINE uint8_t i2c1_clr_intr_getf(void)
{
    return hwp_i2c1->ic_clr_intr.bit_field.clr_intr;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_rx_under_get(void)
{
    return hwp_i2c1->ic_clr_rx_under.val;
}

__STATIC_INLINE void i2c1_ic_clr_rx_under_unpack(uint8_t* clr_rx_under)
{
    T_I2C1_IC_CLR_RX_UNDER localVal = hwp_i2c1->ic_clr_rx_under;

    *clr_rx_under = localVal.bit_field.clr_rx_under;
}

__STATIC_INLINE uint8_t i2c1_clr_rx_under_getf(void)
{
    return hwp_i2c1->ic_clr_rx_under.bit_field.clr_rx_under;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_rx_over_get(void)
{
    return hwp_i2c1->ic_clr_rx_over.val;
}

__STATIC_INLINE void i2c1_ic_clr_rx_over_unpack(uint8_t* clr_rx_over)
{
    T_I2C1_IC_CLR_RX_OVER localVal = hwp_i2c1->ic_clr_rx_over;

    *clr_rx_over = localVal.bit_field.clr_rx_over;
}

__STATIC_INLINE uint8_t i2c1_clr_rx_over_getf(void)
{
    return hwp_i2c1->ic_clr_rx_over.bit_field.clr_rx_over;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_tx_over_get(void)
{
    return hwp_i2c1->ic_clr_tx_over.val;
}

__STATIC_INLINE void i2c1_ic_clr_tx_over_unpack(uint8_t* clr_tx_over)
{
    T_I2C1_IC_CLR_TX_OVER localVal = hwp_i2c1->ic_clr_tx_over;

    *clr_tx_over = localVal.bit_field.clr_tx_over;
}

__STATIC_INLINE uint8_t i2c1_clr_tx_over_getf(void)
{
    return hwp_i2c1->ic_clr_tx_over.bit_field.clr_tx_over;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_rd_req_get(void)
{
    return hwp_i2c1->ic_clr_rd_req.val;
}

__STATIC_INLINE void i2c1_ic_clr_rd_req_unpack(uint8_t* clr_rd_req)
{
    T_I2C1_IC_CLR_RD_REQ localVal = hwp_i2c1->ic_clr_rd_req;

    *clr_rd_req = localVal.bit_field.clr_rd_req;
}

__STATIC_INLINE uint8_t i2c1_clr_rd_req_getf(void)
{
    return hwp_i2c1->ic_clr_rd_req.bit_field.clr_rd_req;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_tx_abrt_get(void)
{
    return hwp_i2c1->ic_clr_tx_abrt.val;
}

__STATIC_INLINE void i2c1_ic_clr_tx_abrt_unpack(uint8_t* clr_tx_abrt)
{
    T_I2C1_IC_CLR_TX_ABRT localVal = hwp_i2c1->ic_clr_tx_abrt;

    *clr_tx_abrt = localVal.bit_field.clr_tx_abrt;
}

__STATIC_INLINE uint8_t i2c1_clr_tx_abrt_getf(void)
{
    return hwp_i2c1->ic_clr_tx_abrt.bit_field.clr_tx_abrt;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_rx_done_get(void)
{
    return hwp_i2c1->ic_clr_rx_done.val;
}

__STATIC_INLINE void i2c1_ic_clr_rx_done_unpack(uint8_t* clr_rx_done)
{
    T_I2C1_IC_CLR_RX_DONE localVal = hwp_i2c1->ic_clr_rx_done;

    *clr_rx_done = localVal.bit_field.clr_rx_done;
}

__STATIC_INLINE uint8_t i2c1_clr_rx_done_getf(void)
{
    return hwp_i2c1->ic_clr_rx_done.bit_field.clr_rx_done;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_activity_get(void)
{
    return hwp_i2c1->ic_clr_activity.val;
}

__STATIC_INLINE void i2c1_ic_clr_activity_unpack(uint8_t* clr_activity)
{
    T_I2C1_IC_CLR_ACTIVITY localVal = hwp_i2c1->ic_clr_activity;

    *clr_activity = localVal.bit_field.clr_activity;
}

__STATIC_INLINE uint8_t i2c1_clr_activity_getf(void)
{
    return hwp_i2c1->ic_clr_activity.bit_field.clr_activity;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_stop_det_get(void)
{
    return hwp_i2c1->ic_clr_stop_det.val;
}

__STATIC_INLINE void i2c1_ic_clr_stop_det_unpack(uint8_t* clr_stop_det)
{
    T_I2C1_IC_CLR_STOP_DET localVal = hwp_i2c1->ic_clr_stop_det;

    *clr_stop_det = localVal.bit_field.clr_stop_det;
}

__STATIC_INLINE uint8_t i2c1_clr_stop_det_getf(void)
{
    return hwp_i2c1->ic_clr_stop_det.bit_field.clr_stop_det;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_start_det_get(void)
{
    return hwp_i2c1->ic_clr_start_det.val;
}

__STATIC_INLINE void i2c1_ic_clr_start_det_unpack(uint8_t* clr_start_det)
{
    T_I2C1_IC_CLR_START_DET localVal = hwp_i2c1->ic_clr_start_det;

    *clr_start_det = localVal.bit_field.clr_start_det;
}

__STATIC_INLINE uint8_t i2c1_clr_start_det_getf(void)
{
    return hwp_i2c1->ic_clr_start_det.bit_field.clr_start_det;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_gen_call_get(void)
{
    return hwp_i2c1->ic_clr_gen_call.val;
}

__STATIC_INLINE void i2c1_ic_clr_gen_call_unpack(uint8_t* clr_gen_call)
{
    T_I2C1_IC_CLR_GEN_CALL localVal = hwp_i2c1->ic_clr_gen_call;

    *clr_gen_call = localVal.bit_field.clr_gen_call;
}

__STATIC_INLINE uint8_t i2c1_clr_gen_call_getf(void)
{
    return hwp_i2c1->ic_clr_gen_call.bit_field.clr_gen_call;
}

__STATIC_INLINE uint32_t i2c1_ic_enable_get(void)
{
    return hwp_i2c1->ic_enable.val;
}

__STATIC_INLINE void i2c1_ic_enable_set(uint32_t value)
{
    hwp_i2c1->ic_enable.val = value;
}

__STATIC_INLINE void i2c1_ic_enable_pack(uint8_t abort, uint8_t enable)
{
    hwp_i2c1->ic_enable.val = (((uint32_t)abort << 1) | ((uint32_t)enable << 0));
}

__STATIC_INLINE void i2c1_ic_enable_unpack(uint8_t* abort, uint8_t* enable)
{
    T_I2C1_IC_ENABLE localVal = hwp_i2c1->ic_enable;

    *abort = localVal.bit_field.abort;
    *enable = localVal.bit_field.enable;
}

__STATIC_INLINE uint8_t i2c1_abort_getf(void)
{
    return hwp_i2c1->ic_enable.bit_field.abort;
}

__STATIC_INLINE void i2c1_abort_setf(uint8_t abort)
{
    hwp_i2c1->ic_enable.bit_field.abort = abort;
}

__STATIC_INLINE uint8_t i2c1_enable_getf(void)
{
    return hwp_i2c1->ic_enable.bit_field.enable;
}

__STATIC_INLINE void i2c1_enable_setf(uint8_t enable)
{
    hwp_i2c1->ic_enable.bit_field.enable = enable;
}

__STATIC_INLINE uint32_t i2c1_ic_status_get(void)
{
    return hwp_i2c1->ic_status.val;
}

__STATIC_INLINE void i2c1_ic_status_unpack(uint8_t* smbus_alert_status, uint8_t* smbus_suspend_status, uint8_t* smbus_slave_addr_resolved, uint8_t* smbus_slave_addr_valid, uint8_t* smbus_quick_cmd_bit, uint8_t* sda_stuck_not_recovered, uint8_t* slv_hold_rx_fifo_full, uint8_t* slv_hold_tx_fifo_empty, uint8_t* mst_hold_rx_fifo_full, uint8_t* mst_hold_tx_fifo_empty, uint8_t* slv_activity, uint8_t* mst_activity, uint8_t* rff, uint8_t* rfne, uint8_t* tfe, uint8_t* tfnf, uint8_t* activity)
{
    T_I2C1_IC_STATUS localVal = hwp_i2c1->ic_status;

    *smbus_alert_status = localVal.bit_field.smbus_alert_status;
    *smbus_suspend_status = localVal.bit_field.smbus_suspend_status;
    *smbus_slave_addr_resolved = localVal.bit_field.smbus_slave_addr_resolved;
    *smbus_slave_addr_valid = localVal.bit_field.smbus_slave_addr_valid;
    *smbus_quick_cmd_bit = localVal.bit_field.smbus_quick_cmd_bit;
    *sda_stuck_not_recovered = localVal.bit_field.sda_stuck_not_recovered;
    *slv_hold_rx_fifo_full = localVal.bit_field.slv_hold_rx_fifo_full;
    *slv_hold_tx_fifo_empty = localVal.bit_field.slv_hold_tx_fifo_empty;
    *mst_hold_rx_fifo_full = localVal.bit_field.mst_hold_rx_fifo_full;
    *mst_hold_tx_fifo_empty = localVal.bit_field.mst_hold_tx_fifo_empty;
    *slv_activity = localVal.bit_field.slv_activity;
    *mst_activity = localVal.bit_field.mst_activity;
    *rff = localVal.bit_field.rff;
    *rfne = localVal.bit_field.rfne;
    *tfe = localVal.bit_field.tfe;
    *tfnf = localVal.bit_field.tfnf;
    *activity = localVal.bit_field.activity;
}

__STATIC_INLINE uint8_t i2c1_smbus_alert_status_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.smbus_alert_status;
}

__STATIC_INLINE uint8_t i2c1_smbus_suspend_status_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.smbus_suspend_status;
}

__STATIC_INLINE uint8_t i2c1_smbus_slave_addr_resolved_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.smbus_slave_addr_resolved;
}

__STATIC_INLINE uint8_t i2c1_smbus_slave_addr_valid_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.smbus_slave_addr_valid;
}

__STATIC_INLINE uint8_t i2c1_smbus_quick_cmd_bit_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.smbus_quick_cmd_bit;
}

__STATIC_INLINE uint8_t i2c1_sda_stuck_not_recovered_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.sda_stuck_not_recovered;
}

__STATIC_INLINE uint8_t i2c1_slv_hold_rx_fifo_full_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.slv_hold_rx_fifo_full;
}

__STATIC_INLINE uint8_t i2c1_slv_hold_tx_fifo_empty_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.slv_hold_tx_fifo_empty;
}

__STATIC_INLINE uint8_t i2c1_mst_hold_rx_fifo_full_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.mst_hold_rx_fifo_full;
}

__STATIC_INLINE uint8_t i2c1_mst_hold_tx_fifo_empty_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.mst_hold_tx_fifo_empty;
}

__STATIC_INLINE uint8_t i2c1_slv_activity_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.slv_activity;
}

__STATIC_INLINE uint8_t i2c1_mst_activity_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.mst_activity;
}

__STATIC_INLINE uint8_t i2c1_rff_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.rff;
}

__STATIC_INLINE uint8_t i2c1_rfne_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.rfne;
}

__STATIC_INLINE uint8_t i2c1_tfe_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.tfe;
}

__STATIC_INLINE uint8_t i2c1_tfnf_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.tfnf;
}

__STATIC_INLINE uint8_t i2c1_activity_getf(void)
{
    return hwp_i2c1->ic_status.bit_field.activity;
}

__STATIC_INLINE uint32_t i2c1_ic_txflr_get(void)
{
    return hwp_i2c1->ic_txflr.val;
}

__STATIC_INLINE void i2c1_ic_txflr_unpack(uint8_t* txflr)
{
    T_I2C1_IC_TXFLR localVal = hwp_i2c1->ic_txflr;

    *txflr = localVal.bit_field.txflr;
}

__STATIC_INLINE uint8_t i2c1_txflr_getf(void)
{
    return hwp_i2c1->ic_txflr.bit_field.txflr;
}

__STATIC_INLINE uint32_t i2c1_ic_rxflr_get(void)
{
    return hwp_i2c1->ic_rxflr.val;
}

__STATIC_INLINE void i2c1_ic_rxflr_unpack(uint8_t* rxflr)
{
    T_I2C1_IC_RXFLR localVal = hwp_i2c1->ic_rxflr;

    *rxflr = localVal.bit_field.rxflr;
}

__STATIC_INLINE uint8_t i2c1_rxflr_getf(void)
{
    return hwp_i2c1->ic_rxflr.bit_field.rxflr;
}

__STATIC_INLINE uint32_t i2c1_ic_sda_hold_get(void)
{
    return hwp_i2c1->ic_sda_hold.val;
}

__STATIC_INLINE void i2c1_ic_sda_hold_set(uint32_t value)
{
    hwp_i2c1->ic_sda_hold.val = value;
}

__STATIC_INLINE void i2c1_ic_sda_hold_pack(uint8_t ic_sda_rx_hold, uint16_t ic_sda_tx_hold)
{
    hwp_i2c1->ic_sda_hold.val = (((uint32_t)ic_sda_rx_hold << 16) | ((uint32_t)ic_sda_tx_hold << 0));
}

__STATIC_INLINE void i2c1_ic_sda_hold_unpack(uint8_t* ic_sda_rx_hold, uint16_t* ic_sda_tx_hold)
{
    T_I2C1_IC_SDA_HOLD localVal = hwp_i2c1->ic_sda_hold;

    *ic_sda_rx_hold = localVal.bit_field.ic_sda_rx_hold;
    *ic_sda_tx_hold = localVal.bit_field.ic_sda_tx_hold;
}

__STATIC_INLINE uint8_t i2c1_ic_sda_rx_hold_getf(void)
{
    return hwp_i2c1->ic_sda_hold.bit_field.ic_sda_rx_hold;
}

__STATIC_INLINE void i2c1_ic_sda_rx_hold_setf(uint8_t ic_sda_rx_hold)
{
    hwp_i2c1->ic_sda_hold.bit_field.ic_sda_rx_hold = ic_sda_rx_hold;
}

__STATIC_INLINE uint16_t i2c1_ic_sda_tx_hold_getf(void)
{
    return hwp_i2c1->ic_sda_hold.bit_field.ic_sda_tx_hold;
}

__STATIC_INLINE void i2c1_ic_sda_tx_hold_setf(uint16_t ic_sda_tx_hold)
{
    hwp_i2c1->ic_sda_hold.bit_field.ic_sda_tx_hold = ic_sda_tx_hold;
}

__STATIC_INLINE uint32_t i2c1_ic_tx_abrt_source_get(void)
{
    return hwp_i2c1->ic_tx_abrt_source.val;
}

__STATIC_INLINE void i2c1_ic_tx_abrt_source_unpack(uint16_t* tx_flush_cnt, uint8_t* abrt_device_write, uint8_t* abrt_device_slvaddr_noack, uint8_t* abrt_device_noack, uint8_t* abrt_sda_stuck_at_low, uint8_t* abrt_user_abrt, uint8_t* abrt_slvrd_intx, uint8_t* abrt_slv_arblost, uint8_t* abrt_slvflush_txfifo, uint8_t* arb_lost, uint8_t* abrt_master_dis, uint8_t* abrt_10b_rd_norstrt, uint8_t* abrt_sbyte_norstrt, uint8_t* abrt_hs_norstrt, uint8_t* abrt_sbyte_ackdet, uint8_t* abrt_hs_ackdet, uint8_t* abrt_gcall_read, uint8_t* abrt_gcall_noack, uint8_t* abrt_txdata_noack, uint8_t* abrt_10addr2_noack, uint8_t* abrt_10addr1_noack, uint8_t* abrt_7baddr_noack)
{
    T_I2C1_IC_TX_ABRT_SOURCE localVal = hwp_i2c1->ic_tx_abrt_source;

    *tx_flush_cnt = localVal.bit_field.tx_flush_cnt;
    *abrt_device_write = localVal.bit_field.abrt_device_write;
    *abrt_device_slvaddr_noack = localVal.bit_field.abrt_device_slvaddr_noack;
    *abrt_device_noack = localVal.bit_field.abrt_device_noack;
    *abrt_sda_stuck_at_low = localVal.bit_field.abrt_sda_stuck_at_low;
    *abrt_user_abrt = localVal.bit_field.abrt_user_abrt;
    *abrt_slvrd_intx = localVal.bit_field.abrt_slvrd_intx;
    *abrt_slv_arblost = localVal.bit_field.abrt_slv_arblost;
    *abrt_slvflush_txfifo = localVal.bit_field.abrt_slvflush_txfifo;
    *arb_lost = localVal.bit_field.arb_lost;
    *abrt_master_dis = localVal.bit_field.abrt_master_dis;
    *abrt_10b_rd_norstrt = localVal.bit_field.abrt_10b_rd_norstrt;
    *abrt_sbyte_norstrt = localVal.bit_field.abrt_sbyte_norstrt;
    *abrt_hs_norstrt = localVal.bit_field.abrt_hs_norstrt;
    *abrt_sbyte_ackdet = localVal.bit_field.abrt_sbyte_ackdet;
    *abrt_hs_ackdet = localVal.bit_field.abrt_hs_ackdet;
    *abrt_gcall_read = localVal.bit_field.abrt_gcall_read;
    *abrt_gcall_noack = localVal.bit_field.abrt_gcall_noack;
    *abrt_txdata_noack = localVal.bit_field.abrt_txdata_noack;
    *abrt_10addr2_noack = localVal.bit_field.abrt_10addr2_noack;
    *abrt_10addr1_noack = localVal.bit_field.abrt_10addr1_noack;
    *abrt_7baddr_noack = localVal.bit_field.abrt_7baddr_noack;
}

__STATIC_INLINE uint16_t i2c1_tx_flush_cnt_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.tx_flush_cnt;
}

__STATIC_INLINE uint8_t i2c1_abrt_device_write_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_device_write;
}

__STATIC_INLINE uint8_t i2c1_abrt_device_slvaddr_noack_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_device_slvaddr_noack;
}

__STATIC_INLINE uint8_t i2c1_abrt_device_noack_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_device_noack;
}

__STATIC_INLINE uint8_t i2c1_abrt_sda_stuck_at_low_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_sda_stuck_at_low;
}

__STATIC_INLINE uint8_t i2c1_abrt_user_abrt_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_user_abrt;
}

__STATIC_INLINE uint8_t i2c1_abrt_slvrd_intx_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_slvrd_intx;
}

__STATIC_INLINE uint8_t i2c1_abrt_slv_arblost_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_slv_arblost;
}

__STATIC_INLINE uint8_t i2c1_abrt_slvflush_txfifo_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_slvflush_txfifo;
}

__STATIC_INLINE uint8_t i2c1_arb_lost_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.arb_lost;
}

__STATIC_INLINE uint8_t i2c1_abrt_master_dis_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_master_dis;
}

__STATIC_INLINE uint8_t i2c1_abrt_10b_rd_norstrt_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_10b_rd_norstrt;
}

__STATIC_INLINE uint8_t i2c1_abrt_sbyte_norstrt_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_sbyte_norstrt;
}

__STATIC_INLINE uint8_t i2c1_abrt_hs_norstrt_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_hs_norstrt;
}

__STATIC_INLINE uint8_t i2c1_abrt_sbyte_ackdet_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_sbyte_ackdet;
}

__STATIC_INLINE uint8_t i2c1_abrt_hs_ackdet_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_hs_ackdet;
}

__STATIC_INLINE uint8_t i2c1_abrt_gcall_read_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_gcall_read;
}

__STATIC_INLINE uint8_t i2c1_abrt_gcall_noack_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_gcall_noack;
}

__STATIC_INLINE uint8_t i2c1_abrt_txdata_noack_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_txdata_noack;
}

__STATIC_INLINE uint8_t i2c1_abrt_10addr2_noack_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_10addr2_noack;
}

__STATIC_INLINE uint8_t i2c1_abrt_10addr1_noack_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_10addr1_noack;
}

__STATIC_INLINE uint8_t i2c1_abrt_7baddr_noack_getf(void)
{
    return hwp_i2c1->ic_tx_abrt_source.bit_field.abrt_7baddr_noack;
}

__STATIC_INLINE uint32_t i2c1_ic_slv_data_nack_only_get(void)
{
    return hwp_i2c1->ic_slv_data_nack_only.val;
}

__STATIC_INLINE void i2c1_ic_slv_data_nack_only_set(uint32_t value)
{
    hwp_i2c1->ic_slv_data_nack_only.val = value;
}

__STATIC_INLINE void i2c1_ic_slv_data_nack_only_pack(uint8_t nack)
{
    hwp_i2c1->ic_slv_data_nack_only.val = (((uint32_t)nack << 0));
}

__STATIC_INLINE void i2c1_ic_slv_data_nack_only_unpack(uint8_t* nack)
{
    T_I2C1_IC_SLV_DATA_NACK_ONLY localVal = hwp_i2c1->ic_slv_data_nack_only;

    *nack = localVal.bit_field.nack;
}

__STATIC_INLINE uint8_t i2c1_nack_getf(void)
{
    return hwp_i2c1->ic_slv_data_nack_only.bit_field.nack;
}

__STATIC_INLINE void i2c1_nack_setf(uint8_t nack)
{
    hwp_i2c1->ic_slv_data_nack_only.bit_field.nack = nack;
}

__STATIC_INLINE uint32_t i2c1_ic_dma_cr_get(void)
{
    return hwp_i2c1->ic_dma_cr.val;
}

__STATIC_INLINE void i2c1_ic_dma_cr_set(uint32_t value)
{
    hwp_i2c1->ic_dma_cr.val = value;
}

__STATIC_INLINE void i2c1_ic_dma_cr_pack(uint8_t tdmae, uint8_t rdmae)
{
    hwp_i2c1->ic_dma_cr.val = (((uint32_t)tdmae << 1) | ((uint32_t)rdmae << 0));
}

__STATIC_INLINE void i2c1_ic_dma_cr_unpack(uint8_t* tdmae, uint8_t* rdmae)
{
    T_I2C1_IC_DMA_CR localVal = hwp_i2c1->ic_dma_cr;

    *tdmae = localVal.bit_field.tdmae;
    *rdmae = localVal.bit_field.rdmae;
}

__STATIC_INLINE uint8_t i2c1_tdmae_getf(void)
{
    return hwp_i2c1->ic_dma_cr.bit_field.tdmae;
}

__STATIC_INLINE void i2c1_tdmae_setf(uint8_t tdmae)
{
    hwp_i2c1->ic_dma_cr.bit_field.tdmae = tdmae;
}

__STATIC_INLINE uint8_t i2c1_rdmae_getf(void)
{
    return hwp_i2c1->ic_dma_cr.bit_field.rdmae;
}

__STATIC_INLINE void i2c1_rdmae_setf(uint8_t rdmae)
{
    hwp_i2c1->ic_dma_cr.bit_field.rdmae = rdmae;
}

__STATIC_INLINE uint32_t i2c1_ic_dma_tdlr_get(void)
{
    return hwp_i2c1->ic_dma_tdlr.val;
}

__STATIC_INLINE void i2c1_ic_dma_tdlr_set(uint32_t value)
{
    hwp_i2c1->ic_dma_tdlr.val = value;
}

__STATIC_INLINE void i2c1_ic_dma_tdlr_pack(uint8_t dmatdl)
{
    hwp_i2c1->ic_dma_tdlr.val = (((uint32_t)dmatdl << 0));
}

__STATIC_INLINE void i2c1_ic_dma_tdlr_unpack(uint8_t* dmatdl)
{
    T_I2C1_IC_DMA_TDLR localVal = hwp_i2c1->ic_dma_tdlr;

    *dmatdl = localVal.bit_field.dmatdl;
}

__STATIC_INLINE uint8_t i2c1_dmatdl_getf(void)
{
    return hwp_i2c1->ic_dma_tdlr.bit_field.dmatdl;
}

__STATIC_INLINE void i2c1_dmatdl_setf(uint8_t dmatdl)
{
    hwp_i2c1->ic_dma_tdlr.bit_field.dmatdl = dmatdl;
}

__STATIC_INLINE uint32_t i2c1_ic_dma_rdlr_get(void)
{
    return hwp_i2c1->ic_dma_rdlr.val;
}

__STATIC_INLINE void i2c1_ic_dma_rdlr_set(uint32_t value)
{
    hwp_i2c1->ic_dma_rdlr.val = value;
}

__STATIC_INLINE void i2c1_ic_dma_rdlr_pack(uint8_t dmardl)
{
    hwp_i2c1->ic_dma_rdlr.val = (((uint32_t)dmardl << 0));
}

__STATIC_INLINE void i2c1_ic_dma_rdlr_unpack(uint8_t* dmardl)
{
    T_I2C1_IC_DMA_RDLR localVal = hwp_i2c1->ic_dma_rdlr;

    *dmardl = localVal.bit_field.dmardl;
}

__STATIC_INLINE uint8_t i2c1_dmardl_getf(void)
{
    return hwp_i2c1->ic_dma_rdlr.bit_field.dmardl;
}

__STATIC_INLINE void i2c1_dmardl_setf(uint8_t dmardl)
{
    hwp_i2c1->ic_dma_rdlr.bit_field.dmardl = dmardl;
}

__STATIC_INLINE uint32_t i2c1_ic_sda_setup_get(void)
{
    return hwp_i2c1->ic_sda_setup.val;
}

__STATIC_INLINE void i2c1_ic_sda_setup_set(uint32_t value)
{
    hwp_i2c1->ic_sda_setup.val = value;
}

__STATIC_INLINE void i2c1_ic_sda_setup_pack(uint8_t sda_setup)
{
    hwp_i2c1->ic_sda_setup.val = (((uint32_t)sda_setup << 0));
}

__STATIC_INLINE void i2c1_ic_sda_setup_unpack(uint8_t* sda_setup)
{
    T_I2C1_IC_SDA_SETUP localVal = hwp_i2c1->ic_sda_setup;

    *sda_setup = localVal.bit_field.sda_setup;
}

__STATIC_INLINE uint8_t i2c1_sda_setup_getf(void)
{
    return hwp_i2c1->ic_sda_setup.bit_field.sda_setup;
}

__STATIC_INLINE void i2c1_sda_setup_setf(uint8_t sda_setup)
{
    hwp_i2c1->ic_sda_setup.bit_field.sda_setup = sda_setup;
}

__STATIC_INLINE uint32_t i2c1_ic_ack_general_call_get(void)
{
    return hwp_i2c1->ic_ack_general_call.val;
}

__STATIC_INLINE void i2c1_ic_ack_general_call_set(uint32_t value)
{
    hwp_i2c1->ic_ack_general_call.val = value;
}

__STATIC_INLINE void i2c1_ic_ack_general_call_pack(uint8_t ack_gen_call)
{
    hwp_i2c1->ic_ack_general_call.val = (((uint32_t)ack_gen_call << 0));
}

__STATIC_INLINE void i2c1_ic_ack_general_call_unpack(uint8_t* ack_gen_call)
{
    T_I2C1_IC_ACK_GENERAL_CALL localVal = hwp_i2c1->ic_ack_general_call;

    *ack_gen_call = localVal.bit_field.ack_gen_call;
}

__STATIC_INLINE uint8_t i2c1_ack_gen_call_getf(void)
{
    return hwp_i2c1->ic_ack_general_call.bit_field.ack_gen_call;
}

__STATIC_INLINE void i2c1_ack_gen_call_setf(uint8_t ack_gen_call)
{
    hwp_i2c1->ic_ack_general_call.bit_field.ack_gen_call = ack_gen_call;
}

__STATIC_INLINE uint32_t i2c1_ic_enable_status_get(void)
{
    return hwp_i2c1->ic_enable_status.val;
}

__STATIC_INLINE void i2c1_ic_enable_status_unpack(uint8_t* slv_rx_data_lost, uint8_t* slv_disabled_while_busy, uint8_t* ic_en)
{
    T_I2C1_IC_ENABLE_STATUS localVal = hwp_i2c1->ic_enable_status;

    *slv_rx_data_lost = localVal.bit_field.slv_rx_data_lost;
    *slv_disabled_while_busy = localVal.bit_field.slv_disabled_while_busy;
    *ic_en = localVal.bit_field.ic_en;
}

__STATIC_INLINE uint8_t i2c1_slv_rx_data_lost_getf(void)
{
    return hwp_i2c1->ic_enable_status.bit_field.slv_rx_data_lost;
}

__STATIC_INLINE uint8_t i2c1_slv_disabled_while_busy_getf(void)
{
    return hwp_i2c1->ic_enable_status.bit_field.slv_disabled_while_busy;
}

__STATIC_INLINE uint8_t i2c1_ic_en_getf(void)
{
    return hwp_i2c1->ic_enable_status.bit_field.ic_en;
}

__STATIC_INLINE uint32_t i2c1_ic_fs_spklen_get(void)
{
    return hwp_i2c1->ic_fs_spklen.val;
}

__STATIC_INLINE void i2c1_ic_fs_spklen_set(uint32_t value)
{
    hwp_i2c1->ic_fs_spklen.val = value;
}

__STATIC_INLINE void i2c1_ic_fs_spklen_pack(uint8_t fs_spklen)
{
    hwp_i2c1->ic_fs_spklen.val = (((uint32_t)fs_spklen << 0));
}

__STATIC_INLINE void i2c1_ic_fs_spklen_unpack(uint8_t* fs_spklen)
{
    T_I2C1_IC_FS_SPKLEN localVal = hwp_i2c1->ic_fs_spklen;

    *fs_spklen = localVal.bit_field.fs_spklen;
}

__STATIC_INLINE uint8_t i2c1_fs_spklen_getf(void)
{
    return hwp_i2c1->ic_fs_spklen.bit_field.fs_spklen;
}

__STATIC_INLINE void i2c1_fs_spklen_setf(uint8_t fs_spklen)
{
    hwp_i2c1->ic_fs_spklen.bit_field.fs_spklen = fs_spklen;
}

__STATIC_INLINE uint32_t i2c1_ic_hs_spklen_get(void)
{
    return hwp_i2c1->ic_hs_spklen.val;
}

__STATIC_INLINE void i2c1_ic_hs_spklen_set(uint32_t value)
{
    hwp_i2c1->ic_hs_spklen.val = value;
}

__STATIC_INLINE void i2c1_ic_hs_spklen_pack(uint8_t hs_spklen)
{
    hwp_i2c1->ic_hs_spklen.val = (((uint32_t)hs_spklen << 0));
}

__STATIC_INLINE void i2c1_ic_hs_spklen_unpack(uint8_t* hs_spklen)
{
    T_I2C1_IC_HS_SPKLEN localVal = hwp_i2c1->ic_hs_spklen;

    *hs_spklen = localVal.bit_field.hs_spklen;
}

__STATIC_INLINE uint8_t i2c1_hs_spklen_getf(void)
{
    return hwp_i2c1->ic_hs_spklen.bit_field.hs_spklen;
}

__STATIC_INLINE void i2c1_hs_spklen_setf(uint8_t hs_spklen)
{
    hwp_i2c1->ic_hs_spklen.bit_field.hs_spklen = hs_spklen;
}

__STATIC_INLINE uint32_t i2c1_ic_clr_restart_det_get(void)
{
    return hwp_i2c1->ic_clr_restart_det.val;
}

__STATIC_INLINE void i2c1_ic_clr_restart_det_unpack(uint8_t* clr_restart_det)
{
    T_I2C1_IC_CLR_RESTART_DET localVal = hwp_i2c1->ic_clr_restart_det;

    *clr_restart_det = localVal.bit_field.clr_restart_det;
}

__STATIC_INLINE uint8_t i2c1_clr_restart_det_getf(void)
{
    return hwp_i2c1->ic_clr_restart_det.bit_field.clr_restart_det;
}

__STATIC_INLINE uint32_t i2c1_ic_comp_param_1_get(void)
{
    return hwp_i2c1->ic_comp_param_1.val;
}

__STATIC_INLINE uint32_t i2c1_ic_comp_version_get(void)
{
    return hwp_i2c1->ic_comp_version.val;
}

__STATIC_INLINE void i2c1_ic_comp_version_unpack(uint32_t* comp_version)
{
    T_I2C1_IC_COMP_VERSION localVal = hwp_i2c1->ic_comp_version;

    *comp_version = localVal.bit_field.comp_version;
}

__STATIC_INLINE uint32_t i2c1_comp_version_getf(void)
{
    return hwp_i2c1->ic_comp_version.bit_field.comp_version;
}

__STATIC_INLINE uint32_t i2c1_ic_comp_type_get(void)
{
    return hwp_i2c1->ic_comp_type.val;
}

__STATIC_INLINE void i2c1_ic_comp_type_unpack(uint32_t* comp_type)
{
    T_I2C1_IC_COMP_TYPE localVal = hwp_i2c1->ic_comp_type;

    *comp_type = localVal.bit_field.comp_type;
}

__STATIC_INLINE uint32_t i2c1_comp_type_getf(void)
{
    return hwp_i2c1->ic_comp_type.bit_field.comp_type;
}
#endif


