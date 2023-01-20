`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:35 11/18/2022 
// Design Name: 
// Module Name:    SignExtend 
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
module SignExtend(input [15:0] value , output [31:0] extendedValue );
	
	assign extendedValue [15:0] = value;	// assigning the value in the first 116 bits
	assign extendedValue[31:16] = {16{value[15]}};	// assigning 16 of value[15] to other bits to have 32 bits

endmodule
