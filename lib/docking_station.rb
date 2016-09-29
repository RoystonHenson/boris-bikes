
require_relative "bike"

class DockingStation
  attr_reader :bike
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike = []
  end

  def release_bike
    fail "no bikes available" if empty?
    @bike.pop

  end

  def dock_bike(bike)
    fail "Sorry! The dock is full!" if full?
    @bike << bike
  end

  private

  def full?
    return true if @bike.length >= @capacity
  end

  def empty?
    return true if @bike.empty?
  end
end
