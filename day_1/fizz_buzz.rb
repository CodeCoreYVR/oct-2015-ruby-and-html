for x in 1..100
  if x % 3 == 0 && x % 5 == 0
    puts "FIZZBUZZ"
  elsif x % 5 == 0
    puts "BUZZ"
  elsif x % 3 == 0
    puts "FIZZ"
  else
    puts x
  end
end
