require 'docking_station'

describe DockingStation do
  let(:ds) { DockingStation.new }
  let(:bike1) { double('bike1', working: false) }
  let(:bike2) { double('bike2', working: true) }

  before(:each) do
    allow(bike1).to receive(:class).and_return(Bike)
    allow(bike2).to receive(:class).and_return(Bike)
  end
  
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
        expect { ds.release_bike }.to raise_error(RuntimeError, 'There are no bikes available to release!')
      end
    end

    context 'when docking station has bikes that aren\'t working' do
      it 'raises error' do
        ds.bike_rack = [bike1]
        expect { ds.release_bike }.to raise_error(RuntimeError, 'There are no bikes available to release!')
      end
    end

    context 'when docking station has working bikes' do
      it 'releases a working bike' do
        ds.bike_rack = [bike1, bike2]
        expect(ds.release_bike).to eq(bike2)
        expect(ds.bike_rack).to eq([bike1])
      end

      it 'releases a specific working bike' do
        bike3 = double('bike3', working: true)
        ds.bike_rack = [bike1, bike2, bike3]
        expect(ds.release_bike(2)).to eq(bike3)
      end
    end
  end

  describe '#dock_bike' do
    context 'when docking station has space for bikes' do
      it 'checks that the object being docked is a bike' do
        ds.dock_bike(bike1)
        expect(bike1.class).to eq(Bike)
      end

      it 'raises error if anything other than a bike is docked' do
        not_a_bike_object = double('not a bike object')
        expect { ds.dock_bike(not_a_bike_object) }.to raise_error(RuntimeError, 'This docking station will only accept bikes!')
      end

      it 'checks bike is not already docked' do
        ds.dock_bike(bike1)
        expect { ds.dock_bike(bike1) }.to raise_error(RuntimeError, 'This bike is already docked!')
      end

      it 'can dock a working bike' do
        ds.dock_bike(bike2)
        expect(ds.bike_rack).to eq([bike2])
      end

      it 'can dock a broken bike' do
        ds.dock_bike(bike1)
        expect(ds.bike_rack).to eq([bike1])
      end
    end

    context 'when docking station is full' do
      it 'raises error' do
        20.times { ds.dock_bike(Bike.new) }
        expect { ds.dock_bike(bike1) }.to raise_error(RuntimeError, 'This docking station is full!')
     end
    end
  end

  describe '#view_bikes' do
    it 'shows available bikes' do
      ds.dock_bike(bike1)
      expect(ds.view_bikes).to eq([bike1])
    end
  end
end