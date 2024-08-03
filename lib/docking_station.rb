require './lib/bike'

class DockingStation
  attr_accessor :bike_rack

  def initialize
    @bike_rack = []
  end
  
  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @bike_rack << bike
  end

  def view_bikes
    @bike_rack
  end
end