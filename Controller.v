module Controller (
    opCode,    // <i
    reset,     // <i
    Ce,        // >o
    Cp,        // >o
    Ea,        // >o
    Ei,        // >o
    Ep,        // >o
    Eu,        // >o
    La,        // >o
    Lb,        // >o
    Li,        // >o
    Lm,        // >o
    Lo,        // >o
    Su,        // >o
    clk,       // >o
    clr        // >o
//  we         // >o
);

input  [3:0] opCode;
input  reset;
output Ce;
output Cp;
output Ea;
output Ei;
output Ep;
output Eu;
output La;
output Lb;
output Li;
output Lm;
output Lo;
output Su;
output clk;
output clr;
//output we;

reg Ce;
reg Cp;
reg Ea;
reg Ei;
reg Ep;
reg Eu;
reg La;
reg Lb;
reg Li;
reg Lm;
reg Lo;
reg Su;
reg clr;
// reg we;


ClockGen clkgen0 (
    .clk(clk)
);


reg [5:0] T;

initial begin
    T = 6'd1;
end

always @(negedge clk) begin
    clr = 0;
    if (reset) begin
        T = 6'd1;
        clr = 1;
    end
    else if (T[2] && opCode == 4'hF) begin
        T = 6'd0;
    end
    else if (T[5]) begin
        T = 6'd1;
    end
    else begin
        T = T << 1;
    end
end

wire T1 = T[0];
wire T2 = T[1];
wire T3 = T[2];
wire T4 = T[3];
wire T5 = T[4];
wire T6 = T[5];

// T1 state
always @(T1) begin
    Ep = 0;
    Lm = 0;
    if (T1) begin
        Ep = 1;
        Lm = 1;
    end
end


// T2 state
always @(T2) begin
    Cp = 0;
    if (T2) begin
        Cp = 1;
    end
end



// T3 state
always @(T3) begin
    Ce = 0;
    Li = 0;
    if (T3) begin
        Ce = 1;
        Li = 1;
    end
end




// T4 state
always @(T4 or T5 or T6) begin
    Ei = 0;
    Lm = 0;
    Ce = 0;
    La = 0;
    Lb = 0;
    Su = 0;
    Eu = 0;
    Lo = 0;
    Ea = 0;
//    we = 0;

    case (opCode) 
        4'h0:
            if (T4) begin
                Ei = 1;
                Lm = 1;
            end
            else if (T5) begin
                Ce = 1;
                La = 1;
            end
        4'h1:
            if (T4) begin
                Ei = 1;
                Lm = 1;
                Su = 0;
            end
            else if (T5) begin
                Ce = 1;
                Lb = 1;
                Su = 0;
            end
            else if (T6) begin
                Eu = 1;
                La = 1;
                Su = 0;
            end
        4'h2:
            if (T4) begin
                Ei = 1;
                Lm = 1;
                Su = 1;
            end
            else if (T5) begin
                Ce = 1;
                Lb = 1;
                Su = 1;
            end
            else if (T6) begin
                Eu = 1;
                La = 1;
                Su = 1;
            end
        /*
        4'h3:
            if (T4) begin
                Ei = 1;
                Lm = 1;
            end
            else if (T5) begin
                Ea = 1;
                we = 1;
            end
        */
        4'hE:
            if (T4) begin
                Ea = 1;
                Lo = 1;
            end
    endcase
end


endmodule
