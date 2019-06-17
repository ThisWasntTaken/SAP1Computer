module Ram (
    Address,    // <i
    Ce,         // <i
    busOut      // >0
); 

input [3:0] Address;
input Ce;
output [7:0] busOut;


wire [7:0] Mem [0:15];

wire [7:0] Data;

assign busOut = (Ce)? Data : 8'bz; 

assign Data = Mem[Address];

endmodule
