module display (v, a, b, c, d, e, A, B, C, D, E, F, G);
	input v, a, b, c, d, e;
	output A, B, C, D, E, F, G;
	
	wire vn;
	
	wire ao1, ao2;
	wire bo1, bo2;
	wire co1;
	wire do1, do3, do4;
	wire eo1, eo3, eo5;
	wire go2, go3, go8;
	
	not(vn, v);
	
	// A
	and(ao1, v, b, d);
	and(ao2, v, c, e);
	or(A, ao1, ao2);
	
	// B
	and(bo1, a, e);
	and(bo2, b, c);
	or(B, vn, bo1, bo2);
	
	// C
	and(co1, c, d);
	or(C, vn, co1);
	
	// D
	and(do1, v, a, d);
	and(do3, v, b, e);
	and(do4, v, c, d);
	or(D, do1, ao1, do3, do4);
	
	// E
	and(eo1, v, a, b);
	and(eo3, v, b, c);
	and(eo5, v, b, e);
	or(E, eo1, do1, eo3, ao1, eo5, ao2);
	
	// F
	or(F, eo1, eo5, do4, ao2);
	
	// G
	and(go2, v, a, c);
	and(go3, v, a, e);
	and(go8, v, d, e);
	or(G, eo1, go2, go3, eo3, ao1, eo5, do4, go8);
endmodule