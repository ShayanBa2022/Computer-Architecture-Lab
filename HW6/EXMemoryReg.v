`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:04 01/20/2023 
// Design Name: 
// Module Name:    EXMemoryReg 
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
module EXMemoryReg(input clk, input hit, input zeroFlag, input memRead, input memWrite, input branch, input regWrite, input MemToReg, input [31:0] branchTarget, input [31:0] ALUresult, input [31:0] readData2, input [4:0] writeReg,output reg zeroFlagOut,output reg memReadOut,output reg memWriteOut,output reg branchOut,output reg regWriteOut,output reg MemToRegOut,output reg [31:0] branchTargetOut,output reg [31:0] ALUresultOut,output reg [31:0] readData2Out,output reg [4:0] writeRegOut,output hitOut);

	assign hitOut = hit;
	//-----------------------------------------------------------------------------------------------------------------------
	always @(posedge clk) begin
		if (hit) begin
			writeRegOut    <= writeReg;
			branchTargetOut<= branchTarget;
			ALUresultOut   <= ALUresult;
			readData2Out   <= readData2;
			zeroFlagOut    <= zeroFlag;
			memReadOut     <= memRead;
			memWriteOut    <= memWrite;
			branchOut      <= branch;
			regWriteOut    <= regWrite;
			MemToRegOut    <= MemToReg;
		end
	end
	//-----------------------------------------------------------------------------------------------------------------------
endmodule
