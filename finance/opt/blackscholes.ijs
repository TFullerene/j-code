erf =: monad define           NB. A&S 7.1.21 (rightmost)
((2 * y) % (%: 1p1)) * (^ - y ^ 2) * (1  H. 1.5) y ^2
)

cnd =: monad define           NB. A&S 26.2.29 (solved for P)
(1 + erf y * %: 0.5) % 2
)

BS =: monad define 
'S X T r v' =. y
d=.((^. S % X) + T * r (+,-) -: *: v) % (v * %: T)
-/ (S , X * ^ - r * T) * cnd d
)
