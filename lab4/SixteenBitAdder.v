`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:52 09/30/2015 
// Design Name: 
// Module Name:    SixteenBitAdder 
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
module SixteenBitAdder(c_out, sum, a, b, c_in);
input [15:0] a;
input [15:0] b;
input c_in;
output [15:0] sum;
output c_out;
wire carry_out1, carry_out2, carry_out3;

FourBitAdder adder1 (carry_out1,sum[3:0], a[3:0], b[3:0], c_in);
FourBitAdder adder2 (carry_out2,sum[7:4], a[7:4], b[7:4], carry_out1);
FourBitAdder adder3 (carry_out3,sum[11:8], a[11:8], b[11:8], carry_out2);
FourBitAdder adder4 (c_out,sum[15:12], a[15:12], b[15:12], carry_out3);


endmodule
