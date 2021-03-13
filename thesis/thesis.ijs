NB. Code for my Thesis
load 'tables/csv'
load 'graphics/plot'
list1 =: 0 {::|: readcsv '~/Desktop/j-code/thesis/vehicle1.csv'
list2 =: 1 {::|: readcsv '~/Desktop/j-code/thesis/vehicle1.csv'
radius =: 2 {::|: readcsv '~/Desktop/j-code/thesis/vehicle1.csv' 
print =: 1!:2&2
print list1
print list2
print radius
np =: 20
print np
foodnumber =: np%2
print foodnumber
limit =: 100
print limit
upperbounds =: 1 100 $ limit
print upperbounds
lowerbounds =: 1 100 $ -limit
print lowerbounds
runtime =: 1
print runtime
globalmins =: 0
print globalmins
range =: 20 30 $ limit
print range
lower =: 20 30 $ _50
print lower
rand =: 100?@$~ ]
print rand
foods =: rand 20 30
print foods
listsize =: $ list1
print listsize
NB. calculatefitness =: 3 : 0
NB. fitness =: 0
NB. index =: objectvalue >= 0
NB. fitness_of_index =: 1 % (objectvalue * (index) + 1)
NB. index =: objectvalue < 0
NB. fitness_of_index =: 1 + |objectvalue * (index)
NB. )
calcfit =: 1 16 $ 0
print calcfit
calculatepath =: 3 : 0
nodesize =: $ list2
logradius =: radius % ^. 20
nodenumber =: 1 1 $ 0
count2 =: count1 =: nodenumber
x =: 500 % (nodenumber + 1)
for. i =: i.nodenumber do.
   for. j =: i.nodenumsize do.
	d =: %: (j { list1 - x * i)^ 2) + (j { list2) - i { path)^2)
	count1(i) =: count(1) + ^(-1 * d % logradius(i))
   end.
end.
for. k =: i.nodenumber - 1
  k { count2 =: %:((x)^2 + (k { path - k { path + 1)^2) 
end.
sc1 =: +/ count1
sc2 =: +/ count2 % 500
path =: sc1 + sc2
)
for. i. runtime do.
   for. i. FoodNumber do.
 i { ObjectValue =: calcfit i { foods
   end.
end.
fitness =: calcfit objectvalue
trial =: 1 1 $ i.foodnumber
BestIndex =: <. objectvalue
globalMin =: BestIndex { objectvalue
globalParameters =: BestIndex  { foods
iteration =: runtime
while. iteration <: maxCycle do.
       for. i.foodNumber do.
    	    changeParam =: (? * D) + 1
	    neighbor =: (? * foodNumber) + 1

	    	  while. neighbor = i do.
	    	   	 neighbor =: (? * foodNumber) + 1
	    	   end.
	    end.
end.
solution =: i { foods
index =: solution < lowerbounds
firstvsize =:  (1?D) * (upperbounds - lowerbounds) + lowerbounds
index { solution =: index { firstvsize
index =: solution > upperbounds
firstvsize =:  (1?D) * (upperbounds - lowerbounds) + lowerbounds
index { solution =: index { firstvsize
objectvalueSolution =: solution { pathcalc
fitnessSol =: objectvalueSolution { fitcalc
 if. (fitnessSol>fitness(i)) 
	1 {:: { foods =: solution
	i { fitness =: fitnessSol
	i { objectValue =: objectvalueSolution
	i { trial =: 0
        else.
	i { trial =: i { trial + 1
       end.       
EBFL =: fitnessSol
NB. Sort descending 
sortEBFL =: fitnessSol \: fitnessSol                      
paretoEBFL =: 0.2 * EBFL
end.
NB.% Onlooker Bee Phase
prob =: 0.9 * fitness % >. fitness + 0.1
i =: 1
t =: 0
while. t<foodNumber do.
    if. rand <  i { prob do.
        t =: t + 1
        changeParam =: (rand * limit) + 1
        neighbour=: rand * (foodNumber) + 1     
            while. neighbour = i do.
                neighbour =:  (rand * foodNumber) + 1
            end.
       
	solution =: 1 {:: i { foods

        	changeParam { solution =: i changeParam { foods + ( i changeParam { foods - neighbour changeParam { foods) * (rand - 0.5) * 2

	index =: solution < lowebounds

	firstvsize =:  (1?limit) * (upperbounds - lowerbounds) + lowerbounds

	index { solution =: index { firstvsize

	index =: solution > upperbounds

	firstvsize =:  (1?limit) * (upperbounds - lowerbounds) + lowerbounds

        	index { solution =: index { firstvsize

	objectvalueSolution =: solution { pathcalc

	fitnessSol =: objectvalueSolution { fitcalc
        NB. Ok, I need to compare fitness(i) to ParetoEBFL.
	if. EBFL> i { fitness do.
	NB. if it is true, then I need to check if the value of fitnessSol is greater than fitness(i)
           NB.if (fitnessSol>fitness(i))
		if. fitnessSol > i { fitness do. 
		{:: i { foods =: solution
		i { fitness =: fitnessSol
		i { fitness =: EBFL
		i { objectValue =: objectvalueSolution
		i { trial =: 0
           else.
	i { trial =: i { trial + 1
	end.
    end.
    i =: i + 1
    if. i = foodNumber + 1  do. 
        i =: 1
    	end.
    end.
	index =: objectValue = <.objectValue
	NB.index = index
         if.  index { objectValue < globalMin do.
	globalMin =: index { objectValue
	globalParameters =: {:: index { foods
         end.
NB. Scout bee phase
	index =: trial = <. trial
NB.index=index(end);
if. index { trial > limit do.

	index { trial =: 0

	solution =: upperbounds - lowerbounds * (1 ? limit) + lowerbounds

	objectvalueSolution =: solution { pathcalc

	fitnessSol =: objectvalueSolution { fitcalc

	{:: index { foods =: solution

	index { fitness =: fitnessSol

	index { objectValue =: objectvalueSolution
end.
iteration =: globalMin
iteration =: iteration + 1
end. 
r =: store
print r
end.

for. i = 1:firstvsize do.
x =: i { xcoordinates , i { ycoordinates
end.

for. i.limit - 1 do.
   x =: 500 % (limit + 1) * i , 500 % (limit + 1) * (i + 1) , i { globalparameters , i + 1 { globalparameters
end.

val1 =: (0 500 % (limit + 1) * 1), (0, 1 { globalParameters)

val2 =: (500 % limit + 1 * limit , 500), (limit { globalparameters , 0)