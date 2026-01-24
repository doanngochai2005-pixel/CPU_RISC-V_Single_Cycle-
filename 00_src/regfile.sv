module regfile ( 
input logic i_clk, 
input logic i_reset, 
input logic [4:0] i_rs1_addr, 
input logic [4:0] i_rs2_addr,
output logic [31:0] o_rs1_data, 
output logic [31:0] o_rs2_data, 
input logic [4:0] i_rd_addr, 
input logic [31:0] i_rd_data, 
input logic i_rd_wren ) ; 


logic [31:0] decoder_wr; 
logic [31:0] wr_en_finish ; 
logic [31:0] reg_data [0:31] ; 

decoder_5_to_32 decoder_0 ( .addr(i_rd_addr),.decoder_output (decoder_wr)); 

write_enable wr_1 ( .decoder_output (decoder_wr), . wr_en (i_rd_wren) , . wr_en_finish (wr_en_finish) );   

assign reg_data[0] =32'b0 ; 
register32 reg1 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[1]),. data_in(i_rd_data) ,. data_out (reg_data[1])); 
register32 reg2 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[2]),. data_in(i_rd_data) ,. data_out (reg_data[2])); 
register32 reg3 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[3]),. data_in(i_rd_data) ,. data_out (reg_data[3]));
register32 reg4 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[4]),. data_in(i_rd_data) ,. data_out (reg_data[4])); 
register32 reg5(.clk(i_clk), .rst(i_reset), . E (wr_en_finish[5]),. data_in(i_rd_data) ,. data_out (reg_data[5])); 
register32 reg6 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[6]),. data_in(i_rd_data) ,. data_out (reg_data[6])); 
register32 reg7 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[7]),. data_in(i_rd_data) ,. data_out (reg_data[7])); 
register32 reg8 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[8]),. data_in(i_rd_data) ,. data_out (reg_data[8])); 
register32 reg9 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[9]),. data_in(i_rd_data) ,. data_out (reg_data[9])); 
register32 reg10 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[10]),. data_in(i_rd_data) ,. data_out (reg_data[10])); 
register32 reg11 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[11]),. data_in(i_rd_data) ,. data_out (reg_data[11])); 
register32 reg12 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[12]),. data_in(i_rd_data) ,. data_out (reg_data[12])); 
register32 reg13 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[13]),. data_in(i_rd_data) ,. data_out (reg_data[13])); 
register32 reg14 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[14]),. data_in(i_rd_data) ,. data_out (reg_data[14])); 
register32 reg15 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[15]),. data_in(i_rd_data) ,. data_out (reg_data[15])); 
register32 reg16 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[16]),. data_in(i_rd_data) ,. data_out (reg_data[16])); 
register32 reg17 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[17]),. data_in(i_rd_data) ,. data_out (reg_data[17])); 
register32 reg18 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[18]),. data_in(i_rd_data) ,. data_out (reg_data[18])); 
register32 reg19 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[19]),. data_in(i_rd_data) ,. data_out (reg_data[19])); 
register32 reg20 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[20]),. data_in(i_rd_data) ,. data_out (reg_data[20])); 
register32 reg21 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[21]),. data_in(i_rd_data) ,. data_out (reg_data[21])); 
register32 reg22 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[22]),. data_in(i_rd_data) ,. data_out (reg_data[22])); 
register32 reg23 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[23]),. data_in(i_rd_data) ,. data_out (reg_data[23])); 
register32 reg24 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[24]),. data_in(i_rd_data) ,. data_out (reg_data[24])); 
register32 reg25 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[25]),. data_in(i_rd_data) ,. data_out (reg_data[25])); 
register32 reg26 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[26]),. data_in(i_rd_data) ,. data_out (reg_data[26])); 
register32 reg27 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[27]),. data_in(i_rd_data) ,. data_out (reg_data[27])); 
register32 reg28 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[28]),. data_in(i_rd_data) ,. data_out (reg_data[28])); 
register32 reg29 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[29]),. data_in(i_rd_data) ,. data_out (reg_data[29]));  
register32 reg30 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[30]),. data_in(i_rd_data) ,. data_out (reg_data[30])); 
register32 reg31 (.clk(i_clk), .rst(i_reset), . E (wr_en_finish[31]),. data_in(i_rd_data) ,. data_out (reg_data[31])); 


mux_32_to_1 mux_1 ( .sel(i_rs1_addr), . data0(reg_data[0]), .data1(reg_data[1]), .data2(reg_data[2]),. data3(reg_data[3]) , . data4(reg_data[4]), .data5(reg_data[5]), .data6(reg_data[6]),. data7(reg_data[7]) , . data8(reg_data[8]), .data9(reg_data[9]), .data10(reg_data[10]),. data11(reg_data[11]) , . data12(reg_data[12]), .data13(reg_data[13]), .data14(reg_data[14]),. data15(reg_data[15]), . data16(reg_data[16]), .data17(reg_data[17]), .data18(reg_data[18]),. data19(reg_data[19]) , . data20(reg_data[20]), .data21(reg_data[21]), .data22(reg_data[22]),. data23(reg_data[23]), . data24(reg_data[24]), .data25(reg_data[25]), .data26(reg_data[26]),. data27(reg_data[27]) , . data28(reg_data[28]), .data29(reg_data[29]), .data30(reg_data[30]),. data31(reg_data[31]),. data_out(o_rs1_data) ); 



mux_32_to_1 mux_2 ( .sel(i_rs2_addr), . data0(reg_data[0]), .data1(reg_data[1]), .data2(reg_data[2]),. data3(reg_data[3]) , . data4(reg_data[4]), .data5(reg_data[5]), .data6(reg_data[6]),. data7(reg_data[7]) , . data8(reg_data[8]), .data9(reg_data[9]), .data10(reg_data[10]),. data11(reg_data[11]) , . data12(reg_data[12]), .data13(reg_data[13]), .data14(reg_data[14]),. data15(reg_data[15]), . data16(reg_data[16]), .data17(reg_data[17]), .data18(reg_data[18]),. data19(reg_data[19]) , . data20(reg_data[20]), .data21(reg_data[21]), .data22(reg_data[22]),. data23(reg_data[23]), . data24(reg_data[24]), .data25(reg_data[25]), .data26(reg_data[26]),. data27(reg_data[27]) , . data28(reg_data[28]), .data29(reg_data[29]), .data30(reg_data[30]),. data31(reg_data[31]),. data_out (o_rs2_data)); 

endmodule 
