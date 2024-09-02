## CAUTION
The ordering in which they were computed is different than the one provided in the paper
If the user wants to use these data files the consider
	·) In https://arxiv.org/pdf/2406.11792 has the ordering: 
(1, P00+P01+P10+P11, P0000+P0011+P1100+P1111, P0101+P1001, P0001+P1101, P0100+P0111)

	·) The data in this folder has the ordering:
(P00+P01+P10+P11, P0000+P0011+P1100+P1111, P0001+P1101, P0100+P0111, P0101+P0110)

Therefore, the coefficients of the Bell inequalities need to be swapped accordingly depending
on the chosen convention.

## Bell inequalities
H_n refers to the hyperplanes of the polytope for n parties
therefore each row is a Bell inequality
they have been obtained by computing the convex hull of the vertices using the cdd library by Fukuda

## Vertices
V_n refers to the vertices of the polytope for n parties
they have been obtained by computing the function build_lds_table_5dimensional(n)