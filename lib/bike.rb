class Bike

  def initialize
    fix!
  end

  def working?
    @working
  end

  def break!
    @working = false
  end

  def fix!
    raise "Bike is already working!" if working?
    @working = true
  end

end
