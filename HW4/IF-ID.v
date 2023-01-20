`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:50:26 12/02/2022 
// Design Name: 
// Module Name:    IF-ID 
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
module IF_ID(input [31:0] insInput , input hitInput , input clk , input [31:0] nextPCinput ,  output reg [31:0] insOutput , output reg [31:0] nextPCoutput);
	
	initial begin
		insOutput = 32'bX;
	end
	//--------------------------------------------------------------------------------------------
	always @(negedge clk) begin
		insOutput = insInput;
		nextPCoutput = nextPCinput;
	end
endmodule
