`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:12 11/21/2015 
// Design Name: 
// Module Name:    ALU_Reg 
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
module ALU_Reg(AlU_reg_out,ALU_reg_in,clk,reset);
input [31:0]ALU_reg_in;
input clk,reset;
output [31:0]AlU_reg_out;

reg [31:0]registerAlu;

assign AlU_reg_out= registerAlu;

always@(posedge clk) // runs the clock.
		begin
			if (reset)
				begin 
					registerAlu <= 32'b0;
				end
		else
				registerAlu <= ALU_reg_in;
		end


endmodule
