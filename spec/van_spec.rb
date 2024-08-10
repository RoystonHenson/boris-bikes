require 'van'

describe Van do
  let(:van) { Van.new }

  describe '#initialize' do
    it 'has storage to load items into for transport' do
      expect(van.storage).to eq([])
    end
  end

  describe '#load_bikes' do
    context 'when picking up broken bikes' do
      it 'loads only broken bikes into it\'s storage' do
        bike1, bike3 = double('bike1', :working => false), double('bike3', :working => false)
        bike2 = double('bike2', :working => true)
        bike_rack = [bike1, bike2, bike3]
        van.load_bikes(bike_rack)
        expect(van.storage).to eq([bike1, bike3])
        expect(bike_rack).to eq([bike2])
      end
    end
  end
end