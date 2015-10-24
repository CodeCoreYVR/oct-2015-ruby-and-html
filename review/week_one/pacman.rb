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
