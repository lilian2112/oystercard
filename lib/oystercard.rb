class Oystercard
  attr_reader :balance, :in_journey

  Balance_limit = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
