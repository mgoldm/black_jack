class Game
  def initialize
    @player = RealPlayer.new
    @diller = Diller.new
    @interf = Interface.new @player, @diller
    @banks = 0
  end

  def start
    @interf.start_of_game
    run_1
  end

  private

  def run_1
    @interf.menu
    action = @interf.action
    case action
    when "1"
      create_cards
      money_in_bank
      @interf.bet
      run_2
    when "2"
      puts "#{@player.bank}"
    when "3"
      abort "Завершение работы"
    else
      @interf.no_option
      run_1
    end
  end

  def run_2
    @interf.menu_2
    action = @interf.action
    case action
    when "1"
      give_one_card
    when "2"
      diller_turn
      show
    when "3"
      show
    else
      @interf.no_option
      run_2
    end
  end

  def create_cards
    @deck = Deck.new
    2.times { @player.add_card(@deck) }
    2.times { @diller.add_card(@deck) }
    @interf.show_player_cards_score
    money_in_bank
  end

  def give_one_card
    @player.add_card(@deck)
    diller_turn
    next_step
  end

  def show
    next_step
  end

  def money_in_bank
    @player.bank = @player.bank - 10
    @diller.bank = @diller.bank - 10
    @banks += 20
  end

  def next_step
    @interf.show_player_cards_score
    @interf.show_diller_cards_score
    if @player.hand.score < @diller.hand.score and @diller.hand.score <= 21
      lose
    elsif @player.hand.score > @diller.hand.score and @player.hand.score <= 21
      win
    elsif @player.hand.score > 21
      lose
    elsif @diller.hand.score > 21
      win
    end
  end

  def diller_turn
    @diller.action(@deck)
  end

  def win
    @interf.winer
    @player.bank += @banks
    @banks = 0
  end

  def lose
    @interf.looser
    @diller.bank += @banks
    @banks = 0
  end
end
