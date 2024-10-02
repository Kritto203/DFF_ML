module DFF_ML (
	input wire clk,
	input wire D,  
	output wire Q,
	output wire Qbar
);
wire q1; 
DFF Master(.D(D), .clk(~clk), .Q(q1), .Qbar());
DFF slave (.D(q1), .clk(clk), .Q(Q), .Qbar(Qbar));
endmodule 