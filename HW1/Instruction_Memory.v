`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:08:27 10/24/2022 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory( input [31:0] address , input clk , output reg [127:0] dataline );
	
	integer i;
	reg [2:0] count = 0;	// counter to hold the delay
	reg [7:0] memory [1023:0];//8-bit memory to locate 1024 entries
	reg [31:0] index;	//  needed when we want to iterate through instruction memory
	reg [27:0] address_same_value; // a register to save 28 bits that are the same when we get 4 32bit inputs
//----------------------------------------------------------------------------------------------------------------------------------------
	initial begin	
		count = 0;
		for (i=0 ; i<1024 ; i=i+1)
			begin
				memory[i] = i;
			end
	end
//----------------------------------------------------------------------------------------------------------------------------------------	
	initial begin
		dataline = 128'bX;
	end
//----------------------------------------------------------------------------------------------------------------------------------------	
	always @(posedge clk) begin
		if( address_same_value != address[31:4]) begin	// checking whether top 28 bits are the same or not
			address_same_value = address;
			count = 1 ;
		end
		
		else if(count == 4 ) begin	// a if statement to check whether counter has reached 4 instructions or not
			index = {address [31:4] , {4'b00}};
			dataline = {memory[index+15],memory[index+14],memory[index+13],memory[index+12],memory[index+11],memory[index+10],memory[index+9],memory[index+8],memory[index+7],memory[index+6],memory[index+5],memory[index+4],memory[index+3],memory[index+2],memory[index+1],memory[index]} ;
			count = 0;
		end
		
		else begin 
			
			count = count + 1 ;
		end
		
		address_same_value = address[31:4];
	end

endmodule
