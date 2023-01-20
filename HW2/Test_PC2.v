`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:04:21 11/04/2022
// Design Name:   PC_2
// Module Name:   D:/CA Lab/Mips/Test_PC2.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_PC2;

	// Inputs
	reg [31:0] next_ins;
	reg clk;
	reg hit;

	// Outputs
	wire [31:0] ins_address;

	// Instantiate the Unit Under Test (UUT)
	PC_2 uut (
		.next_ins(next_ins), 
		.clk(clk), 
		.hit(hit), 
		.ins_address(ins_address)
	);

	initial begin
		// Initialize Inputs
		next_ins = 0;
		clk = 0;
		hit = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		next_ins = 0;
		clk = 1;
		hit = 0;
		#100;
		
		next_ins = 32'b1;
		clk = 1;
		hit = 0;
		#100;
		
		next_ins = 32'b10;
		clk = 0;
		hit = 0;
		#100;
		
		next_ins = 32'b11;
		clk = 1;
		hit = 1;
		#100;
		
		
		// Add stimulus here

	end
      
endmodule

