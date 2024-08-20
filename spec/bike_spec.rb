require 'bike'

describe Bike do
  let(:bike) { Bike.new }
  
  describe '#initialize' do
    it 'is working when new' do
      expect(bike).to be_working
    end
  end

  describe '#broken' do
    it 'sets bike\'s state as not working' do
      bike.broken
      expect(bike).not_to be_working
    end
  end

  describe '#working?' do
    context 'when bike is working' do
      it 'shows bikes is working' do
        expect(bike).to be_working
      end
    end

    context 'when bike is not working' do
      it 'shows bike is not working' do
        bike.broken
        expect(bike ).not_to be_working
      end
    end
  end
end