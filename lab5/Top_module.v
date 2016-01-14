`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:13:56 10/09/2015 
// Design Name: 
// Module Name:    Top_module 
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
module Top_module( R0, R0_verify,clk,a,b,c_in,ALOP);
parameter W = 32;

input clk;
input [W-1:0] a, b; 
input [2:0]ALOP;
input c_in;
output [W-1:0] R0;
output [W-1:0] R0_verify;
wire [W-1:0] result;
wire [W-1:0] result2;


nbit_alu alu(result,a,b,c_in,ALOP);// calls the nbit alu
topnbit_verification verify(result2, clk, c_in,a, b, ALOP); // verification for the nbit output
Register register(R0, clk, result);// stores output of alu in register
Register register_Verify(R0_verify, clk, result2); // stores value of verification in register



endmodule
