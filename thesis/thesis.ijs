NB. Code for my Thesis
print =: 1!:2&2
list1 =: 100 200 300 400 150 250 350 150 250 350 466 250 250 466 30
print list1
list2 =: 0 0 0 0 50 50 50 _50 _50 _50 40 40 _300 300 _40 _20
print list2
radius =: 40 40 40 40 40 40 40 40 40 40 20 20 260 277 20 30
print radius
np =: 20
print np
foodnumber =: np%2
print foodnumber
limit =: 100
print limit
d =: limit
print d
upperbounds =: 1 100 $ d
print upperbounds
lowerbounds =: 1 100 $ -d
print lowerbounds

runtime =: 1
print runtime
globalmins =: 0
print globalmins

range =: 20 30 $ d
print range
lower =: 20 30 $ _50
print lower

rand =: 0?@$~ ]
print rand

foods =: rand 20 30
print foods

listsize =: $ list1
print listsize

calculatefitness =: 3 : 0
fitness =: 0
index =: objectvalue >= 0
fitness_of_index =: 1 % (objectvalue * (index) + 1)
index =: objectvalue < 0
fitness_of_index =: 1 + |objectvalue * (index)
)

calculatepath =: 3 : 0

secvsize =: 1631
x =: radius % ^. 20

)

calculatepath =: 3 : 0



)


for. r < runtime do.
   for. i < FoodNumber do.


   end.
end.
