require "./cat.rb"
require "./bird.rb"

cat_names  = ["Tom", "Mitnight", "Blue", "Darwin"]
bird_names = ["tweeite", "big bird", "road runner"]

100.times do
  cat  = Cat.new cat_names.sample
  bird = Bird.new bird_names.sample
  cat.catch bird
  cat.eat
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>"
end
