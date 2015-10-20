print "Enter a number: "
number = gets.to_i

# Solution 1
counter = 1
while counter <= number
  puts "Hello World"
  counter += 1
end

# Solution 2
while number > 0
  puts "Hello World"
  number -= 1
end
