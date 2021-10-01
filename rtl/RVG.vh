`ifndef __RVG_HEADER__
    `define __RVG_HEADER__

//-----{RISC-V基本操作码(RISC-V base opcode)}
    `define OPCODE_LOAD         7'b0000011
    `define OPCODE_LOAD_FP      7'b0000111
    `define OPCODE_custom_0     7'b0001011
    `define OPCODE_MISC_MEM     7'b0001111
    `define OPCODE_OP_IMM       7'b0010011
    `define OPCODE_AUIPC        7'b0010111
    `define OPCODE_OP_IMM_32    7'b0011011
    `define OPCODE_48b          7'b0011111
    `define OPCODE_STORE        7'b0100011
    `define OPCODE_STORE_FP     7'b0100111
    `define OPCODE_custom_1     7'b0101011
    `define OPCODE_AMO          7'b0101111
    `define OPCODE_OP           7'b0110011
    `define OPCODE_LUI          7'b0110111
    `define OPCODE_OP_32        7'b0111011
    `define OPCODE_64b          7'b0111111
    `define OPCODE_MADD         7'b1000011
    `define OPCODE_MSUB         7'b1000111
    `define OPCODE_NMSUB        7'b1001011
    `define OPCODE_NMADD        7'b1001111
    `define OPCODE_OP_FP        7'b1010011
    `define OPCODE_reserved1    7'b1010111
    `define OPCODE_custom_2     7'b1011011
    `define OPCODE_rv128_1      7'b1011011
    `define OPCODE_BRANCH       7'b1100011
    `define OPCODE_JALR         7'b1100111
    `define OPCODE_reserved2    7'b1101011
    `define OPCODE_JAL          7'b1101111
    `define OPCODE_SYSTEM       7'b1110011
    `define OPCODE_reserved3    7'b1110111
    `define OPCODE_custom_3     7'b1111011
    `define OPCODE_rv128_2      7'b1111011
    `define OPCODE_80b          7'b1111111

//-----{RV32I funct3}

    // Jump Instruction
    `define FUNCT3_JALR         3'b000

    // Branch Instruction
    `define FUNCT3_BEQ          3'b000
    `define FUNCT3_BNE          3'b001
    `define FUNCT3_BLT          3'b100
    `define FUNCT3_BGE          3'b101
    `define FUNCT3_BLTU         3'b110
    `define FUNCT3_BGEU         3'b111

    // Load Instruction
    `define FUNCT3_LB           3'b000
    `define FUNCT3_LH           3'b001
    `define FUNCT3_LW           3'b010
    `define FUNCT3_LBU          3'b100
    `define FUNCT3_LHU          3'b101

    // Store Instruction
    `define FUNCT3_SB           3'b000
    `define FUNCT3_SH           3'b001
    `define FUNCT3_SW           3'b010
`endif