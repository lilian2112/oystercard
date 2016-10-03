require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  it 'should have a balance of 0' do
    expect(card.balance).to eq (0r)
  end
end
