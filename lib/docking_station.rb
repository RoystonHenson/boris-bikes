require './lib/bike'

class DockingStation
  attr_accessor :bike_rack

  MAX_CAPACITY = 20

  def initialize
    @bike_rack = []
  end
  
  def release_bike
    raise 'There are no bikes to release!' if @bike_rack.empty?
    @bike_rack.shift
  end

  def dock_bike(bike)
    raise 'This docking station is full!' if bike_rack.size == MAX_CAPACITY
    @bike_rack << bike
  end

  def view_bikes
    @bike_rack
  end
end