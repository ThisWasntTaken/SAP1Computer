module Bregister (
    clk,        // <i
    Lb,         // <i
    busIn,      // <i
    Bvalue      // >o
);

input clk, Lb;
input [7:0] busIn;
output [7:0] Bvalue;

reg [7:0] Bvalue;

initial begin
    Bvalue = 8'd0;
end


always @(posedge clk) begin
    if (Lb) begin
        Bvalue = busIn;
    end
    else begin
        Bvalue = Bvalue;
    end
end
endmodule
