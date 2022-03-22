module registrador_x(
  input[7:0] valor,
  input load,
  input clock,
  input reset,

  output[15:0] saida
);

  reg[3:0] Q;
  assign saida = Q;

  always @(posedge clock or reset) begin
    if (reset == 1) Q <= 16'b0000000000000000;
    else if (load == 1) Q <= 8'b00000000 + valor;
  end

endmodule

module testbench;
  reg[15:0] valor = 16'b0000000000000000;
  reg load = 0;
  reg clock = 0;
  reg reset = 1;
  
  wire[15:0] saida;

  registrador_x registrador_x0(valor, load, clock, reset, saida);

  always #1 begin
    clock <= ~clock;
  end

  initial begin
    $dumpvars;
    #1;
    reset <= 0;
    load = 1;
    #5;
    valor = 8'b00000001;
    
    #5
    load = 0;
    #5
    valor = 8'b01000001;
    #5
    $finish;
  end
endmodule
