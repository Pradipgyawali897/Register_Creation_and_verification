`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2026 12:17:53 AM
// Design Name: SISO Shift Register
// Module Name: reg_block
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 4-bit Serial In Serial Out Shift Register
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_block(
    input  logic clk,
    input  logic rst_n,
    input  logic sin,
    output logic [3:0] out
);

    logic [3:0] q;

    always_ff @(posedge clk or posedge rst_n) begin
        if (rst_n)
            q <= 4'b0000;
        else
            q <= {q[2:0], sin};  
    end

    assign out = q;

endmodule
