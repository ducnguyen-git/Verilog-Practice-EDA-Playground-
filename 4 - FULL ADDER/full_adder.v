module full_adder(
     input in1, in2, cin,
     output reg sum, cout
);
     reg s1, c1, c2;

     half_adder_behavioural ha1(.a(in1), .b(in2), .c(c1), .s(s1));
     half_adder_behavioural ha2(.a(s1), .b(cin), .c(c2), .s(sum));

     always @(*) begin
         cout <= c1 | c2;
     end
endmodule


// Behavioural model
module half_adder_behavioural(
     input a, b,
     output reg c, s
);
     always @(*) begin
         s <= a ^ b;
         c <= a & b;
     end
endmodule
