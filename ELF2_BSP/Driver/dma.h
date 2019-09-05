
/**
 ****************************************************************************************
 *
 * @file hal_dma.h
 *
 * @brief dma driver interface
 *
 * (C) COPYRIGHT 2015-2017 FASTASIC Limited.
 *          ALL RIGHTS RESERVED
 *
 ****************************************************************************************
 */



/**
 ****************************************************************************************
 * @addtogroup DMA
 * @ingroup DRIVERS
 * @brief DMA Drivers. DMA support 3 mode memory to memory, memory to peripheral, peripheral to memory
 * @{
 ****************************************************************************************
 */



#ifndef DMAC_H_
#define DMAC_H_
#include <stdint.h>

/**
 * @brief enum to enable or disable dma controller.
 */
typedef enum{
	DMAC_Disabled = 0,
	DMAC_Enabled
}DMAC_Dma_En;

/**
 * @brief enum of DMAC_Int_En to enable or disable dma interrupt.
 */
typedef enum{
	Interrupt_Disabled = 0,
	Interrupt_Enabled
}DMAC_Int_En;
/**
 * @brief enum of transfer width. 
 */
typedef enum{
	Transfer_Width_8_bits = 0,
	Transfer_Width_16_bits,
	Transfer_Width_32_bits,
	Transfer_Width_64_bits,
	Transfer_Width_128_bits,
	Transfer_Width_256_bits
}DMAC_Src_Dst_Width;

/**
 * @brief enum of DMAC_Sinc_Dinc. Define the address increasement of source or destination device. 
 *        when working in memory to memory mode, source and destination addess are all set to Address_Increment
 *        when working in memory to peripheral mode, source address is set to Address_Increment and destination address is set to Address_No_Change
 *        when working in peripheral to memory mode, destination address is set to Address_Increment and source address is set to Address_No_Change.
 */
typedef enum{
	Address_Increment = 0,
	Address_Decrement,
	Address_No_Change
}DMAC_Sinc_Dinc;

/**
 * @brief Set the burst transaction length. The threshold to request of dma transfer in peripheral should be less than the length set here. 
 *        Normally, the threshold = msize-1. For example, msize = Burst_Transaction_Length_4, then the threshold should set to 3.
 */
typedef enum{
	Burst_Transaction_Length_1 = 0,
	Burst_Transaction_Length_4,
	Burst_Transaction_Length_8,
	Burst_Transaction_Length_16,
	Burst_Transaction_Length_32,
	Burst_Transaction_Length_64,
	Burst_Transaction_Length_128,
	Burst_Transaction_Length_256
}DMAC_Src_Dst_Msize;

/**
 * @brief Set the DMA Transfer type, set dma to work in memory to memory, memory to peripheral or peripheral to memory mode
 */
typedef enum{
	Memory_to_Memory_DMAC_Flow_Controller = 0,
	Memory_to_Peripheral_DMAC_Flow_Controller,
	Peripheral_to_Memory_DMAC_Flow_Controller,
/*	Peripheral_to_Peripheral_DMAC_Flow_Controller,
	Peripheral_to_Memory_Peripheral_Flow_Controller,
	Peripheral_to_Peripheral_Source_Peripheral_Flow_Controller,
	Memory_to_Peripheral_Peripheral_Flow_Controller,
	Peripheral_to_Peripheral_Destination_Peripheral_Flow_Controller
*/	
}DMAC_Transfer_Type;

/**
 * @brief Set the device type.
 */
typedef enum{
	QSPI_RX = 0,
	QSPI_TX,
	AHB_SLAVE,
	I2C0_TX,
	I2C0_RX,
	I2C1_TX,
	I2C1_RX,
	SPIM_TX,
	SPIM_RX,
	UART_TX,
	UART_RX,
	ADCM_RX,
	ADCS_RX,
}DMAC_Dev_Type;

/**
 * @brief Set the DMA channel to operate.
 */
typedef enum{
    DMAC_CHANNEL_0 = 1,
    DMAC_CHANNEL_1 = 2
}DMAC_Channel_Num;

/**
 * @brief define the bit map of dma interrupt.
 */
typedef enum{
    Int_Status_Tfr = 0x1,
    Int_Status_Block = 0x2,
    Int_Status_SrcTran = 0x4,
    Int_Status_DstTran = 0x8,
    Int_Status_Err =0x10
}DMAC_IntStatus;


#define DMAC_CHANNEL_NUM    2
#define MAX_DMAC_TRANSFER_SIZE 4095


#define DMAC_SPIM_RW_ADDRESS     ((void *)0x40006060)    
#define DMAC_UART_RW_ADDRESS    ((void *)0x40003000)        

/**
 * @brief This is the struct to initialize the DMA module.
 */
typedef struct
{
    DMAC_Dev_Type device;            /**< device: select which device need to perform a DMA operation */
    DMAC_Transfer_Type type;         /**< type: define the dma transfer type */
    DMAC_Src_Dst_Msize msize;        /**< msize: define the dma transfer type */
    DMAC_Src_Dst_Width width;        /**< width: define the dma transfer width */
    DMAC_Sinc_Dinc src_inc;          /**< src_inc: define the source address increasement */
    DMAC_Sinc_Dinc dst_inc;          /**< dst_inc: define the destination address increasement */
    DMAC_Int_En int_en;              /**< int_en: enable or disable the interrupt */
    
}DMAC_InitTypeDef;

void dmac_transfer_qspi_init(void);
void dmac_transfer_QSPI_RX(void *src, void *dst, uint32_t length);
void dmac_transfer_QSPI_RX_32Bit(void *src, void *dst, uint32_t length);
void dmac_transfer_QSPI_TX(void *src, void *dst, uint32_t length);
void dmac_transfer_QSPI_TX_32Bit(void *src, void *dst, uint32_t length);

/**
 * @brief Initialize a dma transfer.
 * @param  ch_idx: specify which dma channel to initialize.
 * @param  config: contain the parameter to initialize the dma
 * @return This function has no return.
 */
void HAL_DMAC_Init(DMAC_Channel_Num ch_idx, DMAC_InitTypeDef config);
/**
 * @brief Start a dma transfer.
 * @param  ch_idx: specify which dma channel to operate.
 * @param  src: specify src address.
 * @param  dst: specify dst address.
 * @param  length: define the data length you want to transfer. maximum is 1023
 * @return This function has no return.
 */
void HAL_DMAC_Start_Transfer(DMAC_Channel_Num ch_idx, void *src, void *dst, uint32_t length);
/*
void HAL_DMAC_Tx_Init(DMAC_Channel_Num ch_idx, DMAC_InitTypeDef config);
void HAL_DMAC_Start_Tx(DMAC_Channel_Num ch_idx, void *src, void *dst, uint32_t length);
void HAL_DMAC_Rx_Init(DMAC_Channel_Num ch_idx, DMAC_InitTypeDef config);
void HAL_DMAC_Start_Rx(DMAC_Channel_Num ch_idx, void *src, void *dst, uint32_t length);
*/
/**
 * @brief Wait DMA transfer finish of specify channel. This function will not return before DMA transfer finish.
 * @param  ch_idx: specify which dma channel to operate.
 * @return This function has no return.
 */
void HAL_DMAC_Wait_Done(DMAC_Channel_Num ch_idx);
/**
 * @brief Enable or disable the dma module globally.
 * @param  en: 1 - enable dma module  0 - disable dma module. When dma is disabled, all operation to dma is useless.
 * @return This function has no return.
 */
void HAL_DMAC_Global_En(uint8_t en);
/**
 * @brief Get channel enabled status
 * @return Return which channel is enabled, the return value is ored of enum DMAC_Channel_Num
 */
uint8_t HAL_DMAC_Get_Busy_Channel(void);
/**
 * @brief Get raw status of tfr interrupt.
 * @return Return raw status of tfr interrupt.
 */
uint8_t HAL_DMAC_RawStatus_Tfr(void);
/**
 * @brief Get raw status of block interrupt.
 * @return Return raw status of block interrupt.
 */
uint8_t HAL_DMAC_RawStatus_Block(void);
/**
 * @brief Get raw status of SrcTran interrupt.
 * @return Return raw status of SrcTran interrupt.
 */
uint8_t HAL_DMAC_RawStatus_SrcTran(void);
/**
 * @brief Get raw status of DstTran interrupt.
 * @return Return raw status of DstTran interrupt.
 */
uint8_t HAL_DMAC_RawStatus_DstTran(void);
/**
 * @brief Get raw status of err interrupt.
 * @return Return raw status of err interrupt.
 */
uint8_t HAL_DMAC_RawStatus_Err(void);
/**
 * @brief Get status of Tfr interrupt.
 * @return Return status of Tfr interrupt.
 */
uint8_t HAL_DMAC_Status_Tfr(void);
/**
 * @brief Get status of Block interrupt.
 * @return Return status of Block interrupt.
 */
uint8_t HAL_DMAC_Status_Block(void);
/**
 * @brief Get status of SrcTran interrupt.
 * @return Return status of SrcTran interrupt.
 */
uint8_t HAL_DMAC_Status_SrcTran(void);
/**
 * @brief Get status of DstTran interrupt.
 * @return Return status of DstTran interrupt.
 */
uint8_t HAL_DMAC_Status_DstTran(void);
/**
 * @brief Get status of Err interrupt.
 * @return Return status of Err interrupt.
 */
uint8_t HAL_DMAC_Status_Err(void);
/**
 * @brief Set to unmask tfr interrupt
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @param  unmasked_map: set the bit map of channel to unmask the interrupt. 1 to unmask the interrupt, 0 to mask the interrupt.
 * @return This function has no return.
 */
void HAL_DMAC_UnMask_Tfr(DMAC_Channel_Num ch_map, uint8_t unmasked_map);
/**
 * @brief Set to unmask block interrupt
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @param  unmasked_map: set the bit map of channel to unmask the interrupt. 1 to unmask the interrupt, 0 to mask the interrupt.
 * @return This function has no return.
 */
void HAL_DMAC_UnMask_Block(DMAC_Channel_Num ch_map, uint8_t unmasked_map);
/**
 * @brief Set to unmask SrcTran interrupt
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @param  unmasked_map: set the bit map of channel to unmask the interrupt. 1 to unmask the interrupt, 0 to mask the interrupt.
 * @return This function has no return.
 */
void HAL_DMAC_UnMask_SrcTran(DMAC_Channel_Num ch_map, uint8_t unmasked_map);
/**
 * @brief Set to unmask DstTran interrupt
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @param  unmasked_map: set the bit map of channel to unmask the interrupt. 1 to unmask the interrupt, 0 to mask the interrupt.
 * @return This function has no return.
 */
void HAL_DMAC_UnMask_DstTran(DMAC_Channel_Num ch_map, uint8_t unmasked_map);
/**
 * @brief Set to unmask err interrupt
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @param  unmasked_map: set the bit map of channel to unmask the interrupt. 1 to unmask the interrupt, 0 to mask the interrupt.
 * @return This function has no return.
 */
void HAL_DMAC_UnMask_Err(DMAC_Channel_Num ch_map, uint8_t unmasked_map);
/**
 * @brief Clear the tfr interrupt.
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @return This function has no return.
 */
void HAL_DMAC_Clr_Tfr(DMAC_Channel_Num ch_map);
/**
 * @brief Clear the Block interrupt.
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @return This function has no return.
 */
void HAL_DMAC_Clr_Block(DMAC_Channel_Num ch_map);
/**
 * @brief Clear the SrcTran interrupt.
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @return This function has no return.
 */
void HAL_DMAC_Clr_SrcTran(DMAC_Channel_Num ch_map);
/**
 * @brief Clear the DstTran interrupt.
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @return This function has no return.
 */
void HAL_DMAC_Clr_DstTran(DMAC_Channel_Num ch_map);
/**
 * @brief Clear the err interrupt.
 * @param  ch_map: specify which dma channel to operate. We can use channel map here. Channels to operate is ored from enum DMAC_Channel_Num
 * @return This function has no return.
 */
void HAL_DMAC_Clr_Err(DMAC_Channel_Num ch_map);
/**
 * @brief Get the combined interrupt status.
 * @return Return the combined interrupt status. The return value is ored result of enum DMAC_IntStatus.
 */
uint8_t HAL_DMAC_Int_Status(void);


#endif


/// @} DMA

