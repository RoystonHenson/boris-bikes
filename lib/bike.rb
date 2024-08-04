class Bike
  attr_accessor :working

  def initialize(working=true)
    @working = working
  end

  def working?
    working
  end

  def broken
    @working = false
  end
end
