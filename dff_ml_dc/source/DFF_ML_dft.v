module DFF_ML_dft (
    input wire clk,
    input wire D,
    input wire scan_enable,  // signal control scan
    input wire scan_in,     
    output wire Q,
    output wire Qbar,
    output wire scan_out
);

    wire q1;
    wire scan_out_master;
    // Instantiation of Master Flip-Flop with scan capabilities
    DFF_dft Master (
        .D(D),
        .clk(~clk),
        .scan_enable(scan_enable),
        .scan_in(scan_in),
        .Q(q1),
        .Qbar(),
        .scan_out(scan_out_master)  
    );

    // Instantiation of Slave Flip-Flop with scan capabilities
    DFF_dft Slave (
        .D(q1),
        .clk(clk),
        .scan_enable(scan_enable),
        .scan_in(scan_out_master),
        .Q(Q),
        .Qbar(Qbar),
        .scan_out(scan_out)
    );

endmodule
