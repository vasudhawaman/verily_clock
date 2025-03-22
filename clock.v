`timescale 1ns/1ps

module clock_gen (	input      enable,
  					output reg clk);

  parameter FREQ = 100000;  // in kHZ
  parameter PHASE = 0; 		// in degrees
  parameter DUTY = 50;  	// in percentage

  real clk_pd  		= 1.0/(FREQ * 1e3) * 1e9; 	// convert to ns
  real clk_on  		= DUTY/100.0 * clk_pd;
  real clk_off 		= (100.0 - DUTY)/100.0 * clk_pd;
  real quarter 		= clk_pd/4;
  real start_dly     = quarter * PHASE/90;

  reg start_clk;

  initial begin
    $display("FREQ      = %0d kHz", FREQ);
    $display("PHASE     = %0d deg", PHASE);
    $display("DUTY      = %0d %%",  DUTY);

    $display("PERIOD    = %0.3f ns", clk_pd);
    $display("CLK_ON    = %0.3f ns", clk_on);
    $display("CLK_OFF   = %0.3f ns", clk_off);
    $display("QUARTER   = %0.3f ns", quarter);
    $display("START_DLY = %0.3f ns", start_dly);
  end

  // Initialize variables to zero
  initial begin
    clk <= 0;
    start_clk <= 0;
  end
