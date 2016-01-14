`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:38 11/19/2015 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(out,clock,reset,IRwrite,MemWrite,MemtoReg,ALUsrcA,ALUsrcB,PCsource,ALUop,branch,RegWrite,PCwrite,PCwritecond,RegDst,regA_mux,Load);

input clock, reset,IRwrite,MemWrite,MemtoReg,RegWrite,PCwrite,PCwritecond,RegDst,branch,regA_mux;//added branch control
input [3:0] ALUop;
input [1:0] PCsource, Load;
input [1:0] ALUsrcB,ALUsrcA;
wire [31:0]Instruc_out;
wire [15:0] PC;
wire [15:0] imm;
wire [5:0] op_out;
wire [4:0] readA,readB,write_reg_mux,RegisterA_mux ; //output from instruction register
wire [31:0] ALUout;
wire [31:0] Mux_to_PC,zero_Extension,sign_Extension;
wire [31:0] Mux_aluA,Mux_aluB;
wire zero_line,andout,zero_invert,Mux_PCbranch;
wire [31:0] write_data_mux;
wire [31:0] output_regB,output_regA,in_regB,in_regA,Mem_data;
wire [31:0] Extended_jump,MemData_reg_out;
wire [25:0] Jump_to_mux;
wire [31:0] ALU_reg_out;
wire [15:0] data_mem_mux;
output [5:0] out;

//PC write
assign zero_invert = ~zero_line;
assign Mux_PCbranch =(branch) ? zero_line : zero_invert; // mux going into pc_enable
and and1(andout, Mux_PCbranch,PCwritecond);
or or1(pc_enable, andout, PCwrite);
Program_counter pc_reg(PC, Mux_to_PC, pc_enable,clock,reset);

//Instruction memory
IMem instruc_mem(PC, Instruc_out);

//Data Memory
assign data_mem_mux = (Load==0)?imm:(Load==1)? ALU_reg_out[15:0]:ALUout[15:0]; 
DMem datamem(output_regA, Mem_data,data_mem_mux,MemWrite, clock);

// instruction register
instruction_register instruc_reg(op_out,readA,readB,imm,IRwrite,Instruc_out,clock,reset);
assign Jump_to_mux = {readA,readB,imm};
assign Extended_jump = {{6{0}},Jump_to_mux}; // zero extend jump 

// Read register
assign write_data_mux = (MemtoReg)?MemData_reg_out:ALU_reg_out; // write data mux
assign RegisterA_mux = (regA_mux)? imm[15:11]:readA; // choose Reg A input.
nbit_register_file nbit_Reg(write_data_mux,in_regA,in_regB,RegisterA_mux,readB, readA,RegWrite, clock);
RegisterA A(output_regA,in_regA, clock,reset);
RegisterB B(output_regB,in_regB,clock,reset);

//Memory data register
Memory_data_reg Memreg(MemData_reg_out,Mem_data,clock,reset); // Memory data reg

//sign extend
assign zero_Extension = {{16{0}}, imm}; // extends immediate to 32 bit. 
assign sign_Extension = (imm[15]) ? {{16'hffff}, imm}:{{16{0}}, imm}; // sign extend 32 bit

// read into alu
assign Mux_aluA = (ALUsrcA==0) ? PC:(ALUsrcA==1)?output_regA:imm; // mux for A
assign Mux_aluB = (ALUsrcB == 0) ? output_regB : (ALUsrcB == 1) ? 1 : (ALUsrcB == 2) ? sign_Extension: zero_Extension;


//ALU module
ALU alu(ALUout,zero_line,ALUop,Mux_aluA,Mux_aluB);//ALU
ALU_Reg alureg(ALU_reg_out, ALUout, clock,reset); // ALU reg

//mux to pc
assign Mux_to_PC = (PCsource==0)? ALUout : (PCsource==1)? ALU_reg_out: Extended_jump; 

assign out = op_out;

endmodule
