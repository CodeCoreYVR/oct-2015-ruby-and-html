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
