require 'bike_container'

class Garage
  include BikeContainer

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def dock bike
    bike.fix!
    super
  end



end