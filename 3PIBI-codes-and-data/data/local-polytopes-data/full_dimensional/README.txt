## CAUTION
The ordering in which they were computed is different than the one provided in the paper
If the user wants to use these data files the consider
	·) In https://arxiv.org/pdf/2406.11792 has the ordering: 
(P0|0, P1|0, P0|1, P1|1, P00|00, P01|00, P11|00, P00|01, P01|01, P10|01, P11|01, P00|11, P01|11, P11|11, 1)

	·) The data in this folder has the ordering:
(1, P0|0, P0|1, P1|0, P1|1, P00|00, P10|00, P11|00, P01|01, P10|01, P00|10, P11|10, P00|11, P10|11, P11|11)

Therefore, the coefficients of the Bell inequalities need to be swapped accordingly depending
on the chosen convention.

## Bell inequalities
H_n refers to the hyperplanes of the polytope for n parties
therefore each row is a Bell inequality
they have been obtained by computing the convex hull of the vertices using the cdd library by Fukuda

## Vertices
V_n refers to the vertices of the polytope for n parties
they have been obtained by computing the function build_lds_table_5dimensional(n)