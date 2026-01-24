module decoder_5_to_32 ( 
input logic [4:0] addr , 
output logic [31:0] decoder_output ) ; 
always_comb begin 
decoder_output = 32'b0 ; 
case (addr) 
5'd0 : decoder_output[0] = 1'b1; 
5'd1 : decoder_output[1] = 1'b1; 
5'd2 : decoder_output[2] = 1'b1; 
5'd3 : decoder_output[3] = 1'b1;
5'd4 : decoder_output[4] = 1'b1; 
5'd5 : decoder_output[5] = 1'b1; 
5'd6 : decoder_output[6] = 1'b1; 
5'd7 : decoder_output[7] = 1'b1; 
5'd8 : decoder_output[8] =1'b1 ; 
5'd9 : decoder_output[9] = 1'b1; 
5'd10 : decoder_output[10] = 1'b1; 

5'd11 : decoder_output[11] = 1'b1; 
5'd12 : decoder_output[12] = 1'b1; 
5'd13 : decoder_output[13] = 1'b1;
5'd14 : decoder_output[14] = 1'b1; 
5'd15 : decoder_output[15] = 1'b1; 
5'd16 : decoder_output[16] = 1'b1; 
5'd17 : decoder_output[17] = 1'b1; 
5'd18 : decoder_output[18] =1'b1 ; 
5'd19 : decoder_output[19] = 1'b1; 
5'd20 : decoder_output[20] = 1'b1; 

5'd21 : decoder_output[21] = 1'b1; 
5'd22 : decoder_output[22] = 1'b1; 
5'd23 : decoder_output[23] = 1'b1;
5'd24 : decoder_output[24] = 1'b1; 
5'd25 : decoder_output[25] = 1'b1; 
5'd26 : decoder_output[26] = 1'b1; 
5'd27 : decoder_output[27] = 1'b1; 
5'd28 : decoder_output[28] =1'b1 ; 
5'd29 : decoder_output[29] = 1'b1; 
5'd30 : decoder_output[30] = 1'b1; 
5'd31 : decoder_output[31] = 1'b1; 
default : decoder_output = 32'b0 ; 
endcase
end   

endmodule   