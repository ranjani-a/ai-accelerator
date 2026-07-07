`timescale 1ns/1ps

module mac_tb;

reg clk;
reg rst;
reg [7:0] A;
reg [7:0] B;

wire [15:0] accumulator;

// Instantiate the MAC
mac uut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .accumulator(accumulator)
);

// Clock Generation (10 ns period)
always #5 clk = ~clk;

initial
begin
    // Initialize
    clk = 0;
    rst = 1;
    A = 0;
    B = 0;

    // Apply Reset
    #10;
    rst = 0;

    // Test 1 : 5 × 4 = 20
    A = 8'd5;
    B = 8'd4;
    #10;

    // Test 2 : 3 × 6 = 18
    A = 8'd3;
    B = 8'd6;
    #10;

    // Test 3 : 2 × 10 = 20
    A = 8'd2;
    B = 8'd10;
    #10;

    // Test 4 : 15 × 15 = 225
    A = 8'd15;
    B = 8'd15;
    #10;

    // Test 5 : 1 × 100 = 100
    A = 8'd1;
    B = 8'd100;
    #10;

    $finish;
end

// Monitor values
initial
begin
    $display("Time\tA\tB\tAccumulator");
    $monitor("%0t\t%d\t%d\t%d", $time, A, B, accumulator);
end

endmodule
