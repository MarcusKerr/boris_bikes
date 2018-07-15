require "DockingStation"

describe DockingStation do

    it "Allows bikes to be docked" do
        expect(subject).to respond_to(:dock).with(1).argument
    end

    describe "#release_bike" do
        it "releases a bike" do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to eq(bike)
        end

        it "Expects bike to be working" do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to be_working 
        end

        it 'raises an error when there are no bikes available' do
            expect{subject.release_bike}.to raise_error 'No bikes available'
        end
    end

     it "has a default capacity" do 
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    describe "#dock" do
        it 'raises an error when the docking station is full' do
            subject.capacity.times {subject.dock Bike.new}
            expect{ subject.dock Bike.new }.to raise_error "Docking Station full"
        end
    end

    describe "initialization" do
        subject { DockingStation.new }
        let(:bike) { Bike.new }
        it 'defaults capacity' do
            described_class::DEFAULT_CAPACITY.times do
                subject.dock(bike)
            end
            expect{ subject.dock(bike) }.to raise_error 'Docking Station full'
        end
    end
end

