

module mac_parameterized_tb;

parameter WIDTH = 8;

reg clk;
reg rst;

reg signed [WIDTH-1:0] A;
reg signed [WIDTH-1:0] B;

wire signed [(2*WIDTH)-1:0] accumulator;

reg signed [(2*WIDTH)-1:0] expected;

integer i;

// DUT
mac_parameterized
#(
    .WIDTH(WIDTH)
)
DUT
(
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .accumulator(accumulator)
);

// Clock Generation
always
begin
    #5 clk = ~clk;
end

initial
begin

    $dumpfile("mac_parameterized_tb.vcd");
    $dumpvars(0, mac_parameterized_tb);

    clk = 0;
    rst = 1;
    A = 0;
    B = 0;
    expected = 0;

    // Reset
    #10;
    rst = 0;

    // -------------------------
    // Directed Tests
    // -------------------------

    A = 2;
    B = 3;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : %0d", accumulator);
    else
        $display("FAIL : Expected=%0d Actual=%0d", expected, accumulator);

    A = -2;
    B = 4;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : %0d", accumulator);
    else
        $display("FAIL : Expected=%0d Actual=%0d", expected, accumulator);

    A = -3;
    B = -5;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : %0d", accumulator);
    else
        $display("FAIL : Expected=%0d Actual=%0d", expected, accumulator);

    // -------------------------
    // Corner Cases
    // -------------------------

    A = 0;
    B = 0;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : Zero Test");
    else
        $display("FAIL : Zero Test");

    A = 127;
    B = 1;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : Max Positive");
    else
        $display("FAIL : Max Positive");

    A = -128;
    B = 1;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : Max Negative");
    else
        $display("FAIL : Max Negative");

    // -------------------------
    // Random Tests
    // -------------------------

    for(i = 0; i < 20; i = i + 1)
    begin

        A = $random;
        B = $random;

        expected = expected + (A * B);

        #10;

        if(accumulator == expected)
            $display("PASS");
        else
            $display("FAIL : Expected=%0d Actual=%0d",
                     expected,
                     accumulator);

    end

    $display("--------------------------------");
    $display("Parameterized MAC Verification Complete");
    $display("--------------------------------");

    $finish;

end

endmodule

