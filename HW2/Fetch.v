`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:57 10/28/2022 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(input pc_src , input [31:0] branchtarget , input wire clk , output [31:0] ins , output [31:0] nextpc , output wire hit);
	wire [127:0] dataline;
	wire [31:0] address;
	wire [31:0] next_address;
	
	MUX MUXInstance(
		 .pc(nextcc), 
		 .branchtarget(branchtarget), 
		 .pc_src(pc_src), 
		 .address(next_address)
	);
	
	PC_2 PC_2Instance(
		.ins_address(address),
		.next_ins(next_address),
		.clk(clk),
		.hit(hit)
	);
	
	Instruction_Memory Instruction_MemoryInstance(
		.address(address),
		.clk(clk),
		.dataline(dataline)
	);
	
	Cache CacheInstance(
		.dataline(dataline),
		.clk(clk),
		.address(address),
		.ins(ins),
		.hit(hit)
	);

endmodule
