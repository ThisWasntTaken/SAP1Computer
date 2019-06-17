module Accumulator (
    clk,        // <i
    Ea,         // <i
    La,         // <i
    busIn,      // <i
    Avalue,     // >o
    busOut      // >o
);

input clk, Ea, La;
input [7:0] busIn;
output [7:0] busOut;
output [7:0] Avalue;

reg [7:0] accumulator;

initial begin
    accumulator = 8'd0;
end


always @(posedge clk) begin
    if (La) begin
        accumulator = busIn;
    end
    else begin
        accumulator = accumulator;
    end
end

// output
assign busOut = (Ea)? accumulator : 8'bz;
assign Avalue = accumulator;
endmodule
