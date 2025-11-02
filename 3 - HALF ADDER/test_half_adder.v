module tb_half_adder;
     reg in1, in2; // Registers for a, b
     wire cout, sum; // Wires for c, s

  half_adder_behavioural ha(.a(in1), .b(in2), .c(cout), .s(sum));

     initial begin
         $dumpvars(1, tb_half_adder); // Enable waveform dumping for simulation
		in1 = 1'b0; in2 = 1'b0;
         // Test case 1
        #10 in1 = 1'b1; in2 = 1'b1;

         // Test case 2
       	#10 in1 = 1'b0; in2 = 1'b1;

         // Test case 3
       	#10 in1 = 1'b0; in2 = 1'b0;

         // Test case 4
       	#10 in1 = 1'b1; in2 = 1'b0;
       #200 $stop;
     end
endmodule
