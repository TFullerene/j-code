NB. An implementation of the algorithms from the book: The mathematics of poker, in J. 

P_a =: (4)*(1%52)

P_a_or_b =: p(a) + p(b)

P_a_of_b =: p(a)*p(b)

NB. All of A and B. 
P_all_a_and_b =: p(a) + p(b) - P(a of b)

P_a_dependent_b =: p(a)*p(b|a)


NB. P-.(a)

0 <= p(A) <= 1

p(c) =: 1

p(i) =: 0

p(a) + p-.(a) = 1

