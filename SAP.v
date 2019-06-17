`include "Accumulator.v"
`include "AdderSubtractor.v"
`include "BinaryDisplay.v"
`include "Bregister.v"
`include "ClockGen.v"
`include "Controller.v"
`include "InstructionRegister.v"
`include "MemoryAddressRegister.v"
`include "OutputRegister.v"
`include "ProgramCounter.v"
`include "Ram.v"

module SAP (
    reset   // <i
);

input reset;

wire [7:0] Wbus;
wire Ce, Cp, Ea, Ei, Ep, Eu, La, Lb, Li, Lm, Lo, Su, clk, clr;
wire [3:0] Address;
wire [3:0] opCode;
wire [7:0] Avalue;
wire [7:0] Bvalue;
wire [7:0] Ovalue;

// wire We; TODO use this to enhance the "SAP"

Accumulator A0(
    .clk(clk),        // <i
    .Ea(Ea),         // <i
    .La(La),         // <i
    .busIn(Wbus),      // <i
    .Avalue(Avalue),    // >o
    .busOut(Wbus)     // >o
);

AdderSubractor ALU0(
    .Eu(Eu),         // <i
    .Su(Su),         // <i
    .Ain(Avalue),        // <i
    .Bin(Bvalue),        // <i
    .Output(Wbus)     // >o
);

BinaryDisplay DISP0(
    .Ovalue(Ovalue)     // <i
);

Bregister B0(
    .clk(clk),        // <i
    .Lb(Lb),         // <i
    .busIn(Wbus),      // <i
    .Bvalue(Bvalue)     // >o
);

InstructionRegister IR0(
    .clk(clk),        // <i
    .clr(clr),        // <i
    .Ei(Ei),         // <i
    .Li(Li),         // <i
    .busIn(Wbus),      // <i
    .busOut(Wbus[3:0]),     // >o
    .opCode(opCode)     // >o
);

MemoryAddressRegister MAR0(
    .clk(clk),        // <i
    .Lm(Lm),         // <i
    .busIn(Wbus[3:0]),      // <i
    .Address(Address)    // >o
);

OutputRegister O_R0(
    .clk(clk),        // <i
    .Lo(Lo),         // <i
    .busIn(Wbus),      // <i
    .Ovalue(Ovalue)     // >o
);

ProgramCounter PC0(
    .clk(clk),        // <i
    .clr(clr),        // <i
    .Ep(Ep),         // <i
    .Cp(Cp),         // <i
    .busOut(Wbus[3:0])     // >o
);

Ram RAM0(
    //.clk(clk),        // <i TODO use this to enhance the "SAP"
    //.We(We),         // <i TODO use this to enhance the "SAP"
    //.busIn(Wbus),      // <i TODO use this to enhance the "SAP"
    .Address(Address),    // <i
    .Ce(Ce),         // <i
    .busOut(Wbus)     // >0
); 


Controller CONTROL0(
    .opCode(opCode),    // <i
    .reset(reset),     // <i
    .Ce(Ce),        // >o
    .Cp(Cp),        // >o
    .Ea(Ea),        // >o
    .Ei(Ei),        // >o
    .Ep(Ep),        // >o
    .Eu(Eu),        // >o
    .La(La),        // >o
    .Lb(Lb),        // >o
    .Li(Li),        // >o
    .Lm(Lm),        // >o
    .Lo(Lo),        // >o
    .Su(Su),        // >o
    .clk(clk),       // >o
    .clr(clr)        // >o
//  .we(we)         // >o
);

endmodule
