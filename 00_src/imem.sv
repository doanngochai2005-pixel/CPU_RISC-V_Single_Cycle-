module imem (
  input  logic [31:0] addr,     
  output logic [31:0] rdata
);
  logic [31:0] mem [0:2047];

  initial begin
    $readmemh("./../02_test/isa_4b.hex", mem);
  end

  assign rdata = mem[addr[12:2]]; 
endmodule
