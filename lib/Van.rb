require_relative 'Garage'
class Van
  attr_reader :capacity, :bikes
  
  def initialize 
    @capacity = 5
    @bikes = []
  end

  def collect_bikes(destination)
    if docking_station?(destination)
      destination.broken_bikes.each do |bike|
        bikes << bike
      end
    else
      destination.fixed_bikes.each do |bike|
        bikes << bike
      end
    end
  end

  def deliver_bikes(destination)
    if destination.is_a?(Garage)
      destination.unload(bikes)
      @bikes = []
    end
  end

  def docking_station?(destination)
    return true if destination.is_a?(DockingStation)
    false
  end
end
