
/**
****************************************************************************************
*
* @file hal_i2c.h
*
* @brief i2c driver interface.
*
* (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
*          ALL RIGHTS RESERVED
*
****************************************************************************************
*/

 
 
/**
****************************************************************************************
* @defgroup I2C
* @ingroup DRIVERS
* @brief I2C Drivers.
****************************************************************************************
*/


#ifndef _I2C_H_
#define _I2C_H_
#include <stdint.h>

#define RX_TX_FIFO_DEPTH 16

/**
 * @brief enum of I2C mode. I2C module can work in master mode or slave mode.
 */
typedef enum
{
    i2c_Slave = 0,
    i2c_Master
}I2C_Mode;

/**
 * @brief enum of I2C Speed. I2C module can work at different speed. 
          Normally Standard Mode work in less than 100kbps
          Fast Mode work in less than 400kbps
          HighSpeed Mode work in 3.4Mbps
 */
typedef enum
{
    i2c_StandardMode = 1,
    i2c_FastMode,
    i2c_HighSpeedMode
}I2C_SpeedMode;

/**
 * @brief enum of Special bit. 
           indicates whether software performs a Device-ID, General Call or START BYTE command.
 */
typedef enum
{
    i2c_Noramlly = 0,
    i2c_GeneralCall_StartByte
}I2C_Special;

/**
 * @brief enum of I2C Addressing. Can be select to use 7bit addressing or 10bit addressing
 */
typedef enum 
{
    i2c_7_Addressing = 0,
    i2c_10_Addressing
}I2C_7_10Addressing;

/**
 * @brief enum of int status.
 */
typedef enum
{
    I2C_INTR_RX_UNDER = 0,
    I2C_INTR_RX_OVER, // 1
    I2C_INTR_RX_FULL,
    I2C_INTR_TX_OVER,
    I2C_INTR_TX_EMPTY,
    I2C_INTR_RD_REQ, // 5
    I2C_INTR_TX_ABORT,
    I2C_INTR_RX_DONE,
    I2C_INTR_ACTIVITY,
    I2C_INTR_STOP_DET,
    I2C_INTR_START_DET, // 10
    I2C_INTR_GEN_CALL,
    I2C_INTR_RESTART_DET,
    I2C_INTR_MST_ON_HOLD,
    I2C_INTR_SCL_STUCK_LOW,	//14
    I2C_INTR_MAX
}I2C_Int_Status;

/**
 * @brief enum of tx abort src.
 */
typedef enum
{
    I2C_ABRT_7BADDR_NOACK = 0,  
    I2C_ABRT_10BADDR1_NOACK,
    I2C_ABRT_10BADDR2_NOACK,
    I2C_ABRT_TXDATA_NOACK,
    I2C_ABRT_GCALL_NOACK,
    I2C_ABRT_GCALL_READ,        //5
    I2C_ABRT_HS_ACKDET,
    I2C_ABRT_SBYTE_ACKDET,
    I2C_ABRT_HS_NORSTRT,
    I2C_ABRT_SBYTE_NORSTRT,
    I2C_ABRT_10B_RD_NORSTRT,    //10
    I2C_ABRT_MASTER_DIS,
    I2C_ABRT_ARB_LOST,
    I2C_ABRT_SLVFLUSH_TXFIFO,
    I2C_ABRT_SLV_ARBLOST,
    I2C_ABRT_SLVRD_INTX,        //15
    I2C_ABRT_USER_ABRT,
    I2C_ABRT_SDA_STUCK_AT_LOW,
    I2C_ABRT_DEVICE_NOACK,
    I2C_ABRT_DEVICE_SLVADDR_NOACK,
    I2C_ABRT_DEVICE_WRITE       //20
}I2C_TX_Abort_Src;

/**
 * @brief enum of int mask.
 */
typedef enum
{
    I2C_MASK_RX_UNDER = 0,  
    I2C_MASK_RX_OVER,
    I2C_MASK_RX_FULL,
    I2C_MASK_TX_OVER,
    I2C_MASK_TX_EMPTY,
    I2C_MASK_RD_REQ,        //5
    I2C_MASK_TX_ABRT,
    I2C_MASK_RX_DONE,
    I2C_MASK_ACTIVITY,
    I2C_MASK_STOP_DET,
    I2C_MASK_START_DET,     //10
    I2C_MASK_GEN_CALL,
    I2C_MASK_RESTART_DET,
    I2C_MASK_MST_ON_HOLD,
    I2C_MASK_SCL_STUCK_AT_LOW   //14
}I2C_Int_Mask;


/**
 * @brief using the default i2c timing parameter or define your own parameter.
 */
typedef enum 
{
    I2C_TIMING_DEFAULT = 0,
    I2C_TIMING_USER_DEFINE
}I2C_Timing_Sel;


/**
 * @brief This is the struct to initialize the i2c module.
 */
typedef struct
{
	I2C_Mode mode;                  /**< mode: I2C mode. slave mode or master mode. */     
	uint16_t dev_addr;              /**< dev_addr: I2C slave address indicate */  
	I2C_7_10Addressing addr_type;   /**< addr_type: 7bit or 10bit addressing select */  
	I2C_SpeedMode speed;            /**< speed: select from standard mode, fast mode or high speed mode */ 
	I2C_Timing_Sel timing;          /**< timing: use default timing or define your own i2c timing */ 
	uint8_t restart_en;             /**< restart_en: Determines whether RESTART conditions may be sent when acting as a master */
}I2C_InitTypeDef;


/**
 * @brief This is the struct to define the i2c timing, only define this when you define your own i2c timing(I2C_TIMING_USER_DEFINE)
 */
typedef struct
{
    uint16_t ss_scl_hcnt;
    uint16_t ss_scl_lcnt;

    uint16_t fs_scl_hcnt;
    uint16_t fs_scl_lcnt;

    uint16_t hs_scl_hcnt;
    uint16_t hs_scl_lcnt;

    uint16_t ic_sda_rx_hold;
    uint16_t ic_sda_tx_hold;
}I2C_Timing_Setting;


/**
 * @brief Enable or disable i2c0 module 
 * @param  en: 1 - enable, 0 - disable
 * @return This function has no return.
 */
void HAL_I2C0_Enable(uint8_t en);
/**
 * @brief  To initiates the transfer abort.
 * @param  en: 1 - abort current transfer, 0 - do nothing.
 * @return This function has no return.
 */
void HAL_I2C0_Abort(uint8_t en);
/**
 * @brief  Set I2C Mode, work as slave or master.
 * @param  mode: select from i2c_Slave or i2c_Master.
 * @return This function has no return.
 */
void HAL_I2C0_SetMode(I2C_Mode mode);
/**
 * @brief  Get I2C Mode.
 * @return return the I2C Mode
 */
I2C_Mode HAL_I2C0_GetMode(void);
/**
 * @brief  Set Special Bit of I2C
 * @param  special: This bit indicates whether software performs a Device-ID, General Call or START BYTE command.
 *         0: ignore bit 10 GC_OR_START and use IC_TAR normally
 *         1: perform special I2C command as specified in Device-ID or GC_OR_START bit.
 * @return This function has no return.
 */
void HAL_I2C0_SetSpecialBit(I2C_Special special);
/**
 * @brief  Indicates whether a General Call or START byte command is to be performed
 * @param  start: 
 *         0: General Call Address
 *         1: START BYTE
 * @return This function has no return
 */
void HAL_I2C0_GC_OR_Start(uint8_t start);
/**
 * @brief  To controls whether a RESTART is issued before the byte is sent or received.
 * @param  en: restart is issured or not
 * @return This function has no return
 */
void HAL_I2C0_RestartModeEnable(uint8_t en);
/**
 * @brief  To controls whether i2c module starts its transfers in 7-bit or 10-bit addressing mode when acting as a master.
 * @param  addressing: define using 7bit addressing or 10bit addressing
 * @return This function has no return
 */
void HAL_I2C0_Set7_10Addressing_Master(I2C_7_10Addressing addressing);
/**
 * @brief  controls whether the i2c module responds to 7-bit or 10-bit addresses.
 * @param  addressing: define using 7bit addressing or 10bit addressing
 * @return This function has no return
 */
void HAL_I2C0_Set7_10Addressing_Slave(I2C_7_10Addressing addressing);
/**
 * @brief  Set I2C target address
 * @param  addr: Set the address of the slave device.
 * @return This function has no return
 */
void HAL_I2C0_SetTarAddr(uint16_t addr);
/**
 * @brief  Set I2C Address when working as a slave device.
 * @param  addr: Set the address of the this device.
 * @return This function has no return
 */
void HAL_I2C0_SetSlvAddr(uint16_t addr);
/**
 * @brief  Set I2C interrupt mask of i2c module
 * @param  mask: bit map of mask, ored from enum I2C_Int_Mask.
 * @return This function has no return
 */
void HAL_I2C0_Mask_Set(uint16_t mask);
/**
 * @brief  Get I2C interrupt mask of i2c module
 * @return return the int mask, the returned value is ored from enum I2C_Int_Mask.
 */
uint16_t HAL_I2C0_Mask_Get(void);
/**
 * @brief  Set tx and rx fifo threshold to trigger an interrupt.
 * @param  txTl: set tx fifo level, when below this level I2C_INTR_TX_EMPTY will trigger.
 * @param  rxTl: set rx fifo level, when above this level I2C_INTR_RX_FULL will trigger.
 * @return This function has no return
 */
void HAL_I2C0_Int_Threshold_Set(uint8_t txTl,uint8_t rxTl);
/**
 * @brief  Read data from rx fifo
 * @param  buf: pointer to the receive buffer.
 * @param  length: define the length of data to read from fifo.
 * @return This function has no return
 */
void HAL_I2C0_Read_fifo(uint8_t *buf, uint32_t length);
/**
 * @brief  Send a data command. Normally, use HAL_I2C0_ReadData_Polling, HAL_I2C0_ReadData, HAL_I2C0_WriteData instead.
 * @return This function has no return
 */
void HAL_I2C0_Data_Cmd(uint8_t restart, uint8_t stop, uint8_t cmd, uint8_t dat);
/**
 * @brief  start an i2c read and define data length to read from slave. Working in polling mode, this function will not return before all data are received.
 * @param  buf: pointer to the receive buffer.
 * @param  length: define the length of data to read from slave.
 * @return This function has no return
 */
void HAL_I2C0_ReadData_Polling(uint8_t *buf, uint32_t length);
/**
 * @brief  start an i2c read and define data length to read from slave. This function return as soon as all the data are put into tx fifo.
 *         It's your responsible to set rx fifo level, enable interrupt and read fifo to get data.
 * @param  length: define the length of data to read from slave.
 * @return This function has no return
 */
void HAL_I2C0_ReadData(uint32_t length);
/**
 * @brief  Read last byte. Useful only when use dma. Read data is stored in fifo.
 * @return This function has no return
 */
void HAL_I2C0_Read_LastByte(void);
/**
 * @brief  Put data into tx fifo. 
 * @param  buf: pointer to the data writing to i2c
 * @param  length: define the length of data to write.
 * @return This function has no return
 */
void HAL_I2C0_WriteData(uint8_t *buf, uint32_t length);
/**
 * @brief  Read last byte. Useful only when use dma. 
 * @param  buf: a byte to write.
 * @return This function has no return
 */
void HAL_I2C0_Write_LastByte(uint8_t buf);
/**
 * @brief  Send slave data address.
 * @param  regAddr: register address of slave device to peform a read or write.
 * @param  len: address data length
 * @return This function has no return
 */
void HAL_I2C0_SendAddrCmd(uint8_t *regAddr, uint8_t len);
/**
 * @brief  Get Tx fifo level to trigger an I2C_INTR_TX_EMPTY
 * @return return the tx fifo level
 */
uint8_t HAL_I2C0_Get_TXF_level(void);
/**
 * @brief  Get Rx fifo level to trigger an I2C_INTR_RX_FULL
 * @return return the rx fifo level
 */
uint8_t HAL_I2C0_Get_RXF_level(void);
/**
 * @brief  Set i2c speed.
 * @param  src_clock: always equal to apb_clk0 defined in plf.h
 * @param  speedMode: set speed mode
 * @param  timing: define using the default timing or user defined timing.
 * @param  setting: if use the user defined timing, input the timing settings.
 * @return This function has no return
 */
void HAL_I2C0_SetSpeed(uint32_t src_clock, I2C_SpeedMode speedMode, I2C_Timing_Sel timing, I2C_Timing_Setting *setting);
/**
 * @brief  Set the value of the I2C HS mode master code
 * @param  maddr: master code
 * @return This function has no return
 */
void HAL_I2C0_Hs_SetMaddr(uint8_t maddr);
/**
 * @brief  Set Dma mode of i2c module
 * @param  tx_dma_en: enable tx dma mode.
 * @param  rx_dma_en: enable rx dma mode.
 * @param  tx_data_level: Transmit Data Level. This bit field controls the level at which a DMA request is made by the transmit logic. It is equal to the watermark level
 * @param  rx_data_level: Receive Data Level. This bit field controls the level at which a DMA request is made by the receive logic. The watermark level = DMARDL+1
 * @return This function has no return
 */
void HAL_I2C0_Set_DMA(uint8_t tx_dma_en, uint8_t rx_dma_en, uint8_t tx_data_level, uint8_t rx_data_level);
/**
 * @brief  Get the i2c interrupt status, after the int mask.
 * @return return the interrupt status. it is ored of enum I2C_Int_Status
 */
uint32_t HAL_I2C0_Get_IrqStatus(void);
/**
 * @brief  Get the i2c interrupt status, before the int mask
 * @return return the interrupt status. it is ored of enum I2C_Int_Status
 */
uint32_t HAL_I2C0_Get_Raw_IrqStatus(void);
/**
 * @brief  Set the high speed spk length. Sets the duration, measured in ic_clk cycles
 * @return This function has no return
 */
void HAL_I2C0_Spklen_HS(uint8_t spklen);
/**
 * @brief  Set the full speed spk length. Sets the duration, measured in ic_clk cycles
 * @return This function has no return
 */
void HAL_I2C0_Spklen_FS(uint8_t spklen);
/**
 * @brief  read restart det interrupt status and clear the interrupt at the same time.
 * @return return the restart det interrupt status.
 */
uint8_t HAL_I2C0_Clr_Restart_Det(void);
/**
 * @brief  read gen call interrupt status and clear the interrupt at the same time.
 * @return return the gen call interrupt status.
 */
uint8_t HAL_I2C0_Clr_Gen_Call(void);
/**
 * @brief  read Start_Det interrupt status and clear the interrupt at the same time.
 * @return return the Start_Det interrupt status.
 */
uint8_t HAL_I2C0_Clr_Start_Det(void);
/**
 * @brief  read Stop Det interrupt status and clear the interrupt at the same time.
 * @return return the Stop Det interrupt status.
 */

uint8_t HAL_I2C0_Clr_Stop_Det(void);
/**
 * @brief  read Activity interrupt status and clear the interrupt at the same time.
 * @return return the Activity interrupt status.
 */
uint8_t HAL_I2C0_Clr_Activity(void);
/**
 * @brief  read rx done interrupt status and clear the interrupt at the same time.
 * @return return the rx done interrupt status.
 */
uint8_t HAL_I2C0_Clr_Rx_Done(void);
/**
 * @brief  read tx abort interrupt status and clear the interrupt at the same time.
 * @return return the tx abort interrupt status.
 */
uint8_t HAL_I2C0_Clr_Tx_Abort(void);
/**
 * @brief  read rd req interrupt status and clear the interrupt at the same time.
 * @return return the rd req interrupt status.
 */
uint8_t HAL_I2C0_Clr_Rd_Req(void);
/**
 * @brief  read tx over interrupt status and clear the interrupt at the same time.
 * @return return the tx over interrupt status.
 */
uint8_t HAL_I2C0_Clr_Tx_Over(void);
/**
 * @brief  read rx under interrupt status and clear the interrupt at the same time.
 * @return return the rx under interrupt status.
 */
uint8_t HAL_I2C0_Clr_Rx_Under(void);
/**
 * @brief  read to clear the combined interrupt, all individual interrupts, and the IC_TX_ABRT_SOURCE register.
 * @return return the combined interrupt status.
 */
uint8_t HAL_I2C0_Clr_Intr(void);
/**
 * @brief  Get the raw int status of i2c, before the int mask.
 * @return return the raw int status.
 */
uint32_t HAL_I2C0_Raw_Intr_Status(void);
/**
 * @brief  Set the int mask
 * @param  mask: the bit map of int mask, it is ored from enum I2C_Int_Mask.
 * @return This function has no return.
 */
void HAL_I2C0_Intr_Mask_Set(uint16_t mask);
/**
 * @brief  Get the int mask
 * @return return the int mask.
 */
uint16_t HAL_I2C0_Intr_Mask_Get(void);
/**
 * @brief  Get the raw int status of i2c, after the int mask.
 * @return return the raw int status.
 */
uint16_t HAL_I2C0_Intr_Status(void);
/**
 * @brief  Get the ic enable status.
 * @return return the ic enable status.
 */
uint8_t HAL_I2C0_IC_Enable_Status(void);
/**
 * @brief  Get the ic status.
 * @return return the ic status.
 */
uint32_t HAL_I2C0_IC_Status(void);

/**
 * @brief Initialize i2c module.
 * @param i2c_src_clk: input the src_clk of spi module, should be always equal to apb_clk0 in plf.h
 * @param i2c_config: input the i2c configure structure to initialize the module.
 * @param setting: user defined timing of i2c, can be NULL if use default timing.
 * @return This function has no return value.
 */
void HAL_I2C0_Init(uint32_t i2c_src_clk, I2C_InitTypeDef i2c_config, I2C_Timing_Setting *setting);



/**
 * @brief Enable or disable i2c0 module 
 * @param  en: 1 - enable, 0 - disable
 * @return This function has no return.
 */
void HAL_I2C1_Enable(uint8_t en);
/**
 * @brief  To initiates the transfer abort.
 * @param  en: 1 - abort current transfer, 0 - do nothing.
 * @return This function has no return.
 */
void HAL_I2C1_Abort(uint8_t en);
/**
 * @brief  Set I2C Mode, work as slave or master.
 * @param  mode: select from i2c_Slave or i2c_Master.
 * @return This function has no return.
 */
void HAL_I2C1_SetMode(I2C_Mode mode);
/**
 * @brief  Get I2C Mode.
 * @return return the I2C Mode
 */
I2C_Mode HAL_I2C1_GetMode(void);
/**
 * @brief  Set Special Bit of I2C
 * @param  special: This bit indicates whether software performs a Device-ID, General Call or START BYTE command.
 *         0: ignore bit 10 GC_OR_START and use IC_TAR normally
 *         1: perform special I2C command as specified in Device-ID or GC_OR_START bit.
 * @return This function has no return.
 */
void HAL_I2C1_SetSpecialBit(I2C_Special special);
/**
 * @brief  Indicates whether a General Call or START byte command is to be performed
 * @param  start: 
 *         0: General Call Address
 *         1: START BYTE
 * @return This function has no return
 */
void HAL_I2C1_GC_OR_Start(uint8_t start);
/**
 * @brief  To controls whether a RESTART is issued before the byte is sent or received.
 * @param  en: restart is issured or not
 * @return This function has no return
 */
void HAL_I2C1_RestartModeEnable(uint8_t en);
/**
 * @brief  To controls whether i2c module starts its transfers in 7-bit or 10-bit addressing mode when acting as a master.
 * @param  addressing: define using 7bit addressing or 10bit addressing
 * @return This function has no return
 */
void HAL_I2C1_Set7_10Addressing_Master(I2C_7_10Addressing addressing);
/**
 * @brief  controls whether the i2c module responds to 7-bit or 10-bit addresses.
 * @param  addressing: define using 7bit addressing or 10bit addressing
 * @return This function has no return
 */
void HAL_I2C1_Set7_10Addressing_Slave(I2C_7_10Addressing addressing);
/**
 * @brief  Set I2C target address
 * @param  addr: Set the address of the slave device.
 * @return This function has no return
 */
void HAL_I2C1_SetTarAddr(uint16_t addr);
/**
 * @brief  Set I2C Address when working as a slave device.
 * @param  addr: Set the address of the this device.
 * @return This function has no return
 */
void HAL_I2C1_SetSlvAddr(uint16_t addr);
/**
 * @brief  Set I2C interrupt mask of i2c module
 * @param  mask: bit map of mask, ored from enum I2C_Int_Mask.
 * @return This function has no return
 */
void HAL_I2C1_Mask_Set(uint16_t mask);
/**
 * @brief  Get I2C interrupt mask of i2c module
 * @return return the int mask, the returned value is ored from enum I2C_Int_Mask.
 */
uint16_t HAL_I2C1_Mask_Get(void);
/**
 * @brief  Set tx and rx fifo threshold to trigger an interrupt.
 * @param  txTl: set tx fifo level, when below this level I2C_INTR_TX_EMPTY will trigger.
 * @param  rxTl: set rx fifo level, when above this level I2C_INTR_RX_FULL will trigger.
 * @return This function has no return
 */
void HAL_I2C1_Int_Threshold_Set(uint8_t txTl,uint8_t rxTl);
/**
 * @brief  Read data from rx fifo
 * @param  buf: pointer to the receive buffer.
 * @param  length: define the length of data to read from fifo.
 * @return This function has no return
 */
void HAL_I2C1_Read_fifo(uint8_t *buf, uint32_t length);
/**
 * @brief  Send a data command. Normally, use HAL_I2C0_ReadData_Polling, HAL_I2C0_ReadData, HAL_I2C0_WriteData instead.
 * @return This function has no return
 */
void HAL_I2C1_Data_Cmd(uint8_t restart, uint8_t stop, uint8_t cmd, uint8_t dat);
/**
 * @brief  start an i2c read and define data length to read from slave. Working in polling mode, this function will not return before all data are received.
 * @param  buf: pointer to the receive buffer.
 * @param  length: define the length of data to read from slave.
 * @return This function has no return
 */
void HAL_I2C1_ReadData_Polling(uint8_t *buf, uint32_t length);
/**
 * @brief  start an i2c read and define data length to read from slave. This function return as soon as all the data are put into tx fifo.
 *         It's your responsible to set rx fifo level, enable interrupt and read fifo to get data.
 * @param  length: define the length of data to read from slave.
 * @return This function has no return
 */
void HAL_I2C1_ReadData(uint32_t length);
/**
 * @brief  Read last byte. Useful only when use dma. Read data is stored in fifo.
 * @return This function has no return
 */
void HAL_I2C1_Read_LastByte(void);
/**
 * @brief  Put data into tx fifo. 
 * @param  buf: pointer to the data writing to i2c
 * @param  length: define the length of data to write.
 * @return This function has no return
 */
void HAL_I2C1_WriteData(uint8_t *buf, uint32_t length);
/**
 * @brief  Read last byte. Useful only when use dma. 
 * @param  buf: a byte to write.
 * @return This function has no return
 */
void HAL_I2C1_Write_LastByte(uint8_t buf);
/**
 * @brief  Send slave data address.
 * @param  regAddr: register address of slave device to peform a read or write.
 * @param  len: address data length
 * @return This function has no return
 */
void HAL_I2C1_SendAddrCmd(uint8_t *regAddr, uint8_t len);
/**
 * @brief  Get Tx fifo level to trigger an I2C_INTR_TX_EMPTY
 * @return return the tx fifo level
 */
uint8_t HAL_I2C1_Get_TXF_level(void);
/**
 * @brief  Get Rx fifo level to trigger an I2C_INTR_RX_FULL
 * @return return the rx fifo level
 */
uint8_t HAL_I2C1_Get_RXF_level(void);
/**
 * @brief  Set i2c speed.
 * @param  src_clock: always equal to apb_clk0 defined in plf.h
 * @param  speedMode: set speed mode
 * @param  timing: define using the default timing or user defined timing.
 * @param  setting: if use the user defined timing, input the timing settings.
 * @return This function has no return
 */
void HAL_I2C1_SetSpeed(uint32_t src_clock, I2C_SpeedMode speedMode, I2C_Timing_Sel timing, I2C_Timing_Setting *setting);
/**
 * @brief  Set the value of the I2C HS mode master code
 * @param  maddr: master code
 * @return This function has no return
 */
void HAL_I2C1_Hs_SetMaddr(uint8_t maddr);
/**
 * @brief  Set Dma mode of i2c module
 * @param  tx_dma_en: enable tx dma mode.
 * @param  rx_dma_en: enable rx dma mode.
 * @param  tx_data_level: Transmit Data Level. This bit field controls the level at which a DMA request is made by the transmit logic. It is equal to the watermark level
 * @param  rx_data_level: Receive Data Level. This bit field controls the level at which a DMA request is made by the receive logic. The watermark level = DMARDL+1
 * @return This function has no return
 */
void HAL_I2C1_Set_DMA(uint8_t tx_dma_en, uint8_t rx_dma_en, uint8_t tx_data_level, uint8_t rx_data_level);

/**
 * @brief  Get the i2c interrupt status, after the int mask.
 * @return return the interrupt status. it is ored of enum I2C_Int_Status
 */
uint32_t HAL_I2C1_Get_IrqStatus(void);
/**
 * @brief  Get the i2c interrupt status, before the int mask
 * @return return the interrupt status. it is ored of enum I2C_Int_Status
 */
uint32_t HAL_I2C1_Get_Raw_IrqStatus(void);
/**
 * @brief  Set the high speed spk length. Sets the duration, measured in ic_clk cycles
 * @return This function has no return
 */
void HAL_I2C1_Spklen_HS(uint8_t spklen);
/**
 * @brief  Set the full speed spk length. Sets the duration, measured in ic_clk cycles
 * @return This function has no return
 */
void HAL_I2C1_Spklen_FS(uint8_t spklen);
/**
 * @brief  read restart det interrupt status and clear the interrupt at the same time.
 * @return return the restart det interrupt status.
 */
uint8_t HAL_I2C1_Clr_Restart_Det(void);
/**
 * @brief  read gen call interrupt status and clear the interrupt at the same time.
 * @return return the gen call interrupt status.
 */
uint8_t HAL_I2C1_Clr_Gen_Call(void);
/**
 * @brief  read Start_Det interrupt status and clear the interrupt at the same time.
 * @return return the Start_Det interrupt status.
 */
uint8_t HAL_I2C1_Clr_Start_Det(void);
/**
 * @brief  read Stop Det interrupt status and clear the interrupt at the same time.
 * @return return the Stop Det interrupt status.
 */

uint8_t HAL_I2C1_Clr_Stop_Det(void);
/**
 * @brief  read Activity interrupt status and clear the interrupt at the same time.
 * @return return the Activity interrupt status.
 */
uint8_t HAL_I2C1_Clr_Activity(void);
/**
 * @brief  read rx done interrupt status and clear the interrupt at the same time.
 * @return return the rx done interrupt status.
 */
uint8_t HAL_I2C1_Clr_Rx_Done(void);
/**
 * @brief  read tx abort interrupt status and clear the interrupt at the same time.
 * @return return the tx abort interrupt status.
 */
uint8_t HAL_I2C1_Clr_Tx_Abort(void);
/**
 * @brief  read rd req interrupt status and clear the interrupt at the same time.
 * @return return the rd req interrupt status.
 */
uint8_t HAL_I2C1_Clr_Rd_Req(void);
/**
 * @brief  read tx over interrupt status and clear the interrupt at the same time.
 * @return return the tx over interrupt status.
 */
uint8_t HAL_I2C1_Clr_Tx_Over(void);
/**
 * @brief  read rx under interrupt status and clear the interrupt at the same time.
 * @return return the rx under interrupt status.
 */
uint8_t HAL_I2C1_Clr_Rx_Under(void);
/**
 * @brief  read to clear the combined interrupt, all individual interrupts, and the IC_TX_ABRT_SOURCE register.
 * @return return the combined interrupt status.
 */
uint8_t HAL_I2C1_Clr_Intr(void);
/**
 * @brief  Get the raw int status of i2c, before the int mask.
 * @return return the raw int status.
 */
uint32_t HAL_I2C1_Raw_Intr_Status(void);
/**
 * @brief  Set the int mask
 * @param  mask: the bit map of int mask, it is ored from enum I2C_Int_Mask.
 * @return This function has no return.
 */
void HAL_I2C1_Intr_Mask_Set(uint16_t mask);
/**
 * @brief  Get the int mask
 * @return return the int mask.
 */
uint16_t HAL_I2C1_Intr_Mask_Get(void);
/**
 * @brief  Get the raw int status of i2c, after the int mask.
 * @return return the raw int status.
 */
uint16_t HAL_I2C1_Intr_Status(void);
/**
 * @brief  Get the ic enable status.
 * @return return the ic enable status.
 */
uint8_t HAL_I2C1_IC_Enable_Status(void);
/**
 * @brief  Get the ic status.
 * @return return the ic status.
 */
uint32_t HAL_I2C1_IC_Status(void);
/**
 * @brief Initialize i2c module.
 * @param i2c_src_clk: input the src_clk of spi module, should be always equal to apb_clk0 in plf.h
 * @param i2c_config: input the i2c configure structure to initialize the module.
 * @param setting: user defined timing of i2c, can be NULL if use default timing.
 * @return This function has no return value.
 */
void HAL_I2C1_Init(uint32_t i2c_src_clk, I2C_InitTypeDef i2c_config, I2C_Timing_Setting *setting);


#endif



/// @} I2C


