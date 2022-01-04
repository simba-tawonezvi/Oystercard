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

  it 'recuces the balance when we spend money using the method deduct' do 
    subject.top_up(50)
    subject.deduct(4.25) 
    expect(subject.balance).to eq (45.75)
  end 

  it 'checks weather touch in is working' do
    expect{  subject.touch_in }.to change { subject.in_journey? }.from(false).to(true)
  end
end 
