`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:54:29 01/20/2023
// Design Name:   EXMemoryReg
// Module Name:   D:/CA Lab/Mips/Test_EXMemoryReg.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EXMemoryReg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_EXMemoryReg;

	// Inputs
	reg clk;
	reg hit;
	reg zeroFlag;
	reg memRead;
	reg memWrite;
	reg branch;
	reg regWrite;
	reg MemToReg;
	reg [31:0] branchTarget;
	reg [31:0] ALUresult;
	reg [31:0] readData2;
	reg [4:0] writeReg;

	// Outputs
	wire zeroFlagOut;
	wire memReadOut;
	wire memWriteOut;
	wire branchOut;
	wire regWriteOut;
	wire MemToRegOut;
	wire [31:0] branchTargetOut;
	wire [31:0] ALUresultOut;
	wire [31:0] readData2Out;
	wire [4:0] writeRegOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	EXMemoryReg uut (
		.clk(clk), 
		.hit(hit), 
		.zeroFlag(zeroFlag), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.regWrite(regWrite), 
		.MemToReg(MemToReg), 
		.branchTarget(branchTarget), 
		.ALUresult(ALUresult), 
		.readData2(readData2), 
		.writeReg(writeReg), 
		.zeroFlagOut(zeroFlagOut), 
		.memReadOut(memReadOut), 
		.memWriteOut(memWriteOut), 
		.branchOut(branchOut), 
		.regWriteOut(regWriteOut), 
		.MemToRegOut(MemToRegOut), 
		.branchTargetOut(branchTargetOut), 
		.ALUresultOut(ALUresultOut), 
		.readData2Out(readData2Out), 
		.writeRegOut(writeRegOut), 
		.hitOut(hitOut)
	);
	always # 250 clk = ~clk;
	initial begin
		clk = 0;
		hit = 0;
		branchTarget = 32'b0000_0000_0000_0000_0000_0000_0000_0111; // 7
		zeroFlag 	 = 0;
		ALUresult 	 = 32'b0000_0000_0000_0000_0000_0000_0000_0101; // 5
		readData2  = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		writeReg     = 5'b10010;
		memRead      = 0;
		memWrite     = 1;
		branch       = 1;
		regWrite     = 0;
		MemToReg     = 1;

		#500;
		
		hit = 1;
		branchTarget = 32'b0000_0000_0000_0000_0000_0000_0000_1111; // 15
		zeroFlag     = 0;
		ALUresult    = 32'b0000_0000_0000_0000_0000_0000_0000_1010; // 10
		readData2  = 32'b0000_0000_0000_0000_0000_0000_0000_1101; // 13
		writeReg     = 5'b10101;
		memRead      = 1;
		memWrite     = 1;
		branch       = 0;
		regWrite     = 1;
		MemToReg     = 0;
        
	end
      
endmodule

