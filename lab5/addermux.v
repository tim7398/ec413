`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:36:52 10/08/2015 
// Design Name: 
// Module Name:    addermux 
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
module addermux(c_out, adder_out, sub_out, select);
input adder_out, sub_out, select;
output reg c_out;

always @(*)
begin
case(select)
1'b0: c_out = adder_out;
1'b1: c_out = sub_out;
default:c_out = 0;
endcase
end


endmodule
