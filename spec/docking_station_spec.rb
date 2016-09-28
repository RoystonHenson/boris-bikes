require 'docking_station'


describe DockingStation do
  let(:docking_station) {DockingStation.new}
it {expect(docking_station).to respond_to (:release_bike)}
end

describe DockingStation do
  let(:docking_station) {DockingStation.new}
  it {expect(docking_station.release_bike).to be_instance_of (Bike)}
end
