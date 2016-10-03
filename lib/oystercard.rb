class Oystercard
  attr_reader :balance, :entry_station

  Balance_limit = 90
  Minimum_fair = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficant funds" if @balance < Minimum_fair
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    deduct(Minimum_fair)
    @entry_station = nil
  end

  def in_journey
    entry_station !=nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
