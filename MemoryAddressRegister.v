module MemoryAddressRegister (
    clk,        // <i
    Lm,         // <i
    busIn,      // <i
    Address     // >o
);

input clk, Lm;
input [3:0] busIn;
output [3:0] Address;

reg [3:0] Address;

initial begin
    Address = 4'd0;
end


always @(posedge clk) begin
    if (Lm) begin
        Address = busIn;
    end
    else begin
        Address = Address;
    end
end

endmodule
