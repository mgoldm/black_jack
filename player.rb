class Player

  attr_reader :cards
  attr_accessor :name, :score, :bank
  attr_writer :using_cards
  @@using_cards = []

  def initialize(name, bank = 100)
    @name = name
    @bank = bank
    @cards = []
    @score = 0
    first_cards
    your_score
  end

  #Создание колоды кард
  CARDS_VALUE = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'T']
  CARDS_TYPE = ['♠', '♦', '♥', '♣']
  # Выдача первых двух кард
  def first_cards
    first_card = CARDS_VALUE.sample + CARDS_TYPE.sample
    second_card = CARDS_VALUE.sample + CARDS_TYPE.sample
    if first_card != second_card
      @cards << first_card
      @cards << second_card
      add_to_use_list(first_card)
      add_to_use_list(second_card)
    else
      first_cards
    end
  end

  #проверка, была ли использована карта
  def check(card)
    if @@using_cards.include?(card)
      give_card
    end
  end

  # Выдача дополнительной карты
  def give_card
    new_card = CARDS_VALUE.sample + CARDS_TYPE.sample
    check(new_card)
    @cards << new_card
    your_score
  end

  # Показ карт
  def show_card
    @cards
  end

  # Подсчет очков
  def your_score
    @score = 0
    @cards.each do |value|
      if value[0] == 'J' or value[0] == 'Q' or value[0] == 'K'
        @score += 10
      elsif value[0] == 'T'
        if @score <= 11
          @score += 10
        else
          @score += 1
        end
      else
        integer = value.split(//).map { |x| x[/\d+/] }.compact.join("").to_i
        @score += integer
      end
    end
    @score
  end

  # Проверка
  def valid?
    validate!
    true
  rescue
    false
  end

  private

  # Добавление новой карты в использованные
  def add_to_use_list (card)
    @@using_cards << card
  end

  # Номер не должен быть пустой
  def validate!
    raise "Name can't be empty" if @player.name.empty? or @player.name == nil
  rescue
    puts 'Введите значение грамотно'
    retry
  end

end


