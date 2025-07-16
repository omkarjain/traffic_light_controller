`timescale 1ns/1ps

module tb_traffic_light;

    reg clk;
    reg reset;
    wire [1:0] ns_light;
    wire [1:0] ew_light;

    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("output_waveform.vcd");
        $dumpvars(0, tb_traffic_light);

        $display("Time\tNS\tEW");
        $monitor("%0t\t%b\t%b", $time, ns_light, ew_light);

        reset = 1;
        #10;
        reset = 0;

        #200;

        $finish;
    end

endmodule
