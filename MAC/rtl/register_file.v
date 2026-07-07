module register_file(
    input clk,
    input we,

    input [2:0] write_addr,
    input [15:0] write_data,

    input [2:0] read_addr1,
    input [2:0] read_addr2,

    output [15:0] read_data1,
    output [15:0] read_data2
);

    // 8 registers, each 16 bits wide
    reg [15:0] registers [0:7];

    // Sequential Write
    always @(posedge clk)
    begin
        if (we)
            registers[write_addr] <= write_data;
    end

    // Combinational Read
    assign read_data1 = registers[read_addr1];
    assign read_data2 = registers[read_addr2];

endmodule
