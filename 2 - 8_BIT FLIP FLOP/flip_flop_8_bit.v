module flip_flop_8bit(
  input wire clk, rst_n,
  input wire penable, psel_reg, pwrite, pready,
  input [7:0] pwd,
  output reg [7:0] reg_A
);
  reg [7:0] Y;
  reg mux_sel;
  assign mux_sel = penable & psel_reg & pready & pwrite;
  /*
  if(mux_sel) begin
    Y[7:0] = pwd[7:0];
  end else begin
    Y[7:0] = reg_A[7:0];
  end
  */
  always @(mux_sel) begin
    case(mux_sel)
      1'b1: Y[7:0] = pwd[7:0];
      default: Y[7:0] = Y[7:0];
    endcase 
  end
  /*
  assign Y[7:0] = (mux_sel) ? pwd[7:0] : reg_A[7:0];
  */
  
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      reg_A[7:0] <= 8'b0;
    else begin
      if(mux_sel) begin
      	reg_A[7:0] <= Y[7:0];
      end
  	end
  end
endmodule