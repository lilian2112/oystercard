class Oystercard
  attr_reader :balance, :in_journey

  Balance_limit = 90
  Minimum_fair = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficant funds" if @balance < Minimum_fair
    @in_journey = true
    station
  end

  def touch_out
    @in_journey = false
    deduct(Minimum_fair)
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
