require 'Van'

describe Van do
  let(:bike) { double :bike_instance}
  let(:docking_station) { double :DockingStation, broken_bikes: [bike] }

  describe '#capacity' do
    it 'has a capacity fo 5 bikes' do
      expect(subject.capacity).to eq 5
    end
  end

  describe '#collect' do
    it 'collects broken bikes from the docking station' do
      allow(bike).to receive(:working?).and_return(false)
      subject.collect_bikes(docking_station)
      expect(subject.bikes[0].working?).to eq(false)
    end 
  end
end
