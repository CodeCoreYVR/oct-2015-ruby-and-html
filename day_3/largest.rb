def largest_number(*a)
  a.sort.last
  a.max
end

puts largest_number 5,565,5,5,56,45,4,54,5,54,455
