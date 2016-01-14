`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:31 10/08/2015 
// Design Name: 
// Module Name:    Mov_1bit 
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
module Mov_1bit(out1, in1);
input in1;
output out1;
wire result;

not not1(result, in1);
not not2(out1, result);





endmodule
