`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 12:16:13 PM
// Design Name: 
// Module Name: counter_test
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


module counter_test();

    reg clk_t, rst_t;
    reg [1:0] msbs_t;
    
    counter #(.N(4)) dut (
       .clk(clk_t),
       .rst(rst_t),
       .msbs(msbs_t)
    );
    
    always begin 
       clk_t = ~clk_t; #5;
    end
    
    initial begin 
        clk_t = 0; msbs_t = 2'b00; rst_t = 0; #7;
        rst_t = 1; #3;
        msbs_t = 2'b01; rst_t = 0; #10;
        msbs_t = 2'b10;            #2;
        msbs_t = 2'b11;            #11;
        $finish;
    end
        
    

endmodule
