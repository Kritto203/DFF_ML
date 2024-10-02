module DFF(
	input wire D,
	input wire clk,
	output reg Q,
	output reg Qbar
	);
always @(posedge clk) begin
    Q <= D;
    Qbar <= ~D;
end
endmodule 