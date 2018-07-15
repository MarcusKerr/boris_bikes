
require_relative "Bike"
class DockingStation
    def initialize
        @bikes = []
    end
    
    # Releade bike method
    def release_bike
       fail "No bikes available" if @bikes.empty?
       @bikes.pop
    end

    def dock(bike)
        fail "Docking Station full" if @bikes.count >= 20
        @bikes << bike
    end
end
