list1 =: 100 200 300 400 150 250 350 150 250 350 466 250 250 466 30
list2 =: 0 0 0 0 50 50 50 _50 _50 _50 40 40 _300 300 _40 _20
radius =: 40 40 40 40 40 40 40 40 40 40 20 20 260 277 20 30
nodesize =: $ list2
logradius =: radius % ^. 20
nodenumber =: 1 1 $ 0
count1 =: 1 1 $ 0
count2 =: count1
x =: 500 % (nodenumber + 1)
for. i =: i.nodenumber do.
   for. j =: i.nodenumsize do.
	d =: %: (list1(j) - x * i)^ 2) + (list2(j) - path(i))^2)
	count1(i) =: count(1) + ^(-1 * d % logradius(i))
   end.
end.
for. k =: i.nodenumber - 1
   count2(k) =: %:((x)^2 + (path(k)-path(k+1))^2) 
end.
sc1 =: +/ count1
sc2 =: +/ count2 % 500
path =: sc1 + sc2
