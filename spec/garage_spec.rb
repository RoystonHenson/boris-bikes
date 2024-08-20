require 'garage'
require 'bike'

describe Garage do
  let(:garage) { Garage.new }

  describe '#initialize' do
    it 'has a storage area for loading/unloading deliveries' do
      expect(garage.storage).to eq([])
    end
  end

  describe '#repair_all' do
    it 'repairs all broken vehicles in storage' do  
      bike1 = Bike.new
      bike2 = Bike.new
      bike1.broken
      bike2.broken
      garage.storage = [bike1, bike2]
      garage.repair_all
      expect(bike1).to be_working
      expect(bike2).to be_working
    end
  end
end