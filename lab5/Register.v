`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:09:08 10/09/2015 
// Design Name: 
// Module Name:    Register 
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
module Register(output [W-1:0] reg_out, input clk,input [W-1:0] reg_in);

	parameter W = 32;

	reg [W-1:0] Reg;

	assign reg_out = Reg; // puts value into register

	always@(posedge clk) // runs the clock.
		begin
		Reg <= reg_in;
		end

endmodule