#ifndef PLATFORM_H
#define PLATFORM_H

#define RUN_ON_FLASH             0                   // run the code on flash or ram
#define RUN_VERIFICATION         0                   // Normally set this to 0. Set to 1 when we need simulation

 
#define WAIT_BEFORE_CACHE_OFF    100                 // wait before cache disable ( to finish qspi transfer )
#define SYSTEM_CLK               200000000           // define the frequency of system clk. 
                                                     // sysclk can be select using HAL_SYSCON_HCLK_Src_Sel()
                                                     // Max Freq.=250000000
#define XTAL_CLK                 32768               // define the frequency of crystal clock for rtc.     
#define RTC_SRC_XTAL             0                   // 1: use external 32k as rtc clock. 0: use ahb to be the clock source of rtc clock


#define AHB_CLK                  (SYSTEM_CLK/2)      // define the ahb clock frequency
                                 
#define APB_CLK0                 (AHB_CLK/4)         // define the apb clock0 frequency
#define APB_CLK1                 (AHB_CLK/2)         // define the apb clock1 frequency
                                 
#define QSPI_CLK                 (AHB_CLK/4)         // define the qspi frequency
#define ADCC_CLK                 (APB_CLK0/4)        // set for adc prescale

#if (RTC_SRC_XTAL == 1)
#define RTC_CLK                  XTAL_CLK               
#else
#define RTC_CLK                  (AHB_CLK/100)       // rtc clk is at most half of ahb clk       the maximum divider is 8192
#endif

#endif


#if (RTC_SRC_XTAL != 1)
#if ((AHB_CLK / RTC_CLK)<2)
#error "rtc clk is at most half of ahb clk"

#endif

#endif
