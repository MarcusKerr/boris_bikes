require "DockingStation"

describe DockingStation do

    # Expect Docking station instance to respond to release_bike method
    it { is_expected.to respond_to :release_bike }
end
