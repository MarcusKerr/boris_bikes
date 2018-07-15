
require_relative "Bike"
class DockingStation
    attr_reader :bike
    def initialize
        @bikes = []
    end

    private
        # Predicate method to check if dock is full
        def full?
            @bikes.count >= 20 
        end 
        
        # Private method to check if dock is empty
        def empty?
            @bikes.empty?
        end 
    end
    
    # Releade bike method
    def release_bike
       fail "No bikes available" if empty?
       @bikes.pop
    end

    def dock(bike)
        fail "Docking Station full" if full?
        @bikes << bike
    end
end
