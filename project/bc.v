module bc (
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

  assign D[0] = Q[1] & ~Q[0] | Q[2] & ~Q[0] | Q[3] & ~Q[0] | start & ~Q[0];
  assign D[1] = ~Q[1] & Q[0] | Q[1] & ~Q[0];
  assign D[2] = Q[2] & ~Q[1] | Q[2] & ~Q[0] | ~Q[3] & ~Q[2] & Q[1] & Q[0];
  assign D[3] = Q[3] & ~Q[1] | Q[3] & ~Q[0] | Q[2] & Q[1] & Q[0];

  assign LX = ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0];
  assign LH = Q[2] & Q[1] & ~Q[0];
  assign LL = Q[3] & ~Q[0] | ~Q[2] & Q[1] & ~Q[0] | Q[2] & ~Q[1] & ~Q[0];
  
  assign M0[0] = Q[2] & ~Q[1] & ~Q[0] | Q[3] & ~Q[1] & Q[0] | Q[3] & Q[1] & ~Q[0] | ~Q[3] & ~Q[2] & Q[1] & Q[0];
  assign M0[1] = Q[2] & ~Q[1] & Q[0] | Q[2] & Q[1] & ~Q[0] | Q[3] & ~Q[1] & Q[0] | Q[3] & Q[1] & ~Q[0];
  assign M1[0] = 0;
  assign M1[1] = Q[3] & ~Q[1] | Q[3] & ~Q[0] | ~Q[3] & Q[1] & Q[0] | Q[2] & ~Q[1] & ~Q[0];
  assign M2[0] = Q[2] & Q[1] & Q[0] | Q[3] & ~Q[1] & ~Q[0] | ~Q[3] & ~Q[2] & ~Q[1] & Q[0] | ~Q[3] & ~Q[2] & Q[1] & ~Q[0];
  assign M2[1] = Q[2] & Q[1] & Q[0] | Q[3] & ~Q[1] & ~Q[0];

  assign H = Q[2] & ~Q[0] | ~Q[3] & ~Q[2] & Q[1] | ~Q[3] & ~Q[1] & Q[0];
  assign pronto = Q[3] & Q[1] & Q[0];
  
  always @(posedge clk or rst) begin
    if (rst == 1) Q <= 4'b0000;
    else Q <= D;
  end
  
endmodule