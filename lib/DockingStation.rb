
require_relative "Bike"
class DockingStation
    DEFAULT_CAPACITY = 20

    attr_accessor :capacity

    def initialize(capacity = DEFAULT_CAPACITY)
        @bikes = []
        @capacity = capacity
    end
    
    # Releade bike method
    def release_bike
       fail "No bikes available" if empty?
       bikes.pop
    end

    def dock(bike)
        fail "Docking Station full" if full?
        bikes << bike
    end
    
    private

    attr_reader :bikes

    # Predicate method to check if dock is full
    def full?
        bikes.count >= capacity
    end 
    
    # Private method to check if dock is empty
    def empty?
        bikes.empty?
    end 
end
