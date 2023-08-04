module excess3_to_bcd(b, e);

	input [3:0]b;
	output [3:0]e;

	wire and_b01, or_b2_and_b01, or_not_b01;
	wire not_b1, not_b0;
	not(not_b1, b[1]);
	not(not_b0, b[0]);

	and(and_b01, b[1], b[0]);
	or(or_b2_and_b01, b[2], and_b01);
	and(e[3], b[3], or_b2_and_b01); // e[3] => MSB
	or(or_not_b01, not_b1, not_b0);
	xor(e[2], b[2], or_not_b01); // e[2]
	xor(e[1], b[0], b[1]); // e[1]
	not(e[0], b[0]); // e[0] => LSB

endmodule

module excess3_to_bcd_tb;

	reg [3:0]in;
	wire [3:0]out;

	excess3_to_bcd e2b(.b(in), .e(out));

	initial begin
		in = 4'b0011; #50;
		in = 4'b0100; #50;
		in = 4'b0101; #50;
		in = 4'b0110; #50;
		in = 4'b0111; #50;
		in = 4'b1000; #50;
		in = 4'b1001; #50;
		in = 4'b1010; #50;
		in = 4'b1011; #50;
		in = 4'b1100; #50;
	end

endmodule