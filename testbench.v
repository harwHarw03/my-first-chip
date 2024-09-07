module cpu_tb;

    reg clk, reset;
    wire [7:0] pc_out;
    wire [3:0] alu_result;

    // Instantiate the CPU
    CPU myCPU (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out),
        .alu_result(alu_result)
    );

    // Generate the clock signal
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Initial block to set up the simulation and print outputs
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        #10 reset = 0;  // Release reset after 10 time units

        // Set up waveform dumping
        $dumpfile("cpu_tb.vcd"); // Dump the waveform to a .vcd file for GTKWave
        $dumpvars(0, cpu_tb);     // Dump all variables in the testbench

        // Print initial state
        $display("Time\tReset\tPC_Out\tALU_Result");
        $monitor("%0t\t%b\t%h\t%h", $time, reset, pc_out, alu_result);

        // Simulate for a period and observe results
        #100 $finish;
    end

endmodule
