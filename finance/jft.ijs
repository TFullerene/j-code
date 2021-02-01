NB. An implementation of the algorithms from the book: Algorithmic and High Frequency Trading

quotedspread =: P(t)^a - P(t)^b

midprice =: 1%2 * (P(t)^a + P(t)^b));

microprice =: V(t)^b % V(t)^b + V(t)^a * P(t)^a + V(t)^a % V(t)^b + V(t)^a * P(t)^b
