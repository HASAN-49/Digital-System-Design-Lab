module nand_gate(a, b, y);
	input a, b;
	output y;
	nand nd(y, a, b);
endmodule
