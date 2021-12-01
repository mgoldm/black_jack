class Deck
  def initialize
    @full_deck = []
    create_deck
  end

  def create_deck
    names = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    titles = %w(♠ ♦ ♥ ♣)
    names.each do |name|
      titles.each do |title|
        cards=Card.new(name, title)
        @full_deck << cards.together
      end
    end
  end

  def give_card
    new_card = @full_deck[rand(0..@full_deck.length - 1)]
    @full_deck.delete(new_card)
    new_card
  end

end
