class Controller
  def initialize
    @player = 0
    @diller = 0
    @banks = 0
    @deck = []
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

  def start
    loop do
      menu
      run_1
    end
  end

  def run_1
    puts "Что вы хотите сделать?"
    action = gets.chomp
    case action
    when "1"
      create_gamer
    when "2"
      puts "#{@player.bank}"
    when "4"
      abort "Завершение работы"

    else
      puts 'Такого варианта нет'
    end
  end

  def resume_game
    puts 'Выберете действие'
    menu_2
    run_2
  end

  def run_2
    action = gets.chomp
    case action
    when "1"
      give_one_card
    when "2"
      diller_turn
      show
    when "3"
      show
    else
      puts 'Такого варианта нет'
    end
  end

  def create_gamer
    puts "Введите ваше имя"
    name = gets.chomp
    @player = RealPlayer.new "#{name}"
    validate!
    puts "Приветствую #{@player.name}"
    @deck = Deck.new
    @player.first_cards(@deck)
    print "Ваши карты #{@player.hand}\n", "Ваш счет #{@player.your_score}"
    @diller = Diller.new 'diller'
    @diller.first_cards(@deck)
    puts "\n Карты диллера ***"
    money_in_bank
  end

  def money_in_bank
    @player.bank = @player.bank - 10
    @diller.bank = @diller.bank - 10
    @banks += 20
    resume_game
  end

  def give_one_card
    @player.add_card(@deck)
    diller_turn
    next_step
  end

  def next_step
    puts "Ваши карты #{@player.hand}\n", "Ваши очки #{@player.your_score}\n"
    puts "Карты диллера #{@diller.hand}\n", "Очки диллера #{@diller.your_score}\n"
    if @player.score < @diller.score and @diller.score <= 21
      lose
    elsif @player.score > @diller.score and @player.score <= 21
      win
    elsif @player.score > 21
      lose
    elsif @diller.score > 21
      win
    end
  end

  def diller_turn
    @diller.action(@deck)
  end

  def show
    next_step
  end

  def win
    puts 'Поздравляем, вы выйграли, на ваш счет начислены очки'
    @player.bank += @banks
    @banks = 0
  end

  def lose
    puts 'К сожалению вы проиграли, ваши очки будут списаны'
    @diller.bank += @banks
    @banks = 0
  end

  private

  def validate!
    raise "Name can't be empty" if @player.name.empty? or @player.name == nil
  rescue
    puts 'Введите значение грамотно'
    create_gamer
  end
end

