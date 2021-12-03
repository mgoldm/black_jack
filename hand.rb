class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def first_cards(deck)
    2.times { @cards << deck.give_card }
    @cards
    score
  end

  def add_card(deck)
    @cards << deck.give_card
    score

  end

  def score
    poins=0
    @cards.each do |card|

      case card.name
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
        poins += card.name.to_i
      end
    end
    poins
  end

end
