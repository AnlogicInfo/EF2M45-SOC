#include   "segger_rtt.h"
#include   "spim.h" 
#include   <stdio.h>
#include   <stdint.h>
#include   "elf2.h"
           
#include   "platform.h"
#include   "syscon.h"
#include   <string.h>
           
#include   "log.h"
           
#include   "int_register.h"
           
#include   "gpio.h"
#include   "spi_driver_sd.h" 
 
#define    SD_SPI_CS       gpio0_10         
#define    SD_SPI_CLK      gpio0_11          
#define    SD_SPI_SDO      gpio0_9          
#define    SD_SPI_SDI      gpio0_8           
                           
#define    CMD0            0x00        
#define    CMD1            0x01
#define    CMD8            0x08
#define    CMD9            0x09
#define    CMD10           0x0A
#define    CMD11           0x0B
#define    CMD12           0x0C
#define    CMD16           0x10
#define    CMD17           0x11
#define    CMD24           0x18
                           
#define    CMD41           0x29
#define    CMD55           0x37
#define    CMD58           0x3A
#define    CMD59           0x3B

// SD Type define             
#define    SD_TYPE_ERR     0X00  
#define    MMC             0X01  
#define    V1              0X02  
#define    V2              0X04  
#define    V2HC            0X06  
   
#define    SPI_CS_HIGH     HAL_GPIO_WritePin(SD_SPI_CS,1)  
#define    SPI_CS_LOW      HAL_GPIO_WritePin(SD_SPI_CS,0) 

uint8_t    SD_Type = 0; 

/*******************************************************************************
* 函数名称       : SPIM_IoMux
* 功能描述       : SPI控制器管脚映射函数
* 进入参数       : None
* 返回参数       : None
* 备注说明       : None
*******************************************************************************/
void SPIM_IoMux(void)
{
    HAL_SYSCON_Function_IO_Set(SPI_SS , gpio1_15   , 1); //Pseudo-Pin,
    HAL_SYSCON_Function_IO_Set(SPI_CLK, SD_SPI_CLK, 1);
    HAL_SYSCON_Function_IO_Set(SPI_SDO, SD_SPI_SDO, 1);
    HAL_SYSCON_Function_IO_Set(SPI_SDI, SD_SPI_SDI, 1);
    
    printf("Function SPIM_IoMux() Running\n");          
}

/*******************************************************************************
* 函数名称       : CS_Gpio_Init
* 功能描述       : GPIO模拟CS信号函数
* 进入参数       : None
* 返回参数       : None
* 备注说明       : None
*******************************************************************************/
void CS_Gpio_Init(void)
{
    GPIO_InitTypeDef spi_cs;
    spi_cs.dir = gpio_Output;
    spi_cs.debounce = gpio_Deb;
    spi_cs.value = gpio_High;   
    HAL_GPIO_Init(SD_SPI_CS,spi_cs); 
    
    SPI_CS_HIGH;  
    
    printf("Function CS_Gpio_Init() Running\n");                
}

/*******************************************************************************
* 函数名称       : SPI_FLASH_SendByte
* 功能描述       : 发送一个数据，同时接收从FLASH返回来的数据
* 进入参数       : byte : byte to send.
* 返回参数       : None
* 备注说明       : The value of the received byte.
*******************************************************************************/
void SD_Device_Init(void)
{
    SPIM_IoMux();//管脚映射
    
    CS_Gpio_Init();//CS初始化
    
    SPIM_InitTypeDef spi_cfg;            
    spi_cfg.dfs = DFS_32_8_bits;   
    spi_cfg.cfs = Control_Word_1_bit;       
    spi_cfg.scpol = Inactive_Low;        
    spi_cfg.scph = SCLK_Toggle_In_Middle;
    spi_cfg.format = Motorola_SPI;       
    spi_cfg.speed = 250000;              
    //Initial SPI Mater Controller                                 
    HAL_SPIM_Init(APB_CLK0,spi_cfg);  
    printf("Function SD_Device_Init() Running\n");
}  
 
/*******************************************************************************
* 函数名称       : SD_SPI_WriteByte
* 功能描述       : 发送一个数据 
* 进入参数       : byte : byte to send.
* 返回参数       : None
* 备注说明       : None
*******************************************************************************/
void SD_SPI_WriteByte(uint8_t byte)
{
    uint32_t writebyte = byte;
    HAL_SPIM_Write_Polling(&writebyte, 1);
}

/*******************************************************************************
* 函数名称       : SD_SPI_ReadByte
* 功能描述       : 发送一个数据 
* 进入参数       : None
* 返回参数       : None
* 备注说明       : 返回接收到的字节  
*******************************************************************************/
uint8_t SD_SPI_ReadByte()
{
    uint32_t recv_byte;
    HAL_SPIM_Read_Only_Polling(&recv_byte,1); 
    return recv_byte;
}
 
/*******************************************************************************
* 函数名称       : SD_Select
* 功能描述       : 选择SD卡，并等待SD卡准备好
* 进入参数       : 无.
* 返回参数       : 0：成功       1：失败
* 备注说明       : SD卡准备好会返回0XFF
*******************************************************************************/
uint8_t SD_Select(void)
{
    uint32_t t=0;
    uint8_t  res=0;
    SPI_CS_LOW;//片选SD，低电平使能
 
    do
    {
        if(SD_SPI_ReadByte()==0XFF)
        {        
            res = 1;//OK
            break;
        }
        t++;     
    }while(t<0XFFFFFF);//等待
    SPI_CS_HIGH;//释放总线
   
    return res;//等待失败
}
 
/*******************************************************************************
* 函数名称       : SD_DisSelect
* 功能描述       : 取消选择,释放SPI总线
* 进入参数       : 无.
* 返回参数       : 无.
* 备注说明       : 
*******************************************************************************/
void SD_DisSelect(void)  
{  
    SPI_CS_HIGH;  
    uint32_t send_byte =0xFF;
    //SPI_CS_HIGH;         
    HAL_SPIM_Write_Polling(&send_byte, 1);//提供额外的8个时钟      
} 

/*******************************************************************************
* 函数名称       : SD_SendCmd
* 功能描述       : 向sd卡写入一个数据包的内容 512字节
* 进入参数       : cmd：命令  arg：命令参数  crc：crc校验值及停止位
* 返回参数       : 返回值:SD卡返回的对应相应命令的响应
* 备注说明       : 响应为R1-R7，见SD协议手册V2.0版（2006）
*******************************************************************************/
uint8_t SD_SendCmd(uint8_t cmd, uint32_t arg, uint8_t crc, uint8_t reset)
{
    uint8_t tmp; 
    uint8_t i  ; 
    SD_DisSelect();//取消上次片选释放总线

    SPI_CS_LOW;
    
    SD_SPI_WriteByte(cmd | 0x40);//分别写入命令

    SD_SPI_WriteByte(arg >> 24);
    SD_SPI_WriteByte(arg >> 16);
    SD_SPI_WriteByte(arg >> 8);
    SD_SPI_WriteByte(arg);   
    SD_SPI_WriteByte(crc); 

    i=0; //成功或超时退出
    do
    {
        tmp=SD_SPI_ReadByte();
        i++;        
        if(i>200)
            break;
    }while(tmp==0xff);   

    return tmp;
}

/*******************************************************************************
* 函数名称       : SD_Initialize
* 功能描述       : 写SD卡
* 进入参数       : 无 
* 返回参数       : 0：成功       其他：失败
* 备注说明       : 1.写的地址必须是一个扇区的起始
*                  2.必须是SD2.0卡，其他的卡不处理
*******************************************************************************/
uint8_t SD_Initialize(void)
{
    uint8_t r1;    // 存放SD卡的返回值
    uint16_t tmp;  // 用来进行超时计数
    uint8_t  buf[4];  
    uint16_t i;
    uint32_t send_pulse[10];   
    //send_pulse = 0xFF;    
    memset(send_pulse, 0x35, sizeof(send_pulse));
    
    SD_Device_Init();
  
    SEGGER_RTT_printf(0,"Test SD Card by SPI Mode... ...\n"); 
    //发送至少74个时钟周期的高电平(CS)----------------------------------------
    SEGGER_RTT_printf(0,"Send 74 pulse\n");     

    SPI_CS_HIGH;
    HAL_SPIM_Write_Polling(send_pulse,10);   
    SPI_CS_HIGH;


    i=0;
    do
    {   //发送CMD0,进入SPI模式
        tmp = SD_SendCmd(0,0,0x95,1);
        i++;
    }while((tmp!=0x01)&&(i<200));//等待回应0x01

    if(tmp==200)
        return 1; //失败退出

    //获取卡的版本信息
    SPI_CS_LOW; 
      tmp=SD_SendCmd(8, 0x1aa,0x87,0);
      SEGGER_RTT_printf(0,"SD 1Ver. %d~\n",tmp);
    if(tmp==0x05)
    {   //v1.0版和MMC
        SD_Type=V1;  //预设SDV1.0
    
        SPI_CS_HIGH;    
        
        SD_SPI_WriteByte(0xff); //增加8个时钟确保本次操作完成
    
        i=0;
        do
        {
            tmp=SD_SendCmd(55,0,0,1); //发送CMD55,应返回0x01
            if(tmp==0xff)
                return tmp;  //返回0xff表明无卡,退出
        
            tmp=SD_SendCmd(41,0,0,1); //再发送CMD41,应返回0x00
            i++;
            //回应正确,则卡类型预设成立
        }while((tmp!=0x00) && (i<400));
    
        if(i==400)
        {   //无回应,是MMC卡
            i=0;
            
            do
            {   //MMC卡初始化
                tmp=SD_SendCmd(1,0,0,1);
                i++;
            }while((tmp!=0x00)&& (i<400));

        if(i==400)
            return 1;   //MMC卡初始化失败
            
        SD_Type=MMC;
    }
    
    //SPI1_Init(4); //SPI时钟改用4分频(18MHz)

    SD_SPI_WriteByte(0xff);//输出8个时钟确保前次操作结束

    //禁用CRC校验
    tmp=SD_SendCmd(59,0,0x95,1);
    if(tmp!=0x00)
      return tmp;  //错误返回
    
    //设置扇区宽度
    tmp=SD_SendCmd(16,512,0x95,1);
    if(tmp!=0x00)
        return tmp;//错误返回
    }
    
    else if(tmp==0x01)
    { 
        //V2.0和V2.0HC版
        //忽略V2.0卡的后续4字节
        SD_SPI_WriteByte(0xff);
        SD_SPI_WriteByte(0xff);
        SD_SPI_WriteByte(0xff);
        SD_SPI_WriteByte(0xff);
            
        //SD_CS=1;    
        SPI_CS_HIGH;        
        SD_SPI_WriteByte(0xff); //增加8个时钟确保本次操作完成
            
        {     
            i=0;
            do
            {
                tmp=SD_SendCmd(55,0,0,1);
                if(tmp!=0x01)
                    return tmp;    //错误返回  
                
                tmp=SD_SendCmd(41,0x40000000,0,1);
                if(i>200)
                    return tmp;  //超时返回
            }while(tmp!=0);         
            
            tmp=SD_SendCmd(58,0,0,0);
            if(tmp!=0x00)
            {
                //SD_CS=1;  //失能SD
                SPI_CS_HIGH;      
                return tmp;  //错误返回
            }
            
            //接收OCR信息
            SD_SPI_WriteByte(0xff);
            buf[0]=SD_SPI_ReadByte();
            SD_SPI_WriteByte(0xff);
            buf[1]=SD_SPI_ReadByte();      
            SD_SPI_WriteByte(0xff);
            buf[2]=SD_SPI_ReadByte();    
            SD_SPI_WriteByte(0xff);
            buf[3]=SD_SPI_ReadByte();    
            
            //SD_CS=1;
            SPI_CS_HIGH;  
            SD_SPI_WriteByte(0xff); //增加8个时钟确保本次操作完成
            
            if(buf[0]&0x40)
                SD_Type=V2HC;
            else 
                SD_Type=V2;             
        }       
    }

    SEGGER_RTT_printf(0,"SD SD_Type. %d~\n",SD_Type);      
    return tmp;         
} 

/*******************************************************************************
* 函数名称       : SD_GetResponse
* 功能描述       : 读SD卡应答并判断
* 进入参数       : response:正确回应值
* 返回参数       : 0：成功       1：失败
* 备注说明       :    
*******************************************************************************/
uint8_t SD_GetResponse(uint8_t response)
{
    uint16_t ii; 
    uint8_t recv_val=0;
    ii=5000; //读应答最多5000次
    
    while(ii)
    {
        //SD_SPI_WriteByte(0xFF);
         
        recv_val = SD_SPI_ReadByte();
        if(recv_val == response)
            break;
        ii--;
    }
      
    if(ii==0)
        return 1;//返回失败
    else 
        return 0;//返回成功
}
 
/*******************************************************************************
* 函数名称       : SdRecvData
* 功能描述       : 从sd卡读取一个数据包的内容 ,0XFE数据起始令牌     
* 进入参数       : buf:数据缓存区  len:要读取的数据长度.  
* 返回参数       : 返回值:0,成功;其他,失败;  
* 备注说明       :    
*******************************************************************************/  
uint8_t SdRecvData(uint8_t *buf,uint16_t len)  
{
    SPI_CS_LOW;     
    uint16_t i;     
    if(SD_GetResponse(0xFE))
    {
        SPI_CS_HIGH;    
        return 1;//等待SD卡发回数据起始令牌0xFE 
    }
 
    for(i=0; i<len; i++)
    //while(len--)//开始接收数据  
    {  
   
        *buf=SD_SPI_ReadByte();//SdSpiReadWriteByte(0xFF);  
        buf++;  
    }  
  
    SD_SPI_ReadByte();
    SD_SPI_ReadByte();   
    SPI_CS_HIGH;                                                             
    return 0;//读取成功  
}  
 
/*******************************************************************************
* 函数名称       : SDReadDisk
* 功能描述       : 读SD卡  
* 进入参数       : buf:数据缓存区  sector:扇区  cnt:扇区数  
* 返回参数       : 返回值:0,成功;其他,失败;  
* 备注说明       :    
*******************************************************************************/  
uint8_t SDReadDisk(uint8_t *buf,uint32_t sector,uint8_t cnt)  
{  
    uint8_t r1;  
    //if(SD_Type!=SD_TYPE_V2HC)sector <<= 9;//转换为字节地址  
    //除SDHC外,其他卡均需扇区地址转换成字节地址
    if(SD_Type!=V2HC) sector = sector<<9;       
    if(cnt==1)  
    {  
        //r1=SD_SendCmd(CMD17,sector,0X01);//读命令  
        SPI_CS_LOW; 
  
        {
            r1=SD_SendCmd(17,sector,0x01,1);//读命令        
        }
      
        if(r1==0)//指令发送成功  
        {  
            r1=SdRecvData(buf,512);//接收512个字节        
        }  
 
    }
    
    else  
    {  
        r1=SD_SendCmd(18,sector,0X01,1);//连续读命令 CMD18
        do  
        {  
            r1=SdRecvData(buf,512);//接收512个字节      
            buf+=512;    
        }while(--cnt && r1==0);       
        SD_SendCmd(CMD12,0,0X01,1);    //发送停止命令  
    }   
  
    SD_DisSelect();//取消片选  
    return r1;//  
}  

/*******************************************************************************
* 函数名称       : SD_SendBlock
* 功能描述       : 向sd卡写入一个数据包的内容 512字节  
* 进入参数       : buf:数据缓存区  cmd:指令  
* 返回参数       : 返回值:0,成功;其他,失败;     
* 备注说明       :    
*******************************************************************************/    
uint8_t SD_SendBlock(uint8_t*buf,uint8_t cmd)  
{     
    uint16_t t;              
  
    SD_SPI_WriteByte(cmd);  
    if(cmd!=0XFD)//不是结束指令  
    {  
        for(t=0;t<512;t++)SD_SPI_WriteByte(buf[t]);//提高速度,减少函数传参时间  
        SD_SPI_WriteByte(0xFF);//忽略crc  
        SD_SPI_WriteByte(0xFF);  
        t=SD_SPI_ReadByte();//接收响应  
        if((t&0x1F)!=0x05)return 2;//响应错误                                                             
    }                                                                                     
    return 0;//写入成功  
}  

/*******************************************************************************
* 函数名称       : SDWriteDisk
* 功能描述       : 写SD卡
* 进入参数       : buf:数据缓存区  sector:起始扇区  cnt:扇区数  
* 返回参数       : 返回值:0,ok;其他,失败.  
* 备注说明       :    
*******************************************************************************/      
uint8_t SDWriteDisk(uint8_t *buf,uint32_t sector,uint8_t cnt)  
{  
    uint8_t r1;  
    if(SD_Type!= V2HC)sector *= 512;//转换为字节地址  

    if(cnt==1)  
    {  
        SPI_CS_LOW; 
        r1=SD_SendCmd(CMD24,sector,0X01,1);//读命令  
        if(r1==0)//指令发送成功  
        {  
            r1=SD_SendBlock(buf,0xFE);//写512个字节       
        }  
    } 
        
    else
    {
        SPI_CS_LOW;         
        if(SD_Type!= MMC)
        {
            SD_SendCmd(55,0,0X01,1);
            SD_SendCmd(23,cnt,0X01,1); 
        }
      
        r1=SD_SendCmd(25,sector,0X01,1);
        if(r1==0)
        {
            do
            {
                r1=SD_SendBlock(buf,0xFC);
                buf+=512;  
            }while(--cnt && r1==0);
            r1=SD_SendBlock(0,0xFD);
            }
        } 
                  
    SD_DisSelect();//取消片选  
    return r1;//  
}     

