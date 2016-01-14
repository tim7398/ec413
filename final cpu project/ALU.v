`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:43 11/20/2015 
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
module ALU(out,zero,alu_control_out,Mux_aluA, Mux_aluB);
input [3:0]alu_control_out;
input [31:0] Mux_aluA, Mux_aluB;

output reg[31:0] out;
output reg zero;


 always @(alu_control_out, Mux_aluA, Mux_aluB, zero)
begin
	zero <= (Mux_aluA==Mux_aluB) ? 1 : 0;
	case(alu_control_out)
	4'b0000: out <= Mux_aluB; // mov
	4'b0001: out <= ~Mux_aluB;// not
	4'b0010: out <= Mux_aluA + Mux_aluB;//add
	4'b0011: out <= Mux_aluA - Mux_aluB;//sub
	4'b0100: out <= Mux_aluA | Mux_aluB;//or
	4'b0101: out <= Mux_aluA &Mux_aluB;//and
	4'b0111: begin//slt
				if(Mux_aluA < Mux_aluB)
				out <= 0;
				else
				out <= 1;
				end
	4'b1001: out<= Mux_aluB;//li	
	4'b1010: out <=Mux_aluA + Mux_aluB; //lw 	
	4'b0001:out <=Mux_aluA ; //sw
	default: out <= 0;
	endcase
end
	

endmodule
