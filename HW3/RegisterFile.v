`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:17 11/18/2022 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(input clk , input regWriteSignal , input [4:0] readReg1 , input [4:0] readReg2 , input [4:0] writeReg , input [31:0] writeData, output [31:0] data1 , output [31:0] data2);
	
	reg [31:0] regFile[31:0];
//------------------------------------------------------------------------------------------------------------------------------------------
	assign data1 = regFile[readReg1];
	assign data2 = regFile[readReg2];
//------------------------------------------------------------------------------------------------------------------------------------------
	initial regFile[0] = 0;	// Register file equals to zero register
//------------------------------------------------------------------------------------------------------------------------------------------
	integer i;
	initial begin 
		for (i=1 ; i<32 ; i=i+1)
			regFile[i] = i;
		end
	//------------------------------------------------------------------------------------------------------------------------------------------
	always @(posedge clk) begin
	
		if (regWriteSignal == 1) begin
		//------------------------------------------------------------------------------------------------------------------------------------------
			if (writeReg == 0) begin
				$display("%h", regFile[writeReg]);
				$display("ZeroRegiser can not be changed");
				$display("%h", regFile[writeReg]);
			end
			//------------------------------------------------------------------------------------------------------------------------------------------
			else begin
				$display("%h", regFile[writeReg]);
				regFile[writeReg] = writeData;
				$display("%h", regFile[writeReg]);
				$display("Process finished successfully");
			end
			//------------------------------------------------------------------------------------------------------------------------------------------
		end
		//------------------------------------------------------------------------------------------------------------------------------------------
		else begin
			$display("%h", regFile[writeReg]);
			$display("Permission Denied");
			$display("%h", regFile[writeReg]);
		end
		//------------------------------------------------------------------------------------------------------------------------------------------
	end
//------------------------------------------------------------------------------------------------------------------------------------------
endmodule
