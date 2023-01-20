`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:10 01/20/2023
// Design Name:   WriteBack
// Module Name:   D:/CA Lab/Mips/Test_WriteBack.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WriteBack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_WriteBack;

	// Inputs
	reg MemToReg;
	reg [31:0] readData;
	reg [31:0] ALUresult;

	// Outputs
	wire [31:0] writeData;

	// Instantiate the Unit Under Test (UUT)
	WriteBack uut (
		.MemToReg(MemToReg), 
		.readData(readData), 
		.ALUresult(ALUresult), 
		.writeData(writeData)
	);

	initial begin
		MemToReg   = 0;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_0010; 		//2
		ALUresult = 32'b0000_0000_0000_0000_0000_0000_0001_0111; 	  //23

		#100;
		
		MemToReg   = 1;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_1000; 	//8
		ALUresult = 32'b0000_0000_0000_0000_0000_0000_0001_0001;   //17

	end
      
endmodule

