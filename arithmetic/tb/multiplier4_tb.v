`timescale 1ns/1ps

module multiplier4_tb;

reg [3:0] a;
reg [3:0] b;

wire [7:0] product;

multiplier4 DUT(
    a,
    b,
    product
);

initial
begin

    $dumpfile("multiplier4_tb.vcd");
    $dumpvars(0, multiplier4_tb);

    a = 4'd0;
    b = 4'd0;
    #10;

    a = 4'd3;
    b = 4'd2;
    #10;

    a = 4'd5;
    b = 4'd4;
    #10;

    a = 4'd7;
    b = 4'd8;
    #10;

    a = 4'd10;
    b = 4'd5;
    #10;

    a = 4'd15;
    b = 4'd15;
    #10;

    $finish;

end

initial
begin

    $monitor(
        "Time=%0t  a=%d  b=%d  product=%d",
        $time,
        a,
        b,
        product
    );

end

endmodule
