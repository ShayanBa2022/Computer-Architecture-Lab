`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:59 12/07/2022 
// Design Name: 
// Module Name:    ID_EX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ID_EX(clk , hit , readData1 , readData2 , immediate , destinationReg , ALUsrc , MemToReg , RegWrite ,
MEM_Read , MEM_Write , branch , ALUop , RT , RD , Function , nextPC , readData1_output , readData2_output,
immediate_output , destinationReg_output , ALUsrc_output , MemToReg_output , RegWrite_output , MEM_Read_output , 
MEM_Write_output , branch_output , ALUop_output , RT_output , RD_output , Function_output , nextPC_output , hit_output);

	 input clk;
	 input hit;
	 input [31:0] readData1;
	 input [31:0] readData2;
	 input [31:0] immediate;
	 input destinationReg;
	 input ALUsrc;
	 input MemToReg;
	 input RegWrite;
	 input MEM_Read;
	 input MEM_Write;
	 input branch;
	 input [2:0] ALUop;
	 input [4:0] RT;
	 input [4:0] RD;
	 input [5:0] Function;
	 input [31:0] nextPC;
//------------------------------------------------------------------------------------------------------------------
	 output hit_output;
	 output reg [31:0] readData1_output;
	 output reg [31:0] readData2_output;
	 output reg [31:0] immediate_output;
	 output reg destinationReg_output;
	 output reg ALUsrc_output;
	 output reg MemToReg_output;
	 output reg RegWrite_output;
	 output reg MEM_Read_output;
	 output reg MEM_Write_output;
	 output reg branch_output;
	 output reg [2:0] ALUop_output;
	 output reg [4:0] RT_output;
	 output reg [4:0] RD_output;
	 output reg [5:0] Function_output;
	 output reg [31:0] nextPC_output;
	 
//------------------------------------------------------------------------------------------------------------------
		assign hit_output = hit;
//------------------------------------------------------------------------------------------------------------------
		always @ (negedge clk) begin
			//------------------------------------------------------------------------------------------------------------------
			if (hit) begin
				readData1_output	 	 <= readData1;
				readData2_output    	 <= readData2;
				immediate_output		 <= immediate;
				destinationReg_output <= destinationReg;
				ALUsrc_output     	 <= ALUsrc;
				MemToReg_output		 <= MemToReg;
				RegWrite_output		 <= RegWrite;
				MEM_Read_output	    <= MEM_Read;
				MEM_Write_output		 <= MEM_Write;
				branch_output 			 <= branch;
				ALUop_output  			 <= ALUop;
				RT_output 				 <= RT; 
				RD_output 				 <= RD;
				Function_output 		 <= Function;
				nextPC_output 		 	 <= nextPC;
			end
			//------------------------------------------------------------------------------------------------------------------
		end
	 


endmodule
