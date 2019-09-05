// Verilog netlist created by TD v4.2.217
// Mon Aug  6 10:00:10 2018

`timescale 1ns / 1ps
module pll  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(23)
  (
  refclk,
  clk0_out,
  clk1_out,
  extlock
  );

  input refclk;  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(28)
  output clk0_out;  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(30)
  output clk1_out;  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(31)
  output extlock;  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(29)

  wire clk0_buf;  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(33)

  EF2_PHY_GCLK bufg_feedback (
    .clki(clk0_buf),
    .clko(clk0_out));  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(35)
  EF2_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EF2_PHY_PLL #(
    .CLKC0_CPHASE(5),
    .CLKC0_DIV(5),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_DUTY(0.500000),
    .CLKC0_DUTY50("ENABLE"),
    .CLKC0_DUTY_INT(3),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(40),
    .CLKC1_DIV(40),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_DUTY(0.500000),
    .CLKC1_DUTY50("ENABLE"),
    .CLKC1_DUTY_INT(20),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(1),
    .CLKC2_DIV(1),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("DISABLE"),
    .CLKC2_FPHASE(0),
    .CLKC3_CPHASE(1),
    .CLKC3_DIV(1),
    .CLKC3_DIV2_ENABLE("DISABLE"),
    .CLKC3_ENABLE("DISABLE"),
    .CLKC3_FPHASE(0),
    .CLKC4_CPHASE(1),
    .CLKC4_DIV(1),
    .CLKC4_DIV2_ENABLE("DISABLE"),
    .CLKC4_ENABLE("DISABLE"),
    .CLKC4_FPHASE(0),
    .CLKC5_CPHASE(1),
    .CLKC5_DIV(1),
    .CLKC5_DIV2_ENABLE("DISABLE"),
    .CLKC5_ENABLE("DISABLE"),
    .CLKC6_CPHASE(1),
    .CLKC6_DIV(1),
    .CLKC6_DIV2_ENABLE("DISABLE"),
    .CLKC6_ENABLE("DISABLE"),
    .DERIVE_PLL_CLOCKS("DISABLE"),
    .DPHASE_SOURCE("DISABLE"),
    .DYNCFG("DISABLE"),
    .FBCLK_DIV(12),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("50.000"),
    .FREQ_LOCK_ACCURACY(2),
    .FREQ_OFFSET("0.000000"),
    .FREQ_OFFSET_INT("0"),
    .GEN_BASIC_CLOCK("DISABLE"),
    .GMC_GAIN(6),
    .GMC_TEST(14),
    .HIGH_SPEED_EN("ENABLE"),
    .ICP_CURRENT(3),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .INTPI(3),
    .KVCO(6),
    .LPF_CAPACITOR(3),
    .LPF_RESISTOR(2),
    .NORESET("DISABLE"),
    .ODIV_MUXC0("DIV"),
    .ODIV_MUXC1("DIV"),
    .ODIV_MUXC2("DIV"),
    .ODIV_MUXC3("DIV"),
    .ODIV_MUXC4("DIV"),
    .OFFSET_MODE("EXT"),
    .PLLC2RST_ENA("DISABLE"),
    .PLLC34RST_ENA("DISABLE"),
    .PLLMRST_ENA("DISABLE"),
    .PLLRST_ENA("DISABLE"),
    .PLL_LOCK_MODE(0),
    .PREDIV_MUXC0("VCO"),
    .PREDIV_MUXC1("VCO"),
    .PREDIV_MUXC2("VCO"),
    .PREDIV_MUXC3("VCO"),
    .PREDIV_MUXC4("VCO"),
    .PREDIV_MUXC5("VCO"),
    .PREDIV_MUXC6("VCO"),
    .PU_INTP("DISABLE"),
    .REFCLK_DIV(3),
    .REFCLK_SEL("INTERNAL"),
    .SSC_AMP("0.000000"),
    .SSC_ENABLE("DISABLE"),
    .SSC_FREQ_DIV(0),
    .SSC_MODE("Down"),
    .SSC_RNGE(0),
    .STDBY_ENABLE("DISABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("ENABLE"),
    .VCO_NORESET("DISABLE"))
    pll_inst (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dsm_refclk(1'b0),
    .dsm_rst(1'b0),
    .dwe(1'b0),
    .fbclk(clk0_out),
    .frac_offset_valid(1'b0),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(refclk),
    .reset(1'b0),
    .ssc_en(1'b0),
    .stdby(1'b0),
    .clkc({open_n47,open_n48,open_n49,open_n50,open_n51,clk1_out,clk0_buf}),
    .extlock(extlock));  // E:/ELF2_SOC/trunk/Basic_Demo/TIMER_Demo/TD/project/demo/al_ip/pll.v(99)

endmodule 

