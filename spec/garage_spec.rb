require 'Garage'

describe Garage do
  let(:bike) { double :bike_instance }
  let(:bike2) { double :bike_instance }
  let(:van) { double :van_instance, bikes: [bike, bike2] }

  describe '#unload' do
    it 'add bikes to the bikes array' do
      subject.unload(van.bikes)
      expect(subject.broken_bikes).to eq([bike, bike2])
    end
  end

  describe '#fix_bikes' do
    it 'fixes broken bikes' do
      broken_bikes = [bike, bike2]
      subject.unload(broken_bikes)
      allow(bike).to receive(:fix).and_return(bike)
      allow(bike2).to receive(:fix).and_return(bike2)
      subject.fix_bikes
      expect(subject.broken_bikes).to be_empty
      expect(subject.fixed_bikes).to eq([bike, bike2])
      allow(bike).to receive(:working?).and_return(true)
      expect(subject.fixed_bikes[0].working?).to eq(true)
    end
  end
end
