module alu (
input logic [31:0] i_op_a, i_op_b,
input logic [3:0] i_alu_op,
output logic [31:0] o_alu_data
);

logic [31:0] add_carry, sub_carry;
logic [31:0] res1, res2, res3, res4, res5, res6, res7, res8, res9, res10;

FA_32 fa(.i_fa_a(i_op_a), .i_fa_b(i_op_b), .i_fa_c(1'b0), .o_fa_s(res1), .o_fa_c(add_carry));
FA_32 fs(.i_fa_a(i_op_a), .i_fa_b(~i_op_b), .i_fa_c(1'b1), .o_fa_s(res2), .o_fa_c(sub_carry));

logic n_flag, v_flag, s_flag;
assign n_flag = res2[31];
assign v_flag = sub_carry[31]^sub_carry[30];
assign s_flag = n_flag^v_flag;
assign res3 = {31'b0,s_flag};
assign res4 = {31'b0,~sub_carry[31]};
assign res5 = i_op_a^i_op_b;
assign res6 = i_op_a|i_op_b;
assign res7 = i_op_a&i_op_b;


shifter sll(.i_shifter_a(i_op_a), .i_shifter_b(i_op_b), .i_sel(2'b00), .o_data(res8));
shifter srl(.i_shifter_a(i_op_a), .i_shifter_b(i_op_b), .i_sel(2'b01), .o_data(res9));
shifter sra(.i_shifter_a(i_op_a), .i_shifter_b(i_op_b), .i_sel(2'b10), .o_data(res10));

always_comb begin
   case(i_alu_op)
	   4'b0000: o_alu_data = res1;
		4'b0001: o_alu_data = res2;
		4'b0010: o_alu_data = res3;
		4'b0011: o_alu_data = res4;
		4'b0100: o_alu_data = res5;
		4'b0101: o_alu_data = res6;
		4'b0110: o_alu_data = res7;
		4'b0111: o_alu_data = res8;
		4'b1000: o_alu_data = res9;
		4'b1001: o_alu_data = res10;
		default: o_alu_data = 32'd0; 
	endcase
end

endmodule

