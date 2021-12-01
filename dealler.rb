class Diller < Player

  def action(deck)
    if @current_cards.score < 17
      add_card(deck)
    else
      puts 'Пропускаю ход'
    end
  end
end
