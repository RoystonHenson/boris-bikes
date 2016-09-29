#testing makersinit
require_relative "bike"

class DockingStation
  attr_reader :bike

  def initialize(bike=[])
    @bike = bike
  end

  def release_bike
    fail "no bikes available" unless @bike.any?
    @bike.pop

  end

  def dock_bike(bike)
    fail "Sorry! The dock is full!" if @bike.length >= 20
    @bike << bike


  end

end
