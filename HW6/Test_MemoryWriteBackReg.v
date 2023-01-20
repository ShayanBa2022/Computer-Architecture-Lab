`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:41 01/20/2023
// Design Name:   MemoryWriteBackReg
// Module Name:   D:/CA Lab/Mips/Test_MemoryWriteBackReg.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryWriteBackReg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_MemoryWriteBackReg;

	// Inputs
	reg clk;
	reg hit;
	reg regWrite;
	reg MemToReg;
	reg [4:0] writeReg;
	reg [31:0] readData;
	reg [31:0] ALUresult;

	// Outputs
	wire hitOut;
	wire regWriteOut;
	wire MemToRegOut;
	wire [4:0] writeRegOut;
	wire [31:0] readDataOut;
	wire [31:0] ALUresultOut;

	// Instantiate the Unit Under Test (UUT)
	MemoryWriteBackReg uut (
		.clk(clk), 
		.hit(hit), 
		.regWrite(regWrite), 
		.MemToReg(MemToReg), 
		.writeReg(writeReg), 
		.readData(readData), 
		.ALUresult(ALUresult), 
		.hitOut(hitOut), 
		.regWriteOut(regWriteOut), 
		.MemToRegOut(MemToRegOut), 
		.writeRegOut(writeRegOut), 
		.readDataOut(readDataOut), 
		.ALUresultOut(ALUresultOut)
	);
	always #250 clk = ~clk;
	
	initial begin
		clk = 0;

		hit = 0;
		readData  = 5'b01110;
		ALUresult = 32'b0000_0000_0000_0000_0000_0000_0000_0010; //2
		writeReg  = 0;
		regWrite  = 0;
		MemToReg  = 1;

		#500;
		
		hit = 1;
		readData  = 5'b10100;
		ALUresult = 32'b0000_0000_0000_0000_0000_0000_0001_0001; //17
		writeReg  = 0;
		regWrite  = 1;
		MemToReg  = 0;

	end
      
endmodule

