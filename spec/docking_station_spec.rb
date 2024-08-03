require 'docking_station'

describe DockingStation do
  let(:ds)   { DockingStation.new }
  let(:bike) { Bike.new }
  
  describe '#release_bike' do
    #let(:bike) { Bike.new }

    context 'when working bikes are available' do
      it 'releases a bike' do
        expect(ds).to respond_to(:release_bike)
      end

      it 'release an instance of bike that is working' do
        ds.bike_rack = [bike]
        expect(bike).to be_instance_of(Bike)
        expect(bike).to be_working
      end
    end

    context 'when docking station has no bikes' do
      it 'raises error' do
        expect { ds.release_bike }.to raise_error(RuntimeError, 'There are no bikes to release!')
      end
    end
  end

  describe '#dock_bike' do
    #let(:bike) { Bike.new }

    context 'when docking station has space for bikes' do
      it 'can dock a bike in the docking station' do
        ds.dock_bike(bike)
        expect(ds.bike_rack).to eq([bike])
      end
    end

    context 'when docking station is full' do
     it 'raises error' do
       ds.bike_rack = [bike]
       bike2 = Bike.new
       expect { ds.dock_bike(bike2) }.to raise_error(RuntimeError, 'This docking station is full!')
     end
    end
  end

  describe '#view_bikes' do
    it 'shows available bikes' do
      ds.dock_bike(bike)
      expect(ds.view_bikes).to eq([bike])
    end
  end
end