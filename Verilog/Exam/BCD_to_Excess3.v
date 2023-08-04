/*module bcd_to_excess3(A, B, C, D, w, x, y, z);
	
	input A, B, C, D;
	output w, x, y, z;

	wire c_or_d, b_and_cord;

	// w = A + B(C+D)
	or(c_or_d, C, D);
	and(b_and_cord, B, c_or_d);
	or(w, A, b_and_cord);

	// x = B Ex-OR (C + D)
	xor(x, B, c_or_d);

	// y = C Ex_NOR D
	xnor(y, C, D);

	// z = ~D
	not(z, D);

endmodule*/

module bcd_to_excess3(in, out);
	
	input [3:0]in;
	output [3:0]out;

	wire c_or_d, b_and_cord;

	// w = A + B(C+D) => MSB => w = out[3]
	or(c_or_d, in[1], in[0]);
	and(b_and_cord, in[2], c_or_d);
	or(out[3], in[3], b_and_cord);

	// x = B Ex-OR (C + D)
	xor(out[2], in[2], c_or_d);

	// y = C Ex_NOR D
	xnor(out[1], in[1], in[0]);

	// z = ~D => LSB
	not(out[0], in[0]);

endmodule

module bcd_to_excess3_tb;

	reg [3:0]inp;
	wire [3:0]outp;

	bcd_to_excess3 b_e3_1(.in(inp), .out(outp));

	initial begin
		inp = 4'b0000; #50;
		inp = 4'b0001; #50;
		inp = 4'b0010; #50;
		inp = 4'b0011; #50;
		inp = 4'b0100; #50;
		inp = 4'b0101; #50;
		inp = 4'b0110; #50;
		inp = 4'b0111; #50;
		inp = 4'b1000; #50;
		inp = 4'b1001; #50;
	end

endmodule
