`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 11:58:01 AM
// Design Name: 
// Module Name: counter
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


module counter #(parameter N = 1) 
    (
    input clk, rst,
    output [1:0] msbs
    );
    
    wire [N-1:0] Q_reg, Q_next;
    assign Q_next = Q_reg + 1;
    
    register #(.N(N)) reg_in_count (
       .D(Q_next),
       .en(1),
       .clk(clk),
       .rst(rst),
       .Q(Q_reg)
    );
    
    assign msbs = Q_reg[N-1:N-2];
    
endmodule
