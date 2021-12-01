class Player

  attr_reader :current_cards, :point
  attr_accessor :bank

  def initialize( bank = 100)
    @bank = bank
    @current_cards = Hand.new
  end


  def add_card(deck)
    @current_cards.add_card(deck)
  end

end


