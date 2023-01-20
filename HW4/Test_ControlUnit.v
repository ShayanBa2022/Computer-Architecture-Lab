`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:32:49 12/02/2022
// Design Name:   ControlUnit
// Module Name:   D:/CA Lab/Mips/Test_ControlUnit.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ControlUnit;

	// Inputs
	reg [5:0] OpCode;

	// Outputs
	wire destReg;
	wire ALUsrc;
	wire MemToReg;
	wire regWrite;
	wire MemRead;
	wire MemWrite;
	wire branch;
	wire [2:0] ALUop;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.OpCode(OpCode), 
		.destReg(destReg), 
		.ALUsrc(ALUsrc), 
		.MemToReg(MemToReg), 
		.regWrite(regWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.branch(branch), 
		.ALUop(ALUop)
	);

	initial begin
		// Initialize Inputs
		OpCode = 6'b000000;
		#100;
      //-----------------------------------------------------------------------------------------------
		OpCode = 6'b000100;
		#100;
		//-----------------------------------------------------------------------------------------------
		OpCode = 6'b000101;
		#100;
		//-----------------------------------------------------------------------------------------------
		OpCode = 6'b000111;
		#100;
		//-----------------------------------------------------------------------------------------------
		OpCode = 6'b000110;
		#100;
		//-----------------------------------------------------------------------------------------------
		OpCode = 6'b111111;
		#100;
		//-----------------------------------------------------------------------------------------------
		OpCode = 6'b000010;
		#100;
	end
      
endmodule

