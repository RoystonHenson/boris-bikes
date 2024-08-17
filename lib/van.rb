require './lib/docking_station'
require './lib/garage'

class Van
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def load_bikes(array)
    array.select { |bike| 
                   storage << bike if bike.working == false
                 }
    array.select! { |bike| bike.working == true }
  end

  def unload_bikes(array)
    storage.select { |bike| 
                    array << bike if bike.working == false
                   }
    storage.select! { |bike| bike.working == true }
  end
end