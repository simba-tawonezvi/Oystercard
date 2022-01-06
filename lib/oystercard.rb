class Oystercard  
  attr_accessor :balance, :entry_station

  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize 
    @balance = 0
    @entry_station
  end

  def top_up(amount)
    fail "maximum limit of #{LIMIT} exceeded" if @balance + amount > 90 
    @balance += amount 
  end 

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail 'Insufficient balance to touch in' if @balance < MINIMUM_FARE
    @entry_station = station
  end
  
  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private
  def deduct(fare)
    @balance -= fare 
  end 

end