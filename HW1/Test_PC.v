`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:08 10/24/2022
// Design Name:   PC_Register
// Module Name:   D:/CA Lab/Mips/Test_PC.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_Register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_PC;

	// Inputs
	reg [31:0] next_ins;
	reg clk;

	// Outputs
	wire [31:0] ins_address;

	// Instantiate the Unit Under Test (UUT)
	PC_Register uut (
		.next_ins(next_ins), 
		.clk(clk), 
		.ins_address(ins_address)
	);

	initial begin
		// Initialize Inputs
		next_ins = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		next_ins = 4;
		clk = 1;
		#100;
		
		next_ins = 8;
		clk = 0;
		#100;

	end
      
endmodule

