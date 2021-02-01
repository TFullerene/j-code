NB. Counterfactual Regret Minimization in J, with an example for rock paper scissors.
actions =: 2
pass =: 0
bet =: 1
random =: 2?2
strategysum =: strategy =: regretsum =: actions
normsum =: 0

getStrategy =: 3 : 0
normsum =. 0
a =. 0
strategyregretsum =. a

for. a < action do.
strategy_a =. regretsum > 0 +. 0
end.
for. a < actoin do.
if. normsum > 0 do.
strategy =. strategy % normsum
else.
strategy =. 1 % action
do.
strategy =. realizationweight + strategy * strategy
end.
strategy
end.
)

getAverageStrategy =: 3 : 0
averagestrategy =. action
normsum =. a =. 0
for. a < action do.
normsum =. normsum + strategysum
end.

for. a < action do.
if. normsum > 0 do.
avgstrategy =. strategysum % normsum
else.
avgstrategy =. 1 % action
end.
avgstrat
end.
)

train =: 3 : 0
rps =. 1 2 3
util =. i =. 0
for. i < actions do.
for. c1 =. i.rps _1 do.
c1 > 0
<: c1
tmp =. i.c1
c1 =. i.c2
c2 =. tmp
end.
)


