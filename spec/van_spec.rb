require 'Van'

describe Van do
  describe '#capacity' do
    it 'has a capacity fo 5 bikes' do
      expect(subject.capacity).to eq 5
    end
  end
end
