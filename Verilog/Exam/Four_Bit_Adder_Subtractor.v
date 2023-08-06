module four_bit_adder_subtractor(A, B, Cin, S, Cout);
	input [3:0]A, B;
	input Cin;
	output [3:0]S;
	output Cout;

	wire [3:0]BB;
	wire [2:0]CC;

	xor(BB[0], Cin, B[0]);
	xor(BB[1], Cin, B[1]);
	xor(BB[2], Cin, B[2]);
	xor(BB[3], Cin, B[3 ]);
	
	full_adder FA1(A[0], BB[0], Cin, S[0], CC[0]);
	full_adder FA2(A[1], BB[1], CC[0], S[1], CC[1]);
	full_adder FA3(A[2], BB[2], CC[1], S[2], CC[2]);
	full_adder FA4(A[3], BB[3], CC[2], S[3], Cout);
endmodule

module four_bit_adder_subtractor_tb;
	reg [3:0]a, b;
	reg cin;
	wire [3:0]s;
	wire cout;

	four_bit_adder_subtractor fas(.A(a), .B(b), .Cin(cin), .S(s), .Cout(cout));

	initial begin
		a = 4'b1000; b = 4'b0010; cin = 0; #50;
		a = 4'b1000; b = 4'b0010; cin = 1; #50;
		a = 4'b1000; b = 4'b1000; cin = 0; #50;
		a = 4'b1000; b = 4'b1000; cin = 1; #50;
		a = 4'b0010; b = 4'b1000; cin = 0; #50;
		a = 4'b0010; b = 4'b1000; cin = 1; #50;
		a = 4'b0001; b = 4'b0111; cin = 0; #50;
		a = 4'b0001; b = 4'b0111; cin = 1; #50;
		a = 4'b1010; b = 4'b1011; cin = 0; #50;
		a = 4'b1010; b = 4'b1011; cin = 1; #50;
		a = 4'b1110; b = 4'b1111; cin = 0; #50;
		a = 4'b1110; b = 4'b1111; cin = 1; #50;
		a = 4'b1011; b = 4'b1010; cin = 0; #50;
		a = 4'b1011; b = 4'b1010; cin = 1; #50;
	end
endmodule
