`timescale 1ns / 1ps

module tb_jk_ff;

    // Inputs
    reg J;
    reg K;
    reg CLK;
    reg RST;

    // Outputs
    wire Q;
    wire Q_bar;

    // Instantiate the DUT (Device Under Test)
    jk_ff uut (
        .J(J),
        .K(K),
        .CLK(CLK),
        .RST(RST),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    // Clock generation (10ns period)
    always #5 CLK = ~CLK;

    initial begin
        // Initialize signals
        CLK = 0;
        RST = 1;
        J = 0;
        K = 0;

        // Apply reset
        #10;
        RST = 0;

        // Test 00 → Hold
        #10;
        J = 0; K = 0;

        // Test 10 → Set
        #10;
        J = 1; K = 0;

        // Test 01 → Reset
        #10;
        J = 0; K = 1;

        // Test 11 → Toggle
        #10;
        J = 1; K = 1;

        // Keep toggling for few cycles
        #40;

        // Finish simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | RST=%b | J=%b K=%b | Q=%b Q_bar=%b",
                  $time, RST, J, K, Q, Q_bar);
    end

endmodule