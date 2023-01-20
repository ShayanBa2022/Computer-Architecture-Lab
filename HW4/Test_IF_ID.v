`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:58:04 12/02/2022
// Design Name:   IF_ID
// Module Name:   D:/CA Lab/Mips/Test_IF_ID.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF_ID
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_IF_ID;

	// Inputs
	reg [31:0] insInput;
	reg hitInput;
	reg clk;
	reg [31:0] nextPCinput;

	// Outputs
	wire [31:0] insOutput;
	wire [31:0] nextPCoutput;
	wire hitOutput;

	// Instantiate the Unit Under Test (UUT)
	IF_ID uut (
		.insInput(insInput), 
		.hitInput(hitInput), 
		.clk(clk), 
		.nextPCinput(nextPCinput), 
		.insOutput(insOutput), 
		.nextPCoutput(nextPCoutput)
	);
	
	always begin
		# 50 clk = ~clk;
	end
	//------------------------------------------------------------
	initial begin
		// Initialize Inputs
		insInput = 32'b1;
		hitInput = 0;
		clk = 0;
		nextPCinput = 0;
		#100;
      //------------------------------------------------------------
		insInput = 32'b10;
		hitInput = 1;
		nextPCinput = 4;
		#100;
		//------------------------------------------------------------
		insInput = 32'b11;
		hitInput = 0;
		nextPCinput = 8;
		#100;
		//------------------------------------------------------------
		insInput = 32'b100;
		hitInput = 0;
		nextPCinput = 12;
		#100;
		//------------------------------------------------------------
		insInput = 32'b 101;
		hitInput = 1;
		nextPCinput = 16;
		#100;
		//------------------------------------------------------------
	end
      
endmodule

