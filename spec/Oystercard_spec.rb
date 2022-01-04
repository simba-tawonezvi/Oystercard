require 'oystercard'

describe Oystercard do 
  it 'checks whether the balance is zero' do
    expect(subject.balance).to eq (0)
  end

  it 'adds money' do
    subject.top_up(50)
    expect(subject.balance).to eq (50)
  end
end 
