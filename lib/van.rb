require 'bike_container'

class Van

  include BikeContainer

  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def collect_broken_bikes_from station
    station.bikes.each {|bike| transfer(bike, from: station, to: self) unless bike.working?}
  end

  def transfer bike, from: station, to: station
    from.release(bike)
    to.dock(bike)
  end

  def drop_off_bikes_to garage
    bikes.each {|bike| transfer bike, from: self, to: garage }
  end

  alias_method :load, :dock

end