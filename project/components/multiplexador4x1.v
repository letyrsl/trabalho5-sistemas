module multiplexador4x1(
  input[15:0] entrada0,
  input[15:0] entrada1,
  input[15:0] entrada2,
  input[15:0] entrada3,
  input[1:0] M,

  output[15:0] resultado
);
  reg[15:0] saida;
  assign resultado = saida;

  always @(M) begin
    if (M == 2'b00) saida <= entrada0;
    else if (M == 2'b01) saida <= entrada1;
    else if (M == 2'b10) saida <= entrada2;
    else if (M == 2'b11) saida <= entrada3;
  end
endmodule

// module testbench;
//   reg[15:0] entrada0 = 16'b0000000000000000;
//   reg[15:0] entrada1 = 16'b0000000000000001;
//   reg[15:0] entrada2 = 16'b0000000000000010;
//   reg[15:0] entrada3 = 16'b0000000000000011;
//   reg[1:0] M = 2'b00;
  
//   wire[15:0] resultado;

//   multiplexador4x1 multiplexador4x10(entrada0, entrada1, entrada2, entrada3, M, resultado);

//   initial begin
//     $dumpvars;
//     #2;
//     M = 2'b01;
//     #2;
//     M = 2'b10;
//     #2;
//     M = 2'b11;
//     #2;
//     M = 2'b00;
//     #2;
//     $finish;
//   end
// endmodule
