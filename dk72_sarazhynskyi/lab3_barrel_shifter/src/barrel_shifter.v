`timescale 1ns/1ps

`define SLL 3'b?00
`define SRL 3'b010
`define ROL 3'b?01
`define ROR 3'b011
`define SRA 3'b11?

module barrel_shifter(bs_opsel, shift_amount, data_in, result);

input  [2:0]  bs_opsel;
input  [4:0]  shift_amount;
input  [31:0] data_in;
output reg [31:0] result;

wire [63:0] left_shift, right_shift;
wire [31:0] a_right_shift;
wire arithm;
 
assign arithm = data_in[31] & bs_opsel[2];
assign left_shift = {data_in, data_in} << shift_amount;
assign right_shift = {data_in, data_in} >> shift_amount;
assign a_right_shift = $signed({arithm, data_in}) >>> shift_amount; //the idea of Alexandr Shlihta;


always @* begin
  casez (bs_opsel)
    `SLL:  result = left_shift[31:0];   
    `SRL:  result = right_shift[63:32];  
    `ROL:  result = left_shift[63:32];
    `ROR:  result = right_shift[31:0];        
    `SRA:  result = a_right_shift[31:0];
	default result = 0;
  endcase
end

endmodule
