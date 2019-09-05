`timescale 1ns / 10ps 
module top(

	input			sys_clk,
	input			sys_rstn,
	input			ppm_rstn,
	output	[3:0]	led
);
	wire	clk_25m;

	wire 	gpio_h0_out;
	wire	gpio_h0_oe_n;
	wire 	gpio_h0_in;
	wire	gpio_h1_out;
	wire 	gpio_h1_oe_n;
	wire 	gpio_h1_in;
	
	reg 	[24:0] 	cnt;
	
	pll u_pll(
					.refclk  (sys_clk),
					.extlock (),
					.clk0_out(),
					.clk1_out(clk_25m)
				);

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

	mcu u_mcu( 						
					.ppm_rstn(ppm_rstn),	
					.gpio_h0_out(gpio_h0_out),
					.gpio_h0_oe_n(gpio_h0_oe_n),
					.gpio_h0_in(gpio_h0_in),
					.gpio_h1_out(gpio_h1_out),
					.gpio_h1_oe_n(gpio_h1_oe_n),
					.gpio_h1_in(gpio_h1_in),
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