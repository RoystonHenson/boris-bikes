require 'garage'

describe Garage do
  let(:garage) { Garage.new }
  describe '#initialize' do
    it 'has a storage area loading/unloading deliveries' do
      expect(garage.storage).to eq([])
    end
  end
end