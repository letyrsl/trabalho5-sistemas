module ula(
  input[15:0] M1,
  input[15:0] M2,
  input H,

  output[15:0] resultado
);

  reg[15:0] saida;
  assign resultado = saida;

  always @(M1, M2 or H) begin
    if (H == 0) saida <= M1 + M2;
    else if (H == 1) saida <= M1 * M2;
  end
endmodule

// module testbench;
//   reg[15:0] M1 = 16'b0000000000000001;
//   reg[15:0] M2 = 16'b0000000000000001;
//   reg H = 0;
  
//   wire[15:0] resultado;

//   ula ula0(M1, M2, H, resultado);

//   initial begin
//     $dumpvars;
//     #5;
//     H = 1;
//     #5
//     $finish;
//   end
// endmodule
