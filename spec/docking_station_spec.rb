require 'docking_station'

describe DockingStation do
  let(:docking_station) {DockingStation.new}
it {expect(docking_station).to respond_to (:release_bike)}
end
