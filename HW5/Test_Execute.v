`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:49:37 12/10/2022
// Design Name:   Execute
// Module Name:   D:/CA Lab/Mips/Test_Execute.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Execute;

	// Inputs
	reg clk;
	reg [31:0] ALU_read_data_1;
	reg [31:0] ALU_read_data_2;
	reg [31:0] immediate;
	reg [5:0] Function;
	reg [2:0] ALUop;
	reg ALUsrc;

	// Outputs
	wire [31:0] ALU_result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clk(clk), 
		.ALU_read_data_1(ALU_read_data_1), 
		.ALU_read_data_2(ALU_read_data_2), 
		.immediate(immediate), 
		.Function(Function), 
		.ALUop(ALUop), 
		.ALUsrc(ALUsrc), 
		.ALU_result(ALU_result), 
		.zero(zero)
	);

	initial begin
			clk = 0;
		end
	
	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
																//ADD output = 5 + 7  zero = 0
		ALU_read_data_1 = 7;
		ALU_read_data_2 = 5;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100; 			//12;
		Function = 6'b000000;
		ALUop = 3'b000;
		ALUsrc = 0;
		#100;
		
		
																//OR output = 6 | 12 zero = 0
		ALU_read_data_1 = 6;
		ALU_read_data_2 = 3;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100;
		Function = 6'b000011;
		ALUop = 3'b000;
		ALUsrc = 1;
		#100;
		
															//NOT
		ALU_read_data_1 = 15;
		ALU_read_data_2 = 6;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1101; // 13
		Function = 6'b000111;
		ALUop = 3'b000;
		ALUsrc = 0;
		#100;
		
															//SLT
		ALU_read_data_1 = 19;
		ALU_read_data_2 = 12;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		Function = 6'bxxxxxx;
		ALUop = 3'b010;
		ALUsrc = 0;
		#100;


															//LSR
		ALU_read_data_1 = 13;
		ALU_read_data_2 = 15;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0100_0000;
		Function = 6'b000110;
		ALUop = 3'b000;
		ALUsrc = 1;
		#100;

															//SUB
		ALU_read_data_1 = 9;
		ALU_read_data_2 = 2;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		Function = 6'b000001;
		ALUop = 3'b000;
		ALUsrc = 1;
		#100;
		
	end
      
endmodule

