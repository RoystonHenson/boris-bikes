require './lib/bike'

class DockingStation
  attr_reader :capacity
  attr_accessor :bike_rack

  MAX_CAPACITY = 20

  def initialize(capacity=MAX_CAPACITY)
    @bike_rack = []
    @capacity = capacity
  end
  
  def release_bike
    if empty?
      raise 'There are no bikes to release!'
    elsif no_working_bikes?
      raise 'There are no working bikes to release!'
    else
      bike_rack.delete_at(bike_rack.index { |bike| bike.working == true })
    end
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
    bike_rack.size >= capacity
  end

  def empty?
    bike_rack.empty?
  end

  def no_working_bikes?
    !bike_rack.any? { |bike| bike.working == true }
  end
end