module mux_32_to_1 ( 
input logic [4:0] sel , 
input logic [31:0] data0 , 
input logic [31:0] data1, 
input logic [31:0] data2, 
input logic [31:0] data3, 
input logic [31:0] data4, 
input logic [31:0] data5, 
input logic [31:0] data6,
input logic [31:0] data7, 
input logic [31:0] data8, 
input logic [31:0] data9, 
input logic [31:0] data10, 
input logic [31:0] data11 , 
input logic [31:0] data12, 
input logic [31:0] data13, 
input logic [31:0] data14, 
input logic [31:0] data15, 
input logic [31:0] data16, 
input logic [31:0] data17,
input logic [31:0] data18, 
input logic [31:0] data19, 
input logic [31:0] data20, 
input logic [31:0] data21, 
input logic [31:0] data22, 
input logic [31:0] data23, 
input logic [31:0] data24, 
input logic [31:0] data25, 
input logic [31:0] data26,
input logic [31:0] data27, 
input logic [31:0] data28, 
input logic [31:0] data29,
input logic [31:0] data30, 
input logic [31:0] data31, 
output logic [31:0] data_out) ; 

always_comb begin 
case (sel) 
5'd0: data_out <= data0; 
5'd1: data_out <= data1; 
5'd2: data_out <= data2; 
5'd3: data_out <= data3; 
5'd4: data_out <= data4; 
5'd5: data_out <= data5; 
5'd6: data_out <= data6; 
5'd7: data_out <= data7; 
5'd8: data_out <= data8; 
5'd9: data_out <= data9; 
5'd10: data_out <= data10; 

5'd11: data_out <= data11; 
5'd12: data_out <= data12; 
5'd13: data_out <= data13; 
5'd14: data_out <= data14; 
5'd15: data_out <= data15; 
5'd16: data_out <= data16; 
5'd17: data_out <= data17; 
5'd18: data_out <= data18; 
5'd19: data_out <= data19; 
5'd20: data_out <= data20; 
5'd21: data_out <= data21; 

5'd22: data_out <= data22; 
5'd23: data_out <= data23; 
5'd24: data_out <= data24; 
5'd25: data_out <= data25; 
5'd26: data_out <= data26; 
5'd27: data_out <= data27; 
5'd28: data_out <= data28; 
5'd29: data_out <= data29; 
5'd30: data_out <= data30; 
5'd31: data_out <= data31;

default:  data_out <= 32'h0;
endcase 
end 

  endmodule 


 
 