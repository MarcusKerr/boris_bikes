
require_relative "Bike"
class DockingStation
    attr_reader :bike
    
    # Releade bike method
    def release_bike
       @bike
    end

    def dock(bike)
        @bike = bike
    end
end
