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
    expect {subject.top_up 1 }.to raise_error 'maximum limit exceeded'
  end 
end 
