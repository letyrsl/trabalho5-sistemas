module BC (
  input clk,
  input rst,
  input start,

  output LX,
  output LH,
  output LL,
  output[1:0] M0,
  output[1:0] M1,
  output[1:0] M2,
  output H, 
  output pronto
);

  reg[3:0] Q;
  wire[3:0] D;

  assign D[0] = ;
  assign D[1] = ;
  assign D[2] = ;
  assign D[3] = ;

  assign lx = ;
  assign lh = ;
  assign ll = ;
  assign m0[0] = ;
  assign m0[1] = ;
  assign m1[0] = ;
  assign m1[1] = ;
  assign m2[0] = ;
  assign m2[1] = ;
  assign h = ;
  assign pronto = ;
  
  always @(posedge clk or rst) begin
    if (rst == 1) Q <= 4'b0000;
    else Q <= D;
  end
  
endmodule