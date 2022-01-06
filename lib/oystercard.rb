class Oystercard  
  attr_accessor :balance

  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize 
    @balance = 0
    @in_journey = false
    
  end

  def top_up(amount)
    fail "maximum limit of #{LIMIT} exceeded" if @balance + amount > 90 
    @balance += amount 
  end 

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Insufficient balance to touch in' if @balance < MINIMUM_FARE
    @in_journey = true
  end
  
  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  private
  def deduct(fare)
    @balance -= fare 
  end 

end