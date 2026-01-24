module shifter (
input logic [1:0] i_sel,
input logic [31:0] i_shifter_a, i_shifter_b,
output logic [31:0] o_data
);

logic [4:0] shift;
logic [31:0] o_sll, o_srl, o_sra, temp;
assign shift = {i_shifter_b[4:0]}; 

sll sl1(.i_sll_a(i_shifter_a), .i_sll_shift(shift), .o_sll_data(o_sll)); 
srl sr1(.i_srl_a(i_shifter_a), .i_srl_shift(shift), .o_srl_data(o_srl));
sra sr2(.i_sra_a(i_shifter_a), .i_sra_shift(shift), .o_sra_data(o_sra));

assign temp = (i_shifter_a[31])?o_sra:o_srl;

always_comb begin
   case (i_sel)
	   2'b00: o_data = o_sll;
		2'b01: o_data = o_srl;
		2'b10: o_data = temp;
		default: o_data = 32'd0;
	endcase
end

endmodule

module sra(
input logic [31:0] i_sra_a,
input logic [4:0] i_sra_shift,
output logic [31:0] o_sra_data
);

always_comb begin
   case (i_sra_shift)
	   5'd0: o_sra_data = {i_sra_a[31:0]};
		5'd1: o_sra_data = {~1'd0,i_sra_a[31:1]};
		5'd2: o_sra_data = {~2'd0,i_sra_a[31:2]};
		5'd3: o_sra_data = {~3'd0,i_sra_a[31:3]};
		5'd4: o_sra_data = {~4'd0,i_sra_a[31:4]};
		5'd5: o_sra_data = {~5'd0,i_sra_a[31:5]};
		5'd6: o_sra_data = {~6'd0,i_sra_a[31:6]};
		5'd7: o_sra_data = {~7'd0,i_sra_a[31:7]};
		5'd8: o_sra_data = {~8'd0,i_sra_a[31:8]};
		5'd9: o_sra_data = {~9'd0,i_sra_a[31:9]};
		5'd10: o_sra_data = {~10'd0,i_sra_a[31:10]};
		5'd11: o_sra_data = {~11'd0,i_sra_a[31:11]};
		5'd12: o_sra_data = {~12'd0,i_sra_a[31:12]};
		5'd13: o_sra_data = {~13'd0,i_sra_a[31:13]};
		5'd14: o_sra_data = {~14'd0,i_sra_a[31:14]};
		5'd15: o_sra_data = {~15'd0,i_sra_a[31:15]};
		5'd16: o_sra_data = {~16'd0,i_sra_a[31:16]};
		5'd17: o_sra_data = {~17'd0,i_sra_a[31:17]};
		5'd18: o_sra_data = {~18'd0,i_sra_a[31:18]};
		5'd19: o_sra_data = {~19'd0,i_sra_a[31:19]};
		5'd20: o_sra_data = {~20'd0,i_sra_a[31:20]};
		5'd21: o_sra_data = {~21'd0,i_sra_a[31:21]};
		5'd22: o_sra_data = {~22'd0,i_sra_a[31:22]};
		5'd23: o_sra_data = {~23'd0,i_sra_a[31:23]};
		5'd24: o_sra_data = {~24'd0,i_sra_a[31:24]};
		5'd25: o_sra_data = {~25'd0,i_sra_a[31:25]};
		5'd26: o_sra_data = {~26'd0,i_sra_a[31:26]};
		5'd27: o_sra_data = {~27'd0,i_sra_a[31:27]};
		5'd28: o_sra_data = {~28'd0,i_sra_a[31:28]};
		5'd29: o_sra_data = {~29'd0,i_sra_a[31:29]};
		5'd30: o_sra_data = {~30'd0,i_sra_a[31:30]};
		5'd31: o_sra_data = {~31'd0,i_sra_a[31]};
	endcase
end

endmodule

module srl(
input logic [31:0] i_srl_a,
input logic [4:0] i_srl_shift,
output logic [31:0] o_srl_data
);

always_comb begin
   case (i_srl_shift)
	   5'd0: o_srl_data = {i_srl_a[31:0]};
		5'd1: o_srl_data = {1'd0,i_srl_a[31:1]};
		5'd2: o_srl_data = {2'd0,i_srl_a[31:2]};
		5'd3: o_srl_data = {3'd0,i_srl_a[31:3]};
		5'd4: o_srl_data = {4'd0,i_srl_a[31:4]};
		5'd5: o_srl_data = {5'd0,i_srl_a[31:5]};
		5'd6: o_srl_data = {6'd0,i_srl_a[31:6]};
		5'd7: o_srl_data = {7'd0,i_srl_a[31:7]};
		5'd8: o_srl_data = {8'd0,i_srl_a[31:8]};
		5'd9: o_srl_data = {9'd0,i_srl_a[31:9]};
		5'd10: o_srl_data = {10'd0,i_srl_a[31:10]};
		5'd11: o_srl_data = {11'd0,i_srl_a[31:11]};
		5'd12: o_srl_data = {12'd0,i_srl_a[31:12]};
		5'd13: o_srl_data = {13'd0,i_srl_a[31:13]};
		5'd14: o_srl_data = {14'd0,i_srl_a[31:14]};
		5'd15: o_srl_data = {15'd0,i_srl_a[31:15]};
		5'd16: o_srl_data = {16'd0,i_srl_a[31:16]};
		5'd17: o_srl_data = {17'd0,i_srl_a[31:17]};
		5'd18: o_srl_data = {18'd0,i_srl_a[31:18]};
		5'd19: o_srl_data = {19'd0,i_srl_a[31:19]};
		5'd20: o_srl_data = {20'd0,i_srl_a[31:20]};
		5'd21: o_srl_data = {21'd0,i_srl_a[31:21]};
		5'd22: o_srl_data = {22'd0,i_srl_a[31:22]};
		5'd23: o_srl_data = {23'd0,i_srl_a[31:23]};
		5'd24: o_srl_data = {24'd0,i_srl_a[31:24]};
		5'd25: o_srl_data = {25'd0,i_srl_a[31:25]};
		5'd26: o_srl_data = {26'd0,i_srl_a[31:26]};
		5'd27: o_srl_data = {27'd0,i_srl_a[31:27]};
		5'd28: o_srl_data = {28'd0,i_srl_a[31:28]};
		5'd29: o_srl_data = {29'd0,i_srl_a[31:29]};
		5'd30: o_srl_data = {30'd0,i_srl_a[31:30]};
		5'd31: o_srl_data = {31'd0,i_srl_a[31]};
	endcase
end

endmodule

module sll(
input logic [31:0] i_sll_a,
input logic [4:0] i_sll_shift,
output logic [31:0] o_sll_data
);

always_comb begin
   case (i_sll_shift)
	   5'd0: o_sll_data = {i_sll_a[31:0]};
		5'd1: o_sll_data = {i_sll_a[30:0],1'd0};
		5'd2: o_sll_data = {i_sll_a[29:0],2'd0};
		5'd3: o_sll_data = {i_sll_a[28:0],3'd0};
		5'd4: o_sll_data = {i_sll_a[27:0],4'd0};
		5'd5: o_sll_data = {i_sll_a[26:0],5'd0};
		5'd6: o_sll_data = {i_sll_a[25:0],6'd0};
		5'd7: o_sll_data = {i_sll_a[24:0],7'd0};
		5'd8: o_sll_data = {i_sll_a[23:0],8'd0};
		5'd9: o_sll_data = {i_sll_a[22:0],9'd0};
		5'd10: o_sll_data = {i_sll_a[21:0],10'd0};
		5'd11: o_sll_data = {i_sll_a[20:0],11'd0};
		5'd12: o_sll_data = {i_sll_a[19:0],12'd0};
		5'd13: o_sll_data = {i_sll_a[18:0],13'd0};
		5'd14: o_sll_data = {i_sll_a[17:0],14'd0};
		5'd15: o_sll_data = {i_sll_a[16:0],15'd0};
		5'd16: o_sll_data = {i_sll_a[15:0],16'd0};
		5'd17: o_sll_data = {i_sll_a[14:0],17'd0};
		5'd18: o_sll_data = {i_sll_a[13:0],18'd0};
		5'd19: o_sll_data = {i_sll_a[12:0],19'd0};
		5'd20: o_sll_data = {i_sll_a[11:0],20'd0};
		5'd21: o_sll_data = {i_sll_a[10:0],21'd0};
		5'd22: o_sll_data = {i_sll_a[9:0],22'd0};
		5'd23: o_sll_data = {i_sll_a[8:0],23'd0};
		5'd24: o_sll_data = {i_sll_a[7:0],24'd0};
		5'd25: o_sll_data = {i_sll_a[6:0],25'd0};
		5'd26: o_sll_data = {i_sll_a[5:0],26'd0};
		5'd27: o_sll_data = {i_sll_a[4:0],27'd0};
		5'd28: o_sll_data = {i_sll_a[3:0],28'd0};
		5'd29: o_sll_data = {i_sll_a[2:0],29'd0};
		5'd30: o_sll_data = {i_sll_a[1:0],30'd0};
		5'd31: o_sll_data = {i_sll_a[0],31'd0};
	endcase
end

endmodule