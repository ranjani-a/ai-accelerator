`timescale 1ns/1ps

module mac_verify_tb;

reg clk;
reg rst;

reg signed [7:0] A;
reg signed [7:0] B;

wire signed [15:0] accumulator;

// Golden reference model
reg signed [15:0] expected;

integer i;

// DUT
mac DUT(
    clk,
    rst,
    A,
    B,
    accumulator
);

// Clock generation
always
begin
    #5 clk = ~clk;
end

initial
begin

    $dumpfile("mac_verify_tb.vcd");
    $dumpvars(0, mac_verify_tb);

    clk = 0;
    rst = 1;
    A = 0;
    B = 0;
    expected = 0;

    // Reset
    #10;
    rst = 0;

    // ---------- Directed Tests ----------

    A = 8'sd2;
    B = 8'sd3;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : %0d", accumulator);
    else
        $display("FAIL : Expected=%0d Actual=%0d", expected, accumulator);

    A = -8'sd2;
    B = 8'sd4;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : %0d", accumulator);
    else
        $display("FAIL : Expected=%0d Actual=%0d", expected, accumulator);

    A = -8'sd3;
    B = -8'sd5;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : %0d", accumulator);
    else
        $display("FAIL : Expected=%0d Actual=%0d", expected, accumulator);

    // ---------- Corner Cases ----------

    A = 0;
    B = 0;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : Zero Test");
    else
        $display("FAIL : Zero Test");

    A = 8'sd127;
    B = 8'sd1;
    expected = expected + (A * B);
    #10;

    if(accumulator == expected)
        $display("PASS : Max Positive");
    else
        $display("FAIL : Max Positive");

    // ---------- Random Tests ----------

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
    $display("Verification Complete");
    $display("--------------------------------");

    $finish;

end

endmodule
