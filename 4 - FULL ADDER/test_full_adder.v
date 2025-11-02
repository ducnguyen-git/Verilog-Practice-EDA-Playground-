module tb_full_adder;
     reg a, b, cin; // Registers for a, b
     wire s, cout; // Wires for c, s

  full_adder fa(.in1(a), .in2(b), .cin(cin), .sum(s), .cout(cout));

     initial begin
       $dumpvars(1, tb_full_adder); // Enable waveform dumping for simulation

         // Test case 1
         a = 1'b0; b = 1'b0; cin = 1'b0;
		#10;
         // Test case 2
         a = 1'b0; b = 1'b0; cin = 1'b1;
		#10;
         // Test case 3
         a = 1'b0; b = 1'b1; cin = 1'b0;
		#10;
         // Test case 4
         a = 1'b0; b = 1'b1; cin = 1'b1;
       	#10;
       // Test case 5
         a = 1'b1; b = 1'b0; cin = 1'b0;
		#10;
         // Test case 6
         a = 1'b1; b = 1'b0; cin = 1'b1;
		#10;
         // Test case 7
         a = 1'b1; b = 1'b1; cin = 1'b0;
		#10;
         // Test case 8
         a = 1'b1; b = 1'b1; cin = 1'b1;
       	#200 $stop;
     end
endmodule
