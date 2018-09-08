class Bike
  def working?
    return false if broken?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def fix
    @broken = false
  end
end
