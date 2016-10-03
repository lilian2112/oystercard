class Oystercard
  attr_reader :balance
  Balance_limit = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance limit exceeded" if @balance + amount > Balance_limit
    @balance = @balance + amount
  end

  def deduct(amount)
    @balance = @balance - amount
  end
end
