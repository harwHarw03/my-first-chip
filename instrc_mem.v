module InstructionMemory (addr, instruction);
input [7:0] addr;
output reg [15:0] instruction;

reg [15:0] memory [0:255]; // instruction memory size (256 words, 16-bit)

initial begin 
//example instructions
    memory[0] = 16'b0001_0000_0001_0010; //(opcode + operands)
    memory[1] = 16'b0010_0010_0001_0100;
end

always @(*) begin 
    instruction = memory[addr];
end

endmodule