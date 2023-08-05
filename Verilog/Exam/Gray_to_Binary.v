module gray_to_binary(gray, bin);

	input [3:0]gray;
	output [3:0]bin;

	// b3 = MSB
	and(bin[3], gray[3], gray[3]);
	xor(bin[2], gray[3], gray[2]);
	xor(bin[1], bin[2], gray[1]);
	xor(bin[0], bin[1], gray[0]);

endmodule

module grayToBinaryTb;

	reg [3:0]g;
	wire [3:0]b;

	gray_to_binary g2b(.gray(g), .bin(b));

	initial begin
		g = 4'b0000; #50;
		g = 4'b0001; #50;
		g = 4'b0010; #50;
		g = 4'b0011; #50;
		g = 4'b0100; #50;
		g = 4'b0101; #50;
		g = 4'b0110; #50;
		g = 4'b0111; #50;
		g = 4'b1000; #50;
		g = 4'b1001; #50;
		g = 4'b1010; #50;
		g = 4'b1011; #50;
		g = 4'b1100; #50;
		g = 4'b1101; #50;
		g = 4'b1110; #50;
		g = 4'b1111; #50;
	end

endmodule
