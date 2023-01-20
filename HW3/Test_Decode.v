`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:31:36 11/19/2022
// Design Name:   Decode
// Module Name:   D:/CA Lab/Mips/Test_Decode.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Decode;

	// Inputs
	reg clk;
	reg [31:0] ins;

	// Outputs
	wire [5:0] opCode;
	wire [31:0] readData1;
	wire [31:0] readData2;
	wire [31:0] signEtendIm;
	wire [4:0] rd;
	wire [4:0] rt;

	// Instantiate the Unit Under Test (UUT)
	Decode uut (
		.clk(clk), 
		.ins(ins), 
		.opCode(opCode), 
		.readData1(readData1), 
		.readData2(readData2), 
		.signEtendIm(signEtendIm), 
		.rd(rd), 
		.rt(rt)
	);
	
	always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		ins = 32;

		// Wait 100 ns for global reset to finish
		#100;
		
		ins = 32'b00000000001111000000000000000000;
        
		// Add stimulus here

	end
      
endmodule

