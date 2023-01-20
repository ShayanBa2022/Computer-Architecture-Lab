`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:05:59 12/02/2022 
// Design Name: 
// Module Name:    Mips_Shayan_edition 
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
module Mips_Shayan_edition(input clk);
	//------------------------------------------------------------
	//Decode
	wire [31:0] Decode_ins;
	wire [5:0]  Decode_opCode;
	wire [31:0] Decode_readData1;
	wire [31:0] Decode_readData2;
	wire [31:0] Decode_signEtendIm;
	wire [4:0] Decode_rt;
	wire [4:0] Decode_rd;
	//------------------------------------------------------------
	//Fetch
	wire [31:0] Fetch_branchtarget;
	wire [31:0] Fetch_nextpc_out;
	wire [31:0] Fetch_ins;
	wire Fetch_nextpc_toIFID;
	wire Fetch_pc_src;
	wire Fetch_hit;
	//------------------------------------------------------------
	//IF_ID
	wire [31:0] IFID_insInput;
	wire [31:0] IFID_insOutput;
	wire [31:0] IFID_nextPCinput;
	wire [31:0] IFID_nextPCoutput;
	wire IFID_hitInput;
	//------------------------------------------------------------
	//ControlUnit
	wire [5:0] CU_OpCode;
	wire CU_destReg;
	wire CU_ALUsrc;
	wire CU_MemToReg;
	wire CU_regWrite;
	wire CU_MemRead;
	wire CU_MemWrite;
	wire CU_branch;
	wire [2:0] CU_ALUop; 
	//------------------------------------------------------------
	assign IFID_nextPCinput = Fetch_nextpc_out;
	assign IFID_insInput = Fetch_ins;
	assign IFID_hitInput = Fetch_hit;
	assign Decode_ins = IFID_insOutput;
	assign CU_OpCode = Decode_opCode;
	//------------------------------------------------------------
	// Execute
	wire [31:0] ID_EX_readData1;
	wire [31:0] ID_EX_readData2;
	wire [31:0] ID_EX_Immediate;
	wire [2:0]  ID_EX_ALUop;
	wire ID_EX_ALUsrc;
	wire [31:0] Execute_ALU_Result;
	wire Execute_Zero;
	//------------------------------------------------------------
	 Decode decode (
    .clk(clk), 
    .ins(Decode_ins), 
    .opCode(Decode_opCode), 
    .readData1(Decode_readData1), 
    .readData2(Decode_readData2), 
    .signEtendIm(Decode_signEtendIm), 
    .rt(rt), 
    .rd(rd)
    );
	//------------------------------------------------------------
	Fetch fetch (
		 .clk(clk), 
		 .branchtarget(Fetch_branchtarget), 
		 .pc_src(Fetch_pc_src), 
		 .nextpc(Fetch_nextpc_out), 
		 .ins(Fetch_ins), 
		 .hit(Fetch_hit)
		 );
	//------------------------------------------------------------
	IF_ID if_id (
    .clk(clk),  
    .insInput(IFID_insInput), 
    .hitInput(IFID_hitInput),
    .nextPCinput(IFID_nextPCinput),	 
    .nextPCoutput(IFID_nextPCoutput), 
    .insOutput(IFID_insOutput), 
    .hitOutput(hitIFIDOutput)
    );
	 //------------------------------------------------------------
	 ControlUnit cu (
    .OpCode(CU_OpCode), 
    .destReg(CU_destReg), 
    .ALUsrc(CU_ALUsrc), 
    .MemToReg(CU_MemToReg), 
    .regWrite(CU_regWrite), 
    .MemRead(CU_MemRead), 
    .MemWrite(CU_MemWrite), 
    .branch(CU_branch), 
    .ALUop(CU_ALUop)
    );
	 //------------------------------------------------------------
	 
	Execute execute (
		 .clk(clk), 
		 .ALU_read_data_1(ID_EX_readData1), 
		 .ALU_read_data_2(ID_EX_readData2), 
		 .immediate(ID_EX_Immediate), 
		 .Function(Function), 
		 .ALUop(ID_EX_ALUop), 
		 .ALUsrc(ID_EX_ALUsrc), 
		 .ALU_result(Execute_ALU_Result), 
		 .zero(Execute_Zero)
		 );
	//------------------------------------------------------------	 
	ID_EX id_ex (
		 .clk(clk), 
		 .hit(hit), 
		 .readData1(readData1), 
		 .readData2(readData2), 
		 .immediate(immediate), 
		 .destinationReg(destinationReg), 
		 .ALUsrc(ALUsrc), 
		 .MemToReg(MemToReg), 
		 .RegWrite(RegWrite), 
		 .MEM_Read(MEM_Read), 
		 .MEM_Write(MEM_Write), 
		 .branch(branch), 
		 .ALUop (ALUop), 
		 .RT(RT), 
		 .RD(RD), 
		 .Function(Function), 
		 .nextPC(nextPC), 
		 .readData1_output(readData1_output), 
		 .readData2_output(readData2_output), 
		 .immediate_output(immediate_output), 
		 .destinationReg_output(destinationReg_output), 
		 .ALUsrc_output(ALUsrc_output), 
		 .MemToReg_output(MemToReg_output), 
		 .RegWrite_output(RegWrite_output), 
		 .MEM_Read_output(MEM_Read_output), 
		 .MEM_Write_output(MEM_Write_output), 
		 .branch_output(branch_output), 
		 .ALUop_output(ALUop_output), 
		 .RT_output(RT_output), 
		 .RD_output(RD_output), 
		 .Function_output(Function_output), 
		 .nextPC_output(nextPC_output), 
		 .hit_output(hit_output)
		 );

endmodule
