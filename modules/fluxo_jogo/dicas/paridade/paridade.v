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

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Sat Nov 22 03:01:00 2025"

module paridade(
	A0,
	A1,
	A2,
	A3,
	B0,
	B1,
	B2,
	P
);


input wire	A0;
input wire	A1;
input wire	A2;
input wire	A3;
input wire	B0;
input wire	B1;
input wire	B2;
output wire	P;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;




assign	SYNTHESIZED_WIRE_0 = A0 ~^ A1;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_0 ~^ A2;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_1 ~^ A3;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_2 ~^ B0;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_3 ~^ B1;

assign	P = SYNTHESIZED_WIRE_4 ^ B2;


endmodule
