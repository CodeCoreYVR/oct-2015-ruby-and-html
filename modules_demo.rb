module HandyMethods
  def cap_and_reverse(string)
    string.capitalize.reverse
  end
end

class ClassOne
  include HandyMethods
end

class ClassTwo
  extend HandyMethods
end

puts ClassOne.new.cap_and_reverse("tam")
puts ClassTwo.cap_and_reverse("tam")
