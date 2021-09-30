/*
-- ================================================================================================
-- FILE NAME   : regfile.v
-- DESCRIPTION : 寄存器堆模块,同步写,异步读
-- ------------------------------------------------------------------------------------------------
-- Revision Date        Coding_by   Comment
-- 1.0.0    2021/09/29  enjou       初版
-- ================================================================================================
*/
module regfile (

    // 时钟复位信号     (Clock and Reset)
    input               clk,
    input               rst,

    // 写端口           (Write Port)
    input               i_wen,
    input       [ 4:0]  i_waddr_5,
    input       [63:0]  i_wdata_64,

    // 读端口
    input       [ 4:0]  i_raddr1_5,
    input       [ 4:0]  i_raddr2_5,
    output      [63:0]  o_rdata1_64,
    output      [63:0]  o_rdata2_64
);

    reg [63:0] rf[31:0];

    always @(posedge clk ) begin
        if (i_wen) begin
            rf[i_waddr_5]   <= i_wdata_64;
        end
    end

    // 读端口1
    assign o_rdata1_64  = {{64{| i_raddr1_5}}   & rf[i_raddr1_5]};

     //读端口2
    assign o_rdata2_64  = {{64{| i_raddr2_5}}   & rf[i_raddr2_5]};

endmodule