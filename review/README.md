# Review Day 3: OOP
Let's create some classes that interact with each other. We've already created birds, cats, and other things. Let's make some balls, ghosts, and Pacman objects.  
  
But how? What attributes and methods should they have? How will they interact with each other?  
  
Let's start with the Ball class.  
  
## Ball Class
Objects of the type Ball should:  
  
  - take an optional argument called `ball_type`
  - if no argument is given, the default `ball_type` should be `regular`
  - `ball_type` should be readable
  
```ruby
class Ball
  attr_reader :ball_type
  def initialize(ball_type = "regular")
    @ball_type = ball_type
  end
end
```
## Ghost Class
Objects of the type Ghost should:  
  
  - initialize with a random color of "yellow, white, pink, blue"

```ruby
class Ghost
  attr_reader :color
  def initialize
    @color = %w| yellow white pink blue |.sample
  end
end
```
