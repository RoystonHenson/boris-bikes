require 'bike'

describe Bike do
  let(:bike) { Bike.new }
  
  describe '#initialize' do
    it  'is working when new' do
      expect(bike.working).to eq(true)
    end
  end

  describe '#broken' do
    it 'reports bike\'s state as not working' do
      bike.broken
      expect(bike.working).to eq(false)
    end
  end

  describe '#working?' do
    context 'when bike is working' do
      it 'user can see the bike is working' do
        expect(bike.working).to eq(true)
      end
    end

    context 'when bike is not working' do
      it 'user can see the bike is not working' do
        bike.broken
        expect(bike.working).to eq(false)
      end
    end
  end
end