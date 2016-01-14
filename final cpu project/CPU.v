`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:11 11/22/2015 
// Design Name: 
// Module Name:    CPU 
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
module CPU(reset,clock);
input reset, clock;
wire IRwrite,MemWrite,MemtoReg,RegWrite,PCwrite,PCwritecond,RegDst,branch,regA_mux;//added branch signal
wire [3:0] ALUop,Load;
wire [1:0] PCsource;
wire [1:0] ALUsrcB,ALUsrcA;
wire[5:0] opcode;


Controller control(clock,reset,opcode,IRwrite,MemWrite,MemtoReg,ALUsrcA,ALUsrcB,PCsource,ALUop,RegWrite,branch,PCwrite,PCwritecond,RegDst,regA_mux,Load);
Datapath datapath(opcode,clock,reset,IRwrite,MemWrite,MemtoReg,ALUsrcA,ALUsrcB,PCsource,ALUop,branch,RegWrite,PCwrite,PCwritecond,RegDst,regA_mux,Load);


endmodule
