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
    expect{card.top_up(91)}.to raise_error "Balance limit exceeded"
  end
end
