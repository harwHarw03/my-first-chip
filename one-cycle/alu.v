module ALU(A, B, ALUop, Result);
input [3:0] A, B;
input [1:0] ALUop; // 2-bit control signal 
output reg [3:0] Result;

always @(*) begin 
    case (ALUop)
        2'b00: Result = A + B;
        2'b01: Result = A - B;
        2'b10: Result = A & B;
        2'b11: Result = A | B;
        default: Result = 4'b0000;
    endcase
end

endmodule