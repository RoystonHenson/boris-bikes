
require_relative "bike"

class DockingStation
  attr_reader :bike, :broken_bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike = []

  end

  def release_bike
    fail "no bikes available" if empty? || @bike.select {|b| b.condition == "Working" }.empty?
    @bike.pop if @bike.select {|b| b.condition == "Broken"}.empty?
    working_bikes = @bike.select {|b| b.condition == "Working" }.pop
    broken_bikes = @bike.select {|b| b.condition == "Broken" }
    @bike = working_bikes.concat broken_bikes
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
