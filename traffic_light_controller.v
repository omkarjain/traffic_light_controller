module traffic_light_controller (
    input clk,
    input reset,
    output reg [1:0] ns_light,
    output reg [1:0] ew_light
);

    // State encoding using parameters
    parameter NS_GREEN  = 2'b00;
    parameter NS_YELLOW = 2'b01;
    parameter EW_GREEN  = 2'b10;
    parameter EW_YELLOW = 2'b11;

    reg [1:0] state;
    reg [2:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= NS_GREEN;
            counter <= 3'd0;
        end else begin
            if ((state == NS_GREEN || state == EW_GREEN) && counter == 3'd4) begin
                if (state == NS_GREEN)
                    state <= NS_YELLOW;
                else
                    state <= EW_YELLOW;
                counter <= 3'd0;
            end else if ((state == NS_YELLOW || state == EW_YELLOW) && counter == 3'd1) begin
                if (state == NS_YELLOW)
                    state <= EW_GREEN;
                else
                    state <= NS_GREEN;
                counter <= 3'd0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    always @(*) begin
        case (state)
            NS_GREEN: begin
                ns_light = 2'b10;
                ew_light = 2'b00;
            end
            NS_YELLOW: begin
                ns_light = 2'b01;
                ew_light = 2'b00;
            end
            EW_GREEN: begin
                ns_light = 2'b00;
                ew_light = 2'b10;
            end
            EW_YELLOW: begin
                ns_light = 2'b00;
                ew_light = 2'b01;
            end
            default: begin
                ns_light = 2'b00;
                ew_light = 2'b00;
            end
        endcase
    end

endmodule
