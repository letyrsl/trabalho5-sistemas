`include "bc.v"
`include "bo.v"

module quadratic_eq(
  input[7:0] x,
  input[15:0] a,
  input[15:0] b,
  input[15:0] c,
  input inicio,
  input clock,
  input reset,

  output pronto,
  output[15:0] resultado
);
  wire lx;
  wire lh;
  wire ll;
  wire[1:0] m0;
  wire[1:0] m1;
  wire[1:0] m2;
  wire h;

  bc bc_0(clock, reset, inicio, lx, lh, ll, m0, m1, m2, h, pronto);
  bo bo_0(x, a, b, c, m0, m1, m2, lx, ll, lh, h, clock, reset, pronto, resultado);
endmodule