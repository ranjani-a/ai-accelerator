module register_tb;

reg clk;
reg reset;
reg [7:0] d;
wire [7:0] q;

register dut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    $dumpfile("register_tb.vcd");
    $dumpvars(0, register_tb);

    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    d = 8'b00000000;
    #10;

    reset = 0;
    d = 8'b10101010;
    #10;

    d = 8'b11110000;
    #10;

    d = 8'b00001111;
    #10;

    reset = 1;
    #10;

    reset = 0;
    d = 8'b11001100;
    #10;

    $finish;
end

endmodule