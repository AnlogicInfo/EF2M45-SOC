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

	mcu u_mcu( 						
					.ppm_rstn(ppm_rstn),	
					.gpio_h0_out(gpio_h0_out),
					.gpio_h0_oe_n(gpio_h0_oe_n),
					.gpio_h0_in(gpio_h0_in),
					.gpio_h1_out(gpio_h1_out),
					.gpio_h1_oe_n(gpio_h1_oe_n),
					.gpio_h1_in(gpio_h1_in)
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