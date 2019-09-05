#include "test_adc.h"
#include "adcc.h"
#include "platform.h"
#include "int_register.h"
#include "elf2.h"
#include "log.h"
#include "dma.h"

void test_adc_single(void)
{
	volatile uint16_t adc_data;
	ADCC_InitTypeDef cfg;
	cfg.adc_clk = APB_CLK0 / 4;
	cfg.align = 0;
	HAL_ADCCM_Init(APB_CLK0, cfg);
	while(1)
	{
		adc_data = HAL_ADCCM_Single_Channel_Polling(ADC_IN4);
    printf("ADC%dCH4=0x%x\tVol=%0.1fV\n",(adc_data>>16)&0x7,adc_data&0xffff,adc_data*2.5/4096);
	}
}


void adcc0_eoc_isr(void)            // ADCC2_IRQn
{
	volatile uint32_t result;
	result = HAL_ADCCM_Get_ADC_Data();
    if((result>>21)&1)          // data is valid
        printf("ADC%d = 0x%x\tVol=%0.1fV\n",(result>>16)&0x7, result&0xffff,result*2.5/4096);


}

void adcc0_eos_isr(void)
{
    printf("ADC EOS!\n");   
}

void adcc0_ovr_isr(void)
{
    
    printf("ADC OverRun!_%x\n",HAL_ADCCM_OverRun_Channel_Map());
}


void test_adc_continue(void)
{
	ADCC_InitTypeDef cfg;
	cfg.adc_clk = APB_CLK0 / 8;
	cfg.align = 0;
	HAL_ADCCM_Init(APB_CLK0, cfg);
	HAL_ADCCM_Single_Channel(ADC_IN4, ADCC_CONTINUOUS_MODE, ADC_INT_EOC|ADC_INT_OVERRUN|ADC_INT_EOS);
	ADCC0_Int_Register(adcc0_eos_isr,NULL);
    ADCC1_Int_Register(adcc0_eoc_isr,NULL);
    ADCC2_Int_Register(adcc0_ovr_isr,NULL);

	NVIC_EnableIRQ(ADCC0_IRQn);
    NVIC_EnableIRQ(ADCC1_IRQn);
    NVIC_EnableIRQ(ADCC2_IRQn);

	HAL_ADCCM_ADC_Start();

}




void dma_isr()
{
    uint8_t status;
    status = HAL_DMAC_Int_Status();
    if((status & Int_Status_Tfr)!=0)
    {
        
        
    }
    if((status & Int_Status_Block)!=0)
    {
        if(HAL_DMAC_Status_Block() & DMAC_CHANNEL_0)
        {
            //channnel 0 block interrupt
            HAL_DMAC_Clr_Block(DMAC_CHANNEL_0);
            
        }
        if(HAL_DMAC_Status_Block() & DMAC_CHANNEL_1)
        {
            //channnel 1 block interrupt
            HAL_DMAC_Clr_Block(DMAC_CHANNEL_1);
            printf("dma channel 1 finish\n");
            HAL_ADCCM_ADC_Stop();
            
            
        }
        
    }
    
    
}


volatile uint32_t adc_result[16];
void test_adc_single_scan()
{
    ADCC_InitTypeDef cfg;
	cfg.adc_clk = APB_CLK0 / 8;
	cfg.align = 0;
	HAL_ADCCM_Init(APB_CLK0, cfg);

    HAL_ADCCM_Set_ADC_Squence(8,0,1,2,3,4,5,6,7);
    HAL_ADCCM_WorkMode(ADCC_SINGLE_MODE);
    HAL_ADCCM_DMA_En(ADCC_DMA_ENABLE);

    DMAC_InitTypeDef dma_config;
    dma_config.device = ADCM_RX;
    dma_config.type = Peripheral_to_Memory_DMAC_Flow_Controller;
    dma_config.msize = Burst_Transaction_Length_1;
    dma_config.width = Transfer_Width_32_bits;
    dma_config.src_inc = Address_No_Change;
    dma_config.dst_inc = Address_Increment;
    dma_config.int_en = Interrupt_Enabled;
    HAL_DMAC_Init(DMAC_CHANNEL_1,dma_config);


    HAL_DMAC_UnMask_Block(DMAC_CHANNEL_1,0x2);
    DMAC_Int_Register(dma_isr,NULL);
    NVIC_EnableIRQ(DMAC_IRQn);
    
    HAL_DMAC_Start_Transfer(DMAC_CHANNEL_1,SINGLE_ADCM_DMA_ADDRESS,(void *)adc_result,8);

    HAL_ADCCM_ADC_Start();


}



void test_adc_contiune_scan()
{
    ADCC_InitTypeDef cfg;
	cfg.adc_clk = APB_CLK0 / 8;
	cfg.align = 0;
	HAL_ADCCM_Init(APB_CLK0, cfg);

    HAL_ADCCM_Set_ADC_Squence(8,0,1,2,3,4,5,6,7);
    HAL_ADCCM_WorkMode(ADCC_CONTINUOUS_MODE);
    HAL_ADCCM_DMA_En(ADCC_DMA_ENABLE);

    DMAC_InitTypeDef dma_config;
    dma_config.device = ADCM_RX;
    dma_config.type = Peripheral_to_Memory_DMAC_Flow_Controller;
    dma_config.msize = Burst_Transaction_Length_1;
    dma_config.width = Transfer_Width_32_bits;
    dma_config.src_inc = Address_No_Change;
    dma_config.dst_inc = Address_Increment;
    dma_config.int_en = Interrupt_Enabled;
    HAL_DMAC_Init(DMAC_CHANNEL_1,dma_config);


    HAL_DMAC_UnMask_Block(DMAC_CHANNEL_1,0x2);
    DMAC_Int_Register(dma_isr,NULL);
    NVIC_EnableIRQ(DMAC_IRQn);
    
    HAL_DMAC_Start_Transfer(DMAC_CHANNEL_1,SINGLE_ADCM_DMA_ADDRESS,(void *)adc_result,16);

    HAL_ADCCM_ADC_Start();

}



void adcc0_eoc_isr_trg()
{
	uint8_t flag = 0;
	volatile uint32_t result;
	result = HAL_ADCCM_Get_ADC_Data();

    if(flag >= 5)
    {
        HAL_ADCCM_Stop_Timer_Trg();
    }
    if((result>>21)&1)          // data is valid
    {
        printf("ADC%d = 0x%x\n",(result>>16)&0x7, result&0xffff);
        flag++;
    }

}

void test_adc_timer_trigger()
{
    
    ADCC_InitTypeDef cfg;
    cfg.adc_clk = APB_CLK0 / 8;
    cfg.align = 0;
    HAL_ADCCM_Init(APB_CLK0, cfg);
    HAL_ADCCM_Single_Channel(ADC_IN4,  ADCC_SINGLE_MODE, ADC_INT_EOC/*|ADC_INT_OVERRUN*/);
    ADCC1_Int_Register(adcc0_eoc_isr_trg,NULL);
    NVIC_EnableIRQ(ADCC1_IRQn);
    HAL_ADCCM_Set_TrgSrc(ADCC_TRIG_TIMER,ADCC_Trig_Enable);
    HAL_ADCCM_Timer_Trigger(ADCC_Trg_Periodic, 0xfffffff);
    
    HAL_ADCCM_ADC_Start();
    
    HAL_ADCCM_Start_Timer_Trg();

//    HAL_ADCCM_ADC_Start();

}


void test_adc_sw_trigger()
{
    
    ADCC_InitTypeDef cfg;
    cfg.adc_clk = APB_CLK0 / 8;
    cfg.align = 0;
    HAL_ADCCM_Init(APB_CLK0, cfg);
    HAL_ADCCM_Single_Channel(ADC_IN6,  ADCC_SINGLE_MODE, ADC_INT_EOC/*|ADC_INT_OVERRUN*/);
    ADCC1_Int_Register(adcc0_eoc_isr_trg,NULL);
    NVIC_EnableIRQ(ADCC1_IRQn);
    HAL_ADCCM_Set_TrgSrc(ADCC_TRIG_SW,ADCC_Trig_Enable);
    HAL_ADCCM_ADC_Start();
    HAL_ADCCM_SW_Trigger(ADCC_Trig_Enable);
    
//    HAL_ADCCM_ADC_Start();

}
