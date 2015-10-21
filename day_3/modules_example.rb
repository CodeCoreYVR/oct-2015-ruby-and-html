module Fruit
  class Apple

  end
end

module Computer
  class Apple

  end
end
# you can also write it as:
class Computer::Apple

end


gala = Fruit::Apple.new
mac  = Computer::Apple.new
