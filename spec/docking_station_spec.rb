require "DockingStation"

describe DockingStation do
    describe '#release_bike' do
        it "releases a bike" do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to eq(bike)
        end

        it 'raises an error when there are no bikes available' do
            docking_station = DockingStation.new
            expect{subject.release_bike}.to raise_error 'No bikes available'
        end
    end

    # it "Gets a bike" do
    #     expect(subject.release_bike).to be_an_instance_of(Bike)
    # end 

    # it "Expects bike to be working" do
    #     bike = subject.release_bike
    #     expect(bike).to be_working
    # end

    # it "Allows bikes to be docked" do
    #     expect(subject).to respond_to(:dock).with(1).argument
    # end

    # it "Sees a bike that has been docked" do
    #     bike = Bike.new
    #     subject.dock(bike)
    #     expect(subject.bike).to eq(bike)
    # end

end

