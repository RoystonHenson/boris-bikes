require "bike"

describe Bike do
  let(:bike) {Bike.new}
  it {expect(bike).to respond_to (:working?)}
end
