class Van
  attr_reader :capacity, :bikes
  
  def initialize 
    @capacity = 5
    @bikes = []
  end

  def collect_bikes(destination)
    if destination.is_a?(DockingStation)
      destination.broken_bikes.each do |bike|
        bikes.push(bike)
      end
    end
  end
end
