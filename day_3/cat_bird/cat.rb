require "./animal.rb"

class Cat < Animal

  def catch(bird)
    number = rand(10)
    if number < 5
      @bird = bird
      puts "#{bird.name} is caught by #{@name}"
    else
      puts "#{bird.name} gets away!"
    end
  end

  def eat
    if @bird
      puts "#{@name} eats bird #{@bird.name}"
      @bird = nil
    else
      puts "Nothing to eat!"
    end
  end

end
