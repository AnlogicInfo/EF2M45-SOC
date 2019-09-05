// Verilog netlist created by TD v4.2.217
// Tue Aug  7 17:39:45 2018

`timescale 1ns / 1ps
module AL_MCU  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(14)
  (
  gpio_h0_in,
  gpio_h1_in,
  ppm_clk,
  gpio_h0_oe_n,
  gpio_h0_out,
  gpio_h1_oe_n,
  gpio_h1_out
  );

  input gpio_h0_in;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(25)
  input gpio_h1_in;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(28)
  input ppm_clk;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(22)
  output gpio_h0_oe_n;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(24)
  output gpio_h0_out;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(23)
  output gpio_h1_oe_n;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(27)
  output gpio_h1_out;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(26)


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
    .GPIO_L6("DISABLE"),
    .GPIO_L7("ENABLE"),
    .GPIO_L8("DISABLE"),
    .GPIO_L9("DISABLE"))
    mcu_inst (
    .gpio_h_in({14'b00000000000000,gpio_h1_in,gpio_h0_in}),
    .ppm_clk(ppm_clk),
    .gpio_h_oe_n({open_n95,open_n96,open_n97,open_n98,open_n99,open_n100,open_n101,open_n102,open_n103,open_n104,open_n105,open_n106,open_n107,open_n108,gpio_h1_oe_n,gpio_h0_oe_n}),
    .gpio_h_out({open_n109,open_n110,open_n111,open_n112,open_n113,open_n114,open_n115,open_n116,open_n117,open_n118,open_n119,open_n120,open_n121,open_n122,gpio_h1_out,gpio_h0_out}));  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/TD/al_ip/AL_MCU.v(37)

endmodule 

