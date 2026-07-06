module multiplier2(
    a,
    b,
    product
);

input [1:0] a;
input [1:0] b;

output [3:0] product;

wire p0;
wire p1;
wire p2;
wire p3;

wire carry;

assign p0 = a[0] & b[0];
assign p1 = a[1] & b[0];
assign p2 = a[0] & b[1];
assign p3 = a[1] & b[1];

assign product[0] = p0;

assign product[1] = p1 ^ p2;

assign carry = p1 & p2;

assign product[2] = p3 ^ carry;

assign product[3] = p3 & carry;

endmodule