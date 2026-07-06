`timescale 1ns/1ps

module rca_tb;

reg [3:0] a;
reg [3:0] b;
reg cin;

wire [3:0] sum;
wire cout;

rca DUT(
    a,
    b,
    cin,
    sum,
    cout
);

initial
begin

    $dumpfile("rca_tb.vcd");
    $dumpvars(0, rca_tb);

    a = 4'b0011;
    b = 4'b0010;
    cin = 0;
    #10;

    a = 4'b0101;
    b = 4'b0011;
    cin = 0;
    #10;

    a = 4'b1111;
    b = 4'b0001;
    cin = 0;
    #10;

    a = 4'b1001;
    b = 4'b0110;
    cin = 0;
    #10;

    a = 4'b0111;
    b = 4'b0111;
    cin = 1;
    #10;

    $finish;

end

initial
begin

    $monitor(
        "Time=%0t a=%b b=%b cin=%b sum=%b cout=%b",
        $time,
        a,
        b,
        cin,
        sum,
        cout
    );

end

endmodule