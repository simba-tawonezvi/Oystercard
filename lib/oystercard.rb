class Oystercard  
  attr_accessor :in_journey, :balance

  LIMIT = 90
  MINIMUN_BALANCE = 1

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
    fail 'Insufficient balance to touch in' if @balance < MINIMUN_BALANCE
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false
  end
end