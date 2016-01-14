module Controller(clock,reset,opcode,IRwrite,MemWrite,MemtoReg,ALUsrcA,ALUsrcB,PCsource,ALUop,RegWrite,branch,PCwrite,PCwritecond,RegDst,regA_mux,Load);

//dont need memread, always reading
output reg IRwrite,MemWrite,MemtoReg,RegWrite,PCwrite,PCwritecond,RegDst,branch,regA_mux;//added branch signal
output reg [3:0] ALUop;
output reg [1:0] PCsource,Load;
output reg [1:0] ALUsrcB,ALUsrcA;

input clock,reset;
input[5:0] opcode;

reg[3:0]state;
reg[3:0]next_state;

initial
begin
	state = 4'd0;
	next_state = 4'd0;
	IRwrite = 0;
	MemWrite = 0;
	MemtoReg = 0;
	ALUsrcB = 2'b00;
	branch = 0;
	Load=0;
	ALUsrcA = 0;
	PCsource = 0;
	ALUop = 4'b0010;
	RegWrite = 0;
	RegDst = 0;
	PCwrite = 0;
	PCwritecond = 0;
	regA_mux = 0;
	
	
end

always @( posedge clock)
state = next_state;
always @(reset or state or opcode)
begin

	if(reset)
	next_state = 4'd0;
else

	case(state)
		4'd0: begin //IF
			ALUsrcA = 2'b0;
			IRwrite = 1'b1;
			branch = 1'b0;
			ALUsrcB=2'b01;
			ALUop = 4'b0010;
			Load=0;
			PCwrite = 1'b1;
			PCsource=2'b00;
			MemWrite = 1'b0;
			PCwritecond = 1'b0;
			RegWrite = 1'b0; 
			RegDst = 0;
			regA_mux = 0;
			next_state = 4'd1;
			end
		4'd1: begin//ID
			//R TYPE
			IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 0;
			ALUsrcB = 2'b11;
			ALUsrcA = 0;
			regA_mux = 0;
			PCsource = 0;
			branch = 1'b0;
			ALUop = 4'b0010;
			RegWrite = 0;
			RegDst = 0;
			PCwrite = 0;
			PCwritecond = 0;
				if (opcode==6'b000000)			//NOOP
					next_state = 4'd0;
				else if (opcode==6'b010000)			//MOV
					next_state = 4'd2;
				else if (opcode==6'b010001)			//NOT
					next_state = 4'd2;
				else if (opcode==6'b010010)			//ADD
					begin
					regA_mux = 1;
					next_state = 4'd2;
					end
				else if (opcode==6'b010011)			//SUB
					begin
				
					next_state = 4'd2;
					end
				else if (opcode==6'b010100)// OR
					begin
					regA_mux = 1;
					next_state = 4'd2;
					end
				else if (opcode==6'b010101) // AND
					begin
					regA_mux = 1;
					next_state = 4'd2;
					end
				else if (opcode==6'b010111) // SLT
					begin
					regA_mux = 1;
					ALUsrcA = 1;
					next_state = 4'd2;
					end
				else if(opcode == 6'b111010)//lw
					begin
					Load=1;
					next_state = 4'd7;
					end
				else if(opcode == 6'b110001)//sw
					begin
					Load = 2'd2;
					next_state = 4'd7;
					end
					
					//I TYPE
				else if (opcode==6'b110010) //ADDI
					next_state = 4'd11;
				else if (opcode==6'b110011) //SUBI
					next_state = 4'd11;
				else if (opcode==6'b110100)//ORI
					next_state = 4'd3;
				else if (opcode==6'b110101)//ANDI
					next_state = 4'd3;
				else if (opcode==6'b110111)//SLTI
					next_state = 4'd11;
				else if(opcode==6'b111001)//LI
					next_state = 4'd3;
				//JUMP	
				else if (opcode==6'b000001)//JUMP
					next_state = 4'd6;
					//BRANCH
				else if(opcode==6'b100000)//BEQ
					next_state = 4'd5;
				else if(opcode==6'b100001)//BNE
					next_state = 4'd5;
				//LWI OR SWI
				else if (opcode==6'b111011)//LWI
					next_state = 4'd7;
				else if(opcode==6'b111100)//SWI
					next_state = 4'd7;
				else
					next_state = 4'd0;
					end
		4'd2:begin//R TYPE
			IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 0;
			ALUsrcB = 2'b00;
			ALUsrcA = 1;
			branch = 1'b0;
			Load=0;
			PCsource = 0;
			ALUop = opcode[3:0];
			RegWrite = 0;
			RegDst = 0;
			 if (opcode==6'b010111)
				regA_mux = 1;
			else
			regA_mux = 0;
			PCwrite = 0;
			PCwritecond = 0;
			next_state = 4'd4;
			end
		4'd3: begin //I Type -Zero extend
			IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 0;
			Load=0;
			ALUsrcB = 2'b11;// zero extend
			ALUsrcA = 1;
			PCsource = 2'b00;
			branch = 1'b0;
			regA_mux = 0;
			ALUop = opcode[3:0];
			RegWrite = 0;
			RegDst = 0;
			PCwrite = 0;
			PCwritecond = 0;
			next_state = 4'd4;
			end
		4'd4:begin // ALU Completion
			IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 0;
			Load=0;
			ALUsrcB = 2'b00;
			regA_mux = 0;
			branch = 1'b0;
			 if (opcode==6'b010111) //slt
			 ALUsrcA = 1;
			 if (opcode==6'b110111) //slti
			 begin
			 ALUsrcA = 2'd2;
			 end
			 else
			ALUsrcA = 0;
			PCsource = 2'b00;
			ALUop = opcode[3:0];
			RegWrite = 1;
			RegDst = 0;
			PCwrite = 0;
			PCwritecond = 0;
			next_state = 4'd0;
			end
		4'd5: begin // Branch
			IRwrite = 0;
			Load=0;
			MemWrite = 0;
			MemtoReg = 0;
			ALUsrcB = 2'b00;
			regA_mux = 0;
			ALUsrcA = 1;
			PCsource = 2'b01;
			ALUop = 4'b0010;
			RegWrite = 0;
			RegDst = 0;
			PCwrite = 0;
			if(opcode==6'b100000) // accounts for beq
			begin
			PCwritecond = 1;
			branch = 1'b1;//just added signal for mux
			end
			if(opcode==6'b100001)// accounts for bne
			begin
			PCwritecond = 1;
			branch = 1'b0;//just added signal for mux
			end
			next_state = 4'd0;
			
			end
		4'd6:begin// Jump
			IRwrite = 0;
			MemWrite = 0;
			Load=0;
			MemtoReg = 0;
			ALUsrcB = 2'b00;
			ALUsrcA = 0;
			regA_mux = 0;
			PCsource = 2'b10;
			ALUop = 4'b0110; //default case
			RegWrite = 0;
			RegDst = 0;
			PCwrite = 1;
			PCwritecond = 0;
			next_state = 4'd0;
			end
		4'd7: begin//Memory address computation
				if(opcode == 6'b111011)//LWI
					next_state = 4'd8;
				else
					next_state = 4'd10; //SWI
						IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 0;
			ALUsrcB = 2'b10;
			if(opcode == 6'b111010)//lw
			begin
			Load=1;
			ALUsrcA = 2;
			ALUsrcB=0;
			next_state = 4'd8;
			end
			else if(opcode == 6'b110001)//sw
			begin
			Load=2'd2;
			ALUsrcA = 2;
			ALUsrcB=0;
			next_state = 4'd10;
			end
			else
			begin
			ALUsrcA = 1;
			Load = 0;
			end
			PCsource = 2'b00;
			ALUop = opcode[3:0];
			RegWrite = 0;
			regA_mux = 0;
			RegDst = 0;
			PCwrite = 0;
			PCwritecond = 0;
			end
		4'd8:begin // MemRead LWI
			IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 0;
			if(opcode == 6'b111010)
			begin
			Load=1;
			end
			else
			Load =0;
			ALUsrcB = 2'b00;
			ALUsrcA = 0;
			PCsource = 2'b00;
			ALUop = 4'b1110;
			RegWrite = 0;
			RegDst = 0;
			PCwrite = 0;
			regA_mux = 0;
			PCwritecond = 0;
			next_state = 4'd9;
			end
		4'd9: begin // Write back step
			IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 1;
			if(opcode == 6'b111010)
			begin
			Load = 1;
			ALUsrcA = 2'd2;
			end
			else
			begin
			Load = 0;
			ALUsrcA = 0;
			end
			ALUsrcB = 2'b00;
			PCsource = 2'b00;
			ALUop = 4'b0010;
			RegWrite = 1;
			regA_mux = 0;
			RegDst = 1;
			PCwrite = 0;
			PCwritecond = 0;
			next_state = 4'd0;
			end
		4'd10: //MemWrite
				begin
			next_state = 4'd0;
			IRwrite = 0;
			MemWrite = 1;
			MemtoReg = 0;
			ALUsrcB = 2'b00;
			ALUsrcA = 0;
			Load = 0;
			if(opcode == 6'b110001)//sw
			begin
			ALUsrcA = 2'd2;
			Load = 2'd2;
			end
			regA_mux = 0;
			
			PCsource = 2'b00;
			ALUop = 4'b0010;
			RegWrite = 0;
			RegDst = 0;
			PCwrite = 0;
			PCwritecond = 0;
			end
		4'd11://I type-sign extend
			begin
			IRwrite = 0;
			MemWrite = 0;
			MemtoReg = 0;
			ALUsrcB = 2'b10;// sign extend
			 if (opcode==6'b110111) //slti
			 begin
			 ALUsrcA = 2'd2;
			 end
			 else
			ALUsrcA = 1;
			PCsource = 2'b00;
			ALUop = opcode[3:0];
			regA_mux = 0;
			Load =0;
			RegWrite = 0;
			RegDst = 0;
			PCwrite = 0;
			PCwritecond = 0;
			next_state = 4'd4;
			end
	endcase
	end
													
endmodule













