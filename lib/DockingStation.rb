
require_relative "Bike"
class DockingStation
    DEFAULT_CAPACITY = 20

    attr_accessor :capacity
    attr_reader :bikes

    def initialize(capacity = DEFAULT_CAPACITY)
        @bikes = []
        @capacity = capacity
    end
    
    def release_bike
       fail "No bikes available" if empty?
       bikes.pop
    end

    def dock(bike)
        fail "Docking Station full" if full?
        bikes << bike
    end

    def full?
        bikes.count >= capacity
    end 
    
    def empty?
        bikes.empty?
    end 

    private :full?, :empty?
end
