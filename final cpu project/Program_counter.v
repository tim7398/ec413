`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:17 11/20/2015 
// Design Name: 
// Module Name:    Program_counter 
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
module Program_counter(pc_out,mux_output,pc_enable,clk,reset);
input [31:0]mux_output;
input pc_enable,clk,reset;
output[15:0] pc_out;
reg [31:0]program_counterReg;
//store to reg


assign pc_out = program_counterReg;

always@(posedge clk)
	begin
	if(reset)
		begin
		program_counterReg <=32'b0;
		end
	else if(pc_enable == 1)
		program_counterReg <= mux_output;
	end



endmodule
