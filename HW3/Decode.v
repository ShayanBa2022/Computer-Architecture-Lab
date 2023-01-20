`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:04:52 11/19/2022 
// Design Name: 
// Module Name:    Decode 
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
module Decode(input clk , input [31:0] ins , output reg [5:0] opCode , output reg [31:0] readData1 , output reg [31:0] readData2 , output reg [31:0] signEtendIm , output reg [4:0] rd , output reg [4:0] rt);

	reg [5:0] opCode_;
	reg [4:0] rs_;
	reg [4:0] rd_;
	reg [4:0] rt_;
	reg [15:0] Immidiate;
	wire [31:0] signExtendedValue;
//------------------------------------------------------------------------------------------------------------------------------------------
	wire writeSignal;
	assign writeSignal = 1;
//------------------------------------------------------------------------------------------------------------------------------------------
	wire [31:0] readData1_;
	wire [31:0] readData2_;
//------------------------------------------------------------------------------------------------------------------------------------------
	wire writeData;
	assign writeData = 5;
//------------------------------------------------------------------------------------------------------------------------------------------
	wire writeReg;
//------------------------------------------------------------------------------------------------------------------------------------------
	always @(posedge clk) begin
	
		opCode_ = ins[31:26];
		rs_ = ins[25:21];
		rt_ = ins[20:16];
		rd_ = ins[15:11];
		Immidiate = ins[15:0];
	end
//------------------------------------------------------------------------------------------------------------------------------------------
	RegisterFile uut(
		.clk(clk),
		.regWriteSignal(writeSignal),
		.readReg1(rs_),
		.readReg2(rt_),
		.writeReg(rd_),
		.writeData(writeData),
		.data1(readData1_),
		.data2(readData2_)	
	);
//------------------------------------------------------------------------------------------------------------------------------------------
	SignExtend uut1(
		.value(Immidiate),
		.extendedValue(signExtendedValue)
	);
//------------------------------------------------------------------------------------------------------------------------------------------
	always @(posedge clk) begin
		opCode = opCode_;
		signEtendIm = signExtendedValue;
		rt = rt_ ;
		rd = rd_ ;
		readData1 = readData1_;
		readData2 = readData2_;
	end
//------------------------------------------------------------------------------------------------------------------------------------------
endmodule
