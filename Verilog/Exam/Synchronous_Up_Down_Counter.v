// If J = K in JK Flip Flop, then it will work as T Flip Flop
// This is a synchronous up down counter
module up_down_counter(M, Clk, Q);
	input M, Clk;
	output [2:0]Q;

	wire T, Clr, Mbar;
	wire [2:0]Qbar;
	buf(T, 1'b1);
	not(Mbar, M);

	jk_flip_flop TFF1(T, T, Clk, Clr, Q[0], Qbar[0]);
	wire and1, and2, or1;
	and(and1, Mbar, Q[0]);
	and(and2, M, Qbar[0]);
	or(or1, and1, and2);

	jk_flip_flop TFF2(or1, or1, Clk, Clr, Q[1], Qbar[1]);
	wire and3, and4, or2;
	and(and3, and1, Q[1]);
	and(and4, and2, Qbar[1]);
	or(or2, and3, and4);

	jk_flip_flop TFF3(or2, or2, Clk, Clr, Q[2], Qbar[2]);
endmodule
