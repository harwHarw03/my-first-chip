module CPU (clk, reset, pc_out, alu_result);
input clk;
input reset;
output [7:0] pc_out;
output [3:0] alu_result;

wire [1:0] alu_op;
wire [15:0] instruction;
reg [3:0] A, B;
reg [3:0] reg_result;

InstructionMemory IM (
    .addr(pc_out),
    .instruction(instruction)
);

ControlUnit CU (
    .opcode(instruction[15:12]),
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
    .pc_in(pc_out + 1),
    .pc_out(pc_out)
);

// Control the registers and ALU
always @(posedge clk or posedge reset) begin
    if (reset) begin
        A <= 4'b0100;  
        B <= 4'b0001;
        reg_result <= 4'b0000;
    end else begin
        case (instruction[15:12]) // Check opcode
            4'b0001: begin // ADD
                A <= A;
                B <= B;
                reg_result <= alu_result;
            end
            4'b0011: begin // SUBTRACT
                A <= reg_result;
                B <= B;
                reg_result <= alu_result;
            end
            4'b0100: begin // AND
                A <= reg_result;
                B <= B;
                reg_result <= alu_result;
            end
            default: begin
                A <= A;
                B <= B;
                reg_result <= reg_result;
            end
        endcase
    end
end

endmodule
