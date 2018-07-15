
require_relative "Bike"
class DockingStation
    DEFAULT_CAPACITY = 20
    def initialize
        @bikes = []
        
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
    
    private
    
    # Predicate method to check if dock is full
    def full?
        @bikes.count >= DEFAULT_CAPACITY
    end 
    
    # Private method to check if dock is empty
    def empty?
        @bikes.empty?
    end 
end
