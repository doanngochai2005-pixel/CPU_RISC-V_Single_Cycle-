module dmem (
  input  logic        clk,
  input  logic [10:0] addr,   
  input  logic [31:0] wdata,
  input  logic [3:0]  be,
  input  logic        wren,      
  output logic [31:0] rdata
);
  logic [31:0] mem [0:511];
  
  initial begin
  $readmemh("./../02_test/zero.hex", mem);
  end

  logic [31:0] word_q, word_d, wmask;
  assign wmask = { {8{be[3]}}, {8{be[2]}}, {8{be[1]}}, {8{be[0]}} };
  assign word_q = mem[addr[10:2]];
  assign rdata  = word_q;

  always_comb begin
    word_d = (word_q & ~wmask) | (wdata & wmask);
  end

  always_ff @(posedge clk) begin
    if (wren) mem[addr[10:2]] <= word_d;
  end
endmodule
