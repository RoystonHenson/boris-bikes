require_relative "bike"

class DockingStation
attr_reader :bike

#def initialize
  #@@boris = []
#end

  def release_bike
    fail ("no bikes available") unless @bike
    @bike
  end

  def dock_bike(bike)
    @bike = bike
  end

end
