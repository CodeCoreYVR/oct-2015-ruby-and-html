def greeting
  puts "Hello"
  # the yield will execute any block that you've passed to the method
  yield if block_given?
  puts "Bye"
end

greeting do
  puts ">>>>>> CodeCore Students >>>>>>"
end
puts "---------------------------------"
greeting { puts ">>>>>> CodeCore Students >>>>>>" }
puts "---------------------------------"
greeting

def my_method
  a = rand(100)
  puts "Your Lucky number is #{a}"
end

def my_method
  a = rand(100)
  yield(a) if block_given? # if not blocks this returns nil
end

my_method do |x|
  puts "Your Lucky number is #{x}"
end

my_method {|x| puts "Your Lucky number is #{x}" }
my_method {|x| puts "Buy a lottery ticket that starts with #{x}" }
my_method { puts "Hello World" }
puts my_method

def multiply(a, b)
  yield if block_given?
  a * b
end

multiply 5, 6 do
  puts "Hello World"
end
