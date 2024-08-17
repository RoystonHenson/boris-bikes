class Garage
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def repair_all
    storage.map { |bike| bike.working = true }
  end
end