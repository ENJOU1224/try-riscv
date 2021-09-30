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
    output
    input   [63:0]  i_GRFReadData1_64,
    input   [63:0]  i_GRFReadData2_64,
    input   [63:0]  i_CSRData_64,
);

endmodule