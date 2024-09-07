module ControlUnit(opcode, reg_write, mem_read, mem_write, alu_op);
input [3:0] opcode;
output reg reg_write;
output reg mem_read;
output reg mem_write;
output reg [1:0] alu_op;

always @(*) begin 
    case (opcode)
        4'b0001: begin //add instruction
            reg_write = 1;
            mem_read = 0;
            mem_write = 0;
            alu_op = 2'b00;
        end  
        default: begin 
            reg_write = 0;
            mem_read = 0;
            mem_write = 0;
            alu_op = 2'b00;
        end 
    endcase
end 

endmodule