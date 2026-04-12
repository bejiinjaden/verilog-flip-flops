`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2026 11:15:28 PM
// Design Name: 
// Module Name: jk_ff
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


module jk_ff(
    input wire J,
    input wire K,
    input wire CLK,
    input wire RST,
    output reg Q,
    output wire Q_bar
    );
    
    assign Q_bar = ~Q;
    
    always @(posedge CLK or posedge RST) begin
    if(RST)begin
    Q <= 1'b0;
    end
    else begin 
    case ({J,K}) 
    2'b00 : Q <= Q;
    2'b10 : Q <= 1;
    2'b01 : Q <= 0;
    2'b11 : Q <= ~Q;
    endcase
    end
    end
    
endmodule
