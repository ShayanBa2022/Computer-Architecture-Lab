`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:21:33 11/18/2022
// Design Name:   SignExtend
// Module Name:   D:/CA Lab/Mips/Test_SignExtend.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_SignExtend;

	// Inputs
	reg [15:0] value;

	// Outputs
	wire [31:0] extendedValue;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.value(value), 
		.extendedValue(extendedValue)
	);

	initial begin
		// Initialize Inputs
		value = 16'b1111111111111111;

		// Wait 100 ns for global reset to finish
		#100;
		
		value = 16'b10;
        
		// Add stimulus here

	end
      
endmodule

