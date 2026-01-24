module PC ( 
input logic clk,
input logic rst, 
input logic PCSel , 
input logic [31:0] ALU_out , 
output  logic [31:0] PC ) ; 

logic [31:0] PC_next;

logic [31:0] pc_sum; 
logic carry_out ; 

FA_32 add_pc ( 
.i_fa_a(PC), 
.i_fa_b(32'd4) ,
.i_fa_c (1'b0), 
.o_fa_s(pc_sum) ,
.o_fa_c(carry_out)); 

always_comb begin 
if (PCSel)
PC_next = ALU_out ; 
else PC_next = pc_sum ;
end   

always_ff @ ( posedge clk or posedge  rst ) begin 
if ( rst)  
PC <= 32'd0;
else   
PC <= PC_next;
  end 
endmodule 
