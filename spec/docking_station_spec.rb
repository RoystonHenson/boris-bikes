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

    it 'docks a bike' do
      ds.dock_bike(bike)
      expect(ds.bikes).to eq([bike])
    end
  end
end