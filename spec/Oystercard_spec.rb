require 'oystercard'

describe Oystercard do 
  
  it 'checks whether the balance is zero' do
    expect(subject.balance).to eq (0)
  end
  
  it 'adds money' do
    subject.top_up(50)
    expect(subject.balance).to eq (50)
  end

  it 'raises an error if we top up more than £90' do 
    limit = Oystercard::LIMIT
    subject.top_up(limit)
    expect {subject.top_up 1 }.to raise_error "maximum limit of #{limit} exceeded"
  end 

  # it 'recuces the balance when we spend money using the method deduct' do 
  #   subject.top_up(50)
  #   subject.deduct(4.25) 
  #   expect(subject.balance).to eq (45.75)
  # end 

  it 'checks weather passemnger in journey' do
    expect(subject).not_to be_in_journey
  end

  it 'changes the in_journey to true after touching in' do
    subject.top_up(1)
    subject.touch_in
    expect(subject).to be_in_journey
  end 

  it 'changes the in_journey back to false after touvhing out' do
    subject.top_up(1)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'raises error when card has less than £1' do
    expect { subject.touch_in }.to raise_error 'Insufficient balance to touch in'
  end

  it 'fare is deducted after touching out' do
    subject.top_up(1)
    expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
  end 
end 


