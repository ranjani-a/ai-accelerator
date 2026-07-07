module alu8_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;

wire [7:0] result;
wire carry;
wire zero;

alu8 DUT(
    A,
    B,
    opcode,
    result,
    carry,
    zero
);

initial
begin

    $dumpfile("alu8_tb.vcd");
    $dumpvars(0, alu8_tb);

    A = 8'd15;
    B = 8'd10;
    opcode = 3'b000;
    #10;

    A = 8'd15;
    B = 8'd5;
    opcode = 3'b001;
    #10;

    A = 8'b11001100;
    B = 8'b10101010;
    opcode = 3'b010;
    #10;

    A = 8'b11001100;
    B = 8'b10101010;
    opcode = 3'b011;
    #10;

    A = 8'b11001100;
    B = 8'b10101010;
    opcode = 3'b100;
    #10;

    A = 8'b11001100;
    B = 8'd0;
    opcode = 3'b101;
    #10;

    A = 8'd25;
    B = 8'd0;
    opcode = 3'b110;
    #10;

    A = 8'd25;
    B = 8'd0;
    opcode = 3'b111;
    #10;

    A = 8'd5;
    B = 8'd5;
    opcode = 3'b001;
    #10;

    $finish;

end

initial
begin

    $monitor(
        "Time=%0t  Opcode=%b  A=%d  B=%d  Result=%d  Carry=%b  Zero=%b",
        $time,
        opcode,
        A,
        B,
        result,
        carry,
        zero
    );

end

endmodule
