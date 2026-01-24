module write_enable ( 
input logic [31:0] decoder_output, 
input logic wr_en, 
output logic [31:0] wr_en_finish) ; 

assign wr_en_finish [0] = 1'b0 ; 

assign wr_en_finish [1] = decoder_output [1] & wr_en ; 
assign wr_en_finish [2]= decoder_output [2] & wr_en ; 
assign wr_en_finish [3] = decoder_output [3] & wr_en ;
assign wr_en_finish [4] = decoder_output [4] & wr_en ; 
assign wr_en_finish [5] = decoder_output [5] & wr_en ; 
assign wr_en_finish [6] = decoder_output [6] & wr_en ; 
assign wr_en_finish [7] = decoder_output [7] & wr_en ; 
assign wr_en_finish [8] = decoder_output [8] & wr_en ; 
assign wr_en_finish [9] = decoder_output [9] & wr_en ; 
assign wr_en_finish [10] = decoder_output [10] & wr_en ; 
assign wr_en_finish [11] = decoder_output [11] & wr_en ; 
assign wr_en_finish [12]= decoder_output [12] & wr_en ; 
assign wr_en_finish [13] = decoder_output [13] & wr_en ;
assign wr_en_finish [14] = decoder_output [14] & wr_en ; 
assign wr_en_finish [15] = decoder_output [15] & wr_en ; 
assign wr_en_finish [16] = decoder_output [16] & wr_en ; 
assign wr_en_finish [17] = decoder_output [17] & wr_en ; 
assign wr_en_finish [18] = decoder_output [18] & wr_en ; 
assign wr_en_finish [19] = decoder_output [19] & wr_en ; 
assign wr_en_finish [20] = decoder_output [20] & wr_en ;
assign wr_en_finish [21] = decoder_output [21] & wr_en ; 
assign wr_en_finish [22]= decoder_output [22] & wr_en ; 
assign wr_en_finish [23] = decoder_output [23] & wr_en ;
assign wr_en_finish [24] = decoder_output [24] & wr_en ; 
assign wr_en_finish [25] = decoder_output [25] & wr_en ; 
assign wr_en_finish [26] = decoder_output [26] & wr_en ; 
assign wr_en_finish [27] = decoder_output [27] & wr_en ; 
assign wr_en_finish [28] = decoder_output [28] & wr_en ; 
assign wr_en_finish [29] = decoder_output [29] & wr_en ; 
assign wr_en_finish [30] = decoder_output [30] & wr_en ; 
assign wr_en_finish [31] = decoder_output [31] & wr_en ; 

endmodule  
