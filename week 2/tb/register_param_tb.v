module register_param_tb;

reg clk;
reg reset;
reg [7:0] d;
wire [7:0] q;

register_param #(8) dut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    $dumpfile("register_param_tb.vcd");
    $dumpvars(0, register_param_tb);

    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    d = 8'h00;
    #10;

    reset = 0;
    d = 8'h55;
    #10;

    d = 8'hA3;
    #10;

    d = 8'hF0;
    #10;

    reset = 1;
    #10;

    reset = 0;
    d = 8'h3C;
    #10;

    $finish;
end

endmodule