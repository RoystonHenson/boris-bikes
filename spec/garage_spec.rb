require 'garage'
require 'bike'

describe Garage do
  let(:garage) { Garage.new }

  describe '#initialize' do
    it 'has a storage area loading/unloading deliveries' do
      expect(garage.storage).to eq([])
    end
  end

  describe '#repair_all' do
    it 'repairs all broken bikes in storage' do
      bike1 = Bike.new
      bike2 = Bike.new
      bike1.broken
      bike2.broken
      garage.storage = [bike1, bike2]
      garage.repair_all
      expect(bike1.working).to eq(true)
      expect(bike2.working).to eq(true)
    end
  end
end