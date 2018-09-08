class Garage

  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def unload(bikes)
    bikes.each do |bike|
      @bikes << bike 
    end
  end
end