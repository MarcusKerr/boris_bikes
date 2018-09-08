require 'DockingStation'

describe DockingStation do
  let(:bike) { double :bike_instance }
  let(:bike2) { double :bike_instance }
  let(:bike3) { double :bike_instance }

  it 'Allows bikes to be docked' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  describe '#dock' do
    it 'allows broken bikes to be docked' do
      allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect(subject.broken_bikes).to include(bike)
    end

    it 'allows working bikes to be docked' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'does not allow the same bike to be docked twice' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect { subject.dock bike }.to raise_error 'This bike has already been docked'
    end

    it 'raises an error when the docking station is full' do
      # subject.capacity.times { subject.dock bike }
      ds = DockingStation.new(2)
      allow(bike2).to receive(:working?).and_return(true)
      allow(bike3).to receive(:working?).and_return(true)
      ds.dock(bike2)
      ds.dock(bike3)
      expect { ds.dock bike }.to raise_error 'Docking Station full'
    end
  end

  describe '#release' do
    it 'releases a bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release(bike)).to eq(bike)
    end

    it 'expects bike to be working' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release(bike)).to be_working
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release(bike) }.to raise_error 'No bikes available'
    end
  end

  describe '#bikes' do
    it 'returns the docked bikes' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  end

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'defaults capacity to 20' do
      expect(described_class::DEFAULT_CAPACITY).to eq 20
    end

    it 'can take custom default capacity' do
      ds = DockingStation.new(60)
      expect(ds.capacity).to eq(60)
    end
  end

  describe '#unload' do
    it'unloads fixed bikes' do
      bikes = [bike2, bike3]
      subject.unload(bikes)
      expect(subject.bikes).to eq(bikes)
    end
  end
end
