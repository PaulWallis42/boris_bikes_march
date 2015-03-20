require 'bike_container'

class DockingStation

  include BikeContainer

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def has_bikes?
    !bikes.empty?
  end

  alias_method :available_bikes, :working_bikes


end