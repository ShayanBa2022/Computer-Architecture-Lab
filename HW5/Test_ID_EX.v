`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:59:53 12/10/2022
// Design Name:   ID_EX
// Module Name:   D:/CA Lab/Mips/Test_ID_EX.v
// Project Name:  Mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_EX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ID_EX;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] readData1;
	reg [31:0] readData2;
	reg [31:0] immediate;
	reg destinationReg;
	reg ALUsrc;
	reg MemToReg;
	reg RegWrite;
	reg MEM_Read;
	reg MEM_Write;
	reg branch;
	reg [2:0] ALUop;
	reg [4:0] RT;
	reg [4:0] RD;
	reg [5:0] Function;
	reg [31:0] nextPC;

	// Outputs
	wire [31:0] readData1_output;
	wire [31:0] readData2_output;
	wire [31:0] immediate_output;
	wire destinationReg_output;
	wire ALUsrc_output;
	wire MemToReg_output;
	wire RegWrite_output;
	wire MEM_Read_output;
	wire MEM_Write_output;
	wire branch_output;
	wire [2:0] ALUop_output;
	wire [4:0] RT_output;
	wire [4:0] RD_output;
	wire [5:0] Function_output;
	wire [31:0] nextPC_output;
	wire hit_output;

	// Instantiate the Unit Under Test (UUT)
	ID_EX uut (
		.clk(clk), 
		.hit(hit), 
		.readData1(readData1), 
		.readData2(readData2), 
		.immediate(immediate), 
		.destinationReg(destinationReg), 
		.ALUsrc(ALUsrc), 
		.MemToReg(MemToReg), 
		.RegWrite(RegWrite), 
		.MEM_Read(MEM_Read), 
		.MEM_Write(MEM_Write), 
		.branch(branch), 
		.ALUop(ALUop), 
		.RT(RT), 
		.RD(RD), 
		.Function(Function), 
		.nextPC(nextPC), 
		.readData1_output(readData1_output), 
		.readData2_output(readData2_output), 
		.immediate_output(immediate_output), 
		.destinationReg_output(destinationReg_output), 
		.ALUsrc_output(ALUsrc_output), 
		.MemToReg_output(MemToReg_output), 
		.RegWrite_output(RegWrite_output), 
		.MEM_Read_output(MEM_Read_output), 
		.MEM_Write_output(MEM_Write_output), 
		.branch_output(branch_output), 
		.ALUop_output(ALUop_output), 
		.RT_output(RT_output), 
		.RD_output(RD_output), 
		.Function_output(Function_output), 
		.nextPC_output(nextPC_output), 
		.hit_output(hit_output)
	);

	initial begin
		hit = 0;
		readData1 = 32'b0000_0000_0000_0000_0000_0000_0000_0010;   	//2
		readData2 = 32'b0000_0000_0000_0000_0000_0000_0001_0001;    //17
		immediate =     32'b0000_0000_0000_0000_0000_0000_0000_1111; //15
		destinationReg = 1;
		ALUsrc = 0;
		MemToReg = 1;
		RegWrite = 1;
		MEM_Read = 0;
		MEM_Write = 0;
		branch = 1;
		ALUop = 3'b100;
		RT = 5'b01100;
		RD = 5'b01010;
		Function = 6'b01101;
		nextPC = 32'b0000_0000_0000_0000_0000_0000_0000_0011;  //3
		#500;
		
		hit = 1;
		readData1 = 32'b0000_0000_0000_0000_0000_0000_0001_0111;     //23
		readData2 = 32'b0000_0000_0000_0000_0000_0000_0000_1010;    //10
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100; //12
		destinationReg = 1;
		ALUsrc = 0;
		MemToReg = 0;
		RegWrite = 1;
		MEM_Read = 1;
		MEM_Write = 0;
		branch = 1;
		ALUop = 3'b110;
		RT = 5'b01110;
		RD = 5'b01100;
		Function = 6'b11101;
		nextPC = 32'b0000_0000_0000_0000_0000_0000_0000_1111;  // 15
		#500;

	end
      
endmodule

