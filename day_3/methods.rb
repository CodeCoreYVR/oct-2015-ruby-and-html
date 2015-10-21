# This defines a method names multiply that requires two arguments (or parameters)
# it returns the mutiplication result
def multiply(a, b)
  a * b
end

puts multiply(6, 7)
puts multiply 6, 7

# this will not work because multiply requires two arguments
# puts multiply 6

def sum(a = 0, b = 0)
  a + b
end

puts sum(4,5)
puts sum(6)
puts sum

def my_method(a)
  return 0 unless a.is_a? Integer
end
