module mac_parameterized
#(
    parameter WIDTH = 8
)
(
    input clk,
    input rst,

    input signed [WIDTH-1:0] A,
    input signed [WIDTH-1:0] B,

    output reg signed [(2*WIDTH)-1:0] accumulator
);

always @(posedge clk)
begin
    if(rst)
        accumulator <= 0;
    else
        accumulator <= accumulator + (A * B);
end

endmodule