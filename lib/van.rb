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
      array.select { |goods| 
                     storage << goods if goods.working == true
                   }
      array.select! { |goods| goods.working == false }
    when 'broken'
      array.select { |goods| 
                     storage << goods if goods.working == false
                   }
      array.select! { |goods| goods.working == true }
    when 'all'
      array.each { |goods| storage << goods }
      array.clear
    end
  end

  def unload_to(array, goods_condition='all')
    case goods_condition
    when 'working'
      storage.select { |goods|
                       array << goods if goods.working == true
                     }
      storage.select! { |goods| goods.working == false }
    when 'broken'
      storage.select { |goods| 
                    array << goods if goods.working == false
                   }
      storage.select! { |goods| goods.working == true }
    when 'all'
      storage.each { |goods| array << goods }
      storage.clear 
    end
  end
end