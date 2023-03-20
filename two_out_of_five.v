/*
 * Hardware Description Project
 * of the discipline TEC498-TP01
 * at the Universidade Estadual
 * da Bahia - UEFS.
 */
 
module two_out_of_five (
	a, b, c, d, e, ch1, ch2, ch3,
	A, B, C, D, E, F, G,
	c1, c2, c3, c4, c5,
	r1, r2, r3, r4, r5, r6, r7, l
);

	input a, b, c, d, e; 					// input pins MSB → LSB
	input ch1, ch2, ch3; 					// selector switch
	
	output A, B, C, D, E, F, G;			// seven seg display
	output l;
	
	output r1, r2, r3, r4, r5, r6, r7;	// led metrix
	output c1, c2, c3, c4, c5;				// column led matrix
	
	wire vout; 									// valid?
	
	validator (
		.a (a), .b (b), .c (c), .d (d), .e (e), .v (vout)
	);
	
	assign c1 = a & vout;
	assign c2 = b & vout;
	assign c3 = c & vout;
	assign c4 = d & vout;
	assign c5 = e & vout;
		
	matrix (
		.ch1 (ch1), .ch2 (ch2), .ch3 (ch3),
		.r1 (r1), .r2 (r2), .r3 (r3), .r4 (r4), .r5 (r5), .r6 (r6), .r7 (r7), .l (l)
	);
	
	display (
		.v (vout), .a (a), .b (b), .c (c), .d (d), .e (e),
		.A (A), .B (B), .C (C), .D (D), .E (E), .F (F), .G (G)
	);
	
endmodule