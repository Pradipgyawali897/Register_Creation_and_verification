`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2026 07:38:19 AM
// Design Name: 
// Module Name: siso_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for 4-bit SISO (Serial In Serial Out) shift register
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module siso_tb;

    logic clk;
    logic rst_n;
    logic si;
    logic so;

    reg_block_siso dut (
        .clk(clk),
        .rst_n(rst_n),
        .si(si),
        .so(so)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst_n = 0;
        si = 0;
        #1;
        repeat(2) @(posedge clk);
        rst_n = 1;

        @(posedge clk) si = 1;
        @(posedge clk) si = 0;
        @(posedge clk) si = 1;
        @(posedge clk) si = 1;
        @(posedge clk) si = 0;
        @(posedge clk) si = 1;
        @(posedge clk) si = 0;
        @(posedge clk) si = 0;

        #50;
        $finish;
    end

    always @(posedge clk) begin
        $display("Time=%0t | rst_n=%b | si=%b | so=%b", $time, rst_n, si, so);
    end

endmodule

