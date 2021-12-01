class Hand
  attr_reader :cards, :score
  def initialize
    @cards = []
    @score=0
  end

  def first_cards(deck)
    2.times { @cards << deck.give_card }
    @cards
  end

  def add_card(deck)
    @cards << deck.give_card

  end

  def score
    point = 0
    @cards.each do |card|
      name = card.split('')
      value = name[0]
      case value
      when 'J'
        point += 10
      when 'Q'
        point += 10
      when 'K'
        point += 10
      when 'A'
        point += 1 if point >= 11
        point += 11 if point < 11
      else
        point += value.to_i
      end
    end
    @score=point
  end


end
