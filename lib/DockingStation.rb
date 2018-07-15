
require_relative "Bike"
class DockingStation
    attr_reader :bike
    
    # Releade bike method
    def release_bike
       fail "No bikes available" unless @bike
       @bike
    end

    def dock(bike)
        fail "Docking Station is full" if @bike
        @bike = bike
    end
end
