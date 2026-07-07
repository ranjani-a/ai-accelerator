module mac(
    input clk,
    input rst,
    input [7:0] A,
    input [7:0] B,
    output reg [15:0] accumulator
);

always @(posedge clk)
begin
    if (rst)
        accumulator <= 16'd0;
    else
        accumulator <= accumulator + (A * B);
end

endmodule
