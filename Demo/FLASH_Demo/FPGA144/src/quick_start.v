`timescale 1ns / 10ps 
module quick_start(
                   fpga_clk_in,
                   fpga_rst_n ,
                   hw_led     , 
                   sw_led
                   );
//---------------------------------------                                         
//Define input / output                                                         
//---------------------------------------                                         
//global clock input
input        fpga_clk_in;
input        fpga_rst_n ;
//fpga fabric drive led
output       hw_led     ;
//MCU drive led
inout        sw_led     ; 

//---------------------------------------                                         
//sys_pll module                                                         
//--------------------------------------- 
wire clk25;
sys_pll U_SYS_PLL(
                  .refclk  (fpga_clk_in),
                  .extlock (           ),
                  .clk0_out(           ),
                  .clk1_out(clk25      )
                  );
//---------------------------------------                                         
//MCU module                                                         
//---------------------------------------                   
wire gpio_h0_out;
wire gpio_h0_en ;
// if gpio_h0_en = 1'b0, gpio_h0 is output;
// if gpio_h0_en = 1'b1, gpio_h0 is input ;
// the enable configured by Software 
assign sw_led = gpio_h0_en ? 1'bz : gpio_h0_out; 

wire qspi_cclk;/* synthesis keep */
wire qspi_cs_n;/* synthesis keep */
wire qspi_mosi;/* synthesis keep */
wire qspi_miso;/* synthesis keep */
wire qspi_wp_n;/* synthesis keep */
wire qspi_hold_n;/* synthesis keep */
wire [3:0] qspi_oen;/* synthesis keep */
wire [3:0] qspi_data;/* synthesis keep */

assign qspi_mosi   = qspi_oen[0] ? 1'bz : qspi_data[0]; //mosi
assign qspi_miso   = qspi_oen[1] ? 1'bz : qspi_data[1]; //miso
assign qspi_wp_n   = qspi_oen[2] ? 1'bz : qspi_data[2]; //wp_n
assign qspi_hold_n = qspi_oen[3] ? 1'bz : qspi_data[3]; //hold_n

AL_MCU U_AL_MCU(
                .ppm_clk     (clk25      ),//MCU clk input 
                .gpio_h0_out (gpio_h0_out),//gp_h0 output port  
                .gpio_h0_oe_n(gpio_h0_en ),//tri enable   
                .gpio_h0_in  (sw_led     ),//gp_h0 input port 
                
                .qspi_oen(qspi_oen),
                .qspi_rxd({qspi_hold_n,qspi_wp_n,qspi_miso,qspi_mosi}),
                .qspi_txd(qspi_data),
                .qspi_sclk(qspi_cclk),
                .qspi_ss(qspi_cs_n)                   
                );
EF2_PHY_INTFLASH xintflash(
                           .mosi_io0  (qspi_mosi   ),
                           .miso_io1  (qspi_miso   ),
                           .wp_n_io2  (qspi_wp_n   ),
                           .hold_n_io3(qspi_hold_n ),
                           .cclk      (qspi_cclk   ),
                           .cs_n      (qspi_cs_n   )
);
//---------------------------------------                                         
//32bits counter                                                        
//---------------------------------------                 
reg [31:0] led_cnt;
always @(posedge clk25 or negedge fpga_rst_n)
begin
    if(~fpga_rst_n)
        led_cnt <= 32'd0; 
    else
      led_cnt <= led_cnt + 1'b1 ; 
end

//use the 24 bit to drive led
assign hw_led = {led_cnt[24]};
endmodule 