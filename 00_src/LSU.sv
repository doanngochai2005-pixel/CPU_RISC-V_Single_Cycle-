module LSU (
    input  logic         clk, reset,
    input  logic [31:0]  i_lsu_addr,
    input  logic [31:0]  i_st_data,
    input  logic         i_lsu_wren,
    input  logic [2:0]   i_funct3,
    input  logic [31:0]  i_io_sw,
    input  logic [31:0]  dmem_rdata,
    output logic [31:0]  o_ld_data,
    output logic [31:0]  o_io_ledr,
    output logic [31:0]  o_io_ledg,
    output logic [6:0]   o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3, o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7,
    output logic [31:0]  o_io_lcd,
    output logic [3:0]   dmem_be,
    output logic [31:0]  dmem_wdata,
    output logic         dmem_wren
);

logic [31:0] addr;
logic is_memory, is_red_led, is_green_led, is_sw, is_lcd, is_hex_low, is_hex_high;


always_comb begin
    addr = i_lsu_addr;
    is_memory    = ~(|(addr[31:11] ^ 21'b0));
    is_red_led   = ~(|(addr[31:12] ^ 20'h10000));
    is_green_led = ~(|(addr[31:12] ^ 20'h10001));
    is_sw        = ~(|(addr[31:12] ^ 20'h10010));
    is_lcd       = ~(|(addr[31:12] ^ 20'h10004));
    is_hex_low   = ~(|(addr[31:12] ^ 20'h10002));
    is_hex_high  = ~(|(addr[31:12] ^ 20'h10003));
end

assign dmem_wren = i_lsu_wren & is_memory;


        always_comb begin
        dmem_wdata = i_st_data; // Default: pass through
        
        case (i_funct3[1:0])
            2'b00: begin // SB - Store Byte
                case (addr[1:0])
                    2'b00: dmem_wdata = {24'b0, i_st_data[7:0]};
                    2'b01: dmem_wdata = {16'b0, i_st_data[7:0], 8'b0};
                    2'b10: dmem_wdata = {8'b0, i_st_data[7:0], 16'b0};
                    2'b11: dmem_wdata = {i_st_data[7:0], 24'b0};
                    default: dmem_wdata = i_st_data;
                endcase
            end
            2'b01: begin // SH - Store Halfword
                case (addr[1])
                    1'b0: dmem_wdata = {16'b0, i_st_data[15:0]};       // Aligned at byte 0,1
                    //2'b01: dmem_wdata = {8'b0, i_st_data[15:0], 8'b0};  // Misaligned at byte 1,2
                    1'b1: dmem_wdata = {i_st_data[15:0], 16'b0};       // Aligned at byte 2,3
                    //2'b11: dmem_wdata = {i_st_data[7:0], 16'h0000, i_st_data[15:8]};      // Misaligned - fallback to 2,3
                    //default: dmem_wdata = i_st_data;
                endcase
            end
            default: dmem_wdata = i_st_data; // SW - Store Word
        endcase
    end
assign dmem_be = calc_byte_enable(i_funct3, addr[1:0]);

always_comb begin
    if (~i_lsu_wren) begin
        if (is_memory) begin
            case (i_funct3)
                3'b000: begin
                    case (addr[1:0])
                        2'b00: o_ld_data = {{24{dmem_rdata[7]}}, dmem_rdata[7:0]};
                        2'b01: o_ld_data = {{24{dmem_rdata[15]}}, dmem_rdata[15:8]};
                        2'b10: o_ld_data = {{24{dmem_rdata[23]}}, dmem_rdata[23:16]};
                        2'b11: o_ld_data =  {{24{dmem_rdata[31]}}, dmem_rdata[31:24]};
                         default: o_ld_data = dmem_rdata;
                    endcase
                end
                3'b001: begin
                    case (addr[1:0])
                        2'b00: o_ld_data = {{16{dmem_rdata[15]}}, dmem_rdata[15:0]};
                        2'b01: o_ld_data = {{16{dmem_rdata[23]}}, dmem_rdata[23:8]};
                        2'b10: o_ld_data = {{16{dmem_rdata[31]}}, dmem_rdata[31:16]};
                        2'b11: o_ld_data = {{16{dmem_rdata[7]}}, dmem_rdata[7:0], dmem_rdata[31:24] };
                    default: o_ld_data = dmem_rdata;
                    endcase
                end
                3'b010: o_ld_data = dmem_rdata;
                3'b100: begin
                    case (addr[1:0])
                        2'b00: o_ld_data = {24'b0, dmem_rdata[7:0]};
                        2'b01: o_ld_data = {24'b0, dmem_rdata[15:8]};
                        2'b10: o_ld_data = {24'b0, dmem_rdata[23:16]};
                        2'b11: o_ld_data = {24'b0, dmem_rdata[31:24]};
                         default: o_ld_data = dmem_rdata;
                    endcase
                end
                3'b101: begin
                    case (addr[1:0])
                        2'b00: o_ld_data = {16'b0, dmem_rdata[15:0]};
                        2'b01: o_ld_data = {16'b0, dmem_rdata[23:8]};
                        2'b10: o_ld_data = {16'b0, dmem_rdata[31:16]};
                        2'b11: o_ld_data = {16'h0000, dmem_rdata[7:0], dmem_rdata[31:24]};
                         default: o_ld_data = dmem_rdata;
                    endcase
                end
                default: o_ld_data = dmem_rdata;
            endcase
        end else if (is_sw) begin
            o_ld_data = i_io_sw;
        end else begin
            o_ld_data = 32'b0;
        end
    end else begin
        o_ld_data = 32'b0;
    end
end

always_ff @(posedge clk) begin
    if (reset) begin
        o_io_ledr <= 32'b0;
        o_io_ledg <= 32'b0;
        o_io_lcd <= 32'b0;
        o_io_hex0 <= 7'b0; o_io_hex1 <= 7'b0; o_io_hex2 <= 7'b0; o_io_hex3 <= 7'b0;
        o_io_hex4 <= 7'b0; o_io_hex5 <= 7'b0; o_io_hex6 <= 7'b0; o_io_hex7 <= 7'b0;
    end else if (i_lsu_wren) begin
        if (is_red_led) o_io_ledr[16:0] <= i_st_data[16:0];
        if (is_green_led) o_io_ledg[7:0] <= i_st_data[7:0];
        if (is_lcd) o_io_lcd <= {1'b1, 20'b0, i_st_data[10:0]};
        if (is_hex_low) begin
            case (addr[3:2])
                2'b00: o_io_hex0 <= i_st_data[6:0];
                2'b01: o_io_hex1 <= i_st_data[6:0];
                2'b10: o_io_hex2 <= i_st_data[6:0];
                2'b11: o_io_hex3 <= i_st_data[6:0];
            endcase
        end
        if (is_hex_high) begin
            case (addr[3:2])
                2'b00: o_io_hex4 <= i_st_data[6:0];
                2'b01: o_io_hex5 <= i_st_data[6:0];
                2'b10: o_io_hex6 <= i_st_data[6:0];
                2'b11: o_io_hex7 <= i_st_data[6:0];
            endcase
        end
    end
end

function logic [3:0] calc_byte_enable(input [2:0] funct3, input [1:0] al);
    case (funct3)
        3'b000: begin 
            case (al)
                2'b00: calc_byte_enable = 4'b0001;
                2'b01: calc_byte_enable = 4'b0010;
                2'b10: calc_byte_enable = 4'b0100;
			    2'b11: calc_byte_enable = 4'b1000;
                default: calc_byte_enable = 4'b0001; 
            endcase
            end 
      3'b001: begin // SH - Store Halfword
            case (al[1])
                1'b0: calc_byte_enable = 4'b0011; // Byte 0,1
                // 2'b01: calc_byte_enable = 4'b0110; // Byte 1,2
                1'b1: calc_byte_enable = 4'b1100;  //Byte 2,3
                //2'b11: calc_byte_enable = 4'b1001; // Wrap around: byte 0 and 3(misaligned)
                //default: calc_byte_enable = 4'b0011;
            endcase
        end
        3'b010: calc_byte_enable = 4'b1111;
        default: calc_byte_enable = 4'b1111;
    endcase
endfunction

endmodule
