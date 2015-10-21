def my_method(a, code1, code2)
  puts a
  code1.call
  code2.call
end

lambda1 = lambda { puts "Hello World" }
lambda2 = lambda { puts "Hello CodeCore" }

my_method("Hey There", lambda1, lambda2)
