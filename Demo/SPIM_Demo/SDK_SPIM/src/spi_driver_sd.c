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
* ��������       : SPIM_IoMux
* ��������       : SPI�������ܽ�ӳ�亯��
* �������       : None
* ���ز���       : None
* ��ע˵��       : None
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
* ��������       : CS_Gpio_Init
* ��������       : GPIOģ��CS�źź���
* �������       : None
* ���ز���       : None
* ��ע˵��       : None
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
* ��������       : SPI_FLASH_SendByte
* ��������       : ����һ�����ݣ�ͬʱ���մ�FLASH������������
* �������       : byte : byte to send.
* ���ز���       : None
* ��ע˵��       : The value of the received byte.
*******************************************************************************/
void SD_Device_Init(void)
{
    SPIM_IoMux();//�ܽ�ӳ��
    
    CS_Gpio_Init();//CS��ʼ��
    
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
* ��������       : SD_SPI_WriteByte
* ��������       : ����һ������ 
* �������       : byte : byte to send.
* ���ز���       : None
* ��ע˵��       : None
*******************************************************************************/
void SD_SPI_WriteByte(uint8_t byte)
{
    uint32_t writebyte = byte;
    HAL_SPIM_Write_Polling(&writebyte, 1);
}

/*******************************************************************************
* ��������       : SD_SPI_ReadByte
* ��������       : ����һ������ 
* �������       : None
* ���ز���       : None
* ��ע˵��       : ���ؽ��յ����ֽ�  
*******************************************************************************/
uint8_t SD_SPI_ReadByte()
{
    uint32_t recv_byte;
    HAL_SPIM_Read_Only_Polling(&recv_byte,1); 
    return recv_byte;
}
 
/*******************************************************************************
* ��������       : SD_Select
* ��������       : ѡ��SD�������ȴ�SD��׼����
* �������       : ��.
* ���ز���       : 0���ɹ�       1��ʧ��
* ��ע˵��       : SD��׼���û᷵��0XFF
*******************************************************************************/
uint8_t SD_Select(void)
{
    uint32_t t=0;
    uint8_t  res=0;
    SPI_CS_LOW;//ƬѡSD���͵�ƽʹ��
 
    do
    {
        if(SD_SPI_ReadByte()==0XFF)
        {        
            res = 1;//OK
            break;
        }
        t++;     
    }while(t<0XFFFFFF);//�ȴ�
    SPI_CS_HIGH;//�ͷ�����
   
    return res;//�ȴ�ʧ��
}
 
/*******************************************************************************
* ��������       : SD_DisSelect
* ��������       : ȡ��ѡ��,�ͷ�SPI����
* �������       : ��.
* ���ز���       : ��.
* ��ע˵��       : 
*******************************************************************************/
void SD_DisSelect(void)  
{  
    SPI_CS_HIGH;  
    uint32_t send_byte =0xFF;
    //SPI_CS_HIGH;         
    HAL_SPIM_Write_Polling(&send_byte, 1);//�ṩ�����8��ʱ��      
} 

/*******************************************************************************
* ��������       : SD_SendCmd
* ��������       : ��sd��д��һ�����ݰ������� 512�ֽ�
* �������       : cmd������  arg���������  crc��crcУ��ֵ��ֹͣλ
* ���ز���       : ����ֵ:SD�����صĶ�Ӧ��Ӧ�������Ӧ
* ��ע˵��       : ��ӦΪR1-R7����SDЭ���ֲ�V2.0�棨2006��
*******************************************************************************/
uint8_t SD_SendCmd(uint8_t cmd, uint32_t arg, uint8_t crc, uint8_t reset)
{
    uint8_t tmp; 
    uint8_t i  ; 
    SD_DisSelect();//ȡ���ϴ�Ƭѡ�ͷ�����

    SPI_CS_LOW;
    
    SD_SPI_WriteByte(cmd | 0x40);//�ֱ�д������

    SD_SPI_WriteByte(arg >> 24);
    SD_SPI_WriteByte(arg >> 16);
    SD_SPI_WriteByte(arg >> 8);
    SD_SPI_WriteByte(arg);   
    SD_SPI_WriteByte(crc); 

    i=0; //�ɹ���ʱ�˳�
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
* ��������       : SD_Initialize
* ��������       : дSD��
* �������       : �� 
* ���ز���       : 0���ɹ�       ������ʧ��
* ��ע˵��       : 1.д�ĵ�ַ������һ����������ʼ
*                  2.������SD2.0���������Ŀ�������
*******************************************************************************/
uint8_t SD_Initialize(void)
{
    uint8_t r1;    // ���SD���ķ���ֵ
    uint16_t tmp;  // �������г�ʱ����
    uint8_t  buf[4];  
    uint16_t i;
    uint32_t send_pulse[10];   
    //send_pulse = 0xFF;    
    memset(send_pulse, 0x35, sizeof(send_pulse));
    
    SD_Device_Init();
  
    SEGGER_RTT_printf(0,"Test SD Card by SPI Mode... ...\n"); 
    //��������74��ʱ�����ڵĸߵ�ƽ(CS)----------------------------------------
    SEGGER_RTT_printf(0,"Send 74 pulse\n");     

    SPI_CS_HIGH;
    HAL_SPIM_Write_Polling(send_pulse,10);   
    SPI_CS_HIGH;


    i=0;
    do
    {   //����CMD0,����SPIģʽ
        tmp = SD_SendCmd(0,0,0x95,1);
        i++;
    }while((tmp!=0x01)&&(i<200));//�ȴ���Ӧ0x01

    if(tmp==200)
        return 1; //ʧ���˳�

    //��ȡ���İ汾��Ϣ
    SPI_CS_LOW; 
      tmp=SD_SendCmd(8, 0x1aa,0x87,0);
      SEGGER_RTT_printf(0,"SD 1Ver. %d~\n",tmp);
    if(tmp==0x05)
    {   //v1.0���MMC
        SD_Type=V1;  //Ԥ��SDV1.0
    
        SPI_CS_HIGH;    
        
        SD_SPI_WriteByte(0xff); //����8��ʱ��ȷ�����β������
    
        i=0;
        do
        {
            tmp=SD_SendCmd(55,0,0,1); //����CMD55,Ӧ����0x01
            if(tmp==0xff)
                return tmp;  //����0xff�����޿�,�˳�
        
            tmp=SD_SendCmd(41,0,0,1); //�ٷ���CMD41,Ӧ����0x00
            i++;
            //��Ӧ��ȷ,������Ԥ�����
        }while((tmp!=0x00) && (i<400));
    
        if(i==400)
        {   //�޻�Ӧ,��MMC��
            i=0;
            
            do
            {   //MMC����ʼ��
                tmp=SD_SendCmd(1,0,0,1);
                i++;
            }while((tmp!=0x00)&& (i<400));

        if(i==400)
            return 1;   //MMC����ʼ��ʧ��
            
        SD_Type=MMC;
    }
    
    //SPI1_Init(4); //SPIʱ�Ӹ���4��Ƶ(18MHz)

    SD_SPI_WriteByte(0xff);//���8��ʱ��ȷ��ǰ�β�������

    //����CRCУ��
    tmp=SD_SendCmd(59,0,0x95,1);
    if(tmp!=0x00)
      return tmp;  //���󷵻�
    
    //�����������
    tmp=SD_SendCmd(16,512,0x95,1);
    if(tmp!=0x00)
        return tmp;//���󷵻�
    }
    
    else if(tmp==0x01)
    { 
        //V2.0��V2.0HC��
        //����V2.0���ĺ���4�ֽ�
        SD_SPI_WriteByte(0xff);
        SD_SPI_WriteByte(0xff);
        SD_SPI_WriteByte(0xff);
        SD_SPI_WriteByte(0xff);
            
        //SD_CS=1;    
        SPI_CS_HIGH;        
        SD_SPI_WriteByte(0xff); //����8��ʱ��ȷ�����β������
            
        {     
            i=0;
            do
            {
                tmp=SD_SendCmd(55,0,0,1);
                if(tmp!=0x01)
                    return tmp;    //���󷵻�  
                
                tmp=SD_SendCmd(41,0x40000000,0,1);
                if(i>200)
                    return tmp;  //��ʱ����
            }while(tmp!=0);         
            
            tmp=SD_SendCmd(58,0,0,0);
            if(tmp!=0x00)
            {
                //SD_CS=1;  //ʧ��SD
                SPI_CS_HIGH;      
                return tmp;  //���󷵻�
            }
            
            //����OCR��Ϣ
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
            SD_SPI_WriteByte(0xff); //����8��ʱ��ȷ�����β������
            
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
* ��������       : SD_GetResponse
* ��������       : ��SD��Ӧ���ж�
* �������       : response:��ȷ��Ӧֵ
* ���ز���       : 0���ɹ�       1��ʧ��
* ��ע˵��       :    
*******************************************************************************/
uint8_t SD_GetResponse(uint8_t response)
{
    uint16_t ii; 
    uint8_t recv_val=0;
    ii=5000; //��Ӧ�����5000��
    
    while(ii)
    {
        //SD_SPI_WriteByte(0xFF);
         
        recv_val = SD_SPI_ReadByte();
        if(recv_val == response)
            break;
        ii--;
    }
      
    if(ii==0)
        return 1;//����ʧ��
    else 
        return 0;//���سɹ�
}
 
/*******************************************************************************
* ��������       : SdRecvData
* ��������       : ��sd����ȡһ�����ݰ������� ,0XFE������ʼ����     
* �������       : buf:���ݻ�����  len:Ҫ��ȡ�����ݳ���.  
* ���ز���       : ����ֵ:0,�ɹ�;����,ʧ��;  
* ��ע˵��       :    
*******************************************************************************/  
uint8_t SdRecvData(uint8_t *buf,uint16_t len)  
{
    SPI_CS_LOW;     
    uint16_t i;     
    if(SD_GetResponse(0xFE))
    {
        SPI_CS_HIGH;    
        return 1;//�ȴ�SD������������ʼ����0xFE 
    }
 
    for(i=0; i<len; i++)
    //while(len--)//��ʼ��������  
    {  
   
        *buf=SD_SPI_ReadByte();//SdSpiReadWriteByte(0xFF);  
        buf++;  
    }  
  
    SD_SPI_ReadByte();
    SD_SPI_ReadByte();   
    SPI_CS_HIGH;                                                             
    return 0;//��ȡ�ɹ�  
}  
 
/*******************************************************************************
* ��������       : SDReadDisk
* ��������       : ��SD��  
* �������       : buf:���ݻ�����  sector:����  cnt:������  
* ���ز���       : ����ֵ:0,�ɹ�;����,ʧ��;  
* ��ע˵��       :    
*******************************************************************************/  
uint8_t SDReadDisk(uint8_t *buf,uint32_t sector,uint8_t cnt)  
{  
    uint8_t r1;  
    //if(SD_Type!=SD_TYPE_V2HC)sector <<= 9;//ת��Ϊ�ֽڵ�ַ  
    //��SDHC��,����������������ַת�����ֽڵ�ַ
    if(SD_Type!=V2HC) sector = sector<<9;       
    if(cnt==1)  
    {  
        //r1=SD_SendCmd(CMD17,sector,0X01);//������  
        SPI_CS_LOW; 
  
        {
            r1=SD_SendCmd(17,sector,0x01,1);//������        
        }
      
        if(r1==0)//ָ��ͳɹ�  
        {  
            r1=SdRecvData(buf,512);//����512���ֽ�        
        }  
 
    }
    
    else  
    {  
        r1=SD_SendCmd(18,sector,0X01,1);//���������� CMD18
        do  
        {  
            r1=SdRecvData(buf,512);//����512���ֽ�      
            buf+=512;    
        }while(--cnt && r1==0);       
        SD_SendCmd(CMD12,0,0X01,1);    //����ֹͣ����  
    }   
  
    SD_DisSelect();//ȡ��Ƭѡ  
    return r1;//  
}  

/*******************************************************************************
* ��������       : SD_SendBlock
* ��������       : ��sd��д��һ�����ݰ������� 512�ֽ�  
* �������       : buf:���ݻ�����  cmd:ָ��  
* ���ز���       : ����ֵ:0,�ɹ�;����,ʧ��;     
* ��ע˵��       :    
*******************************************************************************/    
uint8_t SD_SendBlock(uint8_t*buf,uint8_t cmd)  
{     
    uint16_t t;              
  
    SD_SPI_WriteByte(cmd);  
    if(cmd!=0XFD)//���ǽ���ָ��  
    {  
        for(t=0;t<512;t++)SD_SPI_WriteByte(buf[t]);//����ٶ�,���ٺ�������ʱ��  
        SD_SPI_WriteByte(0xFF);//����crc  
        SD_SPI_WriteByte(0xFF);  
        t=SD_SPI_ReadByte();//������Ӧ  
        if((t&0x1F)!=0x05)return 2;//��Ӧ����                                                             
    }                                                                                     
    return 0;//д��ɹ�  
}  

/*******************************************************************************
* ��������       : SDWriteDisk
* ��������       : дSD��
* �������       : buf:���ݻ�����  sector:��ʼ����  cnt:������  
* ���ز���       : ����ֵ:0,ok;����,ʧ��.  
* ��ע˵��       :    
*******************************************************************************/      
uint8_t SDWriteDisk(uint8_t *buf,uint32_t sector,uint8_t cnt)  
{  
    uint8_t r1;  
    if(SD_Type!= V2HC)sector *= 512;//ת��Ϊ�ֽڵ�ַ  

    if(cnt==1)  
    {  
        SPI_CS_LOW; 
        r1=SD_SendCmd(CMD24,sector,0X01,1);//������  
        if(r1==0)//ָ��ͳɹ�  
        {  
            r1=SD_SendBlock(buf,0xFE);//д512���ֽ�       
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
                  
    SD_DisSelect();//ȡ��Ƭѡ  
    return r1;//  
}     

