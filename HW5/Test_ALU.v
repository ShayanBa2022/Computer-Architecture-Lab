`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:43:32 12/10/2022
// Design Name:   ALU
// Module Name:   D:/CA Lab/Mips/Test_ALU.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ALU;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg [3:0] ALUctrl;
	reg [4:0] shiftAmount;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.input1(input1), 
		.input2(input2), 
		.ALUctrl(ALUctrl), 
		.shiftAmount(shiftAmount), 
		.result(result), 
		.zero(zero)
	);

	initial begin
		input1 = 4;
		input2 = 8;
		ALUctrl = 4'b0000;
		shiftAmount = 5'b0110; 
		
		#200;

		input1 = 3; 
		input2 = 9;						  
		ALUctrl = 4'b0010;
		shiftAmount = 5'b0100;  
		
		#200;
		
		input1 = 10; 
		input2 = 12;           
		ALUctrl = 4'b0100;
		shiftAmount = 5'b00010;
		
		#200;
		
		input1 = 17;
		input2 = 2;
		ALUctrl = 4'b0111;
		shiftAmount = 5'b0110;      


	end
      
endmodule

