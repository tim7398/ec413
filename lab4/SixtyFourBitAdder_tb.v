`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:36:23 09/30/2015
// Design Name:   SixtyFourBitAdder
// Module Name:   /ad/eng/users/q/t/qtim/Desktop/Lab4_CompOrg/SixtyFourBitAdder_tb.v
// Project Name:  Lab4_CompOrg
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SixtyFourBitAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SixtyFourBitAdder_tb;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;
	reg clk;
	// Outputs
	wire c_out;
	wire [63:0] sum;
	wire error_flag;
	wire c_out_verify;
	wire [63:0] sum_verify;

	// Instantiate the Unit Under Test (UUT)
	SixtyFourBitAdder uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
// Verification module
	Verification_64bit Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	

	// Assign Error Flag
	assign error_flag = ((c_out != c_out_verify) || (sum != sum_verify));

	// Derfine clk signal for both Verfication and Input signal generation	
	always #5 clk = ~clk;

	// Verification logic
	always@(posedge clk)
		begin
		if (error_flag == 1'b1)
			begin
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
			end
		end

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		
		a = 1'b0;
		b = 1'b0;
		c_in = 1'd0;

		// Wait 100 ns for global reset to finish
		#200
		a = 64'hffffffffffffffff;
		b = 64'd1;
		c_in = 1;
	 
		// Add stimulus here

	end
          
endmodule

