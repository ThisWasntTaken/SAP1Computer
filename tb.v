`include "SAP.v"

module tb();

reg reset;

SAP SAP0 (
    .reset(reset)
);

initial begin 
    reset = 1;

    // RAM data initializations
    // PROGRAM MEMORY
    force SAP0.RAM0.Mem[0]  = {4'h0, 4'h9};
    force SAP0.RAM0.Mem[1]  = {4'hE, 4'hA};
    force SAP0.RAM0.Mem[2]  = {4'h1, 4'hA};
    force SAP0.RAM0.Mem[3]  = {4'h2, 4'hB};
    force SAP0.RAM0.Mem[4]  = {4'hE, 4'hA};
    force SAP0.RAM0.Mem[5]  = {4'hF, 4'hA};
    force SAP0.RAM0.Mem[6]  = {4'hA, 4'hA};
    force SAP0.RAM0.Mem[7]  = {4'hA, 4'hA};
    force SAP0.RAM0.Mem[8]  = {4'hA, 4'hA};

    // DATA MEMORY
    force SAP0.RAM0.Mem[9]  = {8'd129};
    force SAP0.RAM0.Mem[10] = {8'd16};
    force SAP0.RAM0.Mem[11] = {8'd15};
    force SAP0.RAM0.Mem[12] = {8'hAA};
    force SAP0.RAM0.Mem[13] = {8'hAA};
    force SAP0.RAM0.Mem[14] = {8'hAA};
    force SAP0.RAM0.Mem[15] = {8'hAA};


    #225

    reset = 0;


    #5000
    $finish;

end


initial
begin
    $dumpfile("SAP.vcd");
    $dumpvars(0,SAP0);
end


endmodule
