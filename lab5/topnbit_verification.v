`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:46 10/09/2015 
// Design Name: 
// Module Name:    topnbit_verification 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module topnbit_verification(result, clk, c_in,a, b, ALOP);

	parameter W = 32;
	input [2:0] ALOP;
	input clk;
	input [W-1:0] a, b;
	input c_in;
	output [W-1:0] result;
	
	wire c_out_to_reg;
	wire [W-1:0] sum_to_reg;
	
	assign { result} = //verifies each function 
	(ALOP == 3'b000) ? {a}:
	(ALOP == 3'b001) ? {~a}:
	(ALOP == 3'b010) ? a+b+c_in:
	(ALOP == 3'b011) ? {a-b}:
	(ALOP == 3'b100) ? {a|b}:
	(ALOP == 3'b101) ? {a&b}:
	0;
	
	
	

endmodule