require 'Van'

describe Van do
  let(:bike) { double :bike_instance}
  let(:docking_station) { double :DockingStation, broken_bikes: [bike] }
  let(:garage) { double :garage }

  describe '#capacity' do
    it 'has a capacity fo 5 bikes' do
      expect(subject.capacity).to eq 5
    end
  end

  describe '#collect' do
    it 'collects broken bikes from the docking station' do
      allow(docking_station).to receive(:is_a?).and_return(true)
      allow(bike).to receive(:working?).and_return(false)
      subject.collect_bikes(docking_station)
      expect(subject.bikes).to eq(docking_station.broken_bikes)
    end 
  end

  describe '#deliver' do
    it 'delivers broken bikes to a garage' do
      subject.deliver(garage)
      expect(subject.broken_bikes).to be empty
    end 
  end

end
