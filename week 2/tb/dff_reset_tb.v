module dff_reset_tb;

reg clk;
reg reset;
reg d;
wire q;

dff_reset dut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    $dumpfile("dff_reset_tb.vcd");
    $dumpvars(0, dff_reset_tb);

    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    d = 0;
    #10;

    reset = 0;
    d = 1;
    #10;

    d = 0;
    #10;

    d = 1;
    #10;

    reset = 1;
    #10;

    reset = 0;
    d = 0;
    #10;

    $finish;
end

endmodule