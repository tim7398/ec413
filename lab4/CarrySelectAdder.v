`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:09 09/30/2015 
// Design Name: 
// Module Name:    CarrySelectAdder 
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
module CarrySelectAdder(c_out, sum, a, b, c_in);

input [63:0] a;
input [63:0] b;
input c_in;
output c_out;
output [63:0] sum;
wire carry_out1, carry_out2, select;
wire [31:0] sum1, sum2;

wire c,d;
assign c = 1'b1;
assign d = 1'b0;

ThirtytwoBitAdder Add1(select, sum[31:0], a[31:0], b[31:0], c_in);
ThirtytwoBitAdder Add2(carry_out1, sum1[31:0], a[63:32], b[63:32],d);
ThirtytwoBitAdder Add3(carry_out2, sum2[31:0], a[63:32], b[63:32],c);
Mux_32bits mux(c_out, sum[63:32], select,sum1[31:0],sum2[31:0], carry_out1, carry_out2);   


endmodule
