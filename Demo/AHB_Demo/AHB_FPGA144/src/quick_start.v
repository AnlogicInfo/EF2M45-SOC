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
wire clk25,hclk;
sys_pll U_SYS_PLL(
                  .refclk  (fpga_clk_in),
                  .extlock (           ),
                  .clk0_out(           ),
                  .clk1_out(clk25      ),
                  .clk2_out(hclk)  
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

//H2H Interface
 
wire       hresetn    ;
wire[31:0] haddr      ;/* synthesis keep */
wire       hsel       ;
wire       hready     ;
wire[2:0]  hsize      ;
wire       hwrite     ;/* synthesis keep */
wire[1:0]  htrans     ;
wire[31:0] hwdata     ;/* synthesis keep */
wire       hready_resp;
wire[1:0]  hresp      ;
wire[31:0] hrdata     ;



wire       int_mem_we         ;
wire       int_mem_re         ;
wire[31:0] int_mem_wdata      ;
wire[3:0]  int_mem_byte_enable;
wire       int_mem_clk        ;
wire[10:0] int_mem_addr       ; /* synthesis keep */
wire[31:0] int_mem_rdata      ;

AL_MCU U_AL_MCU(
                .h2h_haddr    (haddr      ),
                .h2h_htrans   (htrans     ),
                .h2h_hwrite   (hwrite     ),
                .h2h_hsize    (hsize      ),
                .h2h_hburst   (           ),
                .h2h_hprot    (           ),
                .h2h_hwdata   (hwdata     ),
                .h2h_hrdata   (hrdata     ),
                .h2h_hreadyout(hready_resp),
                .h2h_hresp    (hresp      ),
                .h2h_mclk     (hclk       ),
                .h2h_rstn     (fpga_rst_n   ),

                .ppm_clk      (clk25      ),//MCU clk input 
                .gpio_h0_out  (gpio_h0_out),//gp_h0 output port  
                .gpio_h0_oe_n (gpio_h0_en ),//tri enable   
                .gpio_h0_in   (sw_led     ) //gp_h0 input port 
                );


ahb_mem u_ahb_mem(
				  // AHB-slave interface
				  .hclk                  (hclk                    ),        // in, clock
				  .hresetn               (fpga_rst_n              ),        // in, asynchronous reset
				  .haddr                 (haddr                   ),        // in, ahb address bus
				  .hsel                  (1'b1                    ),        // in, slave select
				  .hready                (1'b1                    ),        // in, ready status 
				  .hsize                 (hsize                   ),        // in, size of the transfer
				  .hwrite                (hwrite                  ),        // in, write enable
				  .htrans                (htrans                  ),        // in, transfer mode
				  .hwdata                (hwdata                  ),        // in, write data
				  .hready_resp           (hready_resp             ),        // out, transfer ready (always high)
				  .hresp                 (hresp                   ),        // out, transfer status (always okay)
				  .hrdata                (hrdata                  ),        // out, read data
				  
				  // Memory interface
				  .int_mem_we     	     (int_mem_we              ),
				  .int_mem_re     	     (int_mem_re              ),
				  .int_mem_wdata         (int_mem_wdata[31:0]     ),
				  .int_mem_byte_enable   (int_mem_byte_enable[3:0]),
				  .int_mem_clk      	 (int_mem_clk	          ),
				  .int_mem_addr     	 (int_mem_addr            ),	
				  .int_mem_rdata         (int_mem_rdata[31:0]     )
				  );

mem u_mem(
		 .clka (int_mem_clk ),
		 .cea  (1'b1       ),
		 .wea  ({int_mem_byte_enable[3]&int_mem_we,
		         int_mem_byte_enable[2]&int_mem_we,
		         int_mem_byte_enable[1]&int_mem_we,
		         int_mem_byte_enable[0]&int_mem_we}),
		 .addra(int_mem_addr ),
		 .dia  (int_mem_wdata),
		 .doa  (int_mem_rdata),
		 .rsta (1'b0         )
		 );
						


wire [31:0]bram32k_out;/* synthesis keep */
reg [12:0]bram32k_addr;/* synthesis keep */
always @(posedge clk25 or negedge fpga_rst_n)
begin
    if(!fpga_rst_n)
        bram32k_addr<=0;
    else
        bram32k_addr<=bram32k_addr+1;
end
bram256kbit u_bram256kbit( 
                         .dob    (bram32k_out ),
                         .dib    (            ),
                         .ceb    (1'b1        ),
                         .oceb   (1'b1        ),
                         .clkb   (clk25       ),
                         .web    (1'b0        ),
                         .rstb   (1'b0        ),
                         .addrb  (bram32k_addr),
                         .webbyte(4'b0000     ) 
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