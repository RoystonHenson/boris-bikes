require './lib/docking_station'

class Van
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def load_bikes(array)
    # move bikes to the van storage first
    array.select { |bike| 
                   storage << bike if bike.working == false
                 }
    # after all bikes have been moved, set the array to only hold the values that should still be there ('select!'?)
    array.select! { |bike| bike.working == true }
  end

  def unload_bikes(array)
    storage.select { |bike| 
                    array << bike if bike.working == false
                   }
    storage.select! { |bike| bike.working == true }
  end
end