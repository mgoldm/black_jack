class Diller < Player

  def action(deck)
    if @hand.score < 17
      @hand.add_card(deck)
    end
  end
end
