`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:23 11/20/2015 
// Design Name: 
// Module Name:    RegisterA 
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
module RegisterA(outA,InA,clk,reset);
input [31:0]InA;
input reset,clk;
output [31:0] outA;

reg [31:0]registerA;

assign outA = registerA;

always@(posedge clk) // runs the clock.
begin
	if (reset)
		begin 
		registerA <= 32'b0;
		end
	
	else
		registerA <= InA;
		
end

endmodule
