require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'game'
require_relative 'dealler'
require_relative 'real'

class Interface
  attr_reader :action

  def initialize(player, diller)
    @player = player
    @diller = diller
    @action = ''
  end

  def start_of_game
    puts 'Введите ваше имя'
    @name = gets.chomp
    puts "Приветствую, #{@name}"
  end

  def menu
    list = <<TEXT
    Укажите номер действия:
    - Начать игру 1
    - Посмотреть очки 2
    - Выйти из игры 3
TEXT
    puts list
    @action = gets.chomp
  end

  def menu_2
    list = <<TEXT
    Укажите номер действия:
    - Взять карту 1
    - Пропустить ход 2
    - Вскрыть карты 3
TEXT
    puts list

  end

  def bet
    puts 'Сделана ставка 10 очков'
  end

  def no_option
    puts 'Такого варианта нет'
  end

  def show_player_cards_score
    print "Ваши карты:\n"
    @player.hand.cards.each do |card|
      print card.together
    end
    puts "\n Ваш счет #{@player.hand.score}\n"
  end

  def show_diller_cards_score
    print "Карты диллера:\n"
    @diller.hand.cards.each do |card|
      print card.together
    end
    puts "\n Счет диллера #{@diller.hand.score}\n"
  end

  def winner
    puts 'Поздравляем, вы выйграли, на ваш счет начислены очки'
  end

  def looser
    puts 'К сожалению, вы проиграли, ваши очки будут списаны'
  end
end
