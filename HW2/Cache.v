`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:11 10/28/2022 
// Design Name: 
// Module Name:    Cache 
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
module Cache(input [127:0] dataline , input [31:0] address , input clk , output reg [31:0] ins , output reg hit );
	
	// 8 rows for cache wich includes 154 bits -> 25 bits for tag , 2 bits for offset , 3 bits for index , 2 bits 00 , 1 bit for validation , 128 bits for instruction
	reg [153:0] cache [7:0];	
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	// at first all the valid bits are 0
	integer i;
	initial begin
		for ( i = 0 ; i<8 ; i = i+1) begin
		cache[i] = 0;
		end
	end
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	always@(dataline)
		begin
			if(dataline !== 128'bX)
				begin
					cache[address[6:4]][127:0] = dataline; 		  // 128 bits to locate 4 instructions
					cache[address[6:4]][152:128] = address[31:7]; // 25 bits for tag
					cache[address[6:4]][153] = 1;                // validation bit
				end
		end
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	always @(posedge clk) begin
		if (cache[address[6:4]][152:128] == address[31:7] && cache[address[6:4]][153] == 1) begin
			hit = 1;	// we have found and instruction so hit equals to 1
			// if the last 2 bits of address are 00 , instruction equals to first 32 bits of address located in dataline
			if(address[3:2] == 2'b00)
				ins = cache[address[6:4]][31:0];
			// if the last 2 bits of address are 01 , instruction equals to second 32 bits of address located in dataline
			if(address[3:2] == 2'b01)
				ins = cache[address[6:4]][63:32];
			// if the last 2 bits of address are 10 , instruction equals to third 32 bits of address located in dataline
			if(address[3:2] == 2'b10)
				ins = cache[address[6:4]][95:64];
			// if the last 2 bits of address are 11 , instruction equals to fourth 32 bits of address located in dataline
			if(address[3:2] == 2'b11)
				ins = cache[address[6:4]][127:96];
		end
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		else begin
					hit = 0;
					ins = 32'bX;
		end
	end
	
endmodule
