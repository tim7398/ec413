`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:29 10/05/2015 
// Design Name: 
// Module Name:    OneBit_ALU 
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
module OneBit_ALU(c_out,result,a,b,c_in,ALOP);

input a,b,c_in;
input [2:0]ALOP;
output c_out, result;
wire mov_out, not_out, add_out, sub_out, or_out, and_out;
wire c_out_adder, c_out_sub, not_b;

wire add_sub_sel;

assign add_sub_sel = (ALOP == 3'b011);
not not1(not_b, b);

//calls each module
Mov_1bit mov(mov_out, a);
Not_1bit NOT(not_out, a);
FA_str adder(c_out_adder,add_out,a, b, c_in);
FA_str subtracter(c_out_sub, sub_out, a, not_b, c_in); // uses the same full adder, but with a "not b"
Or_1bit Or (or_out, a, b);
And_1bit And(and_out,a,b);
addermux mux2(c_out, c_out_adder, c_out_sub, add_sub_sel); // outputs a cout for adder
Three_EightMux mux1(result,mov_out, not_out, add_out, sub_out, or_out, and_out, ALOP); // selects which output to use. 






endmodule
