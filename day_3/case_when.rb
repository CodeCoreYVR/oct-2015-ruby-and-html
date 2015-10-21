language = gets.chomp

case language
when "English" then puts "Hello"
when "French" then puts "Bonjour!"
when "Spanish" then puts "Hola!"
else puts "What was that?"
end

number = gets.to_i

case number
when 0..10
  puts "Small"
when 10..20
  puts "Medium"
else
  puts "Large"
end
