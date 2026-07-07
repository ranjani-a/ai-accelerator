module signed_multiplier4(
    a,
    b,
    product
);

input signed [3:0] a;
input signed [3:0] b;

output signed [7:0] product;

assign product = a * b;

endmodule