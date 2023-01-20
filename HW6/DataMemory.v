`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:58 01/20/2023 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(input clk,input [31:0] address, input [31:0] writeData, input memWrite, input memRead, output reg [31:0] readData);

	reg [7:0] memory [1023:0];
	//-----------------------------------------------------------------------------------------------------------------------
	integer i;
	initial begin 
		for(i=0; i<1023; i= i+1)
			memory[i] = i;
		end
	//-----------------------------------------------------------------------------------------------------------------------
	always @(posedge clk) begin
		if (memRead) begin
			memory[address] = writeData[7:0];
			memory[address + 1] = writeData[15:8];
			memory[address + 2] = writeData[23:16];
			memory[address + 3] = writeData[31:24];
			$display("After writing data memory[address] is = %b", memory[address]);
		end
	end
	//-----------------------------------------------------------------------------------------------------------------------
endmodule
