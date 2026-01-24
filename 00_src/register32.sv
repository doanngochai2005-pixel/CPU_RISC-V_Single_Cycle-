module  register32( 
input logic clk, 
input logic rst, 
input logic E, 
input  logic [31:0] data_in, 
output  logic [31:0] data_out ) ; 

always_ff @ (posedge clk or posedge rst ) begin 
if ( rst) 
data_out <= 32'd0; 
else if (E)      
data_out <= data_in ; 
else 
data_out <= data_out ; 
end 
endmodule     