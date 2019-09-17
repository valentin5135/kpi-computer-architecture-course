// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.


// Generated by Quartus II 64-Bit Version 13.0 (Build Build 232 06/12/2013)
// Created on Tue Sep 10 07:35:19 2019

`timescale 1 ns / 1 ps

module register_th;
reg i_clk_sig;
reg i_arstn_sig;
reg i_srstn_sig;
reg i_we_sig;
reg [31:0] i_d_sig;
wire [31:0] o_q_sig;
register register_inst
(
	.i_clk(i_clk_sig) ,	// input  i_clk_sig
	.i_arstn(i_arstn_sig) ,	// input  i_arstn_sig
	.i_srstn(i_srstn_sig) ,	// input  i_srstn_sig
	.i_we(i_we_sig) ,	// input  i_we_sig
	.i_d(i_d_sig) ,	// input [WIDTH-1:0] i_d_sig
	.o_q(o_q_sig) 	// output [WIDTH-1:0] o_q_sig
);

defparam register_inst.WIDTH = 32;

initial begin
	i_clk_sig = 1'd1;
	forever #1 i_clk_sig = ~i_clk_sig;
end

initial begin
	i_arstn_sig = 1'b1;
	i_we_sig = 1'b1;
	
	#2 i_arstn_sig = 1'b0;
	#2 i_arstn_sig = 1'b1;
end

initial begin 
	i_srstn_sig = 1'b1;
	
	#20 i_srstn_sig = 1'b0;
	#5 i_srstn_sig = 1'b1;
end

initial begin
	
	#10 i_d_sig = 32'hdeadc0de;
	#30 i_d_sig = 32'hdeadbeef;
end

initial begin
	#50 $stop();
end

endmodule	
	