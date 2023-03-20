module validator (a, b, c, d, e, v);
	input a, b, c, d, e;
	output v;
	
	wire an, bn, dn, en;
	wire n1, n2, n4, n6, n7, n8;
	wire o1, o2, o3, o4, o5, o6, o7, o8, o9, o10;
	
	wire nr5;
	
	// 1
	nand(n1, a, b, c);
	and(o1, n1, d, e);
	
	// 2
	nand(n2, a, b);
	not(dn, d);
	and(o2, n2, c, dn, e);
	
	// 3
	not(en, e);
	and(o3, n2, c, d, en);
	
	// 4
	nand(n4, c, d);
	not(an, a);
	and(o4, an, b, n4, e);
	
	// 5
	nor(nr5, c, d, e); // De Morgan
	and(o5, an, nr5);
	
	// 6
	nand(n6, d, e);
	and(o6, an, b, c, n6);
	
	// 7
	nand(n7, b, c, d);
	and(o7, a, n7, e);
	
	// 8
	nand(n8, b, c);
	or(o8, a, n8, d, en);
	
	// 9
	not(bn, b);
	or(o9, a, bn, c, n6);
	
	// 10
	and(o10, a, b, nr5);
	
	// end
	or(v, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10);
endmodule