`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:43:26 10/24/2022
// Design Name:   Instruction_Memory
// Module Name:   D:/CA Lab/Mips/Test_InstuctionMemory.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_InstuctionMemory;

	// Inputs
	reg [31:0] address;
	reg clk = 0;

	// Outputs
	wire [127:0] dataline;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Memory uut (
		.address(address), 
		.clk(clk), 
		.dataline(dataline)
	);
	initial forever #100 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		address = 1;    // 0-15   output --> 0-15   --> 4 instruction
		
		/*#100;
		address = 17;   //  16-31 output --> 16-31  --> 4 instruction
		#100;
		address = 33;   // 32-47  output --> 32-47  --> 4 instruction
		#100;
		address = 50;   // 48-63  output --> 48-63  --> 4 instruction
		#100;*/
	 


        
		// Add stimulus here

	end
      
endmodule

