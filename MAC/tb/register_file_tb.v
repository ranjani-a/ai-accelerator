module register_file_tb;

reg clk;
reg we;

reg [2:0] write_addr;
reg [15:0] write_data;

reg [2:0] read_addr1;
reg [2:0] read_addr2;

wire [15:0] read_data1;
wire [15:0] read_data2;

// Instantiate Register File
register_file uut(
    .clk(clk),
    .we(we),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    $dumpfile("register_file_tb.vcd");
    $dumpvars(0, register_file_tb);

    clk = 0;
    we = 0;
    write_addr = 0;
    write_data = 0;
    read_addr1 = 0;
    read_addr2 = 0;

    // Write 25 into R1
    #5;
    we = 1;
    write_addr = 3'b001;
    write_data = 16'd25;

    #10;

    // Write 90 into R4
    write_addr = 3'b100;
    write_data = 16'd90;

    #10;

    // Stop writing
    we = 0;

    // Read R1 and R4
    read_addr1 = 3'b001;
    read_addr2 = 3'b100;

    #10;

    // Read R4 and R1
    read_addr1 = 3'b100;
    read_addr2 = 3'b001;

    #10;

    $finish;
end

initial
begin
    $monitor("Time=%0t WE=%b WAddr=%d WData=%d | RAddr1=%d RData1=%d | RAddr2=%d RData2=%d",
              $time,
              we,
              write_addr,
              write_data,
              read_addr1,
              read_data1,
              read_addr2,
              read_data2);
end

endmodule