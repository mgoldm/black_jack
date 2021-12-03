class Card
  attr_reader :name

  def initialize(name, suit)
    @name = name
    @suit = suit
  end

  def together
    @name + @suit
  end
end


