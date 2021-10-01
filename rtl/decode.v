/*
    -- ============================================================================
    -- FILE NAME	: decode.v
    -- DESCRIPTION : 指令集架构
    -- ----------------------------------------------------------------------------
    -- Revision  Date		  Coding_by	 Comment
    -- 1.0.0	  2021/09/29  enjou		 初版
    -- ============================================================================
*/
`include "RVG.vh"

module decode (
    input   [63:0]  i_PC_64,
    input   [31:0]  i_Inst_32,

    // 通用寄存器连接       (General Register Connection)
    output  [ 4:0]  o_GRFReadAddr1_5,
    output  [ 4:0]  o_GRFReadAddr2_5,
    input   [63:0]  i_GRFReadData1_64,
    input   [63:0]  i_GRFReadData2_64,

    // CSR连接              (CSR Connection)
    output  [11:0]  o_CSRReadAddr_12,
    input   [63:0]  i_CSRReadData_64,

);

//-----{指令区域划分(Instruction Subfield Division)}begin
    wire [ 6:0] funct7;
    wire [ 2:0] funct3;
    wire [ 4:0] rs2;
    wire [ 4:0] rs1;
    wire [ 4:0] rd;
    wire [ 5:0] opcode;
    wire [11:0] imm;
    wire [19:0] U_imm;

    assign funct7   = i_Inst_32[31:25];
    assign funct3   = i_Inst_32[14:12];
    assign rs2      = i_Inst_32[24:20];
    assign rs1      = i_Inst_32[19:15];
    assign rd       = i_Inst_32[11: 7];
    assign opcode   = i_Inst_32[ 6: 0];

//-----{指令区域划分(Instruction Zone Division)}end

//-----{指令译码(Instruction Decode)}begin

    // 译码列表
    wire Inst_ADDI  = {}


endmodule