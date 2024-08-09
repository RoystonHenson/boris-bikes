require 'van'

describe Van do
  let(:van) { Van.new }

  describe '#initialize' do
    it 'has storage to load items into for transport' do
      expect(van.storage).to eq([])
    end
  end
end