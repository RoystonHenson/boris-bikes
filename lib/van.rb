require './lib/docking_station'
require './lib/garage'

class Van
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def load_from(array, goods_condition='all')
    case goods_condition
    when 'working'
      array.select { |bike|
                     storage << bike if bike.working == true
                   }
      array.select! { |bike| bike.working == false }
    when 'broken'
      array.select { |bike| 
                     storage << bike if bike.working == false
                   }
      array.select! { |bike| bike.working == true }
    when 'all'
      array.each { |bike| storage << bike }
      array.clear
    end
  end

  def unload_bikes(array)
    storage.select { |bike| 
                    array << bike if bike.working == false
                   }
    storage.select! { |bike| bike.working == true }
  end
end