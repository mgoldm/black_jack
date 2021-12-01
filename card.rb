class Card
  attr_reader :together

  def initialize(name, suit)
    @together = name + suit
  end
end


