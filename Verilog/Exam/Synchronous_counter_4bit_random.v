// Synchronous counter for
// 0000->0001->0011->0111->1111->1110->1100->1000->0000 (0->1->3->7->15->14->12->8->0)
module synchronous_random(Clk, Clr, Q);
	input Clk, Clr;
	output [3:0]Q;
	
	wire [3:0]T, Qbar;

	xnor(T[0], Q[3], Q[0]);
	jk_flip_flop TFF0(T[0], T[0], Clk, Clr, Q[0], Qbar[0]);

	xor(T[1], Q[1], Q[0]);
	jk_flip_flop TFF1(T[1], T[1], Clk, Clr, Q[1], Qbar[1]);

	xor(T[2], Q[1], Q[2]);
	jk_flip_flop TFF2(T[2], T[2], Clk, Clr, Q[2], Qbar[2]);

	xor(T[3], Q[3], Q[2]);
	jk_flip_flop TFF3(T[3], T[3], Clk, Clr, Q[3], Qbar[3]);


	// Previous year exam (0 -> 8 -> 12 -> 14 -> 15 -> 7 -> 3 -> 1 -> 0)
	/*input Clk, Clr;
	output [3:0]Q;

	wire [3:0]Qbar, T;

	xor(T[0], Q[1], Q[0]);
	jk_flip_flop TFF0(T[0], T[0], Clk, Clr, Q[0], Qbar[0]);

	xor(T[1], Q[1], Q[2]);
	jk_flip_flop TFF1(T[1], T[1], Clk, Clr, Q[1], Qbar[1]);

	xor(T[2], Q[2], Q[3]);
	jk_flip_flop TFF2(T[2], T[2], Clk, Clr, Q[2], Qbar[2]);

	xnor(T[3], Q[3], Q[0]);
	jk_flip_flop TFF3(T[3], T[3], Clk, Clr, Q[3], Qbar[3]);*/

endmodule


module T_FlipFlop(T, Clk, Clr, Q, Qb);
	input T, Clk, Clr;
	output Q, Qb;
	
	jk_flip_flop JKFF(T, T, Clk, Clr, Q, Qb);
endmodule
