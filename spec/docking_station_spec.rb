require 'DockingStation'

describe DockingStation do
  let(:bike) { double :bike_instance }

  it 'Allows bikes to be docked' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  describe '#dock' do
    it 'allows broken bikes to be docked' do
      allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'allows working bikes to be docked' do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end

    it 'does not allow the same bike to be docked twice' do
      subject.dock(bike)
      expect { subject.dock bike }.to raise_error 'This bike has already been docked'
    end

    it 'raises an error when the docking station is full' do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error 'Docking Station full'
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

    it 'does not release a broken bike' do
      allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return(false)
      expect { subject.release(bike) }.to raise_error 'Sorry, this bike is broken'
      expect(subject.bikes).to include(bike)
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release(bike) }.to raise_error 'No bikes available'
    end
  end

  describe '#bikes' do
    it 'returns the docked bikes' do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  end

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'defaults capacity to 20' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking Station full'
    end

    it 'can take custom default capacity' do
      ds = DockingStation.new(60)
      expect(ds.capacity).to eq(60)
    end
  end
end
