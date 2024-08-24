require './lib/docking_station'
require './lib/garage'

class Van
  attr_reader :capacity
  attr_accessor :storage

  CAPACITY = 10

  def initialize(capacity=CAPACITY)
    @storage = []
    @capacity = capacity
  end

  def load_from(array, goods_condition='all')
    raise 'The van is full!' if storage.size >= capacity
    select_goods_by_condition(array, storage, goods_condition)
  end

  def unload_to(array, goods_condition='all')
    select_goods_by_condition(storage, array, goods_condition)
  end

  private

  def select_goods_by_condition(from_array, to_array, goods_condition='all')
    case goods_condition
    when 'working' then transfer_working_goods(from_array, to_array, true)
    when 'broken' then transfer_working_goods(from_array, to_array, false)
    when 'all' then transfer_all_goods(from_array, to_array)
    end
  end

  def transfer_working_goods(from_array, to_array, goods_condition)
    while from_array.select { |goods| goods.working == goods_condition }.count > 0
      break if storage.size == capacity
      index = from_array.index(from_array.select { |goods| goods.working == goods_condition }.first)
      to_array << from_array[index]
      from_array.delete_at(index)
    end
  end

  def transfer_all_goods(from_array, to_array)
    from_array.each { |goods| to_array << goods}
    from_array.clear
  end
end