require 'Van'

describe Van do
  let(:bike) { double :bike_instance }
  let(:docking_station) { double :DockingStation, broken_bikes: [bike] }
  let(:garage) { double :garage, fixed_bikes: [bike] }

  describe '#capacity' do
    it 'has a capacity fo 5 bikes' do
      expect(subject.capacity).to eq 5
    end
  end

  describe '#collect' do
    it 'collects broken bikes from the docking station' do
      allow(docking_station).to receive(:is_a?).and_return(true)
      subject.collect(docking_station)
      expect(subject.bikes).to eq(docking_station.broken_bikes)
    end

    it 'collects fixed bikes from garages' do
      allow(garage).to receive(:is_a?).and_return(false)
      subject.collect(garage)
      expect(subject.bikes).to eq(garage.fixed_bikes)
    end
  end

  describe '#deliver' do
    it '#delivers broken bikes to garage' do
      allow(docking_station).to receive(:is_a?).and_return(true)
      subject.collect(docking_station)
      allow(garage).to receive(:unload).and_return(nil)
      subject.deliver(garage)
      expect(subject.bikes).to be_empty
    end

    it '#delivers fixed bikes to docking station' do
      subject.collect(garage)
      allow(docking_station).to receive(:unload).and_return(nil)
      subject.deliver(docking_station)
      expect(subject.bikes).to be_empty
    end
  end
end
