module fsm_toggle_tb;

reg clk;
reg reset;
reg x;
wire y;

fsm_toggle dut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

initial begin
    $dumpfile("fsm_toggle_tb.vcd");
    $dumpvars(0, fsm_toggle_tb);

    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    x = 0;
    #10;

    reset = 0;
    x = 0;
    #10;

    x = 1;
    #10;

    x = 1;
    #10;

    x = 0;
    #10;

    x = 1;
    #10;

    x = 0;
    #10;

    $finish;
end

endmodule