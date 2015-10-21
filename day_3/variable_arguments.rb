def multiply(a, *b)
  result = a
  b.each do |number|
    # result *= number
    result = result * number
  end
  result
end

print multiply 5
print multiply 5,6,7,7,4,5,4,5,4,54,45,4
