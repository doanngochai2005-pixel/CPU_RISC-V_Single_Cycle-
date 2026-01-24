module single_cycle (
    input  logic         i_clk     ,
    input  logic         i_reset   ,
    input  logic [31:0]  i_io_sw   ,
    output logic [31:0]  o_io_ledr ,
    output logic [31:0]  o_io_ledg ,
    output logic [31:0]  o_io_lcd  ,
    output logic [ 6:0]  o_io_hex0 ,
    output logic [ 6:0]  o_io_hex1 ,
    output logic [ 6:0]  o_io_hex2 ,
    output logic [ 6:0]  o_io_hex3 ,
    output logic [ 6:0]  o_io_hex4 ,
    output logic [ 6:0]  o_io_hex5 ,
    output logic [ 6:0]  o_io_hex6 ,
    output logic [ 6:0]  o_io_hex7 ,
    output logic [31:0]  o_pc_debug,
    output logic         o_insn_vld
);

logic [31:0] pc;
logic [31:0] instr;
logic [31:0] rs1_data, rs2_data;
logic [31:0] imm_i, imm_s, imm_b, imm_u, imm_j, imm;
logic [31:0] alu_data;
logic [31:0] ld_data;
logic [31:0] wb_data;
logic [31:0] dmem_rdata;
logic [3:0]  alu_op;
logic [1:0]  opa_sel, opb_sel, pc_sel, wb_sel;
logic [2:0]  imm_sel;
logic        br_un, br_less, br_equal, rd_wren, mem_read, mem_write;
logic [2:0]  funct3;
logic        pc_sel_signal;
logic [31:0] pc_target;
logic [31:0] pc_add_imm_b, pc_add_imm_j, rs1_add_imm_i;
logic [31:0] rs1_align;
logic [31:0] lsu_addr;
logic [3:0]  dmem_be;
logic [31:0] dmem_wdata;
logic        dmem_wren;
logic [31:0] opa, opb;
logic [31:0] pc_four;

FA_32 fa_branch (.i_fa_a(pc), .i_fa_b(imm_b), .i_fa_c(1'b0), .o_fa_s(pc_add_imm_b), .o_fa_c());
FA_32 fa_jal (.i_fa_a(pc), .i_fa_b(imm_j), .i_fa_c(1'b0), .o_fa_s(pc_add_imm_j), .o_fa_c());
assign rs1_align = rs1_data & 32'hFFFFFFFE;
FA_32 fa_jalr (.i_fa_a(rs1_align), .i_fa_b(imm_i), .i_fa_c(1'b0), .o_fa_s(rs1_add_imm_i), .o_fa_c());

always_comb begin
    case (pc_sel)
        2'b00: begin pc_sel_signal = 1'b0; pc_target = 32'b0; end
        2'b01: begin pc_sel_signal = 1'b1; pc_target = pc_add_imm_b; end
        2'b10: begin pc_sel_signal = 1'b1; pc_target = pc_add_imm_j; end
        2'b11: begin pc_sel_signal = 1'b1; pc_target = rs1_add_imm_i; end
        default: begin pc_sel_signal = 1'b0; pc_target = 32'b0; end
    endcase
end

PC pc_unit (.clk(i_clk), .rst(~i_reset), .PCSel(pc_sel_signal), .ALU_out(pc_target), .PC(pc));
assign o_pc_debug = pc;
FA_32 pc_4 (.i_fa_a(pc), .i_fa_b(32'd4), .i_fa_c(1'b0), .o_fa_s(pc_four), .o_fa_c());

imem imem(.addr(pc), .rdata(instr));

control_unit cu (.instr(instr), .br_less(br_less), .br_equal(br_equal), 
                 .o_alu_op(alu_op), .o_src_a_sel(opa_sel), .o_src_b_sel(opb_sel), 
                 .o_imm_sel(imm_sel), .o_br_un(br_un), .o_pc_sel(pc_sel), 
                 .o_mem_read(mem_read), .o_mem_write(mem_write), .o_wb_sel(wb_sel), .o_rd_we(rd_wren));

assign o_insn_vld = |instr[6:0]; 

regfile rf (.i_clk(i_clk), .i_reset(~i_reset), .i_rs1_addr(instr[19:15]), .i_rs2_addr(instr[24:20]),
            .o_rs1_data(rs1_data), .o_rs2_data(rs2_data), .i_rd_addr(instr[11:7]), 
            .i_rd_data(wb_data), .i_rd_wren(rd_wren));

immgen ig (.instr(instr), .imm_i(imm_i), .imm_s(imm_s), .imm_b(imm_b), .imm_u(imm_u), .imm_j(imm_j));

always_comb begin
    case (imm_sel)
        3'b000: imm = imm_i;
        3'b001: imm = imm_s;
        3'b010: imm = imm_b;
        3'b011: imm = imm_u;
        3'b100: imm = imm_j;
        default: imm = 32'b0;
    endcase
end

assign funct3 = instr[14:12];

always_comb begin
    case (opa_sel)
        2'b00: opa = rs1_data;
        2'b01: opa = pc;
        2'b10: opa = 32'b0;
        default: opa = 32'b0;
    endcase
end

assign opb = opb_sel ? imm : rs2_data;

alu alu_unit (.i_op_a(opa), .i_op_b(opb), .i_alu_op(alu_op), .o_alu_data(alu_data));

brc brc_unit (.i_rs1_data(rs1_data), .i_rs2_data(rs2_data), .i_br_un(br_un), 
              .o_br_less(br_less), .o_br_equal(br_equal));

assign lsu_addr = alu_data;

LSU lsu_unit (.clk(i_clk), .reset(~i_reset), .i_lsu_addr(lsu_addr), .i_st_data(rs2_data), 
              .i_lsu_wren(mem_write), .i_funct3(funct3), .i_io_sw(i_io_sw), .dmem_rdata(dmem_rdata),
              .o_ld_data(ld_data), .o_io_ledr(o_io_ledr), .o_io_ledg(o_io_ledg),
              .o_io_hex0(o_io_hex0), .o_io_hex1(o_io_hex1), .o_io_hex2(o_io_hex2), .o_io_hex3(o_io_hex3),
              .o_io_hex4(o_io_hex4), .o_io_hex5(o_io_hex5), .o_io_hex6(o_io_hex6), .o_io_hex7(o_io_hex7),
              .o_io_lcd(o_io_lcd), .dmem_be(dmem_be), .dmem_wdata(dmem_wdata), .dmem_wren(dmem_wren));

dmem dmem_unit (.clk(i_clk), .addr(lsu_addr[10:0]), .wdata(dmem_wdata), .be(dmem_be), 
                .wren(dmem_wren), .rdata(dmem_rdata));

always_comb begin
    case (wb_sel)
        2'b00: wb_data = alu_data;
        2'b01: wb_data = ld_data;
        2'b10: wb_data = pc_four;
        default: wb_data = 32'b0;
    endcase
end

endmodule
