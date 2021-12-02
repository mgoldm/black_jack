class Hand
  attr_reader :cards, :score

  def initialize
    @cards = []
  end

  def first_cards(deck)
    2.times { @cards << deck.give_card }
    @cards
    your_score
  end

  def add_card(deck)
    @cards << deck.give_card
    your_score

  end

  def your_score
    poins=0
    @cards.each do |card|
      value = card.name
      case value
      when 'J'
        poins += 10
      when 'Q'
        poins += 10
      when 'K'
        poins += 10
      when 'A'
        poins += 1 if poins >= 11
        poins += 11 if poins < 11
      else
        poins += value.to_i
      end
    end
    @score=poins
  end

end
