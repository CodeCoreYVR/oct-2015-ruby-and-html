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
## Pacman Class
Let's take a moment now, and really think: What should our Pacman class do?  
  
We don't want to make things overly complicated, so let's not worry about game mechanics, the game world, or even about movement! Let's just focus on some very important features.  
  
Objects of the type Pacman should:  
  
  - initialize with:
    + a regular state (super or not)
    + 2 extra lives
    + 0 points

  - have methods to:
    + eat
      * should handle balls and ghosts
      * get 1 point when eating a regular ball
      * get 5 points when eating a super ball
        - and state changes to super
      * die when eating a ghost
      * get 10 points when eating a ghost

```ruby
class Pacman
  def initialize
    @super_time = 0
    @extra_lives = 2
    @points = 0
  end
end
```
