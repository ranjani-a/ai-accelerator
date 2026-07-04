module vending_machine_tb;

reg clk;
reg reset;
reg coin5;
reg coin10;

wire dispense;

vending_machine dut(
    .clk(clk),
    .reset(reset),
    .coin5(coin5),
    .coin10(coin10),
    .dispense(dispense)
);

initial begin
    $dumpfile("vending_machine_tb.vcd");
    $dumpvars(0,vending_machine_tb);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    reset = 1;
    coin5 = 0;
    coin10 = 0;

    #10;
    reset = 0;

    // Insert ₹5
    #10;
    coin5 = 1;
    #10;
    coin5 = 0;

    // Insert another ₹5
    #10;
    coin5 = 1;
    #10;
    coin5 = 0;

    // Insert ₹10 directly
    #20;
    coin10 = 1;
    #10;
    coin10 = 0;

    #20;

    $finish;

end

initial begin
    $monitor(
        "Time=%0t coin5=%b coin10=%b dispense=%b",
        $time,
        coin5,
        coin10,
        dispense
    );
end

endmodule