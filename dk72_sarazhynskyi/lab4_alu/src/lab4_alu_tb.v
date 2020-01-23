`timescale 1ns/1ps

module lab4_alu_tb;

reg  [31:0] in_A_sig ;
reg  [31:0] in_B_sig ;
reg  [4:0] in_func_sig;
wire [31:0] out_result_sig;
wire out_overlow_sig, out_zero_sig;

lab4_alu lab4_alu_tb(
	.in_A(in_A_sig) ,	// input [31:0] in_A_sig
	.in_B(in_B_sig) ,	// input [31:0] in_B_sig
	.in_func(in_func_sig) ,	// input [4:0] in_func_sig
	.out_result(out_result_sig) ,	// output [31:0] out_result_sig
	.out_overlow(out_overlow_sig) ,	// output  out_overlow_sig
	.out_zero(out_zero_sig) 	// output  out_zero_sig
);

initial begin 

	in_A_sig= 32'habcdabcd;
	in_B_sig= 32'habcdabcd;

	in_func_sig = 5'b00000;     //SLL  
	#10 in_func_sig = 5'b00010; //SRL 
	#10 in_func_sig = 5'b00001; //ROL
	#10 in_func_sig = 5'b00011; //ROR
	#10 in_func_sig = 5'b00110; //SRA

	#10 in_func_sig = 5'b10000; //MUL LOW part (779D 8229)
	#10 in_func_sig = 5'b10010; //MUL HIGH part (734C 68C0)
	#10 in_func_sig = 5'b10001; //DIV result (0000 0001)
	#10 in_func_sig = 5'b10011; //DIV remaind (0000 0000)
	// ABCD ABCD * ABCD ABCD = 734C 68C0 779D 8229
	// ABCD ABCD / ABCD ABCD = 0000 0001 (remaind 0)

	#10 in_A_sig= 32'h11111111;
	in_B_sig= 32'h22222222;
	in_func_sig = 5'b10110;     //ADD
	#10 in_func_sig = 5'b10111; //SUB
	//1111 1111 + 2222 2222 = 3333 3333
	//1111 1111 - 2222 2222 = EEEE EEEF

	#10 in_A_sig= 32'h11111111;
	in_B_sig= 32'h00000000;
	in_func_sig = 5'b11000;     //AND
	#10 in_func_sig = 5'b11001; //OR
	#10 in_func_sig = 5'b11010; //NOR
	#10 in_func_sig = 5'b11011; //XOR
	#10;

end

initial begin 
	#400 $stop();
end

endmodule