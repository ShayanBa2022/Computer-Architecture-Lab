`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:32 12/07/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(input [31:0] input1 , input [31:0] input2 , input [3:0] ALUctrl , input [4:0] shiftAmount , output reg [31:0] result , output reg zero);

	always @(ALUctrl) begin
		//-----------------------------------------------------------------------------------------------------------------
		if(ALUctrl == 4'b0000) begin
				assign result = input1 + input2;
			end
		//-----------------------------------------------------------------------------------------------------------------	
		else if(ALUctrl == 4'b0001) begin
				assign result = input1 - input2;
			end
		//-----------------------------------------------------------------------------------------------------------------
		else if(ALUctrl == 4'b0010) begin
				assign result = ~input1;
			end
		//-----------------------------------------------------------------------------------------------------------------
		else if(ALUctrl == 4'b0011) begin
				assign result = input1 << shiftAmount;
			end
		//-----------------------------------------------------------------------------------------------------------------	
		else if(ALUctrl == 4'b0100) begin
				assign result = input1 >> shiftAmount;
			end
		//-----------------------------------------------------------------------------------------------------------------	
		else if(ALUctrl == 4'b0101) begin
				assign result = input1 & input2;
			end
		//-----------------------------------------------------------------------------------------------------------------	
		else if(ALUctrl == 4'b0110) begin
				assign result = input1 | input2;
			end
		//-----------------------------------------------------------------------------------------------------------------	
		else if(ALUctrl == 4'b0111) begin
				assign result = (input1 < input2)? 32'b1 : 32'b0;
			end
		//-----------------------------------------------------------------------------------------------------------------
		else begin
				assign result = 32'bx;
			end
		//-----------------------------------------------------------------------------------------------------------------
		assign zero = (result == 32'b0)? 1 : 0;
	end

endmodule
