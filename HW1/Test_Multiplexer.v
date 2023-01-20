`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:26:17 10/24/2022
// Design Name:   Multiplexer_32bit
// Module Name:   D:/CA Lab/Mips/Test_Multiplexer.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplexer_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Multiplexer;

	// Inputs
	reg [31:0] val1;
	reg [31:0] val2;
	reg sel;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	Multiplexer_32bit uut (
		.val1(val1), 
		.val2(val2), 
		.sel(sel), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		val1 = 0;
		val2 = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		val1 = 1;
		val2 = 0;
		sel = 0;
		#100;
		
		val1 = 1;
		val2 = 1;
		sel = 0;
		#100;
		
		val1 = 0;
		val2 = 1;
		sel = 0;
		#100;
		
		val1 = 1;
		val2 = 0;
		sel = 1;
		#100;
		
		val1 = 0;
		val2 = 1;
		sel = 1;
		#100;

		val1 = 2;
		val2 = 4;
		sel = 1;
		#100;
		
	end
      
endmodule

