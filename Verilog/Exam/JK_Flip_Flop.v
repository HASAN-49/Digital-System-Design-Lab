// Master Slave JK Flip Flop
module jk_flip_flop(J, K, Clk, Clr, Q, Qbar);
	input J, K, Clk, Clr;
	output Q, Qbar;

	wire w1, w2, w3, w4, w5, w6, w7;

	// First JK
	nand(w1, J, Clk, Qbar, Clr);
	nand(w2, K, Clk, Q);
	nand(w3, w1, w4);
	nand(w4, w2, w3, Clr);

	not(w7, Clk);

	// 2nd JK
	nand(w5, w3, w7);
	nand(w6, w4, w7);
	nand(Q, w5, Qbar);
	nand(Qbar, w6, Q, Clr);
endmodule
