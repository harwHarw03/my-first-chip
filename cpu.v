module CPU (clk, reset, A, B, pc_out, alu_result);
input clk;
input reset;
input [3:0] A, B;
output [7:0] pc_out;
output [3:0] alu_result;

wire [1:0] alu_op;
wire [3:0] opcode = 4'b0001;

ControlUnit CU (
    .opcode(opcode),
    .reg_write(),
    .mem_read(),
    .mem_write(),
    .alu_op(alu_op)
);

ALU myALU (
    .A(A),
    .B(B),
    .ALUop(alu_op),
    .Result(alu_result)
);

ProgramCounter myPC (
    .clk(clk),
    .reset(reset),
    .pc_in(alu_result),
    .pc_out(pc_out)
);

endmodule