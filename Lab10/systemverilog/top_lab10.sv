`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 06:44:25 PM
// Design Name: 
// Module Name: top_lab10
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


module top_lab10(
    input btnU,
    input btnD,
    input [15:0] sw,
    input clk,
    input btnC,
    output [6:0] seg,
    output dp,
    output [3:0] an,
    output [15:0] led
    );
    
    wire [15:0] show_out;
    wire sign_out;
    wire [1:0] counter_out;
    wire [15:0] calc_out;
    
    top_lab9 top0 (
        .btnU(btnU), 
        .btnD(btnD), 
        .btnC(btnC),
        .sw(sw), 
        .clk(clk),  
        .led(calc_out)
     );
    
     show_2c show0 (
        .Din(calc_out[15:8]), 
        .Dout(show_out[15:0]), 
        .sign(sign_out)
     );
     
     counter #(.N(20)) counter0 (
        .clk(clk), 
        .rst(btnC), 
        .msbs(counter_out[1:0])
     );
     
     sseg4 sseg4_0 (
        .data(show_out[15:0]), 
        .sign(sign_out), 
        .hex_dec(sw[15]), 
        .digit_sel(counter_out[1:0]), 
        .seg(seg[6:0]), 
        .dp(dp), 
        .an(an[3:0])
     );
     
     assign led = calc_out;
     
    
endmodule
