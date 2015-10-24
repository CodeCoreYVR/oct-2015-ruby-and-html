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
      * die when eating a ghost (if supertime <= 0)
      * get 10 points when eating a ghost

```ruby
class NotBallOrGhostError < StandardError; end
class Pacman
  def initialize
    @super_time = 0
    @extra_lives = 2
    @points = 0
  end

  def eat(stuff)
    raise NotBallOrGhostError unless ghost_or_ball? stuff
    stuff.class == Ball ? eat_ball(stuff) : eat_ghost(stuff)
  end

  private

    def ghost_or_ball?(stuff)
      stuff.class == Ghost || stuff.class == Ball
    end

    def eat_ball(ball)
      if ball.ball_type == "regular"
        @points += 1
        @super_time -= 1
      elsif ball.ball_type == "super"
        @points += 5
        @super_time = 10
      end
    end

    def eat_ghost(ghost)
      @super_time > 0 ? @points += 10 : die
    end

    def die
      @extra_lives > 0 ? @extra_lives -= 1 : game_over
    end

    def game_over
      1000.times { print "|||||||||||||||||||||||||||||||GAME|||OVER|||||||||||||||||||||||||||" }
    end
end
```
And let's add a setup file to load a bunch of actions and objects for us.
```ruby
require './ball.rb'
require './ghost.rb'
require './pacman.rb'

@pacman = Pacman.new
regular_ball = Ball.new
super_ball = Ball.new('super')
ghost_one = Ghost.new
ghost_two = Ghost.new
ghost_three = Ghost.new
@ghost_four = Ghost.new

@pacman.eat(regular_ball)
@pacman.eat(ghost_one)     # die once
@pacman.eat(ghost_one)     # die once more (no more extra lives)
@pacman.eat(super_ball)    # @super_time = 10
@pacman.eat(ghost_two)     # should gain points
@pacman.eat(ghost_three)   # should gain more points

10.times { @pacman.eat(regular_ball) } # @super_time should be <= 0
```
