`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:41 11/04/2022 
// Design Name: 
// Module Name:    MUX 
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
module MUX(input [31:0] pc , input [31:0] branchtarget , input pc_src , output reg [31:0] address);
	
	always @(pc_src or pc or branchtarget)
	      begin
			
			//address = pcSource ? branchTarget : pc;
			if (pc_src == 1)
				address = branchtarget;
			if (pc_src == 0)
				address = pc;
				  
			end

endmodule
