// Verilog netlist created by TD v4.1.389
// Fri May  4 10:03:58 2018

`timescale 1ns / 1ps
module cortex_m3  // F:/Anlogic_MCU/Demo/FPGA/Quick_Start/al_ip/cortex_m3.v(14)
  (
  gpio_h0_in,
  ppm_clk,
  gpio_h0_oe_n,
  gpio_h0_out
  );

  input gpio_h0_in;  // F:/Anlogic_MCU/Demo/FPGA/Quick_Start/al_ip/cortex_m3.v(22)
  input ppm_clk;  // F:/Anlogic_MCU/Demo/FPGA/Quick_Start/al_ip/cortex_m3.v(19)
  output gpio_h0_oe_n;  // F:/Anlogic_MCU/Demo/FPGA/Quick_Start/al_ip/cortex_m3.v(21)
  output gpio_h0_out;  // F:/Anlogic_MCU/Demo/FPGA/Quick_Start/al_ip/cortex_m3.v(20)


  EF2_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EF2_PHY_MCU #(
    .GPIO_L0("ENABLE"),
    .GPIO_L1("ENABLE"),
    .GPIO_L10("DISABLE"),
    .GPIO_L11("DISABLE"),
    .GPIO_L12("DISABLE"),
    .GPIO_L13("DISABLE"),
    .GPIO_L14("DISABLE"),
    .GPIO_L15("DISABLE"),
    .GPIO_L2("DISABLE"),
    .GPIO_L3("DISABLE"),
    .GPIO_L4("DISABLE"),
    .GPIO_L5("DISABLE"),
    .GPIO_L6("ENABLE"),
    .GPIO_L7("DISABLE"),
    .GPIO_L8("DISABLE"),
    .GPIO_L9("DISABLE"))
    mcu_inst (
    .gpio_h_in({15'b000000000000000,gpio_h0_in}),
    .ppm_clk(ppm_clk),
    .gpio_h_oe_n({open_n95,open_n96,open_n97,open_n98,open_n99,open_n100,open_n101,open_n102,open_n103,open_n104,open_n105,open_n106,open_n107,open_n108,open_n109,gpio_h0_oe_n}),
    .gpio_h_out({open_n110,open_n111,open_n112,open_n113,open_n114,open_n115,open_n116,open_n117,open_n118,open_n119,open_n120,open_n121,open_n122,open_n123,open_n124,gpio_h0_out}));  // F:/Anlogic_MCU/Demo/FPGA/Quick_Start/al_ip/cortex_m3.v(31)

endmodule 

