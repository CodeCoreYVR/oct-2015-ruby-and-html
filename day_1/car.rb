print "Enter your car year: "

year = gets.chomp.to_i

if year > 2015
  puts "You have a future car congratulations"
elsif year == 2015
  puts "You bought your car this year"
elsif year > 2005
  puts "Your car is old"
else
  puts "Time to upgrade"
end
