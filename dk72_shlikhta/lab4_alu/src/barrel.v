`timescale 1ns/1ps

`include "/home/drcah4ec/lab4_alu/defines.v"

`define SLL 3'b000
`define SRL 3'b010
`define ROR 3'b011
`define SRA 3'b110
`define ROL 3'b001

`define OPSEL_WIDTH 3
`define SA_WIDTH 5

module barrel(bs_opsel, shift_amount, data_in, result);

input  [`OPSEL_WIDTH-1:0]  bs_opsel;
input  [`SA_WIDTH-1:0]  shift_amount;
input  [`REG_WIDTH-1:0] data_in;
output reg[`REG_WIDTH-1:0] result;

wire [`REG_WIDTH*2-1:0] temp1, temp2; 
wire arithm, is_arithm_shift;

assign is_arithm_shift = bs_opsel[2];
assign arithm = data_in[`REG_WIDTH-1] & is_arithm_shift;
assign temp1 = {data_in, data_in} << shift_amount;
assign temp2 = $signed({arithm, data_in, data_in}) >>> shift_amount;

always @* begin

	casez(bs_opsel)
		`SLL: result = temp1[`REG_WIDTH-1:0];
		`SRL: result = temp2[`REG_WIDTH*2-1:`REG_WIDTH];
		`ROR: result = temp2[`REG_WIDTH-1:0];
		`ROL: result = temp1[`REG_WIDTH*2-1:`REG_WIDTH];
		`SRA: result = temp2[`REG_WIDTH*2-1:`REG_WIDTH];
		default result = 0;
	endcase
end

endmodule
