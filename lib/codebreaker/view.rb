module Codebreaker

 class View
  attr_reader :player
  attr_reader :game

  def initialize
    new_player
    ready_for_play
  end

  def new_player

    p "Представьтесь пожалуйста"

    name = gets.chomp

    if name != ""

     @player = Player.new(name)
    else

     @player = Player.new
    end
  end

  def ready_for_play
    p "#{player.name} Вы готовы начать новую игру? да/нет"

    answer = gets.chomp

    while answer == "да" do

      play
      p "Начать заново? да/нет"

      answer = gets.chomp
    end

    p "Game over"
    exit
  end

  def ask_for_hint

    puts "#{player.name} Хотите использовать подсказку? да/нет"

    answer = gets.chomp

    if answer == "да"

      p @game.take_hint
    end
  end

  def play
    @game = Game.new(@player)

     while @game.attempts < 4

      ask_for_hint  if @game.can_use_hint?

      p "попробуйте угадать число"

      guess

     end
  end

   def guess

     suspect = Guess.new(gets.chomp)

     if suspect.valid?

      guessing = @game.guess(suspect)

      @game.result(suspect)

      p guessing

      if guessing == "++++"

        ready_for_play
      end

     else

       p "Неверный формат нужно угадать 4 числа каждое от 1 до 6"
     end


   end
 end
end
