module AdderSubractor (
    Eu,         // <i
    Su,         // <i
    Ain,        // <i
    Bin,        // <i
    Output      // >o
);

input Eu, Su;
input [7:0] Ain;
input [7:0] Bin;
output [7:0] Output;

wire [8:0] Result;

// Arithmetic logic
assign Result = (Su)? Ain - Bin : Ain + Bin;

// output
assign Output = (Eu)? Result[7:0] : 8'bz;
endmodule
