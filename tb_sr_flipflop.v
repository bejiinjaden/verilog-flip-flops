`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2026 10:08:50 PM
// Design Name: 
// Module Name: tb_sr_flipflop
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


module tb_sr_flipflop;
reg clk; 
reg rst; 
reg s; 
reg r; wire q; wire q_bar; 
sr_flipflop uut ( .clk(clk), .rst(rst), .s(s), .r(r), .q(q), .q_bar(q_bar) );

initial clk = 0;
always #5 clk = ~clk;

initial begin
rst = 1;   // apply reset
    s = 0;
    r = 0;
    #10;
    rst = 0;   // release reset

    s = 1; r = 0; #10;
    s = 0; r = 1; #10;
    s = 0; r = 0; #10;
    s = 1; r = 1; #10;

$finish;

end
  
endmodule
