
module Codebreaker

 class Game
  attr_reader :secret, :player, :attempts, :hints
  SECRET_SIZE = 4
  MAX_ATTEMPTS = 4

  def initialize(player)
    @player = player

    @secret = ""

    @attempts = 0

    @hints = 0

    generate_secret
  end

  def generate_secret
    SECRET_SIZE.times do

      @secret << (Random.rand(6)+1).to_s
    end
  end

  def guess(suspect)
     result = ""

     SECRET_SIZE.times do |i|

       if @secret[i] == suspect.value[i]

         result << "+"

       elsif @secret.include? suspect.value[i]

         result << "-"
       else

         result << "X"
       end
     end

     result
  end

  def can_use_hint?

    @hints < 1? true : false
  end

  def take_hint

    if can_use_hint?

      position = rand(3)

      @hints += 1

      "в этом числе присутствует цифра #{uncover(position).chr} "
    end
  end

  def uncover(position)

    secret[position]
  end

  def result(suspect)

    @attempts += 1

    string = guess(suspect)

    if string == "++++"

      p "Поздравляю #{@player.name} Вы угадали число!!!"
      save_game_result("../../tmp/results.txt")
    elsif @attempts < MAX_ATTEMPTS

      p "Вы использовали #{@attempts} из #{MAX_ATTEMPTS} попыток"

    elsif @attempts == MAX_ATTEMPTS

      p "игра закончена загаданое число #{@secret}"
    end
  end

  def save_game_result(file)
    
    File.open(file, 'a') { |f| f.puts("#{@player.name} угадал число.\n за #{@attempts} попытки\n подсказок использованно: #{@hints}\n-------") }
  end

  def answer
     p @secret
   end
 end
end