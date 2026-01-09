`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2026 08:56:16 PM
// Design Name: 
// Module Name: PISO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_block_piso (
    input  logic        clk,
    input  logic        rst,
    input  logic        load,
    input  logic [3:0]  parallel_in,
    output logic        serial_out
);

    logic [3:0] q;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 4'b0000;
        end
        else if (load) begin
            q <= parallel_in;         
        end
        else begin
               q <= {q[2:0], 1'b0};      
        end
    end

    assign serial_out = q[3];        

endmodule

