`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:09 10/08/2015 
// Design Name: 
// Module Name:    nbit_alu 
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
module nbit_alu(result,a,b,c_in,ALOP);

parameter W = 32;

input [W-1:0] a, b; // set the parameter to 32-1
input [2:0]ALOP;
input c_in;
output [W-1:0] result;


wire [W:0] carry;

assign carry[0] = c_in;


genvar i;
generate
	for(i = 0; i < W; i = i + 1) 
		begin: alu
		OneBit_ALU alu(carry[i+1], result[i], a[i], b[i], carry[i], ALOP[2:0]); // generates 32 bit alu from 1 bit alu
																										// takes the carry out from last to the carry in of the next
		end

endgenerate


endmodule



