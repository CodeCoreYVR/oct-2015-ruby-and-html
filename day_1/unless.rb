print "Give me a number: "

number = gets.to_i

unless number < 10
  puts "The number is large"
end
# is equivalent to:
puts "The number is large" unless number < 10

# is equivalent to:
if number >= 10
  puts "The number is large"
end
# is equivalent to:
if !(number < 10)
  puts "The number is large"
end
