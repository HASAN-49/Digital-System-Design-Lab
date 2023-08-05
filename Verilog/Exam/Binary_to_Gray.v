module binary_to_gray(gray, bin);
	input [3:0]bin;
	output [3:0]gray;

	and(gray[3], bin[3], bin[3]);
	xor(gray[2], bin[3], bin[2]);
	xor(gray[1], bin[2], bin[1]);
	xor(gray[0], bin[1], bin[0]);
endmodule

module binary_to_gray_tb;
	reg [3:0]b;
	wire [3:0]g;

	binary_to_gray b2g(.bin(b), .gray(g));

	initial begin
		b = 4'b0000; #50;
		b = 4'b0001; #50;
		b = 4'b0010; #50;
		b = 4'b0011; #50;
		b = 4'b0100; #50;
		b = 4'b0101; #50;
		b = 4'b0110; #50;
		b = 4'b0111; #50;
		b = 4'b1000; #50;
		b = 4'b1001; #50;
		b = 4'b1010; #50;
		b = 4'b1011; #50;
		b = 4'b1100; #50;
		b = 4'b1101; #50;
		b = 4'b1110; #50;
		b = 4'b1111; #50;
	end
endmodule 