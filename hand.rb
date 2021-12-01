class Deck
  def initialize
    @full_deck = []
    create_deck
  end

  def create_deck
    names = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    title = %w(♠ ♦ ♥ ♣)
    names.each do |name|
      @full_deck << "#{name} #{title[0]}"
      @full_deck << "#{name} #{title[1]}"
      @full_deck << "#{name} #{title[2]}"
      @full_deck << "#{name} #{title[3]}"
    end
  end

  def give_card
    new_card = @full_deck[rand(0..@full_deck.length-1)]
    @full_deck.delete(new_card)
    new_card
  end

end
