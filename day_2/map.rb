numbers = (1..10).to_a

# numbers > [1,2,3,4,5,6,7,8,9,10]
print numbers.map  {|number| number * number }
# it will print [1, 4, 9, 16...]

# numbers > [1,2,3,4,5,6,7,8,9,10]
print numbers.each {|number| number * number }
# it will print [1,2,3,4,5,6,7,8,9,10]
