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
    input   [63:0]  i_CSRReadData_64

);

//------------------------------指令区域划分(Instruction Subfield Division){begin}------------------------------//

    wire [ 6:0] funct7;
    wire [ 2:0] funct3;
    wire [11:0] funct12;
    wire [ 4:0] rs2;
    wire [ 4:0] rs1;
    wire [ 4:0] rd;
    wire [ 5:0] opcode;
    wire [11:0] imm;
    wire [19:0] U_imm;

    assign funct7   = i_Inst_32[31:25];
    assign funct3   = i_Inst_32[14:12];
    assign funct12  = i_Inst_32[31:20];
    assign rs2      = i_Inst_32[24:20];
    assign rs1      = i_Inst_32[19:15];
    assign rd       = i_Inst_32[11: 7];
    assign opcode   = i_Inst_32[ 6: 0];

//------------------------------指令区域划分(Instruction Subfield Division){begin}------------------------------//

//------------------------------实现指令列表(List of implemented instructions){begin}------------------------------//

    //----------整数运算指令(Interger Computational Instructions)----------//

    // 整型寄存器立即数间操作                               (Integer Register-Immediate Operations)
    wire Inst_ADDI  ,Inst_SLTI  ,Inst_SLTIU ,Inst_ANDI
        ,Inst_ORI   ,Inst_XORI  ;
    wire Inst_SLLI  ,Inst_SRLI  ,Inst_SRAI  ,Inst_LUI
        ,Inst_AUIPC ;

    // 整型寄存器间操作                                     (Integer Register-Register Operations)
    wire Inst_ADD   ,Inst_SLT   ,Inst_SLTU  ,Inst_AND
        ,Inst_OR    ,Inst_XOR   ,Inst_SLL   ,Inst_SRL
        ,Inst_SUB   ,Inst_SRA   ;

    //----------控制权转移指令(Control Transfer Instructions)----------//

    // 无条件跳转                                           (Unconditional Jumps)
    wire Inst_JAL   ,Inst_JALR  ;

    // 条件分支                                             (Conditional Branches)
    wire Inst_BEQ   ,Inst_BNE   ,Inst_BLR   ,Inst_BLT
        ,Inst_BLTU  ,Inst_BGE   ,Inst_BGEU  ;

    //----------读写指令(Load and Store Instructions)----------//

    wire Inst_LB    ,Inst_LH    ,Inst_LW    ,Inst_LBU
        ,Inst_LHU   ,Inst_SB    ,Inst_SH    ,Inst_SW    ;

    //----------内存序指令(Memory Ordering Instructions)----------//
    wire Inst_FENCE ,Inst_FENCETSO ;

    //----------环境调用及断点(Environment Call and Breakpoints)----------//
    wire Inst_PAUSE ,Inst_ECALL ,Inst_EBREAK;

//------------------------------实现指令列表(List of implemented instructions){end}------------------------------//

//------------------------------指令译码(Instruction Decode){begin}------------------------------//

    //----------整数运算指令(Interger Computational Instructions)----------//

    // 整型寄存器立即数间操作                               (Integer Register-Immediate Operations)
    assign Inst_ADDI    = {{funct3 == `FUNCT3_ADDI  } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_SLTI    = {{funct3 == `FUNCT3_SLTI  } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_SLTIU   = {{funct3 == `FUNCT3_SLTIU } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_ANDI    = {{funct3 == `FUNCT3_ANDI  } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_ORI     = {{funct3 == `FUNCT3_ORI   } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_XORI    = {{funct3 == `FUNCT3_XORI  } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_SLLI    = {{funct3 == `FUNCT3_SLLI  } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_SRLI    = {{funct3 == `FUNCT3_SRLI  } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_SRAI    = {{funct3 == `FUNCT3_SRAI  } & {opcode == `OPCODE_OP_IMM   }};
    assign Inst_LUI     = { opcode == `OPCODE_LUI   };
    assign Inst_AUIPC   = { opcode == `OPCODE_AUIPC };

    // 整型寄存器间操作                                     (Integer Register-Register Operations)
    assign Inst_ADD     = {{funct3 == `FUNCT3_ADD   } & {opcode == `OPCODE_OP       }};
    assign Inst_SLT     = {{funct3 == `FUNCT3_SLT   } & {opcode == `OPCODE_OP       }};
    assign Inst_SLTU    = {{funct3 == `FUNCT3_SLTU  } & {opcode == `OPCODE_OP       }};
    assign Inst_AND     = {{funct3 == `FUNCT3_AND   } & {opcode == `OPCODE_OP       }};
    assign Inst_OR      = {{funct3 == `FUNCT3_OR    } & {opcode == `OPCODE_OP       }};
    assign Inst_XOR     = {{funct3 == `FUNCT3_XOR   } & {opcode == `OPCODE_OP       }};
    assign Inst_SLL     = {{funct3 == `FUNCT3_SLL   } & {opcode == `OPCODE_OP       }};
    assign Inst_SRL     = {{funct3 == `FUNCT3_SRL   } & {opcode == `OPCODE_OP       }};
    assign Inst_SUB     = {{funct3 == `FUNCT3_SUB   } & {opcode == `OPCODE_OP       }};
    assign Inst_SRA     = {{funct3 == `FUNCT3_SRA   } & {opcode == `OPCODE_OP       }};

    //----------控制权转移指令(Control Transfer Instructions)----------//

    // 无条件跳转                                           (Unconditional Jumps)
    assign Inst_JAL     = { opcode == `OPCODE_JAL   };
    assign Inst_JALR    = {{funct3 == `FUNCT3_JALR  } & {opcode == `OPCODE_JALR     }};

    // 条件分支                                             (Conditional Branches)
    assign Inst_BEQ     = {{funct3 == `FUNCT3_BEQ   } & {opcode == `OPCODE_BRANCH   }};
    assign Inst_BNE     = {{funct3 == `FUNCT3_BNE   } & {opcode == `OPCODE_BRANCH   }};
    assign Inst_BLT     = {{funct3 == `FUNCT3_BLT   } & {opcode == `OPCODE_BRANCH   }};
    assign Inst_BLTU    = {{funct3 == `FUNCT3_BLTU  } & {opcode == `OPCODE_BRANCH   }};
    assign Inst_BGE     = {{funct3 == `FUNCT3_BGE   } & {opcode == `OPCODE_BRANCH   }};
    assign Inst_BGEU    = {{funct3 == `FUNCT3_BGEU  } & {opcode == `OPCODE_BRANCH   }};

    //----------读写指令(Load and Store Instructions)----------//
    assign Inst_LB      = {{funct3 == `FUNCT3_LB    } & {opcode == `OPCODE_LOAD     }};
    assign Inst_LH      = {{funct3 == `FUNCT3_LH    } & {opcode == `OPCODE_LOAD     }};
    assign Inst_LW      = {{funct3 == `FUNCT3_LW    } & {opcode == `OPCODE_LOAD     }};
    assign Inst_LBU     = {{funct3 == `FUNCT3_LBU   } & {opcode == `OPCODE_LOAD     }};
    assign Inst_LHU     = {{funct3 == `FUNCT3_LHU   } & {opcode == `OPCODE_LOAD     }};
    assign Inst_SB      = {{funct3 == `FUNCT3_SB    } & {opcode == `OPCODE_STORE    }};
    assign Inst_SH      = {{funct3 == `FUNCT3_SH    } & {opcode == `OPCODE_STORE    }};
    assign Inst_SW      = {{funct3 == `FUNCT3_SW    } & {opcode == `OPCODE_STORE    }};

    //----------内存序指令(Memory Ordering Instructions)----------//
    assign Inst_FENCE   = {{funct3 == `FUNCT3_FENCE } & {opcode == `OPCODE_MISC_MEM }};
    assign Inst_FENCETSO= {{funct3 == `FUNCT3_FENCE } & {opcode == `OPCODE_MISC_MEM }};
    assign Inst_PAUSE   = {{funct3 == `FUNCT3_FENCE } & {opcode == `OPCODE_MISC_MEM }};

    //----------环境调用及断点(Environment Call and Breakpoints)----------//
    assign Inst_ECALL   = {{funct3 == `FUNCT3_PRIV  } & {opcode == `OPCODE_SYSTEM   } & {funct12 == `FUNCT12_ECALL  }};
    assign Inst_EBREAK  = {{funct3 == `FUNCT3_PRIV  } & {opcode == `OPCODE_SYSTEM   } & {funct12 == `FUNCT12_EBREAK }};
    



endmodule