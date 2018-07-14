require "DockingStation"

describe DockingStation do

    # Expect Docking station instance to respond to release_bike method
    it { is_expected.to respond_to :release_bike }

    it "Gets a bike" do
        expect(subject.release_bike).to be_an_instance_of(Bike)
    end 

    it "Expects bike to be working" do
        bike = subject.release_bike
        expect(bike).to be_working
    end

    it "Allows bikes to be docked" do
        expect(subject).to respond_to(:dock).with(1).argument
    end

end

