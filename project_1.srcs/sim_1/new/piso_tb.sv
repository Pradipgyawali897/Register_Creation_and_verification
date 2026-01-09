`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2026 07:38:19 AM
// Design Name: 
// Module Name: piso_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for 4-bit PISO (Parallel In Serial Out) shift register
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module piso_tb;

    logic clk;
    logic rst;
    logic load;
    logic [3:0] parallel_in;
    logic serial_out;

    reg_block_piso dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        load = 0;
        parallel_in = 4'b0000;
        #1;
        repeat(2) @(posedge clk);
        rst = 0;

        // Load parallel data
        @(posedge clk);
        parallel_in = 4'b1011;
        load = 1;
        @(posedge clk);
        load = 0;
        
        // Shift out the data serially
        repeat(4) @(posedge clk);
        
        // Load another parallel data
        @(posedge clk);
        parallel_in = 4'b1101;
        load = 1;
        @(posedge clk);
        load = 0;
        
        // Shift out the data serially
        repeat(4) @(posedge clk);

        #50;
        $finish;
    end

    always @(posedge clk) begin
        $display("Time=%0t | rst=%b | load=%b | parallel_in=%b | serial_out=%b", 
                 $time, rst, load, parallel_in, serial_out);
    end

endmodule

