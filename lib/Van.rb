class Van
  attr_reader :capacity, :bikes
  
  def initialize 
    @capacity = 5
    @bikes = []
  end

  def collect_bikes(docking_station)
    docking_station.broken_bikes.each do |bike|
      bikes.push(bike)
    end
  end
end