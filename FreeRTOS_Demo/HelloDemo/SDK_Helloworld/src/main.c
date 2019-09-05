#include "FreeRtos.h"
#include "task.h"

#include "log.h"

void vTask1(void *pvParameters){ 
	while(1)
	{
		printf("Hello, FreeRTOS~~~~.\n");
		vTaskDelay(1000/portTICK_RATE_MS);
	}
}

void vTask2(void *pvParameters)
{
	while(1)
	{
		printf("2 second£¡£¡.\n");
		vTaskDelay(2000/portTICK_RATE_MS);
	}
}

int main()
{
	printf("Run on Flash\n");	
	xTaskCreate(vTask1,"Task1",200,NULL,1,NULL);  
	xTaskCreate(vTask2,"Task2",200,NULL,2,NULL);  
	vTaskStartScheduler();  
    while(1);
}
