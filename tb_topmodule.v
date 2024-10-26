`include "topmodule.v"
`default_nettype none

module tb_topmodule;
reg clk;
reg rst_n;
reg enable;
output wire [3:0] out;

topmodule mod
(
    .global_clk(clk),
    .reset(rst_n),
    .enable(enable),
    .out(out)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_topmodule.vcd");
    $dumpvars(0, tb_topmodule);
end

initial begin
    #1 rst_n<=1'bx;clk<=1'bx;enable<=1'bx;
    #(CLK_PERIOD*3) rst_n<=1;
    #(CLK_PERIOD*3) rst_n<=0;clk<=0;
    repeat(5) @(posedge clk);
    rst_n<=1;
    @(posedge clk);
    repeat(100) @(posedge clk);
    $finish(2);
end

endmodule
`default_nettype wire