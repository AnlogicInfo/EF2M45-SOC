`timescale 1ns / 10ps 
module top(

	input			sys_clk,
	input			sys_rstn,
	input			ppm_rstn,
	output	[3:0]	led
);
	wire			clk_25m;

	wire 			gpio_h0_out;
	wire			gpio_h0_oe_n;
	wire 			gpio_h0_in;
	wire			gpio_h1_out;
	wire 			gpio_h1_oe_n;
	wire 			gpio_h1_in;
	
	reg 	[24:0] 	cnt;
	
	//H2H Interface
	wire    	  	hclk;  
	wire    	   	hresetn;
	wire	[31:0] 	haddr;/* synthesis keep */
	wire      		hsel;
	wire       		hready;
	wire	[2:0]  	hsize;
	wire       		hwrite;/* synthesis keep */
	wire	[1:0]  	htrans;
	wire	[31:0] 	hwdata;/* synthesis keep */
	wire       		hready_resp;
	wire	[1:0]  	hresp;
	wire	[31:0] 	hrdata;

	wire       		int_mem_we;
	wire       		int_mem_re;
	wire	[31:0] 	int_mem_wdata;
	wire	[3:0]  	int_mem_byte_enable;
	wire       		int_mem_clk;
	wire	[10:0]  int_mem_addr;	/* synthesis keep */
	wire	[31:0] 	int_mem_rdata;
	
	pll u_pll(
					.refclk  (sys_clk),
					.extlock (),
					.clk0_out(),
					.clk1_out(clk_25m),
					.clk2_out(hclk)
				);

	mcu u_mcu( 						
					.ppm_rstn		(ppm_rstn		),	
					.gpio_h0_out	(gpio_h0_out	),
					.gpio_h0_oe_n	(gpio_h0_oe_n	),
					.gpio_h0_in		(gpio_h0_in		),
					.gpio_h1_out	(gpio_h1_out	),
					.gpio_h1_oe_n	(gpio_h1_oe_n	),
					.gpio_h1_in		(gpio_h1_in		),
					
					.h2h_haddr    	(haddr			),
					.h2h_htrans   	(htrans			),
					.h2h_hwrite   	(hwrite			),
					.h2h_hsize    	(hsize			),
					.h2h_hburst   	(				),
					.h2h_hprot    	(				),
					.h2h_hwdata   	(hwdata			),
					.h2h_hrdata   	(hrdata			),
					.h2h_hreadyout	(hready_resp	),
					.h2h_hresp    	(hresp			),
					.h2h_mclk     	(hclk			),
					.h2h_rstn     	(sys_rstn		)
				);
	
	ahb_mem u_ahb_mem(
					// AHB-slave interface
					.hclk                  (hclk                    ),        // in, clock
					.hresetn               (sys_rstn                ),        // in, asynchronous reset
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
					.int_mem_we     	   (int_mem_we              ),
					.int_mem_re     	   (int_mem_re              ),
					.int_mem_wdata         (int_mem_wdata[31:0]     ),
					.int_mem_byte_enable   (int_mem_byte_enable[3:0]),
					.int_mem_clk      	   (int_mem_clk	            ),
					.int_mem_addr     	   (int_mem_addr            ),	
					.int_mem_rdata         (int_mem_rdata[31:0]     )
				);

	 mem u_mem(
					.clka (int_mem_clk ),
					.cea  (1'b1       ),
					.wea  ({int_mem_byte_enable[3]&int_mem_we,int_mem_byte_enable[2]&int_mem_we,int_mem_byte_enable[1]&int_mem_we,int_mem_byte_enable[0]&int_mem_we}),
					.addra(int_mem_addr ),
					.dia  (int_mem_wdata),
					.doa  (int_mem_rdata),
					.rsta (1'b0         )
				);

	always @(posedge clk_25m or negedge sys_rstn)begin
		if(~sys_rstn)
			cnt <= 32'd0; 
		else
			cnt <= cnt + 1'b1 ; 
	end
	 
	assign led[3:2] = cnt[23:22]; 
	
	assign led[0]=gpio_h0_oe_n==0?gpio_h0_out:led[0];
	assign led[1]=gpio_h1_oe_n==0?gpio_h1_out:led[1];

endmodule 