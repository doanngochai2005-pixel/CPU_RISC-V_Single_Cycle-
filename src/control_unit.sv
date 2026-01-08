 module control_unit(
  input  logic [31:0] instr,
  input  logic        br_less,
  input  logic        br_equal,
  output logic [3:0]  o_alu_op,
  output logic [1:0]  o_src_a_sel,
  output logic        o_src_b_sel,
  output logic [2:0]  o_imm_sel,
  output logic        o_br_un,
  output logic [1:0]  o_pc_sel,
  output logic        o_mem_read,
  output logic        o_mem_write,
  output logic [1:0]  o_wb_sel,
  output logic        o_rd_we
);

  wire [6:0] opcode = instr[6:0];
  wire [2:0] funct3 = instr[14:12];
  wire [6:0] funct7 = instr[31:25];

  localparam OP_LUI    = 7'b0110111;
  localparam OP_AUIPC  = 7'b0010111;
  localparam OP_JAL    = 7'b1101111;
  localparam OP_JALR   = 7'b1100111;
  localparam OP_BRANCH = 7'b1100011;
  localparam OP_LOAD   = 7'b0000011;
  localparam OP_STORE  = 7'b0100011;
  localparam OP_OPIMM  = 7'b0010011;
  localparam OP_OP     = 7'b0110011;

  localparam IMM_I=3'b000, IMM_S=3'b001, IMM_B=3'b010, IMM_U=3'b011, IMM_J=3'b100;

  always_comb begin
    // Giá trị mặc định
    o_alu_op    = 4'b0000;
    o_src_a_sel = 2'b00;
    o_src_b_sel = 1'b0;
    o_imm_sel   = IMM_I;
    o_br_un     = 1'b0; 
    o_pc_sel    = 2'b00;
    o_mem_read  = 1'b0;
    o_mem_write = 1'b0;
    o_wb_sel    = 2'b00;
    o_rd_we     = 1'b0;

    case (opcode)
      OP_LUI: begin
        o_imm_sel   = IMM_U;
        o_src_a_sel = 2'b10;
        o_src_b_sel = 1'b1;
        o_alu_op    = 4'b0101; // OR logic
        o_wb_sel    = 2'b00;
        o_rd_we     = 1'b1;
      end

      OP_AUIPC: begin
        o_imm_sel   = IMM_U;
        o_src_a_sel = 2'b01;
        o_src_b_sel = 1'b1;
        o_alu_op    = 4'b0000; // ADD
        o_wb_sel    = 2'b00;
        o_rd_we     = 1'b1;
      end

      OP_JAL: begin
        o_imm_sel   = IMM_J;
        o_src_a_sel = 2'b01;
        o_wb_sel    = 2'b10;
        o_rd_we     = 1'b1;
        o_pc_sel    = 2'b10;
      end

      OP_JALR: begin
        o_imm_sel   = IMM_I;
        o_src_a_sel = 2'b00;
        o_src_b_sel = 1'b1;
        o_wb_sel    = 2'b10;
        o_rd_we     = 1'b1;
        o_pc_sel    = 2'b11;
      end

      OP_BRANCH: begin
        o_imm_sel   = IMM_B;
        o_src_a_sel = 2'b00;
        o_src_b_sel = 1'b0;
        o_rd_we     = 1'b0;
        case (funct3)
           3'b110, 3'b111: o_br_un = 1'b1; // BLTU, BGEU -> unsigned
           default:        o_br_un = 1'b0; // BEQ,BNE,BLT,BGE -> signed
        endcase


        if ( (funct3==3'b000 && br_equal)   ||
             (funct3==3'b001 && ~br_equal)  ||
             (funct3==3'b100 && br_less)    ||
             (funct3==3'b101 && ~br_less)   ||
             (funct3==3'b110 && br_less)    ||
             (funct3==3'b111 && ~br_less) ) begin
          o_pc_sel = 2'b01;
        end else begin
          o_pc_sel = 2'b00;
        end
      end

      OP_LOAD: begin
        o_imm_sel   = IMM_I;
        o_src_a_sel = 2'b00;
        o_src_b_sel = 1'b1;
        o_mem_read  = 1'b1;
        o_wb_sel    = 2'b01;
        o_rd_we     = 1'b1;
        o_alu_op    = 4'b0000;
      end

      OP_STORE: begin
        o_imm_sel   = IMM_S;
        o_src_a_sel = 2'b00;
        o_src_b_sel = 1'b1;
        o_mem_write = 1'b1;
        o_rd_we     = 1'b0;
        o_alu_op    = 4'b0000;
      end

      OP_OPIMM: begin
        o_imm_sel   = IMM_I;
        o_src_a_sel = 2'b00;
        o_src_b_sel = 1'b1;
        o_rd_we     = 1'b1;
        o_wb_sel    = 2'b00;
        case (funct3)
          3'b000: o_alu_op = 4'b0000; // ADDI
          3'b010: o_alu_op = 4'b0010; // SLTI
          3'b011: o_alu_op = 4'b0011; // SLTIU
          3'b100: o_alu_op = 4'b0100; // XORI
          3'b110: o_alu_op = 4'b0101; // ORI
          3'b111: o_alu_op = 4'b0110; // ANDI
          3'b001: o_alu_op = 4'b0111; // SLLI
          3'b101: o_alu_op = (funct7==7'b0100000) ? 4'b1001 : 4'b1000; // SRAI or SRLI
          default: o_alu_op = 4'b0000;
        endcase
      end

      OP_OP: begin
        o_src_a_sel = 2'b00;
        o_src_b_sel = 1'b0;
        o_rd_we     = 1'b1;
        o_wb_sel    = 2'b00;
        case (funct3)
          3'b000: o_alu_op = (funct7==7'b0100000) ? 4'b0001 : 4'b0000; // SUB or ADD
          3'b001: o_alu_op = 4'b0111; // SLL
          3'b101: o_alu_op = (funct7==7'b0100000) ? 4'b1001 : 4'b1000; // SRA or SRL
          3'b100: o_alu_op = 4'b0100; // XOR
          3'b110: o_alu_op = 4'b0101; // OR
          3'b111: o_alu_op = 4'b0110; // AND
          3'b010: o_alu_op = 4'b0010; // SLT
          3'b011: o_alu_op = 4'b0011; // SLTU
          default: o_alu_op = 4'b0000;
        endcase
      end
      default: ; 
    endcase
  end
endmodule
