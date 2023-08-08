// First time clr forced to 0, after that turn clr Not Forced
module mod_ten_counter(Clk, Q);
	input Clk;
	output [3:0]Q;

	wire clr, j, k;
	wire [3:0] qbar;
	
	buf(j, 1'b1);
	buf(k, 1'b1);

	nand(clr, Q[3], Q[1]);

	jk_flip_flop jk1(j, k, Clk, clr, Q[0], qbar[0]);
	jk_flip_flop jk2(j, k, Q[0], clr, Q[1], qbar[1]);
	jk_flip_flop jk3(j, k, Q[1], clr, Q[2], qbar[2]);
	jk_flip_flop jk4(j, k, Q[2], clr, Q[3], qbar[3]);
endmodule
