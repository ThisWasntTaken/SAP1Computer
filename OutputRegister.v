module OutputRegister (
    clk,        // <i
    Lo,         // <i
    busIn,      // <i
    Ovalue      // >o
);

input clk, Lo;
input [7:0] busIn;
output [7:0] Ovalue;

reg [7:0] Ovalue;

initial begin
    Ovalue = 8'd0;
end


always @(posedge clk) begin
    if (Lo) begin
        Ovalue = busIn;
    end
    else begin
        Ovalue = Ovalue;
    end
end
endmodule
