class Van
  attr_reader :storage

  def initialize
    @storage = []
  end

  def load_bikes(array)
    array.map { |bike|
                if bike.working == false
                  storage << bike
                  array.delete_at(array.index(bike))
                end
    }
    #storage << array.delete_at(array.index())
  end
end