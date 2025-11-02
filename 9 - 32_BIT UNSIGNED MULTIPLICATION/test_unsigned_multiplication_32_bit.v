module MULT_TB;
  //Inputs
  reg [31:0] A;
  reg [31:0] B;
  
  //Output of design described in architecture model
  wire [31:0] HI_ARCH, LO_ARCH;
  
  //Output of design described in behaviour model
  wire [31:0] HI_BEH, LO_BEH;
  
  wire two_model_out_equal;
  
  assign two_model_out_equal = (HI_ARCH == HI_BEH) & (LO_ARCH == LO_BEH);
  
  unsigned_mul_32bit_struct MULT32_U_inst_0(.HI(HI_ARCH), .LO(LO_ARCH), .A(A), .B(B));
  
  unsigned_mul_32bit_beha  mult32_beh_inst_0 (.HI(HI_BEH), .LO(LO_BEH), .A(A), .B(B));

  initial begin
    A=10; B=20;     	// Y = 10 * 20 = 200
    #10;
    #10 A=3; B=15;  	// Y =  3 * 15 = 45
    #10;
    #10 A=16; B=7;  	// Y = 16 *  7 = -112
    #10;
    #10 A=10; B=19; 	// Y = 10 * 19 = -190
    #100;
    $stop;
  end
  
  //Whenever A or B or CI change, test will fail if corresponding outputs of designs in both models are not identical
  always @(A or B) begin
    assert (two_model_out_equal) else $display ("Test Failed");
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
endmodule