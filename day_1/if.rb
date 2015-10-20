print "Give me a number: "
number = gets.chomp.to_i

# if the expression given to the if statement evaluates to true it will
# execute what's inside the if block, otherwise, it will exectue what's inside
# the else block
# You can do either if(number > 10) or if number > 10
# if number > 10
#   puts "The number is large"
# else
#   puts "The number is small"
# end

# you can have one if and one else blocks. You can have as many elsif blocks
# as you wish
if number > 10
  puts "The number is large"
elsif number > 5
  puts "The number is medium"
else
  puts "The number is small"
end
