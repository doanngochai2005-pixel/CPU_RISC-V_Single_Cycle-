module FA_32 (
input logic [31:0] i_fa_a, i_fa_b,
input logic i_fa_c,
output logic [31:0] o_fa_s, o_fa_c
);

FA fa0 (.i_a(i_fa_a[0]), .i_b(i_fa_b[0]), .i_c(i_fa_c), .o_s(o_fa_s[0]), .o_c(o_fa_c[0]));
FA fa1 (.i_a(i_fa_a[1]), .i_b(i_fa_b[1]), .i_c(o_fa_c[0]), .o_s(o_fa_s[1]), .o_c(o_fa_c[1]));
FA fa2 (.i_a(i_fa_a[2]), .i_b(i_fa_b[2]), .i_c(o_fa_c[1]), .o_s(o_fa_s[2]), .o_c(o_fa_c[2]));
FA fa3 (.i_a(i_fa_a[3]), .i_b(i_fa_b[3]), .i_c(o_fa_c[2]), .o_s(o_fa_s[3]), .o_c(o_fa_c[3]));
FA fa4 (.i_a(i_fa_a[4]), .i_b(i_fa_b[4]), .i_c(o_fa_c[3]), .o_s(o_fa_s[4]), .o_c(o_fa_c[4]));
FA fa5 (.i_a(i_fa_a[5]), .i_b(i_fa_b[5]), .i_c(o_fa_c[4]), .o_s(o_fa_s[5]), .o_c(o_fa_c[5]));
FA fa6 (.i_a(i_fa_a[6]), .i_b(i_fa_b[6]), .i_c(o_fa_c[5]), .o_s(o_fa_s[6]), .o_c(o_fa_c[6]));
FA fa7 (.i_a(i_fa_a[7]), .i_b(i_fa_b[7]), .i_c(o_fa_c[6]), .o_s(o_fa_s[7]), .o_c(o_fa_c[7]));
FA fa8 (.i_a(i_fa_a[8]), .i_b(i_fa_b[8]), .i_c(o_fa_c[7]), .o_s(o_fa_s[8]), .o_c(o_fa_c[8]));
FA fa9 (.i_a(i_fa_a[9]), .i_b(i_fa_b[9]), .i_c(o_fa_c[8]), .o_s(o_fa_s[9]), .o_c(o_fa_c[9]));
FA fa10 (.i_a(i_fa_a[10]), .i_b(i_fa_b[10]), .i_c(o_fa_c[9]), .o_s(o_fa_s[10]), .o_c(o_fa_c[10]));
FA fa11 (.i_a(i_fa_a[11]), .i_b(i_fa_b[11]), .i_c(o_fa_c[10]), .o_s(o_fa_s[11]), .o_c(o_fa_c[11]));
FA fa12 (.i_a(i_fa_a[12]), .i_b(i_fa_b[12]), .i_c(o_fa_c[11]), .o_s(o_fa_s[12]), .o_c(o_fa_c[12]));
FA fa13 (.i_a(i_fa_a[13]), .i_b(i_fa_b[13]), .i_c(o_fa_c[12]), .o_s(o_fa_s[13]), .o_c(o_fa_c[13]));
FA fa14 (.i_a(i_fa_a[14]), .i_b(i_fa_b[14]), .i_c(o_fa_c[13]), .o_s(o_fa_s[14]), .o_c(o_fa_c[14]));
FA fa15 (.i_a(i_fa_a[15]), .i_b(i_fa_b[15]), .i_c(o_fa_c[14]), .o_s(o_fa_s[15]), .o_c(o_fa_c[15]));
FA fa16 (.i_a(i_fa_a[16]), .i_b(i_fa_b[16]), .i_c(o_fa_c[15]), .o_s(o_fa_s[16]), .o_c(o_fa_c[16]));
FA fa17 (.i_a(i_fa_a[17]), .i_b(i_fa_b[17]), .i_c(o_fa_c[16]), .o_s(o_fa_s[17]), .o_c(o_fa_c[17]));
FA fa18 (.i_a(i_fa_a[18]), .i_b(i_fa_b[18]), .i_c(o_fa_c[17]), .o_s(o_fa_s[18]), .o_c(o_fa_c[18]));
FA fa19 (.i_a(i_fa_a[19]), .i_b(i_fa_b[19]), .i_c(o_fa_c[18]), .o_s(o_fa_s[19]), .o_c(o_fa_c[19]));
FA fa20 (.i_a(i_fa_a[20]), .i_b(i_fa_b[20]), .i_c(o_fa_c[19]), .o_s(o_fa_s[20]), .o_c(o_fa_c[20]));
FA fa21 (.i_a(i_fa_a[21]), .i_b(i_fa_b[21]), .i_c(o_fa_c[20]), .o_s(o_fa_s[21]), .o_c(o_fa_c[21]));
FA fa22 (.i_a(i_fa_a[22]), .i_b(i_fa_b[22]), .i_c(o_fa_c[21]), .o_s(o_fa_s[22]), .o_c(o_fa_c[22]));
FA fa23 (.i_a(i_fa_a[23]), .i_b(i_fa_b[23]), .i_c(o_fa_c[22]), .o_s(o_fa_s[23]), .o_c(o_fa_c[23]));
FA fa24 (.i_a(i_fa_a[24]), .i_b(i_fa_b[24]), .i_c(o_fa_c[23]), .o_s(o_fa_s[24]), .o_c(o_fa_c[24]));
FA fa25 (.i_a(i_fa_a[25]), .i_b(i_fa_b[25]), .i_c(o_fa_c[24]), .o_s(o_fa_s[25]), .o_c(o_fa_c[25]));
FA fa26 (.i_a(i_fa_a[26]), .i_b(i_fa_b[26]), .i_c(o_fa_c[25]), .o_s(o_fa_s[26]), .o_c(o_fa_c[26]));
FA fa27 (.i_a(i_fa_a[27]), .i_b(i_fa_b[27]), .i_c(o_fa_c[26]), .o_s(o_fa_s[27]), .o_c(o_fa_c[27]));
FA fa28 (.i_a(i_fa_a[28]), .i_b(i_fa_b[28]), .i_c(o_fa_c[27]), .o_s(o_fa_s[28]), .o_c(o_fa_c[28]));
FA fa29 (.i_a(i_fa_a[29]), .i_b(i_fa_b[29]), .i_c(o_fa_c[28]), .o_s(o_fa_s[29]), .o_c(o_fa_c[29]));
FA fa30 (.i_a(i_fa_a[30]), .i_b(i_fa_b[30]), .i_c(o_fa_c[29]), .o_s(o_fa_s[30]), .o_c(o_fa_c[30]));
FA fa31 (.i_a(i_fa_a[31]), .i_b(i_fa_b[31]), .i_c(o_fa_c[30]), .o_s(o_fa_s[31]), .o_c(o_fa_c[31]));

endmodule


module FA (
input logic i_a, i_b, i_c,
output logic o_s, o_c
);
   assign o_s = i_a^i_b^i_c;
	assign o_c = (i_a&i_b) | (i_c&(i_a^i_b));
endmodule
