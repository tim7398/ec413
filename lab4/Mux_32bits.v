`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:41 09/30/2015 
// Design Name: 
// Module Name:    Mux_32bits 
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
module Mux_32bits( carry, sum, select, a,b, carry_out1, carry_out2);
input select;
input [31:0] a;
input [31:0] b;
input carry_out1, carry_out2;
output carry;
output [31:0]sum;

assign carry = select ? carry_out2: carry_out1;
assign sum = select ? b : a;
endmodule
