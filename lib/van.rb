require './lib/docking_station'
require './lib/garage'

class Van
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def load_from(array, goods_condition='all')
    case goods_condition
    when 'working' then transfer_working_goods(array, storage, true)
    when 'broken'  then transfer_working_goods(array, storage, false)
    when 'all' then transfer_all_goods(array, storage)
    end
  end

  def unload_to(array, goods_condition='all')
    case goods_condition
    when 'working' then transfer_working_goods(storage, array, true)  
    when 'broken' then transfer_working_goods(storage, array, false)
    when 'all' then transfer_all_goods(storage, array)
    end
  end

  private

  def transfer_working_goods(from_array, to_array, goods_condition)
    from_array.select { |goods|
                      to_array << goods if goods.working == goods_condition  
                      }
    from_array.select! { |goods| goods.working == !goods_condition}
  end

  def transfer_all_goods(from_array, to_array)
    from_array.each { |goods| to_array << goods}
    from_array.clear
  end
end