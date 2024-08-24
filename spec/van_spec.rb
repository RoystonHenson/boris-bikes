require 'van'

describe Van do
  let(:van) { Van.new }
  let(:broken_goods1) { double('broken goods 1', :working => false) }
  let(:working_goods1){ double('working goods 1', :working => true) }
  let(:broken_goods2) { double('broken goods 2', :working => false) }
  let(:broken_goods3) { double('broken goods 3', :working => false) }
  let(:pickup_location_storage) { [broken_goods1, working_goods1, broken_goods2, broken_goods3] }
  let(:delivery_location_storage) { [] }

  describe '#initialize' do
    it 'has storage to load items into for transport' do
      expect(van.storage).to eq([])
    end

    it 'has a capacity' do
      goods = double('goods')
      10.times { van.storage << goods }
      expect { van.load_from(pickup_location_storage) }.to raise_error(RuntimeError, 'The van is full!')
    end
  end

  describe '#load_from' do
    context 'when picking up working goods' do
      it 'loads only working goods' do
        van.load_from(pickup_location_storage, 'working')
        expect(van.storage).to eq([working_goods1])
        expect(pickup_location_storage).to eq([broken_goods1, broken_goods2, broken_goods3])
      end
    end

    context 'when picking up broken goods' do
      it 'loads only broken goods' do
        van.load_from(pickup_location_storage, 'broken')
        expect(van.storage).to eq([broken_goods1, broken_goods2, broken_goods3])
        expect(pickup_location_storage).to eq([working_goods1])
      end
    end

    context 'when not specifying state of goods' do
      it 'loads goods regardless of working condition' do
        van.load_from(pickup_location_storage)
        expect(pickup_location_storage).to eq([])
        expect(van.storage).to eq([broken_goods1, working_goods1, broken_goods2, broken_goods3])
      end
    end
  end

  describe '#unload_to' do 
    context 'when delivering working goods' do
      it 'offloads only working goods' do
        van.storage = [broken_goods1, working_goods1, broken_goods2, broken_goods3]
        van.unload_to(delivery_location_storage, 'working')
        expect(delivery_location_storage).to eq([working_goods1])
        expect(van.storage).to eq([broken_goods1, broken_goods2, broken_goods3])
      end
    end

    context 'when delivering broken goods' do
      it 'offloads only broken goods' do
        van.storage = [broken_goods1, working_goods1, broken_goods2, broken_goods3]
        van.unload_to(delivery_location_storage, 'broken')
        expect(van.storage).to eq([working_goods1])
        expect(delivery_location_storage).to eq([broken_goods1, broken_goods2, broken_goods3])
      end
    end

    context 'when delivering goods regardless of working condition' do
      it 'offloads goods regardless of working condition' do
        van.storage = [broken_goods1, working_goods1, broken_goods2, broken_goods3]
        van.unload_to(delivery_location_storage)
        expect(van.storage).to eq([])
        expect(delivery_location_storage).to eq([broken_goods1, working_goods1, broken_goods2, broken_goods3])
      end
    end
  end
end