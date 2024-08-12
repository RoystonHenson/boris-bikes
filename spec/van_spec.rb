require 'van'

describe Van do
  let(:van) { Van.new }
  let(:bike1) { double('bike1', :working => false) }
  let(:bike2) { double('bike2', :working => true ) }
  let(:bike3) { double('bike3', :working => false) }
  let(:bike4) { double('bike4', :working => false) }

  describe '#initialize' do
    it 'has storage to load items into for transport' do
      expect(van.storage).to eq([])
    end
  end

  describe '#load_bikes' do
    context 'when picking up broken bikes' do
      it 'loads only broken bikes into it\'s storage' do
        bike_rack = [bike1, bike2, bike3]
        van.load_bikes(bike_rack)
        expect(van.storage).to eq([bike1, bike3])
        expect(bike_rack).to eq([bike2])
      end
    end
  end

  describe 'unload_bikes' do
    context 'when delivering broken bikes' do
      it 'offloads only broken bikes from its storage' do
        garage = double('garage', :storage => [])
        van.storage = [bike1, bike2, bike3, bike4]
        van.unload_bikes(garage.storage)
        expect(van.storage).to eq([bike2])
        expect(garage.storage).to eq([bike1, bike3, bike4])
      end
    end
  end
end