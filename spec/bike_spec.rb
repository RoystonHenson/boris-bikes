require 'bike'

describe Bike do
  let(:bike) { Bike.new }

  it 'check if bike is working' do
    expect(bike).to respond_to(:working?)
  end
end