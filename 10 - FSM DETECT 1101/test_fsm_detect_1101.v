module tb_fsm_1101;
	reg clk, rst_n, a;
	wire y;

	fsm_1101 dut(
		.clk(clk),
		.rst_n(rst_n),
		.a(a),
		.y(y)
	);

	// Clock generate
	
	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	initial begin
      	$dumpfile("tb_fsm_1101.vcd"); 
      	$dumpvars;
		rst_n = 1'b0;
		a = 1'b0;

		#10 rst_n = 1'b1;
		
		repeat (5) @(posedge clk);

		a = 1'b1; @(posedge clk);
		a = 1'b1; @(posedge clk);
		a = 1'b0; @(posedge clk);
		a = 1'b1; @(posedge clk);

		repeat (5) @(posedge clk);
		a = 1'b0; @(posedge clk);
		a = 1'b1; @(posedge clk);
		a = 1'b1; @(posedge clk);
		a = 1'b1; @(posedge clk);

		#200 $stop;
	end
endmodule
