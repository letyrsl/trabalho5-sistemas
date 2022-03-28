module multiplexador2x1(
  input[15:0] entrada0,
  input[15:0] entrada1,
  input M,

  output[15:0] resultado
);
  reg[15:0] saida;
  assign resultado = saida;

  always @(M) begin
    if (M == 0) saida <= entrada0;
    else if (M == 1) saida <= entrada1;
  end
endmodule

// module testbench;
//   reg[15:0] entrada0 = 16'b0000000000000000;
//   reg[15:0] entrada1 = 16'b0000000000000001;
//   reg M = 0;
  
//   wire[15:0] resultado;

//   multiplexador2x1 multiplexador2x10(entrada0, entrada1, M, resultado);

//   initial begin
//     $dumpvars;
//     #2;
//     M = 1;
//     #2;
//     M = 0;
//     $finish;
//   end
// endmodule
