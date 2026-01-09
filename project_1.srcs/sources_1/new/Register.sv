`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2026 11:49:02 PM
// Design Name: 
// Module Name: Register
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


module reg_block_siso(
    input logic clk,
    input logic rst_n,
    input logic si,
    output logic so
);

    logic [3:0] q;
    
    always_ff @(posedge clk or negedge rst_n) begin 
        if(!rst_n)
            q <= 4'b0000;        
        else
            q <= {q[2:0], si};  
    end
        
    assign so = q[3];
    
endmodule

