require "./handy_methods.rb"

class Car

  # all the methods defined inside HandyMethods are available for us in here
  # as instance methods
  include HandyMethods
  # you can also use extend, which will include all the methods in the module
  # as class methods instead of instance methods

  def initialize(model, type, capacity)
    # @type, @model, @capacity = type, model, capacity
    @model    = model
    @capacity = capacity
    @type     = type
  end

  def self.max_speed
    200
  end

  def drive
    Car.test
    ignite_engine
    driving_printout = reverse_and_upcase("driving...")
    puts driving_printout
  end

  def park
    puts "Parking..."
  end

  def stop
    puts "Stopping.."
  end

  private

  def self.test
    puts "Test method"
  end

  def pump_gas
    puts "Pumping gas.."
  end

  def ignite_engine
    puts "Igniting Engine.."
  end

end
