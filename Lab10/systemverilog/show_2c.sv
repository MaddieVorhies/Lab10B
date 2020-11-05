`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 12:49:23 PM
// Design Name: 
// Module Name: show_2c
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


module show_2c(
    input [7:0] Din,
    output [15:0] Dout,
    output sign
    );
    
    wire [7:0] mux_out;
    wire [7:0] in1;
    
    assign in1 = ~Din[7:0] + 1;
    
    mux2 #(.BITS(8)) mu2_3 (
       .in0(Din[7:0]),
       .in1(in1),
       .sel(Din[7]),
       .out(mux_out)
    );
    
    assign Dout[15:0] = {8'b0, mux_out};
    assign sign = Din[7];
    
    
endmodule
