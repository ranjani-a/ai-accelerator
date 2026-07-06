
module multiplier2_tb;

reg [1:0] a;
reg [1:0] b;

wire [3:0] product;

multiplier2 DUT(
    a,
    b,
    product
);

initial
begin

    $dumpfile("multiplier2_tb.vcd");
    $dumpvars(0,multiplier2_tb);

    a = 2'b00; b = 2'b00; #10;
    a = 2'b01; b = 2'b01; #10;
    a = 2'b01; b = 2'b10; #10;
    a = 2'b10; b = 2'b10; #10;
    a = 2'b10; b = 2'b11; #10;
    a = 2'b11; b = 2'b11; #10;

    $finish;

end

initial
begin

    $monitor(
        "Time=%0t a=%b b=%b product=%b",
        $time,
        a,
        b,
        product
    );

end

endmodule