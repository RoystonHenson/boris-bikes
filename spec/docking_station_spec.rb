require 'docking_station'

describe DockingStation do
  let(:ds) { DockingStation.new }
  
  describe '#release_bike' do
    it 'releases a bike' do
      expect(ds).to respond_to(:release_bike)
    end

    it 'release and instance of bike that is working' do
      bike = ds.release_bike
      expect(bike).to be_instance_of(Bike)
      expect(bike).to be_working
    end
  end

  describe '#dock_bike' do
    let(:bike) { Bike.new }

    it 'can dock a bike in the docking station' do
      ds.dock_bike(bike)
      expect(ds.bike_rack).to eq([bike])
    end
  end

  describe '#view_bikes' do
    bike1, bike2 = Bike.new, Bike.new

    it 'shows available bikes' do
      ds.dock_bike(bike1)
      ds.dock_bike(bike2)
      expect(ds.view_bikes).to eq([bike1, bike2])
    end
  end
end