
module adder_sub4_tb;

reg [3:0] a;
reg [3:0] b;
reg sub;

wire [3:0] result;
wire cout;

adder_sub4 dut(
    .a(a),
    .b(b),
    .sub(sub),
    .result(result),
    .cout(cout)
);

initial begin
    $dumpfile("adder_sub4_tb.vcd");
    $dumpvars(0, adder_sub4_tb);

    a = 4'b0011;
    b = 4'b0010;
    sub = 0;
    #10;

    a = 4'b0110;
    b = 4'b0011;
    sub = 0;
    #10;

    a = 4'b0110;
    b = 4'b0011;
    sub = 1;
    #10;

    a = 4'b1000;
    b = 4'b0010;
    sub = 1;
    #10;

    a = 4'b1111;
    b = 4'b0001;
    sub = 0;
    #10;

    a = 4'b0101;
    b = 4'b0111;
    sub = 1;
    #10;

    $finish;
end

initial begin
    $monitor(
        "Time=%0t | a=%b | b=%b | sub=%b | result=%b | cout=%b",
        $time,
        a,
        b,
        sub,
        result,
        cout
    );
end

endmodule