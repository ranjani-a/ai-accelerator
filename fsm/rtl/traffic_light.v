module traffic_light(
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

parameter RED = 2'b00;
parameter GREEN = 2'b01;
parameter YELLOW = 2'b10;

reg [1:0] state, next_state;
reg timer;

always @(posedge clk)
begin
    if (reset)
        state <= RED;
    else
        state <= next_state;
end

always @(posedge clk)
begin
    if (reset)
        timer <= 0;
    else
        timer <= ~timer;
end

always @(*)
begin
    case(state)

        RED:
            if (timer)
                next_state = GREEN;
            else
                next_state = RED;

        GREEN:
            if (timer)
                next_state = YELLOW;
            else
                next_state = GREEN;

        YELLOW:
            if (timer)
                next_state = RED;
            else
                next_state = YELLOW;

        default:
            next_state = RED;

    endcase
end

always @(*)
begin
    red = 0;
    yellow = 0;
    green = 0;

    case(state)

        RED:
            red = 1;

        GREEN:
            green = 1;

        YELLOW:
            yellow = 1;

    endcase
end

endmodule