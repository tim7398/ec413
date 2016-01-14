`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:47 09/30/2015 
// Design Name: 
// Module Name:    ThirtytwoBitAdder 
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
module ThirtytwoBitAdder(c_out, sum, a, b, c_in);
input [31:0] a;
input [31:0] b;
input c_in;
output c_out;
output [31:0] sum;
wire carry_out1;

SixteenBitAdder adder1(carry_out1, sum[15:0], a[15:0], b[15:0], c_in);
SixteenBitAdder adder2(c_out, sum[31:16], a[31:16], b[31:16], carry_out1);




endmodule
