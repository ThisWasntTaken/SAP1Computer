module ClockGen (
    clk         // >o
);

output clk;

reg clk;

initial begin
    clk = 0;
    forever begin
        #50 clk = !clk;
    end
end

endmodule
