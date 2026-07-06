module adder_sub4(
    input [3:0] a,
    input [3:0] b,
    input sub,
    output [3:0] result,
    output cout
);

wire [3:0] b_in;

assign b_in = b ^ {4{sub}};

assign {cout, result} = a + b_in + sub;

endmodule

//subtraction is done using 2s complement addition. addition if sub=0 & subtraction if sub=1
// during subtraction, b_in will flip all the bits and then 2s complement addition is performed in the next step