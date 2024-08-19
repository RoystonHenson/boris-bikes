require 'van'

describe Van do
  let(:van) { Van.new }
  let(:goods1) { double('goods1', :working => false) }
  let(:goods2) { double('goods2', :working => true ) }
  let(:goods3) { double('goods3', :working => false) }
  let(:goods4) { double('goods4', :working => false) }

  describe '#initialize' do
    it 'has storage to load items into for transport' do
      expect(van.storage).to eq([])
    end
  end

  describe '#load_from' do
    let(:pickup_location_storage) { [goods1, goods2, goods3, goods4] }

    context 'when picking up working goods' do
      it 'loads only working goods' do
        van.load_from(pickup_location_storage, 'working')
        expect(van.storage).to eq([goods2])
        expect(pickup_location_storage).to eq([goods1, goods3, goods4])
      end
    end

    context 'when picking up broken goods' do
      it 'loads only broken goods' do
        van.load_from(pickup_location_storage, 'broken')
        expect(van.storage).to eq([goods1, goods3, goods4])
        expect(pickup_location_storage).to eq([goods2])
      end
    end

    context 'when not specifying state of goods' do
      it 'loads goods regardless of working condition' do
        van.load_from(pickup_location_storage)
        expect(pickup_location_storage).to eq([])
        expect(van.storage).to eq([goods1, goods2, goods3, goods4])
      end
    end
  end

  describe '#unload_to' do 
    let(:delivery_location_storage) { [] }
    
    context 'when delivering working goods' do
      it 'offloads only working goods' do
        van.storage = [goods1, goods2, goods3, goods4] 
        van.unload_to(delivery_location_storage, 'working')
        expect(delivery_location_storage).to eq([goods2])
        expect(van.storage).to eq([goods1, goods3, goods4])
      end
    end

    context 'when delivering broken goods' do
      it 'offloads only broken goods' do
        van.storage = [goods1, goods2, goods3, goods4]
        van.unload_to(delivery_location_storage, 'broken')
        expect(van.storage).to eq([goods2])
        expect(delivery_location_storage).to eq([goods1, goods3, goods4])
      end
    end

    context 'when delivering goods regardless of working condition' do
      it 'offloads goods regardless of working condition' do
        van.storage = [goods1, goods2, goods3, goods4] 
        van.unload_to(delivery_location_storage)
        expect(van.storage).to eq([])
        expect(delivery_location_storage).to eq([goods1, goods2, goods3, goods4])
      end
    end
  end
end