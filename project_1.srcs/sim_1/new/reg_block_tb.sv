`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2026 07:38:19 AM
// Design Name: 
// Module Name: siso_shift_reg_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for 4-bit SISO shift register
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module siso_shift_reg_tb;

    logic clk;
    logic rst;
    logic si;
    logic [3:0] so;

    reg_block dut (
        .clk(clk),
        .rst_n(rst),
        .sin(si),
        .out(so)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        si = 0;
        #1;
        repeat(2) @(posedge clk);
        rst = 0;

        @(posedge clk) si = 1;
        @(posedge clk) si = 0;
        @(posedge clk) si = 1;
        @(posedge clk) si = 1;
        @(posedge clk) si = 0;

        #50;
        $finish;
    end

    always @(posedge clk) begin
        $display("Time=%0t | rst=%b | si=%b | out=%b", $time, rst, si, so);
    end

endmodule


