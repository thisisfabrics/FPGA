// Testbench is based on the testbench from SystemVerilog-Homework repository
// 
// Source:
// https://github.com/chipdesignschool/systemverilog-homework/blob/main/03_finite_state_machines/03_06_sort_floats/testbench.sv

module electron_beam_positioner_testbench;

    //--------------------------------------------------------------------------
    // Signals to drive Device Under Test - DUT

    logic            clk;
    logic            rst;

	wire [1:0][10:0] instantaneous_beam_position;
	wire			 beam2left_signal;
	wire			 beam2top_signal;

    //--------------------------------------------------------------------------
    // Instantiating DUT

    electron_beam_positioner inst_electron_beam_positioner (
		.clock ( clk ),
		.reset ( rst ),

		.*
	);

    //--------------------------------------------------------------------------
    // Driving clock

    initial
    begin
        clk = '1;

        forever
        begin
            # 5 clk = ~ clk;
        end
    end

    //------------------------------------------------------------------------
    // Reset

    task reset ();

        rst <= 'x;
        repeat (3) @ (posedge clk);
        rst <= '1;
        repeat (3) @ (posedge clk);
        rst <= '0;

    endtask

    //--------------------------------------------------------------------------
    // Run

    task run ();

        $display ("--------------------------------------------------");
        $display ("Running %m");

        // Initialize and reset

        reset ();

    endtask

    //----------------------------------------------------------------------
    // Launch the testbench

	initial begin
		
        `ifdef __ICARUS__
            // Uncomment the following line
            // to generate a VCD file and analyze it using GTKwave

            $dumpvars;
        `endif

		run ();

	end

    //----------------------------------------------------------------------
    // Setting timeout

    initial
    begin
        repeat (1000) @ (posedge clk);
        $display ("FAIL %s: timeout!", `__FILE__);
        $finish;
    end

endmodule
