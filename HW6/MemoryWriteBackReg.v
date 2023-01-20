`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:52 01/20/2023 
// Design Name: 
// Module Name:    MemoryWriteBackReg 
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
module MemoryWriteBackReg(input clk, input hit, input regWrite, input MemToReg, input [4:0] writeReg, input [31:0] readData, input[31:0] ALUresult, output hitOut, output reg regWriteOut, output reg MemToRegOut, output reg [4:0] writeRegOut,output reg [31:0] readDataOut, output reg [31:0] ALUresultOut);

	assign hitOut = hit;
	//-----------------------------------------------------------------------------------------------------------------------
	always @(negedge clk) begin
		if (hit) begin
			MemToRegOut <= MemToReg;
			regWriteOut <= regWrite;
			writeRegOut <= writeReg;
			readDataOut <= readData;
			ALUresultOut <= ALUresult;
		end
	end
	//-----------------------------------------------------------------------------------------------------------------------
endmodule
