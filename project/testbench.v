`include "quadratic_eq.v"

module testbench;
  reg[7:0] x = 8'b00000001;
  reg[15:0] a = 16'b0000000000000011;
  reg[15:0] b = 16'b0000000000000011;
  reg[15:0] c = 16'b0000000000000000;
  reg inicio = 0;
  reg clock = 0;
  reg reset = 0;

  wire pronto;
  wire[15:0] resultado;

  quadratic_eq quadratic_eq0(x, a, b, c, inicio, clock, reset, pronto, resultado);

  always #1 begin
    clock <= ~clock;
  end

  initial begin
    $dumpvars;
    reset = 1;
    #1
    reset = 0;
    #1
    inicio = 1;
    #24
    inicio = 0;
    #5
    $finish;
  end
endmodule
