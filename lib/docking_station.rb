
require_relative "bike"

class DockingStation
  attr_reader :bike
  DEFAULT_CAPACITY = 20

  def initialize(bike=[])
    @bike = bike
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
    return true if @bike.length >= DEFAULT_CAPACITY
  end

  def empty?
    return true if @bike.empty?
  end
end
