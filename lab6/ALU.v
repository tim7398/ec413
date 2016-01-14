`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:18 10/26/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(out, mux_out, S2_ReadData1, S2_ALUOp);
input [31:0]mux_out, S2_ReadData1;
input[2:0]S2_ALUOp;
output reg [31:0]out;

always @(S2_ALUOp, mux_out, S2_ReadData1)
begin
	case(S2_ALUOp)
	3'b000: out <= S2_ReadData1; // mov
	3'b001: out <= ~S2_ReadData1;// not
	3'b010: out <= S2_ReadData1 + mux_out;//add
	3'b011: out <= S2_ReadData1 - mux_out;//sub
	3'b100: out <= S2_ReadData1 | mux_out;//or
	3'b101: out <= S2_ReadData1 & mux_out;//and
	3'b110: begin//slt
				if(S2_ReadData1 < mux_out)
				out <= 1;
				else
				out <= 0;
				end
	default: out <= 0;
	endcase
end
	


endmodule
