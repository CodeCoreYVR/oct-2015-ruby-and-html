class Person
  # attr_accessor :name
  # attr_reader :name
  # attr_writer :name
  # constructor method
  def initialize(name)
    @name = name
  end

  # getter method
  def name
    @name
  end

  # setter method
  def name=(new_name)
    @name = new_name
  end
end
