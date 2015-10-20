print "Give me your score: "

# Atom editor shortcuts in Mac
# command + shift + d => duplicates a line
# hold(command + control) then use up / down arrows => moves a line
# command + right arrow => go to end of the line
# command + lef arrow => go to beginning of the line

# we can do without the .chomp in here because we're converting the input
# to an integer which will ignore the new line character
score = gets.to_i
A_GRADE_MINIMUM = 80
B_GRADE_MINIMUM = 70
C_GRADE_MINIMUM = 60
D_GRADE_MINIMUM = 50

if score > A_GRADE_MINIMUM
  puts "A"
elsif score > B_GRADE_MINIMUM
  puts "B"
elsif score > C_GRADE_MINIMUM
  puts "C"
elsif score > D_GRADE_MINIMUM
  puts "D"
else
  puts "F"
end
