module matrix (ch1, ch2, ch3, r1, r2, r3, r4, r5, r6, r7, l);
	input ch1, ch2, ch3;							// MSB → LSB
	output r1, r2, r3, r4, r5, r6, r7, l;
	
	wire ch1n, ch2n, ch3n;
	
	not(ch1n, ch1);
	not(ch2n, ch2);
	not(ch3n, ch3);
	
	or(r1, ch1, ch2, ch3n);						// first row
	or(r2, ch1, ch2n, ch3);
	or(r3, ch1, ch2n, ch3n);
	or(r4, ch1n, ch2, ch3);
	or(r5, ch1n, ch2, ch3n);
	or(r6, ch1n, ch2n, ch3);
	or(r7, ch1n, ch2n, ch3n);		// last row

	or(l, ch1, ch2, ch3);			// display
endmodule