module ProgramCounter (clk, reset, pc_in, pc_out);
input clk, reset;
input [7:0] pc_in; //input for new PC value
output reg [7:0] pc_out; //output current value

always @(posedge clk or posedge reset) begin 
    if (reset)
        pc_out <= 8'b0;
    else 
        pc_out <= pc_in;
end

endmodule