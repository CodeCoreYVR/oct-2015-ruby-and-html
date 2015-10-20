names     = %w(ian brien kourosh isaac glenn)
            # will generate:
            # ["ian", "brien", "kourosh", "isaac", "glenn"]
cap_names = []

names.each do |name|
  # cap_names.push(name.capitalize)
  cap_names.push name.capitalize
  # puts name.capitalize
end

print cap_names
