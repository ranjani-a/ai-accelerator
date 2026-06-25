module counter_tb;

reg clk;
reg reset;
wire [3:0] count;

counter dut(
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0, counter_tb);

    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10;

    reset = 0;
    #50;

    reset = 1;
    #10;

    reset = 0;
    #30;

    $finish;
end

endmodule