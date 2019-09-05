#include "segger_rtt.h"
#include "test_gpio.h"
 
 
#include "spim.h" 
#include <stdio.h>
#include <stdint.h>
#include "elf2.h"

#include "platform.h"
#include "syscon.h"
#include <string.h>

#include "log.h"
 
#include "spim.h"
#include "int_register.h"

#include "gpio.h"

#include "ff.h" 
#include "spi_driver_sd.h"

FATFS fs;         /* Work area (file system object) for logical drive */
FIL fsrc, fdst;      /* file objects */
FRESULT res; 
UINT br,bw;
char path0[512]="0:";

char buffer[4096];   /* file copy buffer */
uint8_t textFileBuffer[] = "ÖÐÓ¢ÎÄ²âÊÔ×Ö·û´® \r\nChinese and English test strings \r\n";
int main() 
{   
 
	printf("\r\n**Anlogic SOC Platform**");	
	res = f_mount(0,&fs);
	if(res != FR_OK){
		printf("mount filesystem 0 failed : %d\n\r",res);
	}
	printf("read file test 2......\n\r");
	
	res = f_open(&fsrc, "0:/SD_SPI_RD_Test.txt", FA_OPEN_EXISTING | FA_READ);
    if(res != FR_OK){
		printf("open file error : %d\n\r",res);
	}else{
	    res = f_read(&fsrc, buffer, sizeof(textFileBuffer), &br);     
		if(res==FR_OK){
			printf("read data num : %d\n\r",br);
			printf("%s\n\r",buffer);
		}else{
			printf("read file error : %d\n\r",res);
		}
		/*close file */
		f_close(&fsrc);
	}
 
}



