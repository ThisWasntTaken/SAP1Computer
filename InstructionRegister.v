module InstructionRegister (
    clk,        // <i
    clr,        // <i
    Ei,         // <i
    Li,         // <i
    busIn,      // <i
    busOut,     // >o
    opCode      // >o
);

input clk, clr, Ei, Li;
input [7:0] busIn;
output [3:0] busOut;
output [3:0] opCode;

reg [7:0] CurrentInstructionValue;

initial begin
    CurrentInstructionValue = 8'd0;
end


always @(posedge clk) begin
    if (clr) begin // reset
        CurrentInstructionValue = 8'hFF; // halt instruction by default
    end
    else begin
        if (Li) begin
            CurrentInstructionValue = busIn;
        end
        else begin
            CurrentInstructionValue = CurrentInstructionValue;
        end
    end
end

// output
assign busOut = (Ei)? CurrentInstructionValue : 4'bz;
assign opCode = CurrentInstructionValue[7:4];
endmodule
