def by_five?(number)
  if number % 5 == 0
    true
  else
    false
  end
end

def by_five?(number)
  # this expression will return true or false which is
  # what I want the method to return
  number % 5 == 0
end

puts by_five?(10)
puts by_five?(32)
