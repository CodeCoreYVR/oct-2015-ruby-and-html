my_array = [1,2,3,4,5]

# I'm passing a block to the each method on the array
# use this syntax if you have multi-line blocks
my_array.each do |number|
  puts number + 1
end

# use this syntax for simple one-line blocks
my_array.each {|number| puts number + 1 }
