class Oystercard  
  attr_accessor :trip, :balance
  LIMIT = 90

  def initialize 
    @balance = 0
    @in_journey = false
    
  end

  def top_up(amount)
    fail "maximum limit of #{LIMIT} exceeded" if @balance + amount > 90 
    @balance += amount 
  end 

  def deduct(fare)
    @balance -= fare 
  end 
  
  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false
  end
end