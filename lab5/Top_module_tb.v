`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:33:21 10/09/2015
// Design Name:   Top_module
// Module Name:   /ad/eng/users/q/t/qtim/lab5_comporg/Top_module_tb.v
// Project Name:  lab5_comporg
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_module_tb;

	parameter W = 32;
	// Inputs
	reg clk;
	reg [W-1:0] a;
	reg [W-1:0] b;
	reg c_in;
	//reg error_flag;
	reg [2:0] ALOP;
	//reg [W-1:0] sum_verify;

	// Outputs
	wire [W-1:0] R0;
	wire [W-1:0] R0_verify;
	wire error_flag;

	// Instantiate the Unit Under Test (UUT)
	Top_module uut (
		.R0(R0), 
		.R0_verify(R0_verify),
		.clk(clk), 
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.ALOP(ALOP)
	);

	
	// Assign Error_flag
	assign error_flag = ( R0 != R0_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
	
	
always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		a = 1;
		b = 0;
		c_in = 0;
		ALOP = 0;

		// Wait 100 ns for global reset to finish
		#100;
      a = 1;
		b = 1;
		c_in = 0;
		ALOP = 3'b010;
		// Add stimulus here
		#100;
		a = 0;
		b = 1;
		c_in = 1;
		ALOP = 3'b011;
		
		#100;
      a = 45657897;
		b = 212321;
		c_in = 1;
		ALOP = 3'b011;
		
		#100;
      a = 20;
		b = 5;
		c_in = 0;
		ALOP = 3'b010;
		
		
		#100;
      a = 4566541;
		b = 4565465;
		c_in = 0;
		ALOP = 3'b000;
		
		
		#100;
      a = 1232154;
		b = 5568732;
		c_in = 0;
		ALOP = 3'b001;
		
		#100;
      a = 7565451;
		b = 1232145;
		c_in = 0;
		ALOP = 3'b100;

		
		#100;
      a = 45657878;
		b = 51232154;
		c_in = 0;
		ALOP = 3'b101;
	end
      
endmodule

