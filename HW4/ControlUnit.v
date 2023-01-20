`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:56 12/02/2022 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit( input [5:0] OpCode , output reg destReg , output reg ALUsrc , output reg MemToReg , output reg regWrite , output reg MemRead , output reg MemWrite , output reg branch , output reg [2:0] ALUop);

	always @(OpCode) begin
		// Initial values
		assign destReg = 0;
		assign ALUsrc = 0;
		assign MemToReg = 0; 
		assign regWrite = 0;
		assign MemRead = 0;
		assign MemWrite = 0;
		assign branch = 0;
		assign ALUop = 000;
		//-----------------------------------------------------------------------------------------------------------------------
		// R-type Instructions
		if (OpCode == 6'b000000) begin
			assign destReg = 1;
			assign ALUsrc = 0;
			assign MemToReg = 0; 
			assign regWrite = 1;
			assign MemRead = 0;
			assign MemWrite = 0;
			assign branch = 0;
			assign ALUop = 000;
		end
		//-----------------------------------------------------------------------------------------------------------------------
		// load word (lw)
		if (OpCode == 6'b000100) begin
			assign destReg = 0;
			assign ALUsrc = 1;
			assign MemToReg = 1; 
			assign regWrite = 1;
			assign MemRead = 1;
			assign MemWrite = 0;
			assign branch = 0;
			assign ALUop = 011;
		end
		//-----------------------------------------------------------------------------------------------------------------------
		// store word (sw)
		if (OpCode == 6'b000101) begin
			assign destReg = 0;
			assign ALUsrc = 1;
			assign MemToReg = 0; 
			assign regWrite = 1;
			assign MemRead = 0;
			assign MemWrite = 1;
			assign branch = 0;
			assign ALUop = 011;
		end	
		//-----------------------------------------------------------------------------------------------------------------------	
		// add immidiate (addi)
		if (OpCode == 6'b000111) begin
			assign destReg = 0;
			assign ALUsrc = 1;
			assign MemToReg = 0; 
			assign regWrite = 1;
			assign MemRead = 0;
			assign MemWrite = 0;
			assign branch = 0;
			assign ALUop = 011;
		end
		//-----------------------------------------------------------------------------------------------------------------------
		// beq
		if (OpCode == 6'b000110) begin
			assign destReg = 0;
			assign ALUsrc = 0;
			assign MemToReg = 0; 
			assign regWrite = 0;
			assign MemRead = 0;
			assign MemWrite = 0;
			assign branch = 1;
			assign ALUop = 001;
		end
		//-----------------------------------------------------------------------------------------------------------------------
		//slti
		if (OpCode == 6'b000001) begin
			assign destReg = 0;
			assign ALUsrc = 1;
			assign MemToReg = 0; 
			assign regWrite = 1;
			assign MemRead = 0;
			assign MemWrite = 0;
			assign branch = 0;
			assign ALUop = 010;
		end
		//-----------------------------------------------------------------------------------------------------------------------
	end
endmodule
