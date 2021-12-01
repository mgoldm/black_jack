require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'game'
require_relative 'dealler'
require_relative 'real'

class Interface

  def initialize(player, diller)
    @player = player
    @diller = diller
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
    puts 'Сделана ставка 30 очков'
  end

  def no_option
    puts 'Такого варианта нет'
  end

  def show_player_cards_score
    print "Ваши карты #{@player.current_cards.cards}\n", "Ваш счет #{@player.current_cards.score}\n"
  end

  def show_diller_cards_score
    puts "Карты диллера #{@diller.current_cards.cards}\n", "Очки диллера #{@diller.current_cards.score}\n"
  end

  def winner
    puts 'Поздравляем, вы выйграли, на ваш счет начислены очки'
  end
  def looser
    puts 'К сожалению, вы проиграли, ваши очки будут списаны'
  end
end
