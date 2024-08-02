require 'docking_station'

describe DockingStation do
  let(:ds) { DockingStation.new }

  it 'releases a bike' do
    expect(ds).to respond_to(:release_bike)
  end
end