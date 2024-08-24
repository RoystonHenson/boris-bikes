require './lib/bike'

class DockingStation
  attr_reader :capacity
  attr_accessor :bike_rack

  CAPACITY = 20

  def initialize(capacity=CAPACITY)
    @bike_rack = []
    @capacity = capacity
  end
  
  def release_bike
    error_if_no_bikes
    bike_rack.delete_at(bike_rack.index { |bike| bike.working == true })
  end

  def dock_bike(bike)
    error_if_full
    error_if_not_a_bike(bike)
    bike_rack << bike
  end

  def view_bikes
    bike_rack
  end

  private

  def error_if_full
    raise 'This docking station is full!' if bike_rack.size >= capacity
  end

  def error_if_not_a_bike(bike)
    raise 'This docking station will only accept bikes!' if bike.class != Bike
  end

  def error_if_no_bikes
    raise 'There are no bikes available to release!' if empty? || no_working_bikes?
  end

  def empty?
    bike_rack.empty?
  end
  
  def no_working_bikes?
    !bike_rack.any? { |bike| bike.working == true }
  end
end