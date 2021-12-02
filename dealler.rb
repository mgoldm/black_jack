class Diller < Player

  def action(deck)
    if @hand.score < 17
      add_card(deck)
    else
      puts 'Пропускаю ход'
    end
  end
end
