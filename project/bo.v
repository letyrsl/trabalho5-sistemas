
`include "components/registrador_x.v"
`include "components/multiplexador4x1.v"
`include "components/multiplexador2x1.v"
`include "components/registrador_16b.v"
`include "components/ula.v"

module bo(
  input[7:0] valor_x,
  input[15:0] valor_a,
  input[15:0] valor_b,
  input[15:0] valor_c,

  input[1:0] M0,
  input[1:0] M1,
  input[1:0] M2,

  input load_x,
  input load_l,
  input load_h,

  input h,
  input clock,
  input reset,
  input pronto,

  output[15:0] resultado
);
  wire[15:0] valor_x_16b;
  wire[15:0] valor_m0;
  wire[15:0] valor_m1;
  wire[15:0] valor_m2;
  wire[15:0] saida_ula;
  
  wire[15:0] reg_l;
  wire[15:0] reg_h;

  registrador_x registrador_x_0(valor_x, load_x, clock, reset, valor_x_16b);
  multiplexador4x1 multiplexador4x1_0(16'b0000000000000000, valor_a, valor_b, valor_c, M0, valor_m0);
  multiplexador4x1 multiplexador4x1_1(valor_x_16b, valor_m0, reg_l, reg_h, M1, valor_m1);
  multiplexador4x1 multiplexador4x1_2(valor_m0, valor_x_16b, reg_l, reg_h, M2, valor_m2);
  ula ula_0(valor_m1, valor_m2, h, saida_ula);
  registrador_16b registrador_16b_L(saida_ula, load_l, clock, reset, reg_l);
  registrador_16b registrador_16b_H(saida_ula, load_h, clock, reset, reg_h);
  multiplexador2x1 multiplexador2x1_0(16'b0000000000000000, reg_l, pronto, resultado);
endmodule