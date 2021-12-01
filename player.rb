class Player

  attr_reader :hand, :score, :name
  attr_accessor :bank

  def initialize(name, bank = 100)
    @name = name
    @bank = bank
    @hand = []
    @score = 0
  end

  def first_cards(deck)
    2.times { @hand << deck.give_card }
  end

  def add_card(deck)
    @hand << deck.give_card
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def your_score
    @score = 0
    @hand.each do |card|
      name = card.split('')
      value = name[0]
      case value
      when 'J'
        @score += 10
      when 'Q'
        @score += 10
      when 'K'
        @score += 10
      when 'A'
        @score += 1 if @score >= 11
        @score += 11 if @score < 11
      else
        @score += value.to_i
      end
    end
    @score
  end

  private

  def validate!
    raise "Name can't be empty" if @player.name.empty? or @player.name == nil
  rescue
    puts 'Введите значение грамотно'
    retry
  end

end


