`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:06:26 11/22/2015
// Design Name:   CPU
// Module Name:   /ad/eng/users/d/y/dyour/Milestone3.0/CPU_tb.v
// Project Name:  Milestone3.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_tb;

	// Inputs
	reg reset;
	reg clock;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.reset(reset), 
		.clock(clock)
	);
always #5 clock = ~clock;
	initial begin
		// Initialize Inputs
		reset = 1;
		clock = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
        
		// Add stimulus here

	end
      
endmodule

