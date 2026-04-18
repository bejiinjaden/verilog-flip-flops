`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2026 11:39:25 PM
// Design Name: 
// Module Name: master_slave_ff_tb
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


module master_slave_ff_tb;
    reg clk;
    reg J;
    reg K;
    reg rst;
    wire Q;
    wire Q_bar;
    
    master_slave_ff uut(
    .clk(clk),
    .J(J),
    .K(K),
    .rst(rst),
    .Q(Q),
    .Q_bar(Q_bar));
    
     
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        
        rst = 1; J = 0; K = 0;
        #10;

        rst = 0;

        
        J = 0; K = 0;
        #20;

        
        J = 0; K = 1;
        #20;

        
        J = 1; K = 0;
        #20;

        
        J = 1; K = 1;
        #40;

        
        J = 0; K = 0;
        #20;

        
        rst = 1;
        #10;
        rst = 0;

        #20;

        $finish;
    end

    
    initial begin
        $monitor("Time=%0t | clk=%b rst=%b J=%b K=%b | Q=%b Q_bar=%b",
                  $time, clk, rst, J, K, Q, Q_bar);
    end

   
endmodule
