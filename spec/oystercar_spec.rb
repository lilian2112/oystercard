require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:station) {double :station}

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

   it "should raise error if insufficant funds" do
     expect{card.touch_in(station)}.to raise_error "Insufficant funds"
   end

  it "can confirm that the card is not in journey" do
    expect(card.in_journey).to be false
  end

  it "can touch in a card" do
    card.top_up(10)
    card.touch_in(station)
    expect(card.in_journey).to be true
  end

  it "will save entry station at touch in" do
    card.top_up(10)
    expect(card.touch_in(station)).to eq station
  end

  it "can touch out a card" do
    card.top_up(10)
    card.touch_in(station)
    card.touch_out
    expect(card.in_journey).to be false
  end
  it "can deduct fair from balance at touch out" do
    card.top_up(10)
    card.touch_in(station)
    expect{card.touch_out}.to change{card.balance}.by(-Oystercard::Minimum_fair)
  end
end
