module topmodule (
    input global_clk,
    input reset,
    input enable,
    output reg [3:0]out
);
always @(posedge global_clk) begin
    out <= out+4'b0010;
end
always @(posedge reset) begin
    out<=4'b0001;
end
endmodule