`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:09:57 11/04/2022
// Design Name:   Fetch
// Module Name:   D:/CA Lab/Mips/Test_Fetch.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Fetch;

	// Inputs
	reg pc_src;
	reg [31:0] branchtarget;
	reg clk;

	// Outputs
	wire [31:0] ins;
	wire [31:0] nextpc;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.pc_src(pc_src), 
		.branchtarget(branchtarget), 
		.clk(clk), 
		.ins(ins), 
		.nextpc(nextpc), 
		.hit(hit)
	);
	/*initial begin
		clk = 0 ;
	end*/
	always #50 clk = ~clk; 
	
	initial begin
		// Initialize Inputs
		pc_src = 0;
		branchtarget = 0;
		clk = 0 ;
		
		#100;
		
		pc_src = 0;
		branchtarget = 1;
		clk = 0 ;

	end
      
endmodule

