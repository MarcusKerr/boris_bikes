require_relative 'Bike'
class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release(bike)
    raise 'No bikes available' if empty?
    raise 'Sorry, this bike is broken' unless bike.working?
    bikes.delete_at(bikes.index(bike))
  end

  def dock(bike)
    raise 'This bike has already been docked' if bikes.include?(bike)
    raise 'Docking Station full' if full?
    @bike = bike
    bikes << @bike
  end

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  private :full?, :empty?
end
