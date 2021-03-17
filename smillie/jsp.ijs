NB. JSP: A J Statistical Package. Second Edition

NB. Summarization
am=: +/ % #
gm=: # %: */
dev=: - am
ssp=: +/ @ (*&dev)~
var=: ssp % <:@#
sd=: %: @ var
ss=: +/ @: *: @ dev
midindices=: (<.,>.)@-:@<:@#
Q2=: median=: [: am midindices { sort
Q1=: [: Q2 ] #~ Q2 > ]
Q3=: [: Q2 ] #~ Q2 < ]
five=: (<./,Q1,Q2,Q3,>./)
summary=: 3 : 0
r=.  'Sample size      ',5.0 ": #y.
r=. r,: 'Minimum           ', 8.3 ": <./y.
r=. r, 'Maximum           ',8.3": >./y.
r=. r, 'Arithmetic mean   ',8.3": am y.
r=. r, 'Variance          ',8.3": var y.
r=. r, 'Standard deviation',8.3": sd y.
r=. r, 'First quartile    ',8.3": Q1 y.
r=. r, 'Median            ',8.3": Q2 y.
r=. r, 'Third quartile    ',8.3": Q3 y.
r=. r, 'Geometric mean    ',8.3": gm y.
)
imax=: (] e. >./) # i.@#
mode=: imax@nubfr { ~.

NB. Frequencies
fr=: +/"1 @ (=/)
frtab=: [,.fr
nubfr=: +/"1 @ =
nubtab=:  ~. ,. nubfr
bnubtab=:  ~. ;"0 +/"1 @ =
cfr=: i.@(<:@$@[) fr io
cfrtab=: midpts@[,.cfr
FR=: [: +/"1 {@[ =/ ]
bars=:  [: #&'*' EACH  fr
barchart=: (": EACH @ [) ,. [: ' '&,. bars
vbarchart=:  [: |. [: |:  [: '^'&,.bars
stem=: <. @ %&10
leaf=: 10&|
SLtab=: 10&*@~.@stem ;"0 stem </. leaf
stemtab=: 10&*@~.@stem ,. stem #/. leaf

NB. Correlation and regression
cov=: ssp % <:@#@]
cor=: cov % (*&sd)
covtab=: cov EACH /~
cortab=: cor EACH /~
SR=: 3 : 0
:
'b0 b1'=. b=: y.%.X=:1,"0 x.
yest=. b0+b1*x.
SRtable=: x. ,. y. ,. yest
sst=. +/*:y.-am y.
sse=. +/*:y.- X +/ . * b
mse=. sse%<:<:$y.
seb=. %:mse%+/*:x.-am x.
rsq=. 1-sse%sst
r=. 'Slope       ',10.5": b1
r=. r,: ' S.E.       ',10.5": seb
r=. r,'Intercept   ',10.5": b0
r=. r,'S.E. of est.',10.5": %:mse
r=. r,'Corr. sq.   ',10.5": rsq
)
REG=: 3 : 0
b=. (y=: ;@{: y.)%.X=:(1&,"1)@|:@(>@}:) y.
sst=. +/*:(y-am y)
ssr=. sst-sse=: +/*:(y- X +/ . * b)
F=. (msr=: ssr%k)%mse=: sse%_1+(n=: $y)-k=: <:#y.
rsq=. ssr%sst
seb=. %:(0{mse)*(<1 0)|:%.(|:X)+/ . * X
r=. 49{.'             Var.    Coeff.      S.E.         t'
r=. r, 15.0 12.5 12.5 10.2 ": (i. >:k),. b,. seb,. b%seb
r=. r, ''
r=. r, '  Source     D.F.    S.S.        M.S.         F'
r=. r, 'Regression', 5.0 12.5 12.5 10.2 ": k, ssr,msr,F
r=. r, 'Error     ', 5.0 12.5 12.5": (n-k+1), sse, mse
r=. r, 'Total     ', 5.0 12.5 ": (n-1), sst
r=. r, ''
r=. r, 'S.E. of estimate    ', 10.5":%:mse
r=. r, 'Corr. coeff. squared', 10.5": rsq
)

NB. Analysis of variance
tt=: #: @ i. @ (2&^)
ott=: (/: +/"1) @ tt
mnum=: [: */ -.@[ # $@]      
msum=: 4 : '+/^:(+/-.x.)(/:x.)|:y.' 
msgn=: _1:^~:/
T=: msgn@[ * mnum %~ [: +/ [: , [: *: msum
expand=: [ #^:_1"1 ]
AllTerms=: [: |."1 [: }. ott@#@$
SubTerms=: [: |. ] expand [: tt +/
SS1=: [: | [: +/ SubTerms@[ T"1 _ ]
SS=: [ SS1"1 _ ]
DF=: [: */"1[: |@<: [ #"2 $@]
Factors=: [: 'ABCDEF'&({.~) #@$
AllLabels=: AllTerms # Factors
AOV=: 3 : 0
(AllLabels y.) AOV y.
:
Terms=. (Factors Data=. y.)e."1 >Labels=. ;:,x.
AOVtable=: Terms (DF,. SS) Data
Total=. (<:*/$Data), (+/*:,Data) - (*:+/,Data)%*/$Data
Error=. Total - +/AOVtable
if. {.Error > 0 do.
   AOVtable=: AOVtable,Error
   Labels=. Labels,<'Error  '
end.
AOVtable=: (AOVtable,. %~/"1 AOVtable), Total,0
r=. ((5 12.5 12.5)":}:AOVtable), (5 12.5":}:{:AOVtable),12$' '
(>Labels,<'Total'),.r
)
wsqs=: ([: *:+/) % #   
aov1=: 3 : 0            
D=. y.
SStr=. (+/ wsqs EACH D) - CT=. wsqs ;D
SStot=. (+/ *: ;D) - CT
SSerr=. SStot - SStr
SS1=. SStr,SSerr,SStot
DFerr=. (DFtot=. <:#;D) - DFtr=. <:#D
DF1=. DFtr,DFerr,DFtot
MS1=. (SStr,SSerr) % DFtr,DFerr
SS1,.DF1,.MS1,0
)

NB. Chi-square
ExpFrTab=: (+/"1 */ +/) % +/@,
chisq=: [: +/@, ([: *: -) % ]
chisq22=: ([: }: (+/"1) , +/) hgeometric {.@,

NB. Nonparametric statistics
v=: 4.5 2 6.1 3.7
v1=: 2 3.7 2 4.5 6.1 2 4.5
uranks=: >: @ /:^:2
nranks=: (= mp uranks) % [: +/"1 =
ranks=:  [: , |:@= # nranks
invranks=: [: ranks -
rcor=: ranks@[ cor ranks@]
runs=: [: >: [: +/ 2: (~:/\) ]

NB. Simulation
Die=: >: @ ? @ $&6
Dice=: -@[ <\ Die @ *
SumDice=:  +/EACH @ Dice
Heads=: [: +/ [: ? , $ 2:
rand=: (? % ]) @ ($&1e9)
stdnmlrand=: 3 : 0
r=. i. 0 2
while. y. > {.$r
   do. whilst. S >: 1
      do. V=. <:+:rand 2		
          S=. +/ *: V
   end.
r=. r, V * %: -+:(^.%])S
end.
)
nmlrand=: 3 : 0
0 1&nmlrand y.
:
y.{., ({.x.) + ({:x.) * stdnmlrand >.-:y.
)
exprand=: [ * [: -@^. [: rand ]

NB.Probability distributions
binomial=: 3 : 0
:
'n p'=: x.
x=: y.
(x!n) * (p^x) * (-.p)^n-x
)
poisson=: ^@-@[ * ^ % !@]
geometric=: [ * -.@[ ^ <:@]
hgeometric=: 3 : 0
:
'm n k'=. x.
x=. y.
(x!m) * ((k-x)!n) % k!m+n
)
ndistn=: 3 : 0
Const=. %:0.5p_1
Const * ^--:*:y.
)
Gamma=: !@<:
tdistn=: 3 : 0
:
n=. x.
Const=. (Gamma -:>:n) % (Gamma -:n) * %:n*1p1
Const * (>:(*:y.)%n) ^ --:>:n
)

csdistn=: 3 : 0
:
n=. x.
Const=. % (2^-:n) * Gamma -:n
Const * (y. ^ -:<:<:n) * ^ --:y.
)

fdistn=: 3 : 0
:
'm n'=. x.
Const=. (Gamma -:m+n) % (Gamma -:m) * Gamma -:n
Const * (m^-:m) * (n^-:n) * (y.^-:<:<:m) * (n+m*y.)^--:m+n
)

NB. General utilities
EACH=: &>                    NB. Open each
io=: [:<:[:+/[</]            NB. Index of for intervals
midpts=: [:-:2:+/\]          NB. Mid points
mnum=: [: */ -.@[ # $@]      NB. Marginal numbers
mp=: +/ . *                  NB. Matrix product
msum=: 4 : '+/^:(+/-.x.)(/:x.)|:y.' NB. Marginal sums
sort=: /:~                   NB. Sort up

NB. Integration utilities
W=: +:(#.|.@])"0 1|:@(0:,%.@(^/~@i)%>:@i=: i.@>:@+:)
ew=: +/@(-@(<:@(#@])*i.@[)|."0 1]{.~>:@([*<:@(#@])))
EW=: ([ ew W@]) f.
ai=: 2 : '+/@(x.&space * x.&[ * y.@(x.&grid))"0'
grid=: space *i.@#@[
space=: ] % <:@#@[
I=: (4 EW 5) ai



