`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:52:44 11/04/2022
// Design Name:   Cache
// Module Name:   D:/CA Lab/Mips/Test_Cache.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Cache
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Cache;

	// Inputs
	reg [127:0] dataline;
	reg [31:0] address;
	reg clk;

	// Outputs
	wire [31:0] ins;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	Cache uut (
		.dataline(dataline), 
		.address(address), 
		.clk(clk), 
		.ins(ins), 
		.hit(hit)
	);
	initial begin
		clk = 1;
	end
	
	always #50 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		address = 32'b1;  // Hit = 0 --> input = 1 Decimal --> output = Dont Care(X) 

		// After 5 clock cycles Dataline will Filling Up. 
		#500; 
		// 15 - 0 (16 instruction * 8 bit = 128 bit)
		dataline = 128'b00001111000011100000110100001100000010110000101000001001000010000000011100000110000001010000010000000011000000100000000100000000;
		#100;
		 
		
		address = 32'b101;   // input = 5 Decimal --> output = 7-6-5-4    Hit = 1
		#100; 
		address = 32'b111;   // input = 7 Decimal --> output = 7-6-5-4    Hit = 1
		
		#100;
		address = 32'b1000;  // input = 8 Decimal --> output =  b-a-9-8   Hit = 1
		#100;
		address = 32'b1001;  // input = 9 Decimal --> output =  b-a-9-8   Hit = 1
		#100;
		address = 32'b1010;  // input = 10 Decimal --> output = b-a-9-8   Hit = 1
		#100;
		address = 32'b1011;  // input = 11 Decimal --> output = b-a-9-8   Hit = 1
		
		#100;
		address = 32'b1111;  // input = 15 Decimal --> output = f-e-d-c   Hit = 1
		
		
		
		/* TestCaseTwo : New DataLine Instruction */
		
		#100;
		
		address = 32'b10000;  // Hit = 0 --> input = 16 Decimal --> output = Dont Care(X)
		
		// After 5 clock cycles Dataline will Filling Up. 
		#500	
		// 31 - 16 (16 instruction * 8 bit = 128 bit)
		dataline = 128'b00011111000111100001110100011100000110110001101000011001000110000001011100010110000101010001010000010011000100100001000100010000;
		#100;
		
		
		address = 32'b10000;   	 	// Hit = 1 --> input = 16 Decimal --> output = 13-12-11-10   (Hex) 
		#100
		address = 32'b10001;  		// Hit = 1 --> input = 17 Decimal --> output = 13-12-11-10   (Hex)   
		#100
		address = 32'b10100;  		// Hit = 1 --> input = 20 Decimal --> output = 17-16-15-14   (Hex)  
		#100;		
		address = 32'b11010;  		// Hit = 1 --> input = 26 Decimal --> output = 1b-1a-19-18   (Hex) 
		#100;
		address = 32'b11101;  	   // Hit = 1 --> input = 29 Decimal --> output = 1f-1e-1d-1c   (Hex) 
		
		#200
		address = 32'b0;     	   // Hit = 1 --> input = 0 Decimal --> output = 3-2-1-0        (Hex)
		#100
		address = 32'b110;    	   // Hit = 1 --> input = 6 Decimal --> output = 7-6-5-4        (Hex)
		#100
		address = 32'b1010;   	   // Hit = 1 --> input = 10 Decimal --> output = b-a-9-8       (Hex)
		#100
		address = 32'b1101;        // Hit = 1 --> input = 13 Decimal --> output = f-e-d-c       (Hex)
		
		#400;
		address = 32'b01100100;    // Hit = 0 --> input = 100 Decimal --> output = Dont Care(X)
	end
      
endmodule

