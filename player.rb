class Player

  attr_reader :hand, :point
  attr_accessor :bank

  def initialize(bank = 100)
    @bank = bank
    @hand = Hand.new
  end

  def add_card(deck)
    @hand.add_card(deck)
  end

end


