`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:49 10/01/2015 
// Design Name: 
// Module Name:    Verification_64bitSelect 
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
module Verification_64bitSelect(c_out, sum, a, b, c_in);

	input [63:0]	 a, b; //declare inputs a, b, and c_in, one bit each
	input c_in;
	output c_out;
	output [63:0] sum; //declare outputs c_out and sum, one bit each

	assign {c_out, sum} = a + b + c_in;

endmodule
