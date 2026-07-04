module fsm_toggle(
    input clk,
    input reset,
    input x,
    output reg y
);

reg state;

parameter S0 = 1'b0;
parameter S1 = 1'b1;

always @(posedge clk)
begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

reg next_state;

always @(*)
begin
    case(state)

        S0:
            if(x)
                next_state = S1;
            else
                next_state = S0;

        S1:
            if(x)
                next_state = S1;
            else
                next_state = S0;

    endcase
end

always @(*)
begin
    case(state)

        S0: y = 0;
        S1: y = 1;

    endcase
end

endmodule