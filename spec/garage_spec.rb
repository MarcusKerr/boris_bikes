require 'Garage'

describe Garage do
  let(:bike) { double :bike_instance }
  let(:bike2) { double :bike_instance }
  let(:van) { double :van_instance, bikes: [bike, bike2]}
  describe '#unload' do
    it 'add bikes to the bikes array' do
      subject.unload(van.bikes)
      expect(subject.bikes).to eq([bike, bike2])
    end 
  end
end