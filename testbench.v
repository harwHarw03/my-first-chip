module ALU_tb;
reg [3:0] A, B;
wire [3:0] Result;
reg [1:0] ALUop;

ALU uut(
    .A(A),
    .B(B),
    .Result(Result),
    .ALUop(ALUop)
);

initial begin 
    A = 4'b0100;
    B = 4'b0001;
end

initial begin 

    $dumpfile("testbench.vcd");
    $dumpvars(0, ALU_tb);

    #10 //maybe wait for initial data be processed
    ALUop = 2'b11;
    #5 
    ALUop = 2'b10;
    #5 
    ALUop = 2'b01;
    #5 
    ALUop = 2'b00;
    #5 
    $finish;
end

initial begin 
    $monitor("Time: %0t | ALU signal : %b | A: %b, A: %b, Result: %b", $time, ALUop, A, B, Result);
end 

endmodule