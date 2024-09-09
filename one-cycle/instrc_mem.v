module InstructionMemory (addr, instruction);
input [7:0] addr;
output reg [15:0] instruction;

reg [15:0] memory [0:255]; // instruction memory size (256 words, 16-bit)

initial begin 
    // Example instructions
    memory[0] = 16'b0001_0000_0001_0010; // ADD A, B
    memory[1] = 16'b0011_0010_0010_0000; // SUBTRACT (result, B)
    memory[2] = 16'b0100_0010_0011_0000; // AND (result, B)
end

always @(*) begin 
    instruction = memory[addr];
end

endmodule
