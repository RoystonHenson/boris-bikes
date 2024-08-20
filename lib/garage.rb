class Garage
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def repair_all
    storage.map { |vehicles| vehicles.working = true }
  end
end