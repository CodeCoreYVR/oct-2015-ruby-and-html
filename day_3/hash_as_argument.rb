def my_method(user_info)
  user_info[:name]
end

puts my_method name: "tam"

def my_method_2(greeting, user_info)
  # greeting + " " + user_info[:name]
  "#{greeting} #{user_info[:name]}"
end

puts my_method_2("hello", {name: "tam"})
puts my_method_2 "hello", name: "tam"
puts my_method_2 "hello", age: 20
