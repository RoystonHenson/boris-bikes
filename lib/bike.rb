class Bike
  attr_accessor :condition

  def initialize(condition="Working")
      @condition = condition
  end

  def working?
    @condition = "Working"
  end

  def broken?
    @condition = "Broken"
  end
end
