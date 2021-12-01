class Diller < Player
  def initialize(name = 'Diler', bank = 100)
    super
    @name = name
  end

  #ход диллера
  def action
    if @score <= 17
      give_card
    else
      puts 'Пропускаю ход'
    end
  end
end
