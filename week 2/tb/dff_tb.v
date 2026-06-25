module dff_tb;
reg clk,d;
wire q;

dff dut(
    .clk(clk),
    .d(d),
    .q(q)
);

initial
begin
    $dumpfile("dff_tb.vcd");
    $dumpvars(0,dff_tb);

    clk = 0;
    forever 
        #5 clk = ~clk;      
    end

    initial begin
        d=0;
        #10 d=1;
        #10 d=0;
        #10 d=1;
        #10
        $finish;
    end
    endmodule
    

