module ProgramCounter (
    clk,        // <i
    clr,        // <i
    Ep,         // <i
    Cp,         // <i
    busOut      // >o
);

input clk, clr, Ep, Cp;
output [3:0] busOut;

reg [3:0] CurrentCounterValue;

initial begin
    CurrentCounterValue = 4'd0;
end

always @(posedge clk) begin
    if (clr) begin // reset
        CurrentCounterValue = 4'd0;
    end
    else begin
        if (Cp) begin
            CurrentCounterValue = CurrentCounterValue + 4'd1;
        end
        else begin
            CurrentCounterValue = CurrentCounterValue;
        end
    end
end

// output
assign busOut = (Ep)? CurrentCounterValue : 4'bz;
endmodule
