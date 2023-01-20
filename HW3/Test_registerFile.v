`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:44 11/18/2022
// Design Name:   RegisterFile
// Module Name:   D:/CA Lab/Mips/Test_registerFile.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_registerFile;

	// Inputs
	reg clk;
	reg regWriteSignal;
	reg [4:0] readReg1;
	reg [4:0] readReg2;
	reg [4:0] writeReg;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] data1;
	wire [31:0] data2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.clk(clk), 
		.regWriteSignal(regWriteSignal), 
		.readReg1(readReg1), 
		.readReg2(readReg2), 
		.writeReg(writeReg), 
		.writeData(writeData), 
		.data1(data1), 
		.data2(data2)
	);
	
	always 
		begin
			#50	clk = ~clk;
		end 

	initial begin
		// Initialize Inputs
		clk = 0;
		
		
		regWriteSignal = 1;
		readReg1 = 16;
		readReg2 = 8;
		writeReg = 5;
		writeData = 4;

		#100;
        
		regWriteSignal = 1;
		readReg1 = 31;
		readReg2 = 16;
		writeReg = 12;
		writeData = 8;
		
		#100;
		
		regWriteSignal = 0;
		readReg1 = 20;
		readReg2 = 10;
		writeReg = 5;
		writeData = 1;
		
		#100;

	end
      
endmodule

