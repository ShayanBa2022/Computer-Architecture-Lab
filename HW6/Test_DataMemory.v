`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:39:03 01/20/2023
// Design Name:   DataMemory
// Module Name:   D:/CA Lab/Mips/Test_DataMemory.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_DataMemory;

	// Inputs
	reg clk;
	reg [31:0] address;
	reg [31:0] writeData;
	reg memWrite;
	reg memRead;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clk(clk), 
		.address(address), 
		.writeData(writeData), 
		.memWrite(memWrite), 
		.memRead(memRead), 
		.readData(readData)
	);
	always #50 clk = ~clk;
	
	initial begin
	clk = 0;

		address = 32'b0000_0000_0000_0000_0000_0000_0001_0001;          //17
		writeData = 0;
		memWrite =  0;
		memRead =   1;

		#100;
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1010; 	 //10
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0111; 	//7
		memWrite  = 1;
		memRead   = 1;
		
		#100;
		
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1100; 	//12
		writeData = 32'b0000_0000_0000_0000_0000_0000_0001_0111;   //23
		memWrite  = 0;
		memRead   = 1;
		
		#100;
				
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1111; 	 //15
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_1010; 	//10
		memWrite  = 1;
		memRead   = 0;
		
		#100;
				
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1100;    //12
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		memWrite  = 0;
		memRead   = 1;
        
	end
      
endmodule

