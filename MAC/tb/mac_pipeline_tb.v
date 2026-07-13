`timescale 1ns/1ps

module mac_pipeline_tb;

reg clk;
reg rst;

reg signed [7:0] A;
reg signed [7:0] B;

wire signed [15:0] accumulator;

mac_pipeline DUT(
    clk,
    rst,
    A,
    B,
    accumulator
);

always
begin
    #5 clk = ~clk;
end

initial
begin

    clk = 0;
    rst = 1;
    A = 0;
    B = 0;

    #10;
    rst = 0;

    A = 8'sd2;
    B = 8'sd3;
    #10;

    A = 8'sd4;
    B = 8'sd5;
    #10;

    A = -8'sd2;
    B = 8'sd6;
    #10;

    A = 8'sd3;
    B = -8'sd4;
    #10;

    A = -8'sd2;
    B = -8'sd3;
    #10;

    $finish;

end

initial
begin

    $dumpfile("mac_pipeline_tb.vcd");
    $dumpvars(0, mac_pipeline_tb);

    $monitor(
        "Time=%0t  A=%0d  B=%0d  ProductReg=%0d  Acc=%0d",
        $time,
        A,
        B,
        DUT.product_reg,
        accumulator
    );

end

endmodule