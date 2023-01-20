`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:48 12/07/2022 
// Design Name: 
// Module Name:    Execute 
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
module Execute(input clk , input [31:0] ALU_read_data_1 , input [31:0] ALU_read_data_2 , input [31:0] immediate , input [5:0] Function , input[2:0] ALUop , input ALUsrc ,input registerDestination , input [4:0] rdDecode , input [4:0] rtDecode , input [31:0] nextPC, output [31:0] ALU_result , output zero , output [31:0] addResult , output [31:0] ALUreadData2 , output rdORrt);
	//-------------------------------------------------------------------------------------------------------------------
	wire [31:0] ALU_data2_input;
	wire [3:0] ALUctrl;
	wire  [4:0] shiftAmount;
	assign shiftAmount = immediate[10:6];
	//-------------------------------------------------------------------------------------------------------------------
	MUX2To1 mux2To1 (
		.input1(ALU_read_data_2),
		.input2(immediate),
		.select(ALUsrc),
		.MUX_res(ALU_data2_input)
	);
	//-------------------------------------------------------------------------------------------------------------------
	ALU_Control_Unit ALU_CU(
		.ALUop(ALUop),
		.Function(Function),
		.ALUctrl(ALUctrl)
	);
	//-------------------------------------------------------------------------------------------------------------------
	ALU ALU_instance(
		.input1(ALU_read_data_1),
		.input2(ALU_read_data_2),
		.ALUctrl(ALUctrl),
		.shiftAmount(shiftAmount),
		.result(ALUresult),
		.zero(zero)
	);
	//-------------------------------------------------------------------------------------------------------------------
	Muxwith5Args muxExecute(
	.input1(rtDecode),
	.input2(rdDecode), 
	.select(registerDestination), 
	.muxResult(RdOrRt)
	);


endmodule
