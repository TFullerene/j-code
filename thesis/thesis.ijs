NB. Code for my Thesis
print =: 1!:2
list1 =: 100 200 300 400 150 250 350 150 250 350 466 250 250 466 30

list2 =: 0 0 0 0 50 50 50 _50 _50 _50 40 40 _300 300 _40 _20

radius =: 40 40 40 40 40 40 40 40 40 40 20 20 260 277 20 30
np =: 20
foodnumber =: np%2
limit =: 100
d =: limit
upperbounds =: 1 100 $ d
lowerbounds =: 1 100 $ -d

runtime =: 1
globalmins =: 0

range =: 20 30 $ d
lower =: 20 30 $ _50

rand =: 0?@$~ ]

foods =: rand 20 30 

listsize =: $ list1

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
