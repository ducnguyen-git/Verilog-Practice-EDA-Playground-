module conse_recog(
  input clk, rst_n, in,
  output reg out
);
  localparam IDLE = 4'd0;
  localparam ONE_1 = 4'd1; localparam ZERO_1 = 4'd5;
  localparam ONE_2 = 4'd2; localparam ZERO_2 = 4'd6;
  localparam ONE_3 = 4'd3; localparam ZERO_3 = 4'd7;
  localparam ONE_4 = 4'd4; localparam ZERO_4 = 4'd8;
  reg [3:0] current_state, next_state;
  
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end
  
  always @(*) begin
    case(current_state)
      IDLE: 
        if(in==1'b1)
          next_state = ONE_1;
        else 
          next_state = ZERO_1;
      ONE_1: 
        if(in==1'b1)
          next_state = ONE_2;
        else 
          next_state = ZERO_1;
      ONE_2: 
        if(in==1'b1)
          next_state = ONE_3;
        else 
          next_state = ZERO_1;
      ONE_3: 
        if(in==1'b1)
          next_state = ONE_4;
        else 
          next_state = ZERO_1;
      ONE_4: 
        if(in==1'b1)
          next_state = ONE_4;
        else 
          next_state = ZERO_1;
      ZERO_1: 
        if(in==1'b0)
          next_state = ZERO_2;
        else 
          next_state = ONE_1;
      ZERO_2: 
        if(in==1'b0)
          next_state = ZERO_3;
        else 
          next_state = ONE_1;
      ZERO_3: 
        if(in==1'b0)
          next_state = ZERO_4;
        else 
          next_state = ONE_1;
      ZERO_4: 
        if(in==1'b0)
          next_state = ZERO_4;
        else 
          next_state = ONE_1;
      default: next_state = IDLE;
    endcase
  end
  
  assign out = (current_state == ONE_4 || current_state == ZERO_4) ? 1'b1 : 1'b0;
endmodule
    