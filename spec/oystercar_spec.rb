require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  it 'should have a balance of 0' do
    expect(card.balance).to eq (0r)
  end
  it "should be able to add money" do
    expect(card.top_up(10)).to eq (10)
  end
  it "should raise error if balance limit exceeded" do
    limit = Oystercard::Balance_limit
    card.top_up(1)
    expect{card.top_up(limit)}.to raise_error "Balance limit exceeded"
  end
  it "should reduce the balance by the specified amount" do
    card.top_up(10)
    expect(card.deduct(5)).to eq (5)
  end

  it "can confirm that the card is not in journey" do
    expect(card.in_journey).to be false
  end

  it "can touch in a card" do
    card.touch_in
    expect(card.in_journey).to be true
  end

  it "can touch out a card" do
    card.touch_in
    card.touch_out
    expect(card.in_journey).to be false
  end
end
