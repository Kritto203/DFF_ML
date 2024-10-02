module DFF_dft (
    input wire D,
    input wire clk,
    input wire scan_enable,
    input wire scan_in,
    output reg Q,
    output reg Qbar,
    output reg scan_out
);

    wire d_internal;

    // Chọn đầu vào cho flip-flop dựa trên tín hiệu scan_enable (tín hiệu ktra hoặc tín hiệu bình thng)
    assign d_internal = scan_enable ? scan_in : D;

    // Flip-flop hoạt động theo tín hiệu đồng hồ
    always @(posedge clk) begin
        Q <= d_internal;
    end
    // Đầu ra của flip-flop cho scan chain
    always @(posedge clk) begin
        scan_out <= Q;
        Qbar <= ~Q;
    end
endmodule
