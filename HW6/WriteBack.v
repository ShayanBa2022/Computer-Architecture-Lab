`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:25 01/20/2023 
// Design Name: 
// Module Name:    WriteBack 
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
module WriteBack(input MemToReg, input [31:0] readData, input [31:0] ALUresult, output reg [31:0] writeData);

	always @(*) begin
		if (MemToReg == 1)
			writeData = readData;
		else
			writeData = ALUresult;
	end


endmodule
