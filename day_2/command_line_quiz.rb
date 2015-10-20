print "How many sides does a hexagon have?"
sides = gets.chomp

# 5 + 5 * 3 => 20
# doing something like this:
# if sides == "six" || "6"
# will result in the expression always evaluating to true because
# the == operator has precedance over the || operator so you'll always
# be calling || "6" which evalutes to true
if sides == "six" || sides == "6"
  puts "Correct"
else
  puts "InCorrect"
end
