
![Anlogic](https://0.rc.xiniu.com/g2/M00/1A/CA/CgAGe1yCYjWAQjUDAAAXmE88dpg262.png?d=20181205152921)<br>
Anlogic ELF2 Serial 
======================
Device Brief 
----------------
The ELF2 family have four devices, which locate the low-cost, low-power programmable market. ELF2 devices are targeted for mass, cost-sensitive applications, enabling system designers to reduce costs while meeting growing bandwidth requirements.The ELF2 devices are based on an optimized low power process, and through the lowest cost to achieve higher functionality. Choosing ELF2 device is the most ideal in industrial users and small, low-cost applications in the communications industry.Anlogic technology provides rich design tools to help users implement complex designs effectively by using ELF2 platform.The industry-leading synthesis and place-routing tools provide a strong guarantee for users to design high-quality products.<br>

MCU Brief
----------------------
The ELF2 SOCs contain FPGA and MCU-Cortex M3, the Max Frequency is 125MHz.<br>
The MCU Feature
* NVIC 
* System Bus:AHB Bus 
* 2 Timers;
* 1 WDT;
* 2 Channel DMA,support M2P,M2M and P2M(M:Memory, P:Peripherals);
* 1 Qspi Controller;
* On-Chip SRAM resoures:16KByte + 32KByte;
* 16-bit user register (MCU-> FPGA);
* RTC clock input -32.768kHz;
* 2 8-channel 1MSPS 12bit SAR ADCs (shared with Fabric);
* 32 GPIOs (High 16-bit GPIO, Low 16-bit GPIO);
* GPIO supports up to 1 SPIM, 2 I2C, 1 I2S, 1 UART;
* Support SWD debugging;

MCU and FPGA communication
* AHB slave;
* Shared SRAM (SRAM: 32K bytes);
* 16 High-GPIOs;
* 16-bit user register (MCU-> FPGA);

Family Selection Guide
----------------------
|Series|Device  |LUTs  |DFFs   |Dis-RAM   |Total    |DSP|PLL|Flash|MCU|User IO|
|---   |---     |---   |---    |---      |---      |---|---|---  |---|---    | 				
|L	   |ELF2L15	|1500  |1500   |12 Kbits |546 Kbits|8  |1  |4Mb	 |-	 |207| 
|L	   |ELF2L25	|2500  |2500   |20 Kbits |607 Kbits|12 |1  |4Mb	 |-	 |207|
|L     |ELF2L45	|4480  |4480   |35 Kbits |700 Kbits|15 |1  |4Mb	 |-	 |207|
|M	   |ELF2M45	|4480  |4480   |35 Kbits |700 Kbits|15 |1  |4Mb	 | Cortex-M3  |207|	
		
Device Package Info
----------------------
|Packages                       | ELF2M45  | ELF2M45  | ELF2M45  | ELF2M45  |
|---                            |---       |---       |---       |---       |
|42 XWFN (4.2x4.2, 0.35mm pitch)|          |29(10+1)  |          |          |
|48 LQFP (10x10, 0.5mm pitch)   |          |          |          |36(6+9)   |
|100 LQFP (14x14, 0.5mm pitch)  |81(15+17) |          |          |          |
|144 LQFP (20x20, 0.5mm pitch)  |114(24+25)|          |114(24+25)|114(24+25)|
|256 fpBGA (17x17, 1.0mm pitch) |207(31+64)|207(31+64)|207(31+64)|          |
	Notes:207(31+64) means the number of IO users can use (Ture LVDS +Emulated LVDS).
