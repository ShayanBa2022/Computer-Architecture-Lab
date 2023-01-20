`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:06:43 10/24/2022 
// Design Name: 
// Module Name:    PC_Register 
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
module PC_Register(input [31:0] next_ins , input clk , output reg [31:0] ins_address);

	initial begin
		ins_address = 32'b0;
	end
	
	always @(posedge clk) begin
		ins_address <= next_ins;
	end

endmodule
