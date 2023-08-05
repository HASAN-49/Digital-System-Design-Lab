module half_adder(A, B, S, C);
	input A, B;
	output S, C;

	xor(S, A, B);
	and(C, A, B);
endmodule

module half_adder_tb;
	reg a, b;
	wire s, c;

	half_adder hf(.A(a), .B(b), .S(s), .C(c));

	initial begin
		a = 1'b0; b = 1'b0; #50;
		a = 1'b0; b = 1'b1; #50;
		a = 1'b1; b = 1'b0; #50;
		a = 1'b1; b = 1'b1; #50;
	end
endmodule