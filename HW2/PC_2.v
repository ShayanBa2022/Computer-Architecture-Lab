`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:43 10/28/2022 
// Design Name: 
// Module Name:    PC_2 
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
module PC_2(input [31:0] next_ins , input clk , input hit , output reg [31:0] ins_address);

	// This program counter contains "hit" input, which is used to locate next instruction to the current instruction when hit signal is up
	
	initial begin
		ins_address = 32'b00;
	end
	
	always @(negedge clk) begin
		if ( hit == 1 )
			ins_address = next_ins;
	end
	

endmodule
