`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 10:06:15 PM
// Design Name: 
// Module Name: master_slave_ff
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


module master_slave_ff(
    input clk,
    input J,
    input K,
    input rst,
    output reg Q,
    output Q_bar
    );
    
    reg master_Q;
    
    always @(posedge clk or posedge rst) begin
      
      if(rst) begin
      master_Q<=0;
      end else begin
      case({J,K})
      2'b00: master_Q <= master_Q;
      2'b01: master_Q <= 0;
      2'b10: master_Q <= 1;
      2'b11: master_Q <= ~master_Q;
      endcase
      end
      end
     
    assign Q_bar = ~Q;
      
    always @(negedge clk or posedge rst) begin
        if(rst) begin
        Q <= 0;
        end else begin
        Q <= master_Q;
        end
     end
        
endmodule
