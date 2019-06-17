module BinaryDisplay (
    Ovalue      // <i
);

input[7:0] Ovalue;

always @(*) begin
    $display ("Output = %d", Ovalue);
end

endmodule
