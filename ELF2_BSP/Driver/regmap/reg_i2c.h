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
#ifndef __REG_I2C_H__
#define __REG_I2C_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//ic_con
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    master_mode :  1; /* 0: 0, This bit controls whether the DW_apb_i2c master is enabled.
        uint32_t                          speed :  2; /* 2: 1, These bits control at which speed the DW_apb_i2c operates.
        uint32_t             ic_10bitaddr_slave :  1; /* 3: 3, When acting as a slave, this bit controls whether the
        uint32_t            ic_10bitaddr_master :  1; /* 4: 4, If the I2C_DYNAMIC_TAR_UPDATE configuration parameter
        uint32_t                  ic_restart_en :  1; /* 5: 5, Determines whether RESTART conditions may be sent when
        uint32_t               ic_slave_disable :  1; /* 6: 6, This bit controls whether I2C has its slave disabled, which
        uint32_t           stop_det_ifaddressed :  1; /* 7: 7, In slave mode:
        uint32_t                  tx_empty_ctrl :  1; /* 8: 8, This bit controls the generation of the TX_EMPTY interrupt,
        uint32_t          rx_fifo_full_hld_ctrl :  1; /* 9: 9, This bit controls whether DW_apb_i2c should hold the bus
        uint32_t                     reserved_0 : 22; /*31:10,                             NA*/
    } bit_field;
} T_I2C_IC_CON;

//ic_tar
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            tar : 10; /* 9: 0, This is the target address for any master transaction. When
        uint32_t                    gc_or_start :  1; /*10:10, If bit 11 (SPECIAL) is set to 1 and bit 13 (Device-ID) is set to 0, then
        uint32_t                        special :  1; /*11:11, This bit indicates whether software performs a Device-ID, General
        uint32_t                     reserved_0 : 20; /*31:12,                             NA*/
    } bit_field;
} T_I2C_IC_TAR;

//ic_sar
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            sar : 10; /* 9: 0, The IC_SAR holds the slave address when the I2C is operating as a slave. For 7-bit
        uint32_t                     reserved_0 : 22; /*31:10,                             NA*/
    } bit_field;
} T_I2C_IC_SAR;

//ic_hs_maddr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         hs_mar :  3; /* 2: 0, This bit field holds the value of the I2C HS mode master code. HS-mode master
        uint32_t                     reserved_0 : 29; /*31: 3,                             NA*/
    } bit_field;
} T_I2C_IC_HS_MADDR;

//ic_data_cmd
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            dat :  8; /* 7: 0, This register contains the data to be transmitted or received on the I2C bus.
        uint32_t                            cmd :  1; /* 8: 8, This bit controls whether a read or a write is performed. This bit does not
        uint32_t                           stop :  1; /* 9: 9, This bit controls whether a STOP is issued after the byte is sent or received.
        uint32_t                        restart :  1; /*10:10, This bit controls whether a RESTART is issued before the byte is sent or
        uint32_t                first_data_byte :  1; /*11:11, Indicates the first data byte received after the address phase for receive
        uint32_t                     reserved_0 : 20; /*31:12,                             NA*/
    } bit_field;
} T_I2C_IC_DATA_CMD;

//ic_ss_scl_hcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    ss_scl_hcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C_IC_SS_SCL_HCNT;

//ic_ss_scl_lcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    ss_scl_lcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C_IC_SS_SCL_LCNT;

//ic_fs_scl_hcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    fs_scl_hcnt : 16; /*15: 0,  This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C_IC_FS_SCL_HCNT;

//ic_fs_scl_lcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    fs_scl_lcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C_IC_FS_SCL_LCNT;

//ic_hs_scl_hcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    hs_scl_hcnt : 16; /*15: 0,  This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C_IC_HS_SCL_HCNT;

//ic_hs_scl_lcnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    hs_scl_lcnt : 16; /*15: 0, This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_I2C_IC_HS_SCL_LCNT;

//ic_intr_stat
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  rx_under_stat :  1; /* 0: 0, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                   rx_over_stat :  1; /* 1: 1, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                   rx_full_stat :  1; /* 2: 2, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                   tx_over_stat :  1; /* 3: 3, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                  tx_empty_stat :  1; /* 4: 4, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                    rd_req_stat :  1; /* 5: 5, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                   tx_abrt_stat :  1; /* 6: 6, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                   rx_done_stat :  1; /* 7: 7, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                  activity_stat :  1; /* 8: 8, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                  stop_det_stat :  1; /* 9: 9, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                 start_det_stat :  1; /*10:10, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t                  gen_call_stat :  1; /*11:11, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t               restart_det_stat :  1; /*12:12, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of these
        uint32_t               mst_on_hold_stat :  1; /*13:13, See ��IC_RAW_INTR_STAT�� on page 186 for a detailed description of this bit.
        uint32_t          scl_stuck_at_low_stat :  1; /*14:14, See IC_RAW_INTR_STAT for a detailed description of this bit.
        uint32_t                     reserved_0 : 17; /*31:15,                             NA*/
    } bit_field;
} T_I2C_IC_INTR_STAT;

//ic_intr_mask
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  rx_under_mask :  1; /* 0: 0, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                   rx_over_mask :  1; /* 1: 1, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                   rx_full_mask :  1; /* 2: 2, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                   tx_over_mask :  1; /* 3: 3, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                  tx_empty_mask :  1; /* 4: 4, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                    rd_req_mask :  1; /* 5: 5, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                   tx_abrt_mask :  1; /* 6: 6, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                   rx_done_mask :  1; /* 7: 7, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                  activity_mask :  1; /* 8: 8, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                  stop_det_mask :  1; /* 9: 9, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                 start_det_mask :  1; /*10:10, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t                  gen_call_mask :  1; /*11:11, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t               restart_det_mask :  1; /*12:12, This bit masks the R_RESTART_DET interrupt status bit in the
        uint32_t               mst_on_hold_mask :  1; /*13:13, This bit masks the R_MST_ON_HOLD interrupt bit in the IC_INTR_STAT
        uint32_t          scl_stuck_at_low_mask :  1; /*14:14, This bit masks the R_SCL_STUCK_AT_LOW interrupt bit in the
        uint32_t                     reserved_0 : 17; /*31:15,                             NA*/
    } bit_field;
} T_I2C_IC_INTR_MASK;

//ic_raw_intr_stat
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   rx_under_raw :  1; /* 0: 0, Set if the processor attempts to read the receive buffer when it is empty by
        uint32_t                    rx_over_raw :  1; /* 1: 1, Set if the receive buffer is completely filled to IC_RX_BUFFER_DEPTH and
        uint32_t                    rx_full_raw :  1; /* 2: 2, Set when the receive buffer reaches or goes above the RX_TL threshold in the
        uint32_t                    tx_over_raw :  1; /* 3: 3, Set during transmit if the transmit buffer is filled to IC_TX_BUFFER_DEPTH
        uint32_t                   tx_empty_raw :  1; /* 4: 4, The behavior of the TX_EMPTY interrupt status differs based on the
        uint32_t                     rd_req_raw :  1; /* 5: 5, This bit is set to 1 when DW_apb_i2c is acting as a slave and another I2C
        uint32_t                    tx_abrt_raw :  1; /* 6: 6, This bit indicates if DW_apb_i2c, as an I2C transmitter, is unable to complete
        uint32_t                    rx_done_raw :  1; /* 7: 7, When the DW_apb_i2c is acting as a slave-transmitter, this bit is set to 1 if the
        uint32_t                   activity_raw :  1; /* 8: 8, This bit captures DW_apb_i2c activity and stays set until it is cleared. There
        uint32_t                   stop_det_raw :  1; /* 9: 9, Indicates whether a STOP condition has occurred on the I2C interface
        uint32_t                  start_det_raw :  1; /*10:10, Indicates whether a START or RESTART condition has occurred on the I2C
        uint32_t                   gen_call_raw :  1; /*11:11, Set only when a General Call address is received and it is acknowledged. It
        uint32_t                restart_det_raw :  1; /*12:12, Indicates whether a RESTART condition has occurred on the I2C interface
        uint32_t                mst_on_hold_raw :  1; /*13:13, Indicates whether a master is holding the bus and the Tx FIFO is empty.
        uint32_t           scl_stuck_at_low_raw :  1; /*14:14, Indicates whether the SCL Line is stuck at low for the
        uint32_t                     reserved_0 : 17; /*31:15,                             NA*/
    } bit_field;
} T_I2C_IC_RAW_INTR_STAT;

//ic_rx_tl
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rx_tl :  8; /* 7: 0, Receive FIFO Threshold Level
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C_IC_RX_TL;

//ic_tx_tl
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          tx_tl :  8; /* 7: 0, Transmit FIFO Threshold Level
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C_IC_TX_TL;

//ic_clr_intr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       clr_intr :  1; /* 0: 0, Read this register to clear the combined interrupt, all individual interrupts, and the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_INTR;

//ic_clr_rx_under
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_rx_under :  1; /* 0: 0, Read this register to clear the RX_UNDER interrupt (bit 0) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_RX_UNDER;

//ic_clr_rx_over
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_rx_over :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_RX_OVER;

//ic_clr_tx_over
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_tx_over :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_TX_OVER;

//ic_clr_rd_req
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     clr_rd_req :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_RD_REQ;

//ic_clr_tx_abrt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_tx_abrt :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_TX_ABRT;

//ic_clr_rx_done
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clr_rx_done :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_RX_DONE;

//ic_clr_activity
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_activity :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_ACTIVITY;

//ic_clr_stop_det
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_stop_det :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_STOP_DET;

//ic_clr_start_det
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  clr_start_det :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_START_DET;

//ic_clr_gen_call
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   clr_gen_call :  1; /* 0: 0, Read this register to clear the RX_OVER interrupt (bit 1) of the
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_GEN_CALL;

//ic_enable
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         enable :  1; /* 0: 0, Controls whether the DW_apb_i2c is enabled.
        uint32_t                          abort :  1; /* 1: 1, When set, the controller initiates the transfer abort.
        uint32_t                     reserved_0 : 30; /*31: 2,                             NA*/
    } bit_field;
} T_I2C_IC_ENABLE;

//ic_status
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       activity :  1; /* 0: 0, I2C Activity Status.
        uint32_t                           tfnf :  1; /* 1: 1, Transmit FIFO Not Full. Set when the transmit FIFO contains one or
        uint32_t                            tfe :  1; /* 2: 2, Transmit FIFO Completely Empty. When the transmit FIFO is
        uint32_t                           rfne :  1; /* 3: 3, Receive FIFO Not Empty. This bit is set when the receive FIFO
        uint32_t                            rff :  1; /* 4: 4, Receive FIFO Completely Full. When the receive FIFO is
        uint32_t                   mst_activity :  1; /* 5: 5, Master FSM Activity Status. When the Master Finite State Machine
        uint32_t                   slv_activity :  1; /* 6: 6, Slave FSM Activity Status. When the Slave Finite State Machine
        uint32_t         mst_hold_tx_fifo_empty :  1; /* 7: 7, If the IC_EMPTYFIFO_HOLD_MASTER_EN parameter is set to 1,
        uint32_t          mst_hold_rx_fifo_full :  1; /* 8: 8, This bit indicates the BUS Hold in Master mode due to Rx FIFO is
        uint32_t         slv_hold_tx_fifo_empty :  1; /* 9: 9, This bit indicates the BUS Hold in Slave mode for the Read request
        uint32_t          slv_hold_rx_fifo_full :  1; /*10:10, This bit indicates the BUS Hold in Slave mode due to the Rx FIFO
        uint32_t        sda_stuck_not_recovered :  1; /*11:11, This bit indicates that an SDA stuck at low is not recovered after the
        uint32_t                     reserved_1 :  4; /*15:12,                             NA*/
        uint32_t            smbus_quick_cmd_bit :  1; /*16:16, This bit indicates the R/W bit of the Quick command received. This
        uint32_t         smbus_slave_addr_valid :  1; /*17:17, This bit indicates whether the SMBus Slave address (ic_sar[6:0]) is
        uint32_t      smbus_slave_addr_resolved :  1; /*18:18, This bit indicates whether the SMBus Slave address (ic_sar[6:0]) is
        uint32_t           smbus_suspend_status :  1; /*19:19, This bit indicates whether the status of the input signal is
        uint32_t             smbus_alert_status :  1; /*20:20, This bit indicates whether the status of the input signal is
        uint32_t                     reserved_0 : 11; /*31:21,                             NA*/
    } bit_field;
} T_I2C_IC_STATUS;

//ic_txflr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txflr :  5; /* 4: 0, Transmit FIFO Level. Contains the number of valid data entries in the
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_I2C_IC_TXFLR;

//ic_rxflr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rxflr :  5; /* 4: 0, Receive FIFO Level. Contains the number of valid data entries in the
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_I2C_IC_RXFLR;

//ic_sda_hold
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 ic_sda_tx_hold : 16; /*15: 0, Sets the required SDA hold time in units of ic_clk period, when
        uint32_t                 ic_sda_rx_hold :  8; /*23:16, Sets the required SDA hold time in units of ic_clk period, when
        uint32_t                     reserved_0 :  8; /*31:24,                             NA*/
    } bit_field;
} T_I2C_IC_SDA_HOLD;

//ic_tx_abrt_source
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t              abrt_7baddr_noack :  1; /* 0: 0, �� 1: Master is in 7-bit addressing mode and
        uint32_t             abrt_10addr1_noack :  1; /* 1: 1, �� 1: Master is in 10-bit address mode and the
        uint32_t             abrt_10addr2_noack :  1; /* 2: 2, �� 1: Master is in 10-bit address mode and the
        uint32_t              abrt_txdata_noack :  1; /* 3: 3, �� 1: This is a master-mode only bit. Master
        uint32_t               abrt_gcall_noack :  1; /* 4: 4, �� 1: DW_apb_i2c in master mode sent a
        uint32_t                abrt_gcall_read :  1; /* 5: 5, �� 1: DW_apb_i2c in master mode sent a
        uint32_t                 abrt_hs_ackdet :  1; /* 6: 6, �� 1: Master is in High Speed mode and the
        uint32_t              abrt_sbyte_ackdet :  1; /* 7: 7, �� 1: Master has sent a START Byte and the
        uint32_t                abrt_hs_norstrt :  1; /* 8: 8, �� 1: The restart is disabled
        uint32_t             abrt_sbyte_norstrt :  1; /* 9: 9,  To clear Bit 9, the source of the
        uint32_t            abrt_10b_rd_norstrt :  1; /*10:10, �� 1: The restart is disabled
        uint32_t                abrt_master_dis :  1; /*11:11, �� 1: User tries to initiate a Master operation
        uint32_t                       arb_lost :  1; /*12:12, �� 1: Master has lost arbitration, or if
        uint32_t           abrt_slvflush_txfifo :  1; /*13:13, �� 1: Slave has received a read command and
        uint32_t               abrt_slv_arblost :  1; /*14:14, �� 1: Slave lost the bus while transmitting data
        uint32_t                abrt_slvrd_intx :  1; /*15:15, 1: When the processor side responds to a
        uint32_t                 abrt_user_abrt :  1; /*16:16, This is a master-mode-only bit. Master has
        uint32_t          abrt_sda_stuck_at_low :  1; /*17:17, This is a master-mode-only bit. Master detects
        uint32_t              abrt_device_noack :  1; /*18:18, This is a master-mode-only bit. Master initiates
        uint32_t      abrt_device_slvaddr_noack :  1; /*19:19, This is a master-mode-only bit. Master is
        uint32_t              abrt_device_write :  1; /*20:20, This is a master-mode-only bit. Master is
        uint32_t                     reserved_0 :  2; /*22:21,                             NA*/
        uint32_t                   tx_flush_cnt :  9; /*31:23, This field indicates the number of Tx FIFO data
    } bit_field;
} T_I2C_IC_TX_ABRT_SOURCE;

//ic_slv_data_nack_only
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           nack :  1; /* 0: 0,  Generate NACK. This NACK generation only occurs when DW_apb_i2c is a slavereceiver. If this register is set to a value of 1, it can only generate a NACK after a
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_SLV_DATA_NACK_ONLY;

//ic_dma_cr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rdmae :  1; /* 0: 0, Receive DMA Enable. This bit enables/disables the receive FIFO DMA channel.
        uint32_t                          tdmae :  1; /* 1: 1, Transmit DMA Enable. This bit enables/disables the transmit FIFO DMA channel.
        uint32_t                     reserved_0 : 30; /*31: 2,                             NA*/
    } bit_field;
} T_I2C_IC_DMA_CR;

//ic_dma_tdlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         dmatdl :  4; /* 3: 0, Transmit Data Level. This bit field controls the level at which a DMA
        uint32_t                     reserved_0 : 28; /*31: 4,                             NA*/
    } bit_field;
} T_I2C_IC_DMA_TDLR;

//ic_dma_rdlr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         dmardl :  4; /* 3: 0, Receive Data Level. This bit field controls the level at which a DMA request
        uint32_t                     reserved_0 : 28; /*31: 4,                             NA*/
    } bit_field;
} T_I2C_IC_DMA_RDLR;

//ic_sda_setup
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      sda_setup :  8; /* 7: 0, SDA Setup. It is recommended that if the required delay is 1000ns, then for an
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C_IC_SDA_SETUP;

//ic_ack_general_call
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ack_gen_call :  1; /* 0: 0, ACK General Call. When set to 1, DW_apb_i2c responds with a ACK (by
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_ACK_GENERAL_CALL;

//ic_enable_status
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          ic_en :  1; /* 0: 0, ic_en Status. This bit always reflects the value driven on the output
        uint32_t        slv_disabled_while_busy :  1; /* 1: 1, Slave Disabled While Busy (Transmit, Receive). This bit indicates if
        uint32_t               slv_rx_data_lost :  1; /* 2: 2, Slave Received Data Lost. This bit indicates if a Slave-Receiver
        uint32_t                     reserved_0 : 29; /*31: 3,                             NA*/
    } bit_field;
} T_I2C_IC_ENABLE_STATUS;

//ic_fs_spklen
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      fs_spklen :  8; /* 7: 0, This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C_IC_FS_SPKLEN;

//ic_hs_spklen
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      hs_spklen :  8; /* 7: 0, This register must be set before any I2C bus transaction can take place to
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_I2C_IC_HS_SPKLEN;

//ic_clr_restart_det
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                clr_restart_det :  1; /* 0: 0, Read this register to clear the RESTART_DET interrupt (bit 12) of
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2C_IC_CLR_RESTART_DET;

//ic_comp_param_1
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     reserved_0 : 32; /*31: 0,                             NA*/
    } bit_field;
} T_I2C_IC_COMP_PARAM_1;

//ic_comp_version
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   comp_version : 32; /*31: 0,                             NA*/
    } bit_field;
} T_I2C_IC_COMP_VERSION;

//ic_comp_type
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      comp_type : 32; /*31: 0,                             NA*/
    } bit_field;
} T_I2C_IC_COMP_TYPE;

//Registers Mapping to the same address

typedef struct
{
    volatile                    T_I2C_IC_CON                         ic_con; /*  0x0,    RW, 0x0000007F,                             NA*/
    volatile                    T_I2C_IC_TAR                         ic_tar; /*  0x4,    RW, 0x00000055,                             NA*/
    volatile                    T_I2C_IC_SAR                         ic_sar; /*  0x8,    RW, 0x00000055,                             NA*/
    volatile               T_I2C_IC_HS_MADDR                    ic_hs_maddr; /*  0xc,    RW, 0x00000001,                             NA*/
    volatile               T_I2C_IC_DATA_CMD                    ic_data_cmd; /* 0x10,    RW, 0x00000000,                             NA*/
    volatile            T_I2C_IC_SS_SCL_HCNT                 ic_ss_scl_hcnt; /* 0x14,    RW, 0x00000190,                             NA*/
    volatile            T_I2C_IC_SS_SCL_LCNT                 ic_ss_scl_lcnt; /* 0x18,    RW, 0x000001D6,                             NA*/
    volatile            T_I2C_IC_FS_SCL_HCNT                 ic_fs_scl_hcnt; /* 0x1c,    RW, 0x0000003C,                             NA*/
    volatile            T_I2C_IC_FS_SCL_LCNT                 ic_fs_scl_lcnt; /* 0x20,    RW, 0x00000082,                             NA*/
    volatile            T_I2C_IC_HS_SCL_HCNT                 ic_hs_scl_hcnt; /* 0x24,    RW, 0x00000006,                             NA*/
    volatile            T_I2C_IC_HS_SCL_LCNT                 ic_hs_scl_lcnt; /* 0x28,    RW, 0x00000010,                             NA*/
    volatile              T_I2C_IC_INTR_STAT                   ic_intr_stat; /* 0x2c,    RO, 0x00000000,                             NA*/
    volatile              T_I2C_IC_INTR_MASK                   ic_intr_mask; /* 0x30,    RW, 0x000008FF,                             NA*/
    volatile          T_I2C_IC_RAW_INTR_STAT               ic_raw_intr_stat; /* 0x34,    RO, 0x00000000,                             NA*/
    volatile                  T_I2C_IC_RX_TL                       ic_rx_tl; /* 0x38,    RW, 0x00000000,                             NA*/
    volatile                  T_I2C_IC_TX_TL                       ic_tx_tl; /* 0x3c,    RW, 0x00000000,                             NA*/
    volatile               T_I2C_IC_CLR_INTR                    ic_clr_intr; /* 0x40,    RO, 0x00000000,                             NA*/
    volatile           T_I2C_IC_CLR_RX_UNDER                ic_clr_rx_under; /* 0x44,    RO, 0x00000000,                             NA*/
    volatile            T_I2C_IC_CLR_RX_OVER                 ic_clr_rx_over; /* 0x48,    RO, 0x00000000,                             NA*/
    volatile            T_I2C_IC_CLR_TX_OVER                 ic_clr_tx_over; /* 0x4c,    RO, 0x00000000,                             NA*/
    volatile             T_I2C_IC_CLR_RD_REQ                  ic_clr_rd_req; /* 0x50,    RO, 0x00000000,                             NA*/
    volatile            T_I2C_IC_CLR_TX_ABRT                 ic_clr_tx_abrt; /* 0x54,    RO, 0x00000000,                             NA*/
    volatile            T_I2C_IC_CLR_RX_DONE                 ic_clr_rx_done; /* 0x58,    RO, 0x00000000,                             NA*/
    volatile           T_I2C_IC_CLR_ACTIVITY                ic_clr_activity; /* 0x5c,    RO, 0x00000000,                             NA*/
    volatile           T_I2C_IC_CLR_STOP_DET                ic_clr_stop_det; /* 0x60,    RO, 0x00000000,                             NA*/
    volatile          T_I2C_IC_CLR_START_DET               ic_clr_start_det; /* 0x64,    RO, 0x00000000,                             NA*/
    volatile           T_I2C_IC_CLR_GEN_CALL                ic_clr_gen_call; /* 0x68,    RO, 0x00000000,                             NA*/
    volatile                 T_I2C_IC_ENABLE                      ic_enable; /* 0x6c,    RW, 0x00000000,                             NA*/
    volatile                 T_I2C_IC_STATUS                      ic_status; /* 0x70,    RO, 0x00000006,                             NA*/
    volatile                  T_I2C_IC_TXFLR                       ic_txflr; /* 0x74,    RO, 0x00000000,                             NA*/
    volatile                  T_I2C_IC_RXFLR                       ic_rxflr; /* 0x78,    RO, 0x00000000,                             NA*/
    volatile               T_I2C_IC_SDA_HOLD                    ic_sda_hold; /* 0x7c,    RW, 0x00000001,                             NA*/
    volatile         T_I2C_IC_TX_ABRT_SOURCE              ic_tx_abrt_source; /* 0x80,    RO, 0x00000000,                             NA*/
    volatile     T_I2C_IC_SLV_DATA_NACK_ONLY          ic_slv_data_nack_only; /* 0x84,    RW, 0x00000000,                             NA*/
    volatile                 T_I2C_IC_DMA_CR                      ic_dma_cr; /* 0x88,    RW, 0x00000000,                             NA*/
    volatile               T_I2C_IC_DMA_TDLR                    ic_dma_tdlr; /* 0x8c,    RW, 0x00000000,                             NA*/
    volatile               T_I2C_IC_DMA_RDLR                    ic_dma_rdlr; /* 0x90,    RW, 0x00000000,                             NA*/
    volatile              T_I2C_IC_SDA_SETUP                   ic_sda_setup; /* 0x94,    RW, 0x00000064,                             NA*/
    volatile       T_I2C_IC_ACK_GENERAL_CALL            ic_ack_general_call; /* 0x98,    RW, 0x00000001,                             NA*/
    volatile          T_I2C_IC_ENABLE_STATUS               ic_enable_status; /* 0x9c,    RO, 0x00000000,                             NA*/
    volatile              T_I2C_IC_FS_SPKLEN                   ic_fs_spklen; /* 0xa0,    RW, 0x00000005,                             NA*/
    volatile              T_I2C_IC_HS_SPKLEN                   ic_hs_spklen; /* 0xa4,    RW, 0x00000001,                             NA*/
    volatile        T_I2C_IC_CLR_RESTART_DET             ic_clr_restart_det; /* 0xa8,    RO, 0x00000000,                             NA*/
    volatile                        uint32_t                 reserved_0[18];
    volatile           T_I2C_IC_COMP_PARAM_1                ic_comp_param_1; /* 0xf4,    RO, 0x00000000,                             NA*/
    volatile           T_I2C_IC_COMP_VERSION                ic_comp_version; /* 0xf8,    RO, 0x3230302A,                             NA*/
    volatile              T_I2C_IC_COMP_TYPE                   ic_comp_type; /* 0xfc,    RO, 0x44570140,                             NA*/
} T_HWP_I2C_T;

#define hwp_i2c ((T_HWP_I2C_T*)REG_I2C_BASE)


__STATIC_INLINE uint32_t i2c_ic_con_get(void)
{
    return hwp_i2c->ic_con.val;
}

__STATIC_INLINE void i2c_ic_con_set(uint32_t value)
{
    hwp_i2c->ic_con.val = value;
}

__STATIC_INLINE void i2c_ic_con_pack(uint8_t rx_fifo_full_hld_ctrl, uint8_t tx_empty_ctrl, uint8_t stop_det_ifaddressed, uint8_t ic_slave_disable, uint8_t ic_restart_en, uint8_t ic_10bitaddr_master, uint8_t ic_10bitaddr_slave, uint8_t speed, uint8_t master_mode)
{
    hwp_i2c->ic_con.val = (((uint32_t)rx_fifo_full_hld_ctrl << 9) | ((uint32_t)tx_empty_ctrl << 8) | ((uint32_t)stop_det_ifaddressed << 7) | ((uint32_t)ic_slave_disable << 6) | ((uint32_t)ic_restart_en << 5) | ((uint32_t)ic_10bitaddr_master << 4) | ((uint32_t)ic_10bitaddr_slave << 3) | ((uint32_t)speed << 1) | ((uint32_t)master_mode << 0));
}

__STATIC_INLINE void i2c_ic_con_unpack(uint8_t* rx_fifo_full_hld_ctrl, uint8_t* tx_empty_ctrl, uint8_t* stop_det_ifaddressed, uint8_t* ic_slave_disable, uint8_t* ic_restart_en, uint8_t* ic_10bitaddr_master, uint8_t* ic_10bitaddr_slave, uint8_t* speed, uint8_t* master_mode)
{
    T_I2C_IC_CON localVal = hwp_i2c->ic_con;

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

__STATIC_INLINE uint8_t i2c_rx_fifo_full_hld_ctrl_getf(void)
{
    return hwp_i2c->ic_con.bit_field.rx_fifo_full_hld_ctrl;
}

__STATIC_INLINE void i2c_rx_fifo_full_hld_ctrl_setf(uint8_t rx_fifo_full_hld_ctrl)
{
    hwp_i2c->ic_con.bit_field.rx_fifo_full_hld_ctrl = rx_fifo_full_hld_ctrl;
}

__STATIC_INLINE uint8_t i2c_tx_empty_ctrl_getf(void)
{
    return hwp_i2c->ic_con.bit_field.tx_empty_ctrl;
}

__STATIC_INLINE void i2c_tx_empty_ctrl_setf(uint8_t tx_empty_ctrl)
{
    hwp_i2c->ic_con.bit_field.tx_empty_ctrl = tx_empty_ctrl;
}

__STATIC_INLINE uint8_t i2c_stop_det_ifaddressed_getf(void)
{
    return hwp_i2c->ic_con.bit_field.stop_det_ifaddressed;
}

__STATIC_INLINE void i2c_stop_det_ifaddressed_setf(uint8_t stop_det_ifaddressed)
{
    hwp_i2c->ic_con.bit_field.stop_det_ifaddressed = stop_det_ifaddressed;
}

__STATIC_INLINE uint8_t i2c_ic_slave_disable_getf(void)
{
    return hwp_i2c->ic_con.bit_field.ic_slave_disable;
}

__STATIC_INLINE void i2c_ic_slave_disable_setf(uint8_t ic_slave_disable)
{
    hwp_i2c->ic_con.bit_field.ic_slave_disable = ic_slave_disable;
}

__STATIC_INLINE uint8_t i2c_ic_restart_en_getf(void)
{
    return hwp_i2c->ic_con.bit_field.ic_restart_en;
}

__STATIC_INLINE void i2c_ic_restart_en_setf(uint8_t ic_restart_en)
{
    hwp_i2c->ic_con.bit_field.ic_restart_en = ic_restart_en;
}

__STATIC_INLINE uint8_t i2c_ic_10bitaddr_master_getf(void)
{
    return hwp_i2c->ic_con.bit_field.ic_10bitaddr_master;
}

__STATIC_INLINE void i2c_ic_10bitaddr_master_setf(uint8_t ic_10bitaddr_master)
{
    hwp_i2c->ic_con.bit_field.ic_10bitaddr_master = ic_10bitaddr_master;
}

__STATIC_INLINE uint8_t i2c_ic_10bitaddr_slave_getf(void)
{
    return hwp_i2c->ic_con.bit_field.ic_10bitaddr_slave;
}

__STATIC_INLINE void i2c_ic_10bitaddr_slave_setf(uint8_t ic_10bitaddr_slave)
{
    hwp_i2c->ic_con.bit_field.ic_10bitaddr_slave = ic_10bitaddr_slave;
}

__STATIC_INLINE uint8_t i2c_speed_getf(void)
{
    return hwp_i2c->ic_con.bit_field.speed;
}

__STATIC_INLINE void i2c_speed_setf(uint8_t speed)
{
    hwp_i2c->ic_con.bit_field.speed = speed;
}

__STATIC_INLINE uint8_t i2c_master_mode_getf(void)
{
    return hwp_i2c->ic_con.bit_field.master_mode;
}

__STATIC_INLINE void i2c_master_mode_setf(uint8_t master_mode)
{
    hwp_i2c->ic_con.bit_field.master_mode = master_mode;
}

__STATIC_INLINE uint32_t i2c_ic_tar_get(void)
{
    return hwp_i2c->ic_tar.val;
}

__STATIC_INLINE void i2c_ic_tar_set(uint32_t value)
{
    hwp_i2c->ic_tar.val = value;
}

__STATIC_INLINE void i2c_ic_tar_pack(uint8_t special, uint8_t gc_or_start, uint16_t tar)
{
    hwp_i2c->ic_tar.val = (((uint32_t)special << 11) | ((uint32_t)gc_or_start << 10) | ((uint32_t)tar << 0));
}

__STATIC_INLINE void i2c_ic_tar_unpack(uint8_t* special, uint8_t* gc_or_start, uint16_t* tar)
{
    T_I2C_IC_TAR localVal = hwp_i2c->ic_tar;

    *special = localVal.bit_field.special;
    *gc_or_start = localVal.bit_field.gc_or_start;
    *tar = localVal.bit_field.tar;
}

__STATIC_INLINE uint8_t i2c_special_getf(void)
{
    return hwp_i2c->ic_tar.bit_field.special;
}

__STATIC_INLINE void i2c_special_setf(uint8_t special)
{
    hwp_i2c->ic_tar.bit_field.special = special;
}

__STATIC_INLINE uint8_t i2c_gc_or_start_getf(void)
{
    return hwp_i2c->ic_tar.bit_field.gc_or_start;
}

__STATIC_INLINE void i2c_gc_or_start_setf(uint8_t gc_or_start)
{
    hwp_i2c->ic_tar.bit_field.gc_or_start = gc_or_start;
}

__STATIC_INLINE uint16_t i2c_tar_getf(void)
{
    return hwp_i2c->ic_tar.bit_field.tar;
}

__STATIC_INLINE void i2c_tar_setf(uint16_t tar)
{
    hwp_i2c->ic_tar.bit_field.tar = tar;
}

__STATIC_INLINE uint32_t i2c_ic_sar_get(void)
{
    return hwp_i2c->ic_sar.val;
}

__STATIC_INLINE void i2c_ic_sar_set(uint32_t value)
{
    hwp_i2c->ic_sar.val = value;
}

__STATIC_INLINE void i2c_ic_sar_pack(uint16_t sar)
{
    hwp_i2c->ic_sar.val = (((uint32_t)sar << 0));
}

__STATIC_INLINE void i2c_ic_sar_unpack(uint16_t* sar)
{
    T_I2C_IC_SAR localVal = hwp_i2c->ic_sar;

    *sar = localVal.bit_field.sar;
}

__STATIC_INLINE uint16_t i2c_sar_getf(void)
{
    return hwp_i2c->ic_sar.bit_field.sar;
}

__STATIC_INLINE void i2c_sar_setf(uint16_t sar)
{
    hwp_i2c->ic_sar.bit_field.sar = sar;
}

__STATIC_INLINE uint32_t i2c_ic_hs_maddr_get(void)
{
    return hwp_i2c->ic_hs_maddr.val;
}

__STATIC_INLINE void i2c_ic_hs_maddr_set(uint32_t value)
{
    hwp_i2c->ic_hs_maddr.val = value;
}

__STATIC_INLINE void i2c_ic_hs_maddr_pack(uint8_t hs_mar)
{
    hwp_i2c->ic_hs_maddr.val = (((uint32_t)hs_mar << 0));
}

__STATIC_INLINE void i2c_ic_hs_maddr_unpack(uint8_t* hs_mar)
{
    T_I2C_IC_HS_MADDR localVal = hwp_i2c->ic_hs_maddr;

    *hs_mar = localVal.bit_field.hs_mar;
}

__STATIC_INLINE uint8_t i2c_hs_mar_getf(void)
{
    return hwp_i2c->ic_hs_maddr.bit_field.hs_mar;
}

__STATIC_INLINE void i2c_hs_mar_setf(uint8_t hs_mar)
{
    hwp_i2c->ic_hs_maddr.bit_field.hs_mar = hs_mar;
}

__STATIC_INLINE uint32_t i2c_ic_data_cmd_get(void)
{
    return hwp_i2c->ic_data_cmd.val;
}

__STATIC_INLINE void i2c_ic_data_cmd_set(uint32_t value)
{
    hwp_i2c->ic_data_cmd.val = value;
}

__STATIC_INLINE void i2c_ic_data_cmd_pack(uint8_t restart, uint8_t stop, uint8_t cmd, uint8_t dat)
{
    hwp_i2c->ic_data_cmd.val = (((uint32_t)restart << 10) | ((uint32_t)stop << 9) | ((uint32_t)cmd << 8) | ((uint32_t)dat << 0));
}

__STATIC_INLINE void i2c_ic_data_cmd_unpack(uint8_t* first_data_byte, uint8_t* dat)
{
    T_I2C_IC_DATA_CMD localVal = hwp_i2c->ic_data_cmd;

    *first_data_byte = localVal.bit_field.first_data_byte;
    *dat = localVal.bit_field.dat;
}

__STATIC_INLINE uint8_t i2c_first_data_byte_getf(void)
{
    return hwp_i2c->ic_data_cmd.bit_field.first_data_byte;
}

__STATIC_INLINE uint8_t i2c_dat_getf(void)
{
    return hwp_i2c->ic_data_cmd.bit_field.dat;
}

__STATIC_INLINE uint32_t i2c_ic_ss_scl_hcnt_get(void)
{
    return hwp_i2c->ic_ss_scl_hcnt.val;
}

__STATIC_INLINE void i2c_ic_ss_scl_hcnt_set(uint32_t value)
{
    hwp_i2c->ic_ss_scl_hcnt.val = value;
}

__STATIC_INLINE void i2c_ic_ss_scl_hcnt_pack(uint16_t ss_scl_hcnt)
{
    hwp_i2c->ic_ss_scl_hcnt.val = (((uint32_t)ss_scl_hcnt << 0));
}

__STATIC_INLINE void i2c_ic_ss_scl_hcnt_unpack(uint16_t* ss_scl_hcnt)
{
    T_I2C_IC_SS_SCL_HCNT localVal = hwp_i2c->ic_ss_scl_hcnt;

    *ss_scl_hcnt = localVal.bit_field.ss_scl_hcnt;
}

__STATIC_INLINE uint16_t i2c_ss_scl_hcnt_getf(void)
{
    return hwp_i2c->ic_ss_scl_hcnt.bit_field.ss_scl_hcnt;
}

__STATIC_INLINE void i2c_ss_scl_hcnt_setf(uint16_t ss_scl_hcnt)
{
    hwp_i2c->ic_ss_scl_hcnt.bit_field.ss_scl_hcnt = ss_scl_hcnt;
}

__STATIC_INLINE uint32_t i2c_ic_ss_scl_lcnt_get(void)
{
    return hwp_i2c->ic_ss_scl_lcnt.val;
}

__STATIC_INLINE void i2c_ic_ss_scl_lcnt_set(uint32_t value)
{
    hwp_i2c->ic_ss_scl_lcnt.val = value;
}

__STATIC_INLINE void i2c_ic_ss_scl_lcnt_pack(uint16_t ss_scl_lcnt)
{
    hwp_i2c->ic_ss_scl_lcnt.val = (((uint32_t)ss_scl_lcnt << 0));
}

__STATIC_INLINE void i2c_ic_ss_scl_lcnt_unpack(uint16_t* ss_scl_lcnt)
{
    T_I2C_IC_SS_SCL_LCNT localVal = hwp_i2c->ic_ss_scl_lcnt;

    *ss_scl_lcnt = localVal.bit_field.ss_scl_lcnt;
}

__STATIC_INLINE uint16_t i2c_ss_scl_lcnt_getf(void)
{
    return hwp_i2c->ic_ss_scl_lcnt.bit_field.ss_scl_lcnt;
}

__STATIC_INLINE void i2c_ss_scl_lcnt_setf(uint16_t ss_scl_lcnt)
{
    hwp_i2c->ic_ss_scl_lcnt.bit_field.ss_scl_lcnt = ss_scl_lcnt;
}

__STATIC_INLINE uint32_t i2c_ic_fs_scl_hcnt_get(void)
{
    return hwp_i2c->ic_fs_scl_hcnt.val;
}

__STATIC_INLINE void i2c_ic_fs_scl_hcnt_set(uint32_t value)
{
    hwp_i2c->ic_fs_scl_hcnt.val = value;
}

__STATIC_INLINE void i2c_ic_fs_scl_hcnt_pack(uint16_t fs_scl_hcnt)
{
    hwp_i2c->ic_fs_scl_hcnt.val = (((uint32_t)fs_scl_hcnt << 0));
}

__STATIC_INLINE void i2c_ic_fs_scl_hcnt_unpack(uint16_t* fs_scl_hcnt)
{
    T_I2C_IC_FS_SCL_HCNT localVal = hwp_i2c->ic_fs_scl_hcnt;

    *fs_scl_hcnt = localVal.bit_field.fs_scl_hcnt;
}

__STATIC_INLINE uint16_t i2c_fs_scl_hcnt_getf(void)
{
    return hwp_i2c->ic_fs_scl_hcnt.bit_field.fs_scl_hcnt;
}

__STATIC_INLINE void i2c_fs_scl_hcnt_setf(uint16_t fs_scl_hcnt)
{
    hwp_i2c->ic_fs_scl_hcnt.bit_field.fs_scl_hcnt = fs_scl_hcnt;
}

__STATIC_INLINE uint32_t i2c_ic_fs_scl_lcnt_get(void)
{
    return hwp_i2c->ic_fs_scl_lcnt.val;
}

__STATIC_INLINE void i2c_ic_fs_scl_lcnt_set(uint32_t value)
{
    hwp_i2c->ic_fs_scl_lcnt.val = value;
}

__STATIC_INLINE void i2c_ic_fs_scl_lcnt_pack(uint16_t fs_scl_lcnt)
{
    hwp_i2c->ic_fs_scl_lcnt.val = (((uint32_t)fs_scl_lcnt << 0));
}

__STATIC_INLINE void i2c_ic_fs_scl_lcnt_unpack(uint16_t* fs_scl_lcnt)
{
    T_I2C_IC_FS_SCL_LCNT localVal = hwp_i2c->ic_fs_scl_lcnt;

    *fs_scl_lcnt = localVal.bit_field.fs_scl_lcnt;
}

__STATIC_INLINE uint16_t i2c_fs_scl_lcnt_getf(void)
{
    return hwp_i2c->ic_fs_scl_lcnt.bit_field.fs_scl_lcnt;
}

__STATIC_INLINE void i2c_fs_scl_lcnt_setf(uint16_t fs_scl_lcnt)
{
    hwp_i2c->ic_fs_scl_lcnt.bit_field.fs_scl_lcnt = fs_scl_lcnt;
}

__STATIC_INLINE uint32_t i2c_ic_hs_scl_hcnt_get(void)
{
    return hwp_i2c->ic_hs_scl_hcnt.val;
}

__STATIC_INLINE void i2c_ic_hs_scl_hcnt_set(uint32_t value)
{
    hwp_i2c->ic_hs_scl_hcnt.val = value;
}

__STATIC_INLINE void i2c_ic_hs_scl_hcnt_pack(uint16_t hs_scl_hcnt)
{
    hwp_i2c->ic_hs_scl_hcnt.val = (((uint32_t)hs_scl_hcnt << 0));
}

__STATIC_INLINE void i2c_ic_hs_scl_hcnt_unpack(uint16_t* hs_scl_hcnt)
{
    T_I2C_IC_HS_SCL_HCNT localVal = hwp_i2c->ic_hs_scl_hcnt;

    *hs_scl_hcnt = localVal.bit_field.hs_scl_hcnt;
}

__STATIC_INLINE uint16_t i2c_hs_scl_hcnt_getf(void)
{
    return hwp_i2c->ic_hs_scl_hcnt.bit_field.hs_scl_hcnt;
}

__STATIC_INLINE void i2c_hs_scl_hcnt_setf(uint16_t hs_scl_hcnt)
{
    hwp_i2c->ic_hs_scl_hcnt.bit_field.hs_scl_hcnt = hs_scl_hcnt;
}

__STATIC_INLINE uint32_t i2c_ic_hs_scl_lcnt_get(void)
{
    return hwp_i2c->ic_hs_scl_lcnt.val;
}

__STATIC_INLINE void i2c_ic_hs_scl_lcnt_set(uint32_t value)
{
    hwp_i2c->ic_hs_scl_lcnt.val = value;
}

__STATIC_INLINE void i2c_ic_hs_scl_lcnt_pack(uint16_t hs_scl_lcnt)
{
    hwp_i2c->ic_hs_scl_lcnt.val = (((uint32_t)hs_scl_lcnt << 0));
}

__STATIC_INLINE void i2c_ic_hs_scl_lcnt_unpack(uint16_t* hs_scl_lcnt)
{
    T_I2C_IC_HS_SCL_LCNT localVal = hwp_i2c->ic_hs_scl_lcnt;

    *hs_scl_lcnt = localVal.bit_field.hs_scl_lcnt;
}

__STATIC_INLINE uint16_t i2c_hs_scl_lcnt_getf(void)
{
    return hwp_i2c->ic_hs_scl_lcnt.bit_field.hs_scl_lcnt;
}

__STATIC_INLINE void i2c_hs_scl_lcnt_setf(uint16_t hs_scl_lcnt)
{
    hwp_i2c->ic_hs_scl_lcnt.bit_field.hs_scl_lcnt = hs_scl_lcnt;
}

__STATIC_INLINE uint32_t i2c_ic_intr_stat_get(void)
{
    return hwp_i2c->ic_intr_stat.val;
}

__STATIC_INLINE void i2c_ic_intr_stat_unpack(uint8_t* scl_stuck_at_low_stat, uint8_t* mst_on_hold_stat, uint8_t* restart_det_stat, uint8_t* gen_call_stat, uint8_t* start_det_stat, uint8_t* stop_det_stat, uint8_t* activity_stat, uint8_t* rx_done_stat, uint8_t* tx_abrt_stat, uint8_t* rd_req_stat, uint8_t* tx_empty_stat, uint8_t* tx_over_stat, uint8_t* rx_full_stat, uint8_t* rx_over_stat, uint8_t* rx_under_stat)
{
    T_I2C_IC_INTR_STAT localVal = hwp_i2c->ic_intr_stat;

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

__STATIC_INLINE uint8_t i2c_scl_stuck_at_low_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.scl_stuck_at_low_stat;
}

__STATIC_INLINE uint8_t i2c_mst_on_hold_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.mst_on_hold_stat;
}

__STATIC_INLINE uint8_t i2c_restart_det_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.restart_det_stat;
}

__STATIC_INLINE uint8_t i2c_gen_call_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.gen_call_stat;
}

__STATIC_INLINE uint8_t i2c_start_det_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.start_det_stat;
}

__STATIC_INLINE uint8_t i2c_stop_det_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.stop_det_stat;
}

__STATIC_INLINE uint8_t i2c_activity_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.activity_stat;
}

__STATIC_INLINE uint8_t i2c_rx_done_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.rx_done_stat;
}

__STATIC_INLINE uint8_t i2c_tx_abrt_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.tx_abrt_stat;
}

__STATIC_INLINE uint8_t i2c_rd_req_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.rd_req_stat;
}

__STATIC_INLINE uint8_t i2c_tx_empty_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.tx_empty_stat;
}

__STATIC_INLINE uint8_t i2c_tx_over_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.tx_over_stat;
}

__STATIC_INLINE uint8_t i2c_rx_full_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.rx_full_stat;
}

__STATIC_INLINE uint8_t i2c_rx_over_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.rx_over_stat;
}

__STATIC_INLINE uint8_t i2c_rx_under_stat_getf(void)
{
    return hwp_i2c->ic_intr_stat.bit_field.rx_under_stat;
}

__STATIC_INLINE uint32_t i2c_ic_intr_mask_get(void)
{
    return hwp_i2c->ic_intr_mask.val;
}

__STATIC_INLINE void i2c_ic_intr_mask_set(uint32_t value)
{
    hwp_i2c->ic_intr_mask.val = value;
}

__STATIC_INLINE void i2c_ic_intr_mask_pack(uint8_t restart_det_mask, uint8_t gen_call_mask, uint8_t start_det_mask, uint8_t stop_det_mask, uint8_t activity_mask, uint8_t rx_done_mask, uint8_t tx_abrt_mask, uint8_t rd_req_mask, uint8_t tx_empty_mask, uint8_t tx_over_mask, uint8_t rx_full_mask, uint8_t rx_over_mask, uint8_t rx_under_mask)
{
    hwp_i2c->ic_intr_mask.val = (((uint32_t)restart_det_mask << 12) | ((uint32_t)gen_call_mask << 11) | ((uint32_t)start_det_mask << 10) | ((uint32_t)stop_det_mask << 9) | ((uint32_t)activity_mask << 8) | ((uint32_t)rx_done_mask << 7) | ((uint32_t)tx_abrt_mask << 6) | ((uint32_t)rd_req_mask << 5) | ((uint32_t)tx_empty_mask << 4) | ((uint32_t)tx_over_mask << 3) | ((uint32_t)rx_full_mask << 2) | ((uint32_t)rx_over_mask << 1) | ((uint32_t)rx_under_mask << 0));
}

__STATIC_INLINE void i2c_ic_intr_mask_unpack(uint8_t* scl_stuck_at_low_mask, uint8_t* mst_on_hold_mask, uint8_t* restart_det_mask, uint8_t* gen_call_mask, uint8_t* start_det_mask, uint8_t* stop_det_mask, uint8_t* activity_mask, uint8_t* rx_done_mask, uint8_t* tx_abrt_mask, uint8_t* rd_req_mask, uint8_t* tx_empty_mask, uint8_t* tx_over_mask, uint8_t* rx_full_mask, uint8_t* rx_over_mask, uint8_t* rx_under_mask)
{
    T_I2C_IC_INTR_MASK localVal = hwp_i2c->ic_intr_mask;

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

__STATIC_INLINE uint8_t i2c_scl_stuck_at_low_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.scl_stuck_at_low_mask;
}

__STATIC_INLINE uint8_t i2c_mst_on_hold_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.mst_on_hold_mask;
}

__STATIC_INLINE uint8_t i2c_restart_det_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.restart_det_mask;
}

__STATIC_INLINE void i2c_restart_det_mask_setf(uint8_t restart_det_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.restart_det_mask = restart_det_mask;
}

__STATIC_INLINE uint8_t i2c_gen_call_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.gen_call_mask;
}

__STATIC_INLINE void i2c_gen_call_mask_setf(uint8_t gen_call_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.gen_call_mask = gen_call_mask;
}

__STATIC_INLINE uint8_t i2c_start_det_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.start_det_mask;
}

__STATIC_INLINE void i2c_start_det_mask_setf(uint8_t start_det_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.start_det_mask = start_det_mask;
}

__STATIC_INLINE uint8_t i2c_stop_det_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.stop_det_mask;
}

__STATIC_INLINE void i2c_stop_det_mask_setf(uint8_t stop_det_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.stop_det_mask = stop_det_mask;
}

__STATIC_INLINE uint8_t i2c_activity_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.activity_mask;
}

__STATIC_INLINE void i2c_activity_mask_setf(uint8_t activity_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.activity_mask = activity_mask;
}

__STATIC_INLINE uint8_t i2c_rx_done_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.rx_done_mask;
}

__STATIC_INLINE void i2c_rx_done_mask_setf(uint8_t rx_done_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.rx_done_mask = rx_done_mask;
}

__STATIC_INLINE uint8_t i2c_tx_abrt_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.tx_abrt_mask;
}

__STATIC_INLINE void i2c_tx_abrt_mask_setf(uint8_t tx_abrt_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.tx_abrt_mask = tx_abrt_mask;
}

__STATIC_INLINE uint8_t i2c_rd_req_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.rd_req_mask;
}

__STATIC_INLINE void i2c_rd_req_mask_setf(uint8_t rd_req_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.rd_req_mask = rd_req_mask;
}

__STATIC_INLINE uint8_t i2c_tx_empty_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.tx_empty_mask;
}

__STATIC_INLINE void i2c_tx_empty_mask_setf(uint8_t tx_empty_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.tx_empty_mask = tx_empty_mask;
}

__STATIC_INLINE uint8_t i2c_tx_over_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.tx_over_mask;
}

__STATIC_INLINE void i2c_tx_over_mask_setf(uint8_t tx_over_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.tx_over_mask = tx_over_mask;
}

__STATIC_INLINE uint8_t i2c_rx_full_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.rx_full_mask;
}

__STATIC_INLINE void i2c_rx_full_mask_setf(uint8_t rx_full_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.rx_full_mask = rx_full_mask;
}

__STATIC_INLINE uint8_t i2c_rx_over_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.rx_over_mask;
}

__STATIC_INLINE void i2c_rx_over_mask_setf(uint8_t rx_over_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.rx_over_mask = rx_over_mask;
}

__STATIC_INLINE uint8_t i2c_rx_under_mask_getf(void)
{
    return hwp_i2c->ic_intr_mask.bit_field.rx_under_mask;
}

__STATIC_INLINE void i2c_rx_under_mask_setf(uint8_t rx_under_mask)
{
    hwp_i2c->ic_intr_mask.bit_field.rx_under_mask = rx_under_mask;
}

__STATIC_INLINE uint32_t i2c_ic_raw_intr_stat_get(void)
{
    return hwp_i2c->ic_raw_intr_stat.val;
}

__STATIC_INLINE void i2c_ic_raw_intr_stat_unpack(uint8_t* scl_stuck_at_low_raw, uint8_t* mst_on_hold_raw, uint8_t* restart_det_raw, uint8_t* gen_call_raw, uint8_t* start_det_raw, uint8_t* stop_det_raw, uint8_t* activity_raw, uint8_t* rx_done_raw, uint8_t* tx_abrt_raw, uint8_t* rd_req_raw, uint8_t* tx_empty_raw, uint8_t* tx_over_raw, uint8_t* rx_full_raw, uint8_t* rx_over_raw, uint8_t* rx_under_raw)
{
    T_I2C_IC_RAW_INTR_STAT localVal = hwp_i2c->ic_raw_intr_stat;

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

__STATIC_INLINE uint8_t i2c_scl_stuck_at_low_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.scl_stuck_at_low_raw;
}

__STATIC_INLINE uint8_t i2c_mst_on_hold_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.mst_on_hold_raw;
}

__STATIC_INLINE uint8_t i2c_restart_det_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.restart_det_raw;
}

__STATIC_INLINE uint8_t i2c_gen_call_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.gen_call_raw;
}

__STATIC_INLINE uint8_t i2c_start_det_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.start_det_raw;
}

__STATIC_INLINE uint8_t i2c_stop_det_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.stop_det_raw;
}

__STATIC_INLINE uint8_t i2c_activity_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.activity_raw;
}

__STATIC_INLINE uint8_t i2c_rx_done_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.rx_done_raw;
}

__STATIC_INLINE uint8_t i2c_tx_abrt_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.tx_abrt_raw;
}

__STATIC_INLINE uint8_t i2c_rd_req_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.rd_req_raw;
}

__STATIC_INLINE uint8_t i2c_tx_empty_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.tx_empty_raw;
}

__STATIC_INLINE uint8_t i2c_tx_over_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.tx_over_raw;
}

__STATIC_INLINE uint8_t i2c_rx_full_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.rx_full_raw;
}

__STATIC_INLINE uint8_t i2c_rx_over_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.rx_over_raw;
}

__STATIC_INLINE uint8_t i2c_rx_under_raw_getf(void)
{
    return hwp_i2c->ic_raw_intr_stat.bit_field.rx_under_raw;
}

__STATIC_INLINE uint32_t i2c_ic_rx_tl_get(void)
{
    return hwp_i2c->ic_rx_tl.val;
}

__STATIC_INLINE void i2c_ic_rx_tl_set(uint32_t value)
{
    hwp_i2c->ic_rx_tl.val = value;
}

__STATIC_INLINE void i2c_ic_rx_tl_pack(uint8_t rx_tl)
{
    hwp_i2c->ic_rx_tl.val = (((uint32_t)rx_tl << 0));
}

__STATIC_INLINE void i2c_ic_rx_tl_unpack(uint8_t* rx_tl)
{
    T_I2C_IC_RX_TL localVal = hwp_i2c->ic_rx_tl;

    *rx_tl = localVal.bit_field.rx_tl;
}

__STATIC_INLINE uint8_t i2c_rx_tl_getf(void)
{
    return hwp_i2c->ic_rx_tl.bit_field.rx_tl;
}

__STATIC_INLINE void i2c_rx_tl_setf(uint8_t rx_tl)
{
    hwp_i2c->ic_rx_tl.bit_field.rx_tl = rx_tl;
}

__STATIC_INLINE uint32_t i2c_ic_tx_tl_get(void)
{
    return hwp_i2c->ic_tx_tl.val;
}

__STATIC_INLINE void i2c_ic_tx_tl_set(uint32_t value)
{
    hwp_i2c->ic_tx_tl.val = value;
}

__STATIC_INLINE void i2c_ic_tx_tl_pack(uint8_t tx_tl)
{
    hwp_i2c->ic_tx_tl.val = (((uint32_t)tx_tl << 0));
}

__STATIC_INLINE void i2c_ic_tx_tl_unpack(uint8_t* tx_tl)
{
    T_I2C_IC_TX_TL localVal = hwp_i2c->ic_tx_tl;

    *tx_tl = localVal.bit_field.tx_tl;
}

__STATIC_INLINE uint8_t i2c_tx_tl_getf(void)
{
    return hwp_i2c->ic_tx_tl.bit_field.tx_tl;
}

__STATIC_INLINE void i2c_tx_tl_setf(uint8_t tx_tl)
{
    hwp_i2c->ic_tx_tl.bit_field.tx_tl = tx_tl;
}

__STATIC_INLINE uint32_t i2c_ic_clr_intr_get(void)
{
    return hwp_i2c->ic_clr_intr.val;
}

__STATIC_INLINE void i2c_ic_clr_intr_unpack(uint8_t* clr_intr)
{
    T_I2C_IC_CLR_INTR localVal = hwp_i2c->ic_clr_intr;

    *clr_intr = localVal.bit_field.clr_intr;
}

__STATIC_INLINE uint8_t i2c_clr_intr_getf(void)
{
    return hwp_i2c->ic_clr_intr.bit_field.clr_intr;
}

__STATIC_INLINE uint32_t i2c_ic_clr_rx_under_get(void)
{
    return hwp_i2c->ic_clr_rx_under.val;
}

__STATIC_INLINE void i2c_ic_clr_rx_under_unpack(uint8_t* clr_rx_under)
{
    T_I2C_IC_CLR_RX_UNDER localVal = hwp_i2c->ic_clr_rx_under;

    *clr_rx_under = localVal.bit_field.clr_rx_under;
}

__STATIC_INLINE uint8_t i2c_clr_rx_under_getf(void)
{
    return hwp_i2c->ic_clr_rx_under.bit_field.clr_rx_under;
}

__STATIC_INLINE uint32_t i2c_ic_clr_rx_over_get(void)
{
    return hwp_i2c->ic_clr_rx_over.val;
}

__STATIC_INLINE void i2c_ic_clr_rx_over_unpack(uint8_t* clr_rx_over)
{
    T_I2C_IC_CLR_RX_OVER localVal = hwp_i2c->ic_clr_rx_over;

    *clr_rx_over = localVal.bit_field.clr_rx_over;
}

__STATIC_INLINE uint8_t i2c_clr_rx_over_getf(void)
{
    return hwp_i2c->ic_clr_rx_over.bit_field.clr_rx_over;
}

__STATIC_INLINE uint32_t i2c_ic_clr_tx_over_get(void)
{
    return hwp_i2c->ic_clr_tx_over.val;
}

__STATIC_INLINE void i2c_ic_clr_tx_over_unpack(uint8_t* clr_tx_over)
{
    T_I2C_IC_CLR_TX_OVER localVal = hwp_i2c->ic_clr_tx_over;

    *clr_tx_over = localVal.bit_field.clr_tx_over;
}

__STATIC_INLINE uint8_t i2c_clr_tx_over_getf(void)
{
    return hwp_i2c->ic_clr_tx_over.bit_field.clr_tx_over;
}

__STATIC_INLINE uint32_t i2c_ic_clr_rd_req_get(void)
{
    return hwp_i2c->ic_clr_rd_req.val;
}

__STATIC_INLINE void i2c_ic_clr_rd_req_unpack(uint8_t* clr_rd_req)
{
    T_I2C_IC_CLR_RD_REQ localVal = hwp_i2c->ic_clr_rd_req;

    *clr_rd_req = localVal.bit_field.clr_rd_req;
}

__STATIC_INLINE uint8_t i2c_clr_rd_req_getf(void)
{
    return hwp_i2c->ic_clr_rd_req.bit_field.clr_rd_req;
}

__STATIC_INLINE uint32_t i2c_ic_clr_tx_abrt_get(void)
{
    return hwp_i2c->ic_clr_tx_abrt.val;
}

__STATIC_INLINE void i2c_ic_clr_tx_abrt_unpack(uint8_t* clr_tx_abrt)
{
    T_I2C_IC_CLR_TX_ABRT localVal = hwp_i2c->ic_clr_tx_abrt;

    *clr_tx_abrt = localVal.bit_field.clr_tx_abrt;
}

__STATIC_INLINE uint8_t i2c_clr_tx_abrt_getf(void)
{
    return hwp_i2c->ic_clr_tx_abrt.bit_field.clr_tx_abrt;
}

__STATIC_INLINE uint32_t i2c_ic_clr_rx_done_get(void)
{
    return hwp_i2c->ic_clr_rx_done.val;
}

__STATIC_INLINE void i2c_ic_clr_rx_done_unpack(uint8_t* clr_rx_done)
{
    T_I2C_IC_CLR_RX_DONE localVal = hwp_i2c->ic_clr_rx_done;

    *clr_rx_done = localVal.bit_field.clr_rx_done;
}

__STATIC_INLINE uint8_t i2c_clr_rx_done_getf(void)
{
    return hwp_i2c->ic_clr_rx_done.bit_field.clr_rx_done;
}

__STATIC_INLINE uint32_t i2c_ic_clr_activity_get(void)
{
    return hwp_i2c->ic_clr_activity.val;
}

__STATIC_INLINE void i2c_ic_clr_activity_unpack(uint8_t* clr_activity)
{
    T_I2C_IC_CLR_ACTIVITY localVal = hwp_i2c->ic_clr_activity;

    *clr_activity = localVal.bit_field.clr_activity;
}

__STATIC_INLINE uint8_t i2c_clr_activity_getf(void)
{
    return hwp_i2c->ic_clr_activity.bit_field.clr_activity;
}

__STATIC_INLINE uint32_t i2c_ic_clr_stop_det_get(void)
{
    return hwp_i2c->ic_clr_stop_det.val;
}

__STATIC_INLINE void i2c_ic_clr_stop_det_unpack(uint8_t* clr_stop_det)
{
    T_I2C_IC_CLR_STOP_DET localVal = hwp_i2c->ic_clr_stop_det;

    *clr_stop_det = localVal.bit_field.clr_stop_det;
}

__STATIC_INLINE uint8_t i2c_clr_stop_det_getf(void)
{
    return hwp_i2c->ic_clr_stop_det.bit_field.clr_stop_det;
}

__STATIC_INLINE uint32_t i2c_ic_clr_start_det_get(void)
{
    return hwp_i2c->ic_clr_start_det.val;
}

__STATIC_INLINE void i2c_ic_clr_start_det_unpack(uint8_t* clr_start_det)
{
    T_I2C_IC_CLR_START_DET localVal = hwp_i2c->ic_clr_start_det;

    *clr_start_det = localVal.bit_field.clr_start_det;
}

__STATIC_INLINE uint8_t i2c_clr_start_det_getf(void)
{
    return hwp_i2c->ic_clr_start_det.bit_field.clr_start_det;
}

__STATIC_INLINE uint32_t i2c_ic_clr_gen_call_get(void)
{
    return hwp_i2c->ic_clr_gen_call.val;
}

__STATIC_INLINE void i2c_ic_clr_gen_call_unpack(uint8_t* clr_gen_call)
{
    T_I2C_IC_CLR_GEN_CALL localVal = hwp_i2c->ic_clr_gen_call;

    *clr_gen_call = localVal.bit_field.clr_gen_call;
}

__STATIC_INLINE uint8_t i2c_clr_gen_call_getf(void)
{
    return hwp_i2c->ic_clr_gen_call.bit_field.clr_gen_call;
}

__STATIC_INLINE uint32_t i2c_ic_enable_get(void)
{
    return hwp_i2c->ic_enable.val;
}

__STATIC_INLINE void i2c_ic_enable_set(uint32_t value)
{
    hwp_i2c->ic_enable.val = value;
}

__STATIC_INLINE void i2c_ic_enable_pack(uint8_t abort, uint8_t enable)
{
    hwp_i2c->ic_enable.val = (((uint32_t)abort << 1) | ((uint32_t)enable << 0));
}

__STATIC_INLINE void i2c_ic_enable_unpack(uint8_t* abort, uint8_t* enable)
{
    T_I2C_IC_ENABLE localVal = hwp_i2c->ic_enable;

    *abort = localVal.bit_field.abort;
    *enable = localVal.bit_field.enable;
}

__STATIC_INLINE uint8_t i2c_abort_getf(void)
{
    return hwp_i2c->ic_enable.bit_field.abort;
}

__STATIC_INLINE void i2c_abort_setf(uint8_t abort)
{
    hwp_i2c->ic_enable.bit_field.abort = abort;
}

__STATIC_INLINE uint8_t i2c_enable_getf(void)
{
    return hwp_i2c->ic_enable.bit_field.enable;
}

__STATIC_INLINE void i2c_enable_setf(uint8_t enable)
{
    hwp_i2c->ic_enable.bit_field.enable = enable;
}

__STATIC_INLINE uint32_t i2c_ic_status_get(void)
{
    return hwp_i2c->ic_status.val;
}

__STATIC_INLINE void i2c_ic_status_unpack(uint8_t* smbus_alert_status, uint8_t* smbus_suspend_status, uint8_t* smbus_slave_addr_resolved, uint8_t* smbus_slave_addr_valid, uint8_t* smbus_quick_cmd_bit, uint8_t* sda_stuck_not_recovered, uint8_t* slv_hold_rx_fifo_full, uint8_t* slv_hold_tx_fifo_empty, uint8_t* mst_hold_rx_fifo_full, uint8_t* mst_hold_tx_fifo_empty, uint8_t* slv_activity, uint8_t* mst_activity, uint8_t* rff, uint8_t* rfne, uint8_t* tfe, uint8_t* tfnf, uint8_t* activity)
{
    T_I2C_IC_STATUS localVal = hwp_i2c->ic_status;

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

__STATIC_INLINE uint8_t i2c_smbus_alert_status_getf(void)
{
    return hwp_i2c->ic_status.bit_field.smbus_alert_status;
}

__STATIC_INLINE uint8_t i2c_smbus_suspend_status_getf(void)
{
    return hwp_i2c->ic_status.bit_field.smbus_suspend_status;
}

__STATIC_INLINE uint8_t i2c_smbus_slave_addr_resolved_getf(void)
{
    return hwp_i2c->ic_status.bit_field.smbus_slave_addr_resolved;
}

__STATIC_INLINE uint8_t i2c_smbus_slave_addr_valid_getf(void)
{
    return hwp_i2c->ic_status.bit_field.smbus_slave_addr_valid;
}

__STATIC_INLINE uint8_t i2c_smbus_quick_cmd_bit_getf(void)
{
    return hwp_i2c->ic_status.bit_field.smbus_quick_cmd_bit;
}

__STATIC_INLINE uint8_t i2c_sda_stuck_not_recovered_getf(void)
{
    return hwp_i2c->ic_status.bit_field.sda_stuck_not_recovered;
}

__STATIC_INLINE uint8_t i2c_slv_hold_rx_fifo_full_getf(void)
{
    return hwp_i2c->ic_status.bit_field.slv_hold_rx_fifo_full;
}

__STATIC_INLINE uint8_t i2c_slv_hold_tx_fifo_empty_getf(void)
{
    return hwp_i2c->ic_status.bit_field.slv_hold_tx_fifo_empty;
}

__STATIC_INLINE uint8_t i2c_mst_hold_rx_fifo_full_getf(void)
{
    return hwp_i2c->ic_status.bit_field.mst_hold_rx_fifo_full;
}

__STATIC_INLINE uint8_t i2c_mst_hold_tx_fifo_empty_getf(void)
{
    return hwp_i2c->ic_status.bit_field.mst_hold_tx_fifo_empty;
}

__STATIC_INLINE uint8_t i2c_slv_activity_getf(void)
{
    return hwp_i2c->ic_status.bit_field.slv_activity;
}

__STATIC_INLINE uint8_t i2c_mst_activity_getf(void)
{
    return hwp_i2c->ic_status.bit_field.mst_activity;
}

__STATIC_INLINE uint8_t i2c_rff_getf(void)
{
    return hwp_i2c->ic_status.bit_field.rff;
}

__STATIC_INLINE uint8_t i2c_rfne_getf(void)
{
    return hwp_i2c->ic_status.bit_field.rfne;
}

__STATIC_INLINE uint8_t i2c_tfe_getf(void)
{
    return hwp_i2c->ic_status.bit_field.tfe;
}

__STATIC_INLINE uint8_t i2c_tfnf_getf(void)
{
    return hwp_i2c->ic_status.bit_field.tfnf;
}

__STATIC_INLINE uint8_t i2c_activity_getf(void)
{
    return hwp_i2c->ic_status.bit_field.activity;
}

__STATIC_INLINE uint32_t i2c_ic_txflr_get(void)
{
    return hwp_i2c->ic_txflr.val;
}

__STATIC_INLINE void i2c_ic_txflr_unpack(uint8_t* txflr)
{
    T_I2C_IC_TXFLR localVal = hwp_i2c->ic_txflr;

    *txflr = localVal.bit_field.txflr;
}

__STATIC_INLINE uint8_t i2c_txflr_getf(void)
{
    return hwp_i2c->ic_txflr.bit_field.txflr;
}

__STATIC_INLINE uint32_t i2c_ic_rxflr_get(void)
{
    return hwp_i2c->ic_rxflr.val;
}

__STATIC_INLINE void i2c_ic_rxflr_unpack(uint8_t* rxflr)
{
    T_I2C_IC_RXFLR localVal = hwp_i2c->ic_rxflr;

    *rxflr = localVal.bit_field.rxflr;
}

__STATIC_INLINE uint8_t i2c_rxflr_getf(void)
{
    return hwp_i2c->ic_rxflr.bit_field.rxflr;
}

__STATIC_INLINE uint32_t i2c_ic_sda_hold_get(void)
{
    return hwp_i2c->ic_sda_hold.val;
}

__STATIC_INLINE void i2c_ic_sda_hold_set(uint32_t value)
{
    hwp_i2c->ic_sda_hold.val = value;
}

__STATIC_INLINE void i2c_ic_sda_hold_pack(uint8_t ic_sda_rx_hold, uint16_t ic_sda_tx_hold)
{
    hwp_i2c->ic_sda_hold.val = (((uint32_t)ic_sda_rx_hold << 16) | ((uint32_t)ic_sda_tx_hold << 0));
}

__STATIC_INLINE void i2c_ic_sda_hold_unpack(uint8_t* ic_sda_rx_hold, uint16_t* ic_sda_tx_hold)
{
    T_I2C_IC_SDA_HOLD localVal = hwp_i2c->ic_sda_hold;

    *ic_sda_rx_hold = localVal.bit_field.ic_sda_rx_hold;
    *ic_sda_tx_hold = localVal.bit_field.ic_sda_tx_hold;
}

__STATIC_INLINE uint8_t i2c_ic_sda_rx_hold_getf(void)
{
    return hwp_i2c->ic_sda_hold.bit_field.ic_sda_rx_hold;
}

__STATIC_INLINE void i2c_ic_sda_rx_hold_setf(uint8_t ic_sda_rx_hold)
{
    hwp_i2c->ic_sda_hold.bit_field.ic_sda_rx_hold = ic_sda_rx_hold;
}

__STATIC_INLINE uint16_t i2c_ic_sda_tx_hold_getf(void)
{
    return hwp_i2c->ic_sda_hold.bit_field.ic_sda_tx_hold;
}

__STATIC_INLINE void i2c_ic_sda_tx_hold_setf(uint16_t ic_sda_tx_hold)
{
    hwp_i2c->ic_sda_hold.bit_field.ic_sda_tx_hold = ic_sda_tx_hold;
}

__STATIC_INLINE uint32_t i2c_ic_tx_abrt_source_get(void)
{
    return hwp_i2c->ic_tx_abrt_source.val;
}

__STATIC_INLINE void i2c_ic_tx_abrt_source_unpack(uint16_t* tx_flush_cnt, uint8_t* abrt_device_write, uint8_t* abrt_device_slvaddr_noack, uint8_t* abrt_device_noack, uint8_t* abrt_sda_stuck_at_low, uint8_t* abrt_user_abrt, uint8_t* abrt_slvrd_intx, uint8_t* abrt_slv_arblost, uint8_t* abrt_slvflush_txfifo, uint8_t* arb_lost, uint8_t* abrt_master_dis, uint8_t* abrt_10b_rd_norstrt, uint8_t* abrt_sbyte_norstrt, uint8_t* abrt_hs_norstrt, uint8_t* abrt_sbyte_ackdet, uint8_t* abrt_hs_ackdet, uint8_t* abrt_gcall_read, uint8_t* abrt_gcall_noack, uint8_t* abrt_txdata_noack, uint8_t* abrt_10addr2_noack, uint8_t* abrt_10addr1_noack, uint8_t* abrt_7baddr_noack)
{
    T_I2C_IC_TX_ABRT_SOURCE localVal = hwp_i2c->ic_tx_abrt_source;

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

__STATIC_INLINE uint16_t i2c_tx_flush_cnt_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.tx_flush_cnt;
}

__STATIC_INLINE uint8_t i2c_abrt_device_write_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_device_write;
}

__STATIC_INLINE uint8_t i2c_abrt_device_slvaddr_noack_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_device_slvaddr_noack;
}

__STATIC_INLINE uint8_t i2c_abrt_device_noack_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_device_noack;
}

__STATIC_INLINE uint8_t i2c_abrt_sda_stuck_at_low_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_sda_stuck_at_low;
}

__STATIC_INLINE uint8_t i2c_abrt_user_abrt_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_user_abrt;
}

__STATIC_INLINE uint8_t i2c_abrt_slvrd_intx_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_slvrd_intx;
}

__STATIC_INLINE uint8_t i2c_abrt_slv_arblost_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_slv_arblost;
}

__STATIC_INLINE uint8_t i2c_abrt_slvflush_txfifo_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_slvflush_txfifo;
}

__STATIC_INLINE uint8_t i2c_arb_lost_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.arb_lost;
}

__STATIC_INLINE uint8_t i2c_abrt_master_dis_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_master_dis;
}

__STATIC_INLINE uint8_t i2c_abrt_10b_rd_norstrt_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_10b_rd_norstrt;
}

__STATIC_INLINE uint8_t i2c_abrt_sbyte_norstrt_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_sbyte_norstrt;
}

__STATIC_INLINE uint8_t i2c_abrt_hs_norstrt_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_hs_norstrt;
}

__STATIC_INLINE uint8_t i2c_abrt_sbyte_ackdet_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_sbyte_ackdet;
}

__STATIC_INLINE uint8_t i2c_abrt_hs_ackdet_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_hs_ackdet;
}

__STATIC_INLINE uint8_t i2c_abrt_gcall_read_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_gcall_read;
}

__STATIC_INLINE uint8_t i2c_abrt_gcall_noack_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_gcall_noack;
}

__STATIC_INLINE uint8_t i2c_abrt_txdata_noack_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_txdata_noack;
}

__STATIC_INLINE uint8_t i2c_abrt_10addr2_noack_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_10addr2_noack;
}

__STATIC_INLINE uint8_t i2c_abrt_10addr1_noack_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_10addr1_noack;
}

__STATIC_INLINE uint8_t i2c_abrt_7baddr_noack_getf(void)
{
    return hwp_i2c->ic_tx_abrt_source.bit_field.abrt_7baddr_noack;
}

__STATIC_INLINE uint32_t i2c_ic_slv_data_nack_only_get(void)
{
    return hwp_i2c->ic_slv_data_nack_only.val;
}

__STATIC_INLINE void i2c_ic_slv_data_nack_only_set(uint32_t value)
{
    hwp_i2c->ic_slv_data_nack_only.val = value;
}

__STATIC_INLINE void i2c_ic_slv_data_nack_only_pack(uint8_t nack)
{
    hwp_i2c->ic_slv_data_nack_only.val = (((uint32_t)nack << 0));
}

__STATIC_INLINE void i2c_ic_slv_data_nack_only_unpack(uint8_t* nack)
{
    T_I2C_IC_SLV_DATA_NACK_ONLY localVal = hwp_i2c->ic_slv_data_nack_only;

    *nack = localVal.bit_field.nack;
}

__STATIC_INLINE uint8_t i2c_nack_getf(void)
{
    return hwp_i2c->ic_slv_data_nack_only.bit_field.nack;
}

__STATIC_INLINE void i2c_nack_setf(uint8_t nack)
{
    hwp_i2c->ic_slv_data_nack_only.bit_field.nack = nack;
}

__STATIC_INLINE uint32_t i2c_ic_dma_cr_get(void)
{
    return hwp_i2c->ic_dma_cr.val;
}

__STATIC_INLINE void i2c_ic_dma_cr_set(uint32_t value)
{
    hwp_i2c->ic_dma_cr.val = value;
}

__STATIC_INLINE void i2c_ic_dma_cr_pack(uint8_t tdmae, uint8_t rdmae)
{
    hwp_i2c->ic_dma_cr.val = (((uint32_t)tdmae << 1) | ((uint32_t)rdmae << 0));
}

__STATIC_INLINE void i2c_ic_dma_cr_unpack(uint8_t* tdmae, uint8_t* rdmae)
{
    T_I2C_IC_DMA_CR localVal = hwp_i2c->ic_dma_cr;

    *tdmae = localVal.bit_field.tdmae;
    *rdmae = localVal.bit_field.rdmae;
}

__STATIC_INLINE uint8_t i2c_tdmae_getf(void)
{
    return hwp_i2c->ic_dma_cr.bit_field.tdmae;
}

__STATIC_INLINE void i2c_tdmae_setf(uint8_t tdmae)
{
    hwp_i2c->ic_dma_cr.bit_field.tdmae = tdmae;
}

__STATIC_INLINE uint8_t i2c_rdmae_getf(void)
{
    return hwp_i2c->ic_dma_cr.bit_field.rdmae;
}

__STATIC_INLINE void i2c_rdmae_setf(uint8_t rdmae)
{
    hwp_i2c->ic_dma_cr.bit_field.rdmae = rdmae;
}

__STATIC_INLINE uint32_t i2c_ic_dma_tdlr_get(void)
{
    return hwp_i2c->ic_dma_tdlr.val;
}

__STATIC_INLINE void i2c_ic_dma_tdlr_set(uint32_t value)
{
    hwp_i2c->ic_dma_tdlr.val = value;
}

__STATIC_INLINE void i2c_ic_dma_tdlr_pack(uint8_t dmatdl)
{
    hwp_i2c->ic_dma_tdlr.val = (((uint32_t)dmatdl << 0));
}

__STATIC_INLINE void i2c_ic_dma_tdlr_unpack(uint8_t* dmatdl)
{
    T_I2C_IC_DMA_TDLR localVal = hwp_i2c->ic_dma_tdlr;

    *dmatdl = localVal.bit_field.dmatdl;
}

__STATIC_INLINE uint8_t i2c_dmatdl_getf(void)
{
    return hwp_i2c->ic_dma_tdlr.bit_field.dmatdl;
}

__STATIC_INLINE void i2c_dmatdl_setf(uint8_t dmatdl)
{
    hwp_i2c->ic_dma_tdlr.bit_field.dmatdl = dmatdl;
}

__STATIC_INLINE uint32_t i2c_ic_dma_rdlr_get(void)
{
    return hwp_i2c->ic_dma_rdlr.val;
}

__STATIC_INLINE void i2c_ic_dma_rdlr_set(uint32_t value)
{
    hwp_i2c->ic_dma_rdlr.val = value;
}

__STATIC_INLINE void i2c_ic_dma_rdlr_pack(uint8_t dmardl)
{
    hwp_i2c->ic_dma_rdlr.val = (((uint32_t)dmardl << 0));
}

__STATIC_INLINE void i2c_ic_dma_rdlr_unpack(uint8_t* dmardl)
{
    T_I2C_IC_DMA_RDLR localVal = hwp_i2c->ic_dma_rdlr;

    *dmardl = localVal.bit_field.dmardl;
}

__STATIC_INLINE uint8_t i2c_dmardl_getf(void)
{
    return hwp_i2c->ic_dma_rdlr.bit_field.dmardl;
}

__STATIC_INLINE void i2c_dmardl_setf(uint8_t dmardl)
{
    hwp_i2c->ic_dma_rdlr.bit_field.dmardl = dmardl;
}

__STATIC_INLINE uint32_t i2c_ic_sda_setup_get(void)
{
    return hwp_i2c->ic_sda_setup.val;
}

__STATIC_INLINE void i2c_ic_sda_setup_set(uint32_t value)
{
    hwp_i2c->ic_sda_setup.val = value;
}

__STATIC_INLINE void i2c_ic_sda_setup_pack(uint8_t sda_setup)
{
    hwp_i2c->ic_sda_setup.val = (((uint32_t)sda_setup << 0));
}

__STATIC_INLINE void i2c_ic_sda_setup_unpack(uint8_t* sda_setup)
{
    T_I2C_IC_SDA_SETUP localVal = hwp_i2c->ic_sda_setup;

    *sda_setup = localVal.bit_field.sda_setup;
}

__STATIC_INLINE uint8_t i2c_sda_setup_getf(void)
{
    return hwp_i2c->ic_sda_setup.bit_field.sda_setup;
}

__STATIC_INLINE void i2c_sda_setup_setf(uint8_t sda_setup)
{
    hwp_i2c->ic_sda_setup.bit_field.sda_setup = sda_setup;
}

__STATIC_INLINE uint32_t i2c_ic_ack_general_call_get(void)
{
    return hwp_i2c->ic_ack_general_call.val;
}

__STATIC_INLINE void i2c_ic_ack_general_call_set(uint32_t value)
{
    hwp_i2c->ic_ack_general_call.val = value;
}

__STATIC_INLINE void i2c_ic_ack_general_call_pack(uint8_t ack_gen_call)
{
    hwp_i2c->ic_ack_general_call.val = (((uint32_t)ack_gen_call << 0));
}

__STATIC_INLINE void i2c_ic_ack_general_call_unpack(uint8_t* ack_gen_call)
{
    T_I2C_IC_ACK_GENERAL_CALL localVal = hwp_i2c->ic_ack_general_call;

    *ack_gen_call = localVal.bit_field.ack_gen_call;
}

__STATIC_INLINE uint8_t i2c_ack_gen_call_getf(void)
{
    return hwp_i2c->ic_ack_general_call.bit_field.ack_gen_call;
}

__STATIC_INLINE void i2c_ack_gen_call_setf(uint8_t ack_gen_call)
{
    hwp_i2c->ic_ack_general_call.bit_field.ack_gen_call = ack_gen_call;
}

__STATIC_INLINE uint32_t i2c_ic_enable_status_get(void)
{
    return hwp_i2c->ic_enable_status.val;
}

__STATIC_INLINE void i2c_ic_enable_status_unpack(uint8_t* slv_rx_data_lost, uint8_t* slv_disabled_while_busy, uint8_t* ic_en)
{
    T_I2C_IC_ENABLE_STATUS localVal = hwp_i2c->ic_enable_status;

    *slv_rx_data_lost = localVal.bit_field.slv_rx_data_lost;
    *slv_disabled_while_busy = localVal.bit_field.slv_disabled_while_busy;
    *ic_en = localVal.bit_field.ic_en;
}

__STATIC_INLINE uint8_t i2c_slv_rx_data_lost_getf(void)
{
    return hwp_i2c->ic_enable_status.bit_field.slv_rx_data_lost;
}

__STATIC_INLINE uint8_t i2c_slv_disabled_while_busy_getf(void)
{
    return hwp_i2c->ic_enable_status.bit_field.slv_disabled_while_busy;
}

__STATIC_INLINE uint8_t i2c_ic_en_getf(void)
{
    return hwp_i2c->ic_enable_status.bit_field.ic_en;
}

__STATIC_INLINE uint32_t i2c_ic_fs_spklen_get(void)
{
    return hwp_i2c->ic_fs_spklen.val;
}

__STATIC_INLINE void i2c_ic_fs_spklen_set(uint32_t value)
{
    hwp_i2c->ic_fs_spklen.val = value;
}

__STATIC_INLINE void i2c_ic_fs_spklen_pack(uint8_t fs_spklen)
{
    hwp_i2c->ic_fs_spklen.val = (((uint32_t)fs_spklen << 0));
}

__STATIC_INLINE void i2c_ic_fs_spklen_unpack(uint8_t* fs_spklen)
{
    T_I2C_IC_FS_SPKLEN localVal = hwp_i2c->ic_fs_spklen;

    *fs_spklen = localVal.bit_field.fs_spklen;
}

__STATIC_INLINE uint8_t i2c_fs_spklen_getf(void)
{
    return hwp_i2c->ic_fs_spklen.bit_field.fs_spklen;
}

__STATIC_INLINE void i2c_fs_spklen_setf(uint8_t fs_spklen)
{
    hwp_i2c->ic_fs_spklen.bit_field.fs_spklen = fs_spklen;
}

__STATIC_INLINE uint32_t i2c_ic_hs_spklen_get(void)
{
    return hwp_i2c->ic_hs_spklen.val;
}

__STATIC_INLINE void i2c_ic_hs_spklen_set(uint32_t value)
{
    hwp_i2c->ic_hs_spklen.val = value;
}

__STATIC_INLINE void i2c_ic_hs_spklen_pack(uint8_t hs_spklen)
{
    hwp_i2c->ic_hs_spklen.val = (((uint32_t)hs_spklen << 0));
}

__STATIC_INLINE void i2c_ic_hs_spklen_unpack(uint8_t* hs_spklen)
{
    T_I2C_IC_HS_SPKLEN localVal = hwp_i2c->ic_hs_spklen;

    *hs_spklen = localVal.bit_field.hs_spklen;
}

__STATIC_INLINE uint8_t i2c_hs_spklen_getf(void)
{
    return hwp_i2c->ic_hs_spklen.bit_field.hs_spklen;
}

__STATIC_INLINE void i2c_hs_spklen_setf(uint8_t hs_spklen)
{
    hwp_i2c->ic_hs_spklen.bit_field.hs_spklen = hs_spklen;
}

__STATIC_INLINE uint32_t i2c_ic_clr_restart_det_get(void)
{
    return hwp_i2c->ic_clr_restart_det.val;
}

__STATIC_INLINE void i2c_ic_clr_restart_det_unpack(uint8_t* clr_restart_det)
{
    T_I2C_IC_CLR_RESTART_DET localVal = hwp_i2c->ic_clr_restart_det;

    *clr_restart_det = localVal.bit_field.clr_restart_det;
}

__STATIC_INLINE uint8_t i2c_clr_restart_det_getf(void)
{
    return hwp_i2c->ic_clr_restart_det.bit_field.clr_restart_det;
}

__STATIC_INLINE uint32_t i2c_ic_comp_param_1_get(void)
{
    return hwp_i2c->ic_comp_param_1.val;
}

__STATIC_INLINE uint32_t i2c_ic_comp_version_get(void)
{
    return hwp_i2c->ic_comp_version.val;
}

__STATIC_INLINE void i2c_ic_comp_version_unpack(uint32_t* comp_version)
{
    T_I2C_IC_COMP_VERSION localVal = hwp_i2c->ic_comp_version;

    *comp_version = localVal.bit_field.comp_version;
}

__STATIC_INLINE uint32_t i2c_comp_version_getf(void)
{
    return hwp_i2c->ic_comp_version.bit_field.comp_version;
}

__STATIC_INLINE uint32_t i2c_ic_comp_type_get(void)
{
    return hwp_i2c->ic_comp_type.val;
}

__STATIC_INLINE void i2c_ic_comp_type_unpack(uint32_t* comp_type)
{
    T_I2C_IC_COMP_TYPE localVal = hwp_i2c->ic_comp_type;

    *comp_type = localVal.bit_field.comp_type;
}

__STATIC_INLINE uint32_t i2c_comp_type_getf(void)
{
    return hwp_i2c->ic_comp_type.bit_field.comp_type;
}
#endif

