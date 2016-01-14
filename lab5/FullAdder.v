`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:29 10/05/2015 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(c_out, sum, a, b, c_in);
input		a, b, c_in;
output	c_out, sum;
wire not_a, not_b, not_cin, and1_out, and2_out, and3_out;
wire and4_out,and5_out,and6_out,and7_out, and8_out;

not not1(not_a, a);
not not2(not_b,b);
not not3(not_cin,c_in);

//sum output
and and1(and1_out, not_a, not_b, c_in);
and and2(and2_out, not_a, b, not_cin);
and and3(and3_out, a, not_b, not_cin);
and and4(and4_out, a,b,c_in);
or or1(sum, and1_out, and2_out, and3_out, and4_out);

// carryout
and and5(and5_out, b,c_in);
and and6(and6_out, a,c_in);
and and7(and7_out, a,b);
and and8(and8_out, a, b, c_in);
or or2(c_out, and5_out, and6_out, and7_out, and8_out);

endmodule
