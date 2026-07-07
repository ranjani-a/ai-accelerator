`timescale 1ns/1ps

module signed_multiplier4_tb;

reg signed [3:0] a;
reg signed [3:0] b;

wire signed [7:0] product;

signed_multiplier4 DUT(
    a,
    b,
    product
);

initial
begin

    $dumpfile("signed_multiplier4_tb.vcd");
    $dumpvars(0, signed_multiplier4_tb);

    a = 4'sd3;
    b = 4'sd2;
    #10;

    a = -4'sd2;
    b = 4'sd3;
    #10;

    a = -4'sd3;
    b = -4'sd2;
    #10;

    a = -4'sd8;
    b = 4'sd1;
    #10;

    a = 4'sd7;
    b = -4'sd1;
    #10;

    a = -4'sd4;
    b = -4'sd2;
    #10;

    $finish;

end

initial
begin

    $monitor(
        "Time=%0t  A=%0d  B=%0d  Product=%0d",
        $time,
        a,
        b,
        product
    );

end

endmodule
