module full_adder(A, B, Cin, Sum, Cout);
	input A, B, Cin;
	output Sum, Cout;

	wire s0, c0, c1;

	half_adder HA1(A, B, s0, c0);
	half_adder HA2(Cin, s0, Sum, c1);
	or(Cout, c0, c1);
endmodule

module full_adder_tb;
	reg a, b, cin;
	wire sum, cout;

	full_adder FA(.A(a), .B(b), .Cin(cin), .Sum(sum), .Cout(cout)); 

	initial begin
		a = 1'b0; b = 1'b0; cin = 1'b0; #50;
		a = 1'b0; b = 1'b0; cin = 1'b1; #50;
		a = 1'b0; b = 1'b1; cin = 1'b0; #50;
		a = 1'b0; b = 1'b1; cin = 1'b1; #50;
		a = 1'b1; b = 1'b0; cin = 1'b0; #50;
		a = 1'b1; b = 1'b0; cin = 1'b1; #50;
		a = 1'b1; b = 1'b1; cin = 1'b0; #50;
		a = 1'b1; b = 1'b1; cin = 1'b1; #50;
	end
endmodule
