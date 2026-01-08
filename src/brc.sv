
module brc (
  input  logic [31:0] i_rs1_data,
  input  logic [31:0] i_rs2_data,
  input  logic        i_br_un,
  output logic        o_br_less,
  output logic        o_br_equal
);
  wire [31:0] x = i_rs1_data ^ i_rs2_data;
  assign o_br_equal = ~(|x);

  logic [31:0] diff;
  logic [31:0] sub_carry;
  FA_32 u_sub (
    .i_fa_a (i_rs1_data),
    .i_fa_b (~i_rs2_data),
    .i_fa_c (1'b1),
    .o_fa_s (diff),
    .o_fa_c (sub_carry)
  );

  wire u_less = ~sub_carry[31];
  wire a_sign = i_rs1_data[31];
  wire b_sign = i_rs2_data[31];
  wire d_sign = diff[31];
  wire s_less = (a_sign ^ b_sign) ? a_sign : d_sign;

  assign o_br_less = i_br_un ? u_less : s_less;

endmodule
