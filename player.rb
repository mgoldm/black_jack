class Player

  attr_reader :hand, :point
  attr_accessor :bank

  def initialize(bank = 100)
    @bank = bank
    @hand = Hand.new
  end

end


