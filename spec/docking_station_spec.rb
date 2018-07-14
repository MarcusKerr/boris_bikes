require "DockingStation"

describe DockingStation do

    # Error if there are no bikes available 
   

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

    it "Sees a bike that has been docked" do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq(bike)
    end

end

