# Solution 1
print "Enter a sentence: "
sentence = gets.chomp

sentence_array = sentence.split

sentence_array.each do |word|
  word.capitalize!
end

puts sentence_array.join(" ")

# Solution 2
print "Enter a sentence: "
sentence = gets.chomp

sentence_array = sentence.split
cap_words      = []

sentence_array.each do |word|
  cap_words << word.capitalize
end

puts cap_words.join(" ")

# Solution 3
print "Enter a sentence: "
sentence = gets.chomp

sentence_array = sentence.split

sentence_array.each do |word|
  print word.capitalize + " "
end

# Solution 4
print "Enter a sentence: "
sentence = gets.chomp

words = sentence.split # ["hello", "codecore", "students"]

words.map! {|word| word.capitalize } # ["Hello", "Codecore", "Students"]

puts words.join(" ")

# Solution 5

puts gets.chomp.split.map {|word| word.capitalize }.join(" ")
