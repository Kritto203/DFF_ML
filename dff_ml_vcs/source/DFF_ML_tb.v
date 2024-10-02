module DFF_ML_tb;

    reg clk;
    reg D;
    wire Q;
    wire Qbar;

    parameter CLK_HALF_PERIOD = 1;
    parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;

    DFF_ML DUT (
        .clk(clk),
        .D(D),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    always begin
        #CLK_HALF_PERIOD;
        clk = !clk;
    end

    initial begin
        clk = 0;
        D = 0;

        #(4*CLK_PERIOD);
        D = 1;
        #(4*CLK_PERIOD);
        D = 0;
        #(4*CLK_PERIOD);
        D = 1;
        #(4*CLK_PERIOD);
        $finish;
    end
    // Display
    initial begin
        $monitor("Time=%t, clk=%b, D=%b, Q=%b, Qbar=%b", $time, clk, D, Q, Qbar);
    end

endmodule
