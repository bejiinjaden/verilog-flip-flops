`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2026 09:55:24 PM
// Design Name: 
// Module Name: sr_flipflop
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


module sr_flipflop(
    input wire clk,
    input wire s,
    input wire r,
    input wire rst,
    output reg q,
    output wire q_bar
       );
       
     assign q_bar = ~q;
     
     always @(posedge clk) begin
     if(rst)
        q <= 0;
     else if(s & ~r)
        q <= 1;
     else if(r & ~s)
        q <= 0;
     end
     
endmodule
