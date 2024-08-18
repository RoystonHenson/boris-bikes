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

  describe '#load' do
    context 'when picking up working goods' do
      it 'loads only working goods into it\'s storage' do
        # swap to before each?
        goods_storage = [goods1, goods2, goods3, goods4]
        van.load_from(goods_storage, 'working')
        expect(van.storage).to eq([goods2])
        expect(goods_storage).to eq([goods1, goods3, goods4])
      end
    end

    context 'when picking up broken goods' do
      it 'loads only broken goods into it\'s storage' do
        goods_storage = [goods1, goods2, goods3, goods4]
        van.load_from(goods_storage, 'broken')
        expect(van.storage).to eq([goods1, goods3, goods4])
        expect(goods_storage).to eq([goods2])
      end
    end

    context 'when not specifying state of goods' do
      it 'loads all goods into it\'s storage' do
        goods_storage = [goods1, goods2, goods3, goods4]
        van.load_from(goods_storage)
        p goods_storage
        p van.storage
        expect(goods_storage).to eq([])
        expect(van.storage).to eq([goods1, goods2, goods3, goods4])
      end
    end
  end

  describe 'unload_bikes' do
    context 'when delivering broken bikes' do
      it 'offloads only broken bikes from its storage' do
        garage = double('garage', :storage => [])
        van.storage = [goods1, goods2, goods3, goods4]
        van.unload_bikes(garage.storage)
        expect(van.storage).to eq([goods2])
        expect(garage.storage).to eq([goods1, goods3, goods4])
      end
    end
  end
end