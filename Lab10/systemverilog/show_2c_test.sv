`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 06:29:34 PM
// Design Name: 
// Module Name: show_2c_test
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


module show_2c_test();

    reg [7:0] Din_t;
    wire [15:0] Dout_t;
    wire sign_t; 
    
    show_2c dut (
       .Din(Din_t), 
       .Dout(Dout_t), 
       .sign(sign_t)
    );
    
    initial begin
       Din_t = 10; #10;
       Din_t = -10; #10;
       Din_t = 3; #10;
       Din_t = -3; #10;
       $finish;
    end
 
endmodule
