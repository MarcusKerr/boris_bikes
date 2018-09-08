require_relative 'Garage'
class Van
  attr_reader :capacity, :bikes

  def initialize
    @capacity = 5
    @bikes = []
  end

  def collect_bikes(destination)
    @bikes = if docking_station?(destination)
               destination.broken_bikes
             else
               destination.fixed_bikes
             end
  end

  def deliver_bikes(destination)
    destination.unload(@bikes)
    @bikes = []
  end

  def docking_station?(destination)
    return true if destination.is_a?(DockingStation)
    false
  end
end
