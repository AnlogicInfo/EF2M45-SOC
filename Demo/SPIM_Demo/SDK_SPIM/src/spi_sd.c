#define SD_SPI_CS     GPIO_5
#define SD_SPI_CLK    GPIO_6
#define SD_SPI_SDO    GPIO_7
#define SD_SPI_SDI    GPIO_8
#define SPI_CS_ENABLE  HAL_GPIO_WritePin(SPI_CS,1)  	
void SPIM_IoMux()
{
	HAL_SYSCON_Function_IO_Set(SPI_SS , SD_SPI_CS , 1);
    HAL_SYSCON_Function_IO_Set(SPI_CLK, SD_SPI_CLK, 1);
    HAL_SYSCON_Function_IO_Set(SPI_SDO, SD_SPI_SDO, 1);
    HAL_SYSCON_Function_IO_Set(SPI_SDI, SD_SPI_SDI, 1);	
}

void sd_init(void)
{
	int i;	
	SPIM_IoMux();
	SPIM_InitTypeDef spi_cfg;            
	spi_cfg.dfs = DFS_32_8_bits;    //设置SPI的数据大小：SPI发送接收8位帧结构     	
	spi_cfg.cfs = Control_Word_1_bit;    	
	spi_cfg.scpol = Inactive_Low;        
	spi_cfg.scph = SCLK_Toggle_In_Middle;
	spi_cfg.format = Motorola_SPI;       
	spi_cfg.speed = 500000;              
	//初始化SPI                                    
	HAL_SPIM_Init(APB_CLK0,spi_cfg);  
	
	SPI_CS_ENABLE;

    u8 r1;      // 
    u16 retry;  //  
    u8 buf[4];  
	u16 i;

	SD_SPI_Init();		// 
 	SD_SPI_SpeedLow();	// 
 	for(i=0;i<10;i++)SD_SPI_ReadWriteByte(0XFF);// 
	retry=20;	
}   