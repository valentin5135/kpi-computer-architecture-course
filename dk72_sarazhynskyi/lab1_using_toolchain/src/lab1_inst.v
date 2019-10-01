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
// Created on Tue Oct  1 21:33:52 2019
`timescale 1ns/1ps
module test;

reg arstn_sig, srstn_sig, clk_sig, we_sig;
reg [31:0] idata_sig;
wire [31:0] dataout_sig;

lab1 lab1_inst
(
	.arstn(arstn_sig) ,	// input  arstn_sig
	.clk(clk_sig) ,	// input  clk_sig
	.we(we_sig) ,	// input  we_sig
	.srstn(srstn_sig) ,	// input  srstn_sig
	.idata(idata_sig) ,	// input [31:0] idata_sig
	.dataout(dataout_sig) 	// output [31:0] dataout_sig
);
initial begin
	clk_sig=1'b0;
	forever #1 clk_sig=~clk_sig;
end


initial begin 
	arstn_sig = 1'b1;
	srstn_sig = 1'b1;
	we_sig = 1'b1;

	#2 arstn_sig = ~arstn_sig;
	#2 arstn_sig = ~arstn_sig;

	#50 srstn_sig=~srstn_sig;
	#10 srstn_sig=~srstn_sig;
end

initial begin 
	idata_sig=32'h12345678;
	#20 idata_sig=32'habcdef00;
	#60 idata_sig=32'hdeadbeef;
end

initial begin 
	#100 $stop();
end



endmodule 
