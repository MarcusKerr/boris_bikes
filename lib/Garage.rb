require_relative 'Bike'

class Garage
  attr_reader :broken_bikes, :fixed_bikes

  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end

  def unload(bikes)
    bikes.each do |bike|
      @broken_bikes << bike
    end
  end

  def fix_bikes
    @broken_bikes.each do |bike|
      bike.fix
      @fixed_bikes << bike
    end
    @broken_bikes = []
  end
end
