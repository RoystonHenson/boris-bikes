require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to (:release_bike) }

  it "releases bike" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it {is_expected.to respond_to(:bike) }

  it "docks bike" do
    bike = []
    bike << Bike.new
    expect(subject.dock_bike(bike)).to include(bike)
  end

  it "return docked bike" do
    bike = []
    bike << Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to include(bike)
  end

  it "raises error when no bikes" do
    expect{subject.release_bike}.to raise_error("no bikes available")
  end

  it "when docking station is full" do
    20.times {subject.dock_bike(Bike.new)}
    expect {subject.dock_bike(Bike.new)}.to raise_error("Sorry! The dock is full!")
  end
end
