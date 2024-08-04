require './lib/bike'

class DockingStation
  attr_accessor :bike_rack

  MAX_CAPACITY = 20

  def initialize
    @bike_rack = []
  end
  
  def release_bike
    raise 'There are no bikes to release!' if empty?
    bike_rack.shift
  end

  def dock_bike(bike)
    raise 'This docking station is full!' if full?
    bike_rack << bike
  end

  def view_bikes
    bike_rack
  end

  private

  def full?
    bike_rack.size == MAX_CAPACITY
  end

  def empty?
    bike_rack.empty?
  end
end