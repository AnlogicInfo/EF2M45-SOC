/*-----------------------------------------------------------------------*/
/* Low level disk I/O module skeleton for FatFs     (C)ChaN, 2014        */
/*-----------------------------------------------------------------------*/
/* If a working storage control module is available, it should be        */
/* attached to the FatFs via a glue function rather than modifying it.   */
/* This is an example of glue functions to attach various exsisting      */
/* storage control modules to the FatFs module with a defined API.       */
/*-----------------------------------------------------------------------*/

#include "diskio.h"		/* FatFs lower layer API */
//#include "usbdisk.h"	/* Example: Header file of existing USB MSD control module */
//#include "atadrive.h"	/* Example: Header file of existing ATA harddisk control module */
#include "spi_driver_sd.h"		/* Example: Header file of existing MMC/SDC contorl module */

/* Definitions of physical drive number for each drive */

/*-----------------------------------------------------------------------*/
/* Get Drive Status                                                      */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
	BYTE pdrv		/* Physical drive nmuber to identify the drive */
)
{
 
	DRESULT  stat; 	

	switch (pdrv) {
	case 0 :
		stat = SPI_SD_Initial();
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



/*-----------------------------------------------------------------------*/
/* Inidialize a Drive                                                    */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
	BYTE pdrv				/* Physical drive nmuber to identify the drive */
)
{
	switch (pdrv)
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
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
	BYTE pdrv,		/* Physical drive nmuber to identify the drive */
	BYTE *buff,		/* Data buffer to store read data */
	DWORD sector,	/* Sector address in LBA */
	UINT count		/* Number of sectors to read */
)
{
	DRESULT  Status;
	if( !count )
	{    
		return RES_PARERR;  /* count不能等于0，否则返回参数错误 */
	}
	switch (pdrv)
	{
		case 0:
		    if(count==1)            /* 1个sector的读操作 */      
		    {   
				//Status = SPI_SD_ReadSingleBlock( sector ,buff );
				if(Status == 0){
					return RES_OK;
				}else{
					return RES_ERROR;
				}    
		    }                                                
		    else                    /* 多个sector的读操作 */     
		    {  
				//Status = SPI_SD_ReadMultiBlock( sector , buff ,count);
				if(Status == 0){
					return RES_OK;
				}else{
					return RES_ERROR;
				} 
		    }                                                
		case 1:
		    if(count==1)            /* 1个sector的读操作 */      
		    {   
				return RES_OK;    
		    }                                                
		    else                    /* 多个sector的读操作 */     
		    {  
				return RES_OK; 
		    } 

		default:
			return RES_ERROR;
	}
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if _USE_WRITE
DRESULT disk_write (
	BYTE pdrv,			/* Physical drive nmuber to identify the drive */
	const BYTE *buff,	/* Data to be written */
	DWORD sector,		/* Sector address in LBA */
	UINT count			/* Number of sectors to write */
)
{
	DRESULT stat;
 
	return stat; 
}
#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

#if _USE_IOCTL
DRESULT disk_ioctl (
	BYTE pdrv,		/* Physical drive nmuber (0..) */
	BYTE cmd,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	DRESULT stat;
 
	return stat;
}
#endif

/* 得到文件Calendar格式的建立日期*/
DWORD get_fattime(void) {
    return 0;
}
