require "DockingStation"

describe DockingStation do

    # Expect Docking station instance to respond to release_bike method
    it { is_expected.to respond_to :release_bike }

    it "Gets a bike" do
        expect(subject.release_bike).to be_an_instance_of(Bike)
    end 
end
