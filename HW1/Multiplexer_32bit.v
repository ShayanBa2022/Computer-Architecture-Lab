`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:54:05 10/24/2022 
// Design Name: 
// Module Name:    Multiplexer_32bit 
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
module Multiplexer_32bit(input [31:0] val1 , input [31:0] val2 , input sel , output [31:0] result );

	assign result = sel ? val1 : val2;

endmodule
