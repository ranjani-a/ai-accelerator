module vending_machine(
    input clk,
    input reset,
    input coin5,
    input coin10,
    output reg dispense
);

parameter S0  = 2'b00;
parameter S5  = 2'b01;
parameter S10 = 2'b10;

reg [1:0] state, next_state;

always @(posedge clk)
begin
    if(reset)
        state <= S0;
    else
        state <= next_state;
end

always @(*)
begin
    case(state)

        S0:
            if(coin10)
                next_state = S10;
            else if(coin5)
                next_state = S5;
            else
                next_state = S0;

        S5:
            if(coin5 || coin10)
                next_state = S10;
            else
                next_state = S5;

        S10:
            next_state = S0;

        default:
            next_state = S0;

    endcase
end

always @(*)
begin
    case(state)

        S0:
            dispense = 0;

        S5:
            dispense = 0;

        S10:
            dispense = 1;

        default:
            dispense = 0;

    endcase
end

endmodule