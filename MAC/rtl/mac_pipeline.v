module mac_pipeline(
    clk,
    rst,
    A,
    B,
    accumulator
);

input clk;
input rst;

input signed [7:0] A;
input signed [7:0] B;

output reg signed [15:0] accumulator;

reg signed [15:0] product_reg;

always @(posedge clk)
begin

    if(rst)
    begin
        product_reg <= 16'sd0;
        accumulator <= 16'sd0;
    end

    else
    begin
        product_reg <= A * B;
        accumulator <= accumulator + product_reg;
    end

end

endmodule