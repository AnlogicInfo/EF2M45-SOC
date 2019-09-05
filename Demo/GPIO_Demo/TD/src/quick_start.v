`timescale 1ns / 10ps 
module quick_start(
                   fpga_clk_in,
                   fpga_rst_n ,
                   hw_led     ,
                   sw_led     ,
                   button2    
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
inout        button2    ;

//---------------------------------------                                         
//sys_pll module                                                         
//--------------------------------------- 
wire clk25;
wire clk200;
sys_pll U_SYS_PLL(
                  .refclk  (fpga_clk_in),
                  .extlock (           ),
                  .clk0_out(clk200     ),
                  .clk1_out(clk25      )
                  );
//---------------------------------------                                         
//MCU module                                                         
//---------------------------------------                   
wire gpio_h0_out;
wire gpio_h0_en ;
wire gpio_h1_out;
wire gpio_h1_en ;
// if gpio_h0_en = 1'b0, gpio_h0 is output;
// if gpio_h0_en = 1'b1, gpio_h0 is input ;
// the enable configured by Software 
assign sw_led  = gpio_h0_en ? 1'bz : gpio_h0_out;     
assign button2 = gpio_h1_en ? 1'bz : gpio_h1_out; 
AL_MCU U_AL_MCU(
                .ppm_clk     (clk25      ),//MCU clk input 
                .gpio_h0_out (gpio_h0_out),//gp_h0 output port  
                .gpio_h0_oe_n(gpio_h0_en ),//tri enable   
                .gpio_h0_in  (sw_led     ),//gp_h0 input port 
                .gpio_h1_out (gpio_h1_out),//gp_h0 output port  
                .gpio_h1_oe_n(gpio_h1_en ),//tri enable   
                .gpio_h1_in  (button2    ) //gp_h0 input port                 
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