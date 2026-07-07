module alu8(
    A,
    B,
    opcode,
    result,
    carry,
    zero
);

input [7:0] A;
input [7:0] B;
input [2:0] opcode;

output reg [7:0] result;
output reg carry;
output reg zero;

reg [8:0] temp;

always @(*)
begin

    carry = 0;

    case(opcode)

        3'b000:
        begin
            temp = A + B;
            result = temp[7:0];
            carry = temp[8];
        end

        3'b001:
        begin
            temp = A - B;
            result = temp[7:0];
            carry = temp[8];
        end

        3'b010:
        begin
            result = A & B;
        end

        3'b011:
        begin
            result = A | B;
        end

        3'b100:
        begin
            result = A ^ B;
        end

        3'b101:
        begin
            result = ~A;
        end

        3'b110:
        begin
            result = A << 1;
        end

        3'b111:
        begin
            result = A >> 1;
        end

        default:
        begin
            result = 8'b00000000;
        end

    endcase

    if(result == 8'b00000000)
        zero = 1;
    else
        zero = 0;

end

endmodule
