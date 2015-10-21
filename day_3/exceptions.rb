begin
  # you put the code that might raise an exception in here
  10 / 0
rescue ZeroDivisionError
  puts "Can't divide by zero, use another number"
rescue => exp
  # handling the exception in here
  puts "Something went wrong: #{exp.message}"
end
