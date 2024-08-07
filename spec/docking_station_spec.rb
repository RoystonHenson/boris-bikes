require 'docking_station'

describe DockingStation do
  let(:ds)   { DockingStation.new }
  let(:bike) { Bike.new }
  
  describe '#initialize' do
    context 'when user does not specify default capacity' do
      it 'has a capacity of 20' do
        expect(ds.capacity).to eq(20)
      end
    end

    context 'when user specifies default capacity' do
      it 'has the capacity entered by the user' do
        ds = DockingStation.new(50)
        expect(ds.capacity).to eq(50)
      end
    end
  end

  describe '#release_bike' do
    context 'when docking station has no bikes' do
      it 'raises error' do
        expect { ds.release_bike }.to raise_error(RuntimeError, 'There are no bikes to release!')
      end
    end

    context 'when docking station has working bikes' do
      it 'release a working bike' do
        bike2 = Bike.new
        bike.broken
        ds.bike_rack = [bike, bike2]
        expect(ds.release_bike).to eq(bike2)
        expect(ds.bike_rack).to eq([bike])
      end
    end

    context 'when docking station has bikes that aren\'t working' do
      it 'raises error' do
        bike.broken
        ds.bike_rack = [bike]
        expect { ds.release_bike }.to raise_error(RuntimeError, 'There are no working bikes to release!')
      end
    end
  end

  describe '#dock_bike' do
    context 'when docking station has space for bikes' do
      it 'can dock a working bike' do
        ds.dock_bike(bike)
        expect(ds.bike_rack).to eq([bike])
      end

      it 'can dock a broken bike' do
        bike.broken
        ds.dock_bike(bike)
        expect(ds.bike_rack).to eq([bike])
      end
    end

    context 'when docking station is full' do
      it 'raises error' do
        20.times { ds.dock_bike(Bike.new) }
        expect { ds.dock_bike(bike) }.to raise_error(RuntimeError, 'This docking station is full!')
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