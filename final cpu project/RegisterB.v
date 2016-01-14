`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:55:57 11/20/2015 
// Design Name: 
// Module Name:    RegisterB 
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
module RegisterB(outB,InB,clk,reset);
input [31:0]InB;
input reset,clk;
output [31:0] outB;

reg [31:0]registerB;

assign outB = registerB;

always@(posedge clk) // runs the clock.
		begin
		if (reset)
			begin 
			registerB <= 32'b0;
			end
		else
			registerB <= InB;
		end



endmodule
