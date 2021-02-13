NB. Code for my Thesis
load 'tables/dsv'
load 'graphics/plot'
list1 =: 1 {::|: readdsv 'vehicle1.dat'
list2 =: 2 {::|: readdsv 'vehicle1.dat'
radius =: 3 {::|: readdsv 'vehicle1.dat' 
print =: 1!:2&2
NB.print list1
NB.print list2
NB.print radius
np =: 20
NB.print np
foodnumber =: np%2
NB.print foodnumber
limit =: 100
NB.print limit
d =: limit
NB.print d
upperbounds =: 1 100 $ d
NB.print upperbounds
lowerbounds =: 1 100 $ -d
NB.print lowerbounds

runtime =: 1
NB.print runtime
globalmins =: 0
NB.print globalmins

range =: 20 30 $ d
NB.print range
lower =: 20 30 $ _50
NB.print lower

rand =: 0?@$~ ]
NB.print rand

foods =: rand 20 30
NB.print foods

listsize =: $ list1
NB.print listsize

calculatefitness =: 3 : 0
fitness =: 0
index =: objectvalue >= 0
fitness_of_index =: 1 % (objectvalue * (index) + 1)
index =: objectvalue < 0
fitness_of_index =: 1 + |objectvalue * (index)
)

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


for. i. r < runtime do.
   for. i. i < FoodNumber do.
 i { ObjectValue =: calculatefitness i { foods
   end.
end.
fitness =: calculatefitness objectvalue

trial =: 1 1 $ i.foodnumber

BestIndex =: <. ObjectValue

