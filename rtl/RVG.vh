`ifndef __RVG_HEADER__
    `define __RVG_HEADER__

    // RISC-V基本操作码(RISC-V base opcode)
    `define RVG_LOAD      7'b0000011
    `define RVG_LOAD_FP   7'b0000111
    `define RVG_custom_0  7'b0001011
    `define RVG_MISC_MEM  7'b0001111
    `define RVG_OP_IMM    7'b0010011
    `define RVG_AUIPC     7'b0010111
    `define RVG_OP_IMM_32 7'b0011011
    `define RVG_48b       7'b0011111
    `define RVG_STORE     7'b0100011
    `define RVG_STORE_FP  7'b0100111
    `define RVG_custom_1  7'b0101011
    `define RVG_AMO       7'b0101111
    `define RVG_OP        7'b0110011
    `define RVG_LUI       7'b0110111
    `define RVG_OP_32     7'b0111011
    `define RVG_64b       7'b0111111
    `define RVG_MADD      7'b1000011
    `define RVG_MSUB      7'b1000111
    `define RVG_NMSUB     7'b1001011
    `define RVG_NMADD     7'b1001111
    `define RVG_OP_FP     7'b1010011
    `define RVG_reserved1 7'b1010111
    `define RVG_custom_2  7'b1011011
    `define RVG_rv128_1   7'b1011011
    `define RVG_BRANCH    7'b1100011
    `define RVG_JALR      7'b1100111
    `define RVG_reserved2 7'b1101011
    `define RVG_JAL       7'b1101111
    `define RVG_SYSTEM    7'b1110011
    `define RVG_reserved3 7'b1110111
    `define RVG_custom_3  7'b1111011
    `define RVG_rv128_2   7'b1111011
    `define RVG_80b       7'b1111111
`endif