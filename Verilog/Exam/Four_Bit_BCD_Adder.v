module four_bit_BCD_adder(A, B, Cin, Sum, Cout);
	input [3:0]A, B;
	input Cin;
	output [3:0]Sum;
	output Cout;

	wire Co, TC;
	wire [3:0]S, C;

	four_bit_adder FBA1(A, B, Cin, S, Co); 

	wire and_s23, and_s13, or_and_s23s13;
	and(and_s23, S[2], S[3]);
	and(and_s13, S[1], S[3]);
	or(or_and_s23s13, and_s23, and_s13);
	or(Cout, Co, or_and_s23s13);

	buf(C[0], 1'b0);
	buf(C[1], Cout);
	buf(C[2], Cout);
	buf(C[3], 1'b0);

	wire CinT;
	buf(CinT, 1'b0);

	four_bit_adder FBA2(C, S, CinT, Sum, TC); 
endmodule

module four_bit_BCD_adder_tb;
	reg [3:0] a, b;
	reg cin;
	wire [3:0] sum;
	wire cout;

	four_bit_BCD_adder BCDA(.A(a), .B(b), .Cin(cin), .Sum(sum), .Cout(cout));

	initial begin
		a = 4'b0000; b = 4'b0000; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0001; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0010; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0011; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0100; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0101; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0110; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0111; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b1000; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b0001; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b0010; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b0011; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b0100; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b0101; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b0110; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b0111; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b1000; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b1001; b = 4'b1001; cin = 1'b0; #50;
		a = 4'b1001; b = 4'b1001; cin = 1'b1; #50;
	end
endmodule

module four_bit_adder(A, B, Cin, S, Cout);
	input [3:0]A, B;
	input Cin;
	output [3:0]S;
	output Cout;

	wire [2:0]CC;
	
	full_adder FA1(A[0], B[0], Cin, S[0], CC[0]);
	full_adder FA2(A[1], B[1], CC[0], S[1], CC[1]);
	full_adder FA3(A[2], B[2], CC[1], S[2], CC[2]);
	full_adder FA4(A[3], B[3], CC[2], S[3], Cout);
endmodule
