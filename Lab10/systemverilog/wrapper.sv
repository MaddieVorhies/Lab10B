`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 12:36:36 PM
// Design Name: 
// Module Name: wrapper
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


module wrapper(
    input clk,
    input btnC,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    wire [1:0] msbs_out;
    
    counter #(.N(20)) counter0 (
       .clk(clk), 
       .rst(btnC), 
       .msbs(msbs_out)
    );
    
    sseg4 sseg4_0 (
       .data(16'b0), 
       .sign(0), 
       .hex_dec(0),
       .digit_sel(msbs_out),
       .seg(seg), 
       .dp(dp), 
       .an(an)
    );
    
endmodule
