module BikeContainer

  attr_reader :bikes, :capacity


  def dock(bike)
    raise "#{self.class} is full" if full?
    raise "You can only dock a bike" unless bike.respond_to? :working?
    bikes << bike
  end

  def full?
    @bikes.count == capacity
  end

  def release bike
    @bikes.delete bike
  end

  def working_bikes
    @bikes.select(&:working?)
  end

end