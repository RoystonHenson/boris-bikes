require 'docking_station'

describe DockingStation do
  let(:docking_station) {DockingStation.new}
  let(:bike) {Bike.new}
  it {expect(docking_station).to respond_to (:release_bike)}
  it {expect(docking_station.release_bike).to be_instance_of(Bike)}
  it {expect(bike.working?).to be true}
  it {expect(docking_station).to respond_to(:dock_bike).with(1).argument}
  it {expect(docking_station.dock_bike).to be_instance_of (Bike)}
  it {expect(docking_station).to respond_to (:bike)}

end

describe DockingStation do
  let(:docking_station) {DockingStation.new}
  it {expect{docking_station.release_bike}.to raise_error("Error")}
end
