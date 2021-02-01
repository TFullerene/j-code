CR =: 3 : 0
NB. Cox Rubinstein Binomial Option Value
z=. BINSTEPS CR y NB. default is global # of steps
:
steps =. x
'S K Te Td sigma Rd Rf Type ExStyle' =. y NB. Type=1 for call and _1 for put
NB. ExStyle = 1 American, 0 = European
g =. Rd - Rf
dt =. Te % steps
a =. ^ dt * g
u =. %d =. ^ - sigma * %: dt
p=. (a - d) % u - d

NB. final node values
n=. >: steps
s =. S * (u ^i. -n) * d ^ i. n
z =. 0 >. Type * s - K  NB. final option payoffs

NB. backward induction
while.  (1~:#s) do. NB. as soon as #s is 1, we are at the root node
        s =. }: s % u 
        z =. ( ^ -Rd * dt ) * (p * }: z) + (1 - p) * }. z
        z =. z >. ExStyle * Type * s -K   NB. i.e. only check exercise if American
end.

z =. ''$ z
)


NB. ========================================================


CR0 =: 3 : 0
NB. Cox Rubinstein European Option Value, no looping, so ExStyle ignored
z=. BINSTEPS CR y NB. default is global # of steps
:
steps =. x
'S K Te Td sigma Rd Rf Type ExStyle' =. y NB. Type=1 for call and _1 for put
g =. Rd - Rf
dt =. Te % steps
a =. ^ dt * g
u =. %d =. ^ - sigma * %: dt
p =. (a - d) % u - d NB. prob of increase in underlying at each dt step
q =. 1 - p NB. complementary prob

pascal =. i.@>: ! ]
coeffs =. pascal steps

n=. >: steps
s =. S * (u ^i. -n) * d ^ i. n
z =. 0 >. Type * s - K  NB. final option payoffs
fp =. coeffs * (p ^ i. -n) * q ^ i. n NB. final risk neutral prob vector for each payoff
z =. (^ -Td * Rd) * +/ z * fp  NB. present value of expectation of payoffs = option value

)
