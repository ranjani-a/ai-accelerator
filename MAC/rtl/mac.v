module mac(
    input clk,
    input rst,
    input signed [7:0] A,
    input signed [7:0] B,
    output reg signed [15:0] accumulator
);

always @(posedge clk)
begin
    if(rst)
        accumulator <= 16'sd0;
    else
        accumulator <= accumulator + (A * B);
end

endmodule