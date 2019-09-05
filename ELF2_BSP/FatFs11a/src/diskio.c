/****************************************Copyright (c)****************************************************
**                                      
**                                 http://www.powermcu.com
**
**--------------File Info---------------------------------------------------------------------------------
** File name:               diskio.c
** Descriptions:            The FATFS Diskio
**
**--------------------------------------------------------------------------------------------------------
** Created by:              AVRman
** Created date:            2010-11-4
** Version:                 v1.0
** Descriptions:            The original version
**
**--------------------------------------------------------------------------------------------------------
** Modified by:             
** Modified date:           
** Version:                 
** Descriptions:            
**
*********************************************************************************************************/

/* Includes ------------------------------------------------------------------*/
 
#include "ffconf.h"
 
#include <stdio.h>
#include "diskio.h"		/* FatFs lower layer API */
 
#include "spi_driver_sd.h"		/* Example: Header file of existing MMC/SDC contorl module */
 

DSTATUS disk_initialize (
	BYTE drv				/* Physical drive nmuber (0..) */
)
{
	int stat;
	switch (drv) {
	case 0 :
		stat = SD_Initialize();
		if(stat==0) 
		{ 
			return RES_OK; 
		}
		else
		{
			return STA_NOINIT;
		}
	case 1 :
		return RES_OK;	  
	case 2 :
		return RES_OK;	  
	case 3 :
		return RES_OK;		
	default:
		stat = STA_NOINIT;
	}
	return stat;
}




DSTATUS disk_status (
	BYTE drv		/* Physical drive nmuber (0..) */
)
{
	switch (drv)
	{
		case 0 :
			return RES_OK;
		case 1 :
			return RES_OK;
		case 2 :
			return RES_OK;
		default:
			return STA_NOINIT;
	}
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */

DRESULT disk_read (
	BYTE drv,		/* Physical drive nmuber (0..) */
	BYTE *buff,		/* Data buffer to store read data */
	DWORD sector,	/* Sector address (LBA) */
	BYTE count		/* Number of sectors to read (1..255) */
)
{
	int Status;
	if( !count )
	{    
		return RES_PARERR;  /* count不能等于0，否则返回参数错误 */
	}
	switch (drv)
	{
		case 0:
			Status = SDReadDisk(buff, sector, count) ; 	
			if(Status == 0){
					return RES_OK;
				}else{
					return RES_ERROR;
				}    
 
		default:
			return RES_ERROR;
	}
}

/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */

#if _READONLY == 0
DRESULT disk_write (
	BYTE drv,			/* Physical drive nmuber (0..) */
	const BYTE *buff,	        /* Data to be written */
	DWORD sector,		/* Sector address (LBA) */
	BYTE count			/* Number of sectors to write (1..255) */
)
{
	
	int Status;
 
	if( !count )
	{    
		return RES_PARERR;   
	}
	switch (drv)
	{
		case 0:
				Status = SDWriteDisk(buff ,sector, count) ;				
				if(Status == 0){
					return RES_OK;
				}else{
					return RES_ERROR;
				}                                              
                                           
		default:return RES_ERROR;
	} 
	return RES_OK;
}
 
#endif /* _READONLY */



/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */

DRESULT disk_ioctl (
	BYTE drv,		/* Physical drive nmuber (0..) */
	BYTE ctrl,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
 
	DRESULT stat;
	switch (ctrl)
	{
	case CTRL_SYNC :
		return RES_OK;
	break;
	case GET_SECTOR_COUNT :
		*(DWORD*)buff = 2252148039;//1024;//SD0_CardInfo.Capacity/SD0_CardInfo.BlockSize;
		return RES_OK;
	break;
	case GET_BLOCK_SIZE :
		*(WORD*)buff = 512;//SD0_CardInfo.BlockSize;
		return RES_OK;
	break;
	default:
		return RES_PARERR;
	break;
	} 
 
	return RES_PARERR; 
}

/* 得到文件Calendar格式的建立日期,是DWORD get_fattime (void) 逆变换 */							
/*-----------------------------------------------------------------------*/
/* User defined function to give a current time to fatfs module          */
/* 31-25: Year(0-127 org.1980), 24-21: Month(1-12), 20-16: Day(1-31) */                                                                                                                                                                                                                                          
/* 15-11: Hour(0-23), 10-5: Minute(0-59), 4-0: Second(0-29 *2) */                                                                                                                                                                                                                                                
DWORD get_fattime (void)
{
   
    return 0;
}
void get_Calendarfattime (DWORD date,DWORD time)
{  	 

}



/*********************************************************************************************************
      END FILE
*********************************************************************************************************/
