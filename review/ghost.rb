class Ghost
  attr_reader :color
  def initialize
    @color = %w? yellow white pink blue ?.sample
  end
end
