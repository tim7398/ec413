`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:11 11/22/2015 
// Design Name: 
// Module Name:    Memory_data_reg 
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
module Memory_data_reg(Memreg_out,Memreg_in,clk,reset);
input [31:0]Memreg_in;
input clk,reset;
output [31:0]Memreg_out;

reg [31:0]Memregister;

assign Memreg_out= Memregister;

always@(posedge clk) // runs the clock.
		begin
			if (reset)
				begin 
					Memregister <= 32'b0;
				end
			else
				Memregister <= Memreg_in;
			end


endmodule