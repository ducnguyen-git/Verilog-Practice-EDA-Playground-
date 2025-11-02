module LED_7(
  input [3:0] dec,
  output reg [6:0] abcdefg
);
  /*
  
  -----a-----
  |			|
  f			b
  |			|
  -----g-----
  |			|
  e			c
  |			|
  -----d-----
  
  */
  
  always @(dec) begin
    case(dec)
      4'd0: abcdefg = 7'b1111110;
      4'd1: abcdefg = 7'b0110000;
      4'd2: abcdefg = 7'b1101101;
      4'd3: abcdefg = 7'b1111001;
      4'd4: abcdefg = 7'b0110011;
      4'd5: abcdefg = 7'b1011011;
      4'd6: abcdefg = 7'b1011111;
      4'd7: abcdefg = 7'b1110000;
      4'd8: abcdefg = 7'b1111111;
      4'd9: abcdefg = 7'b1111011;
      default: abcdefg = 7'b0;
    endcase
  end
endmodule