print "Give me a sentence: "
sentence = gets.chomp

sentence = sentence.gsub(" ", "").downcase

# this will give us an array of characters from the string
sentence_array = sentence.split("")

# char_hash = Hash.new(0)
char_hash = {}

sentence_array.each do |character|
  # char_hash[character] += 1
  if char_hash.has_key?(character)
    value = char_hash[character]
    char_hash[character] = value + 1
  else
    char_hash[character] = 1
  end
end

puts char_hash.max_by {|k, v| v }
