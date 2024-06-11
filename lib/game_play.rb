require_relative 'texts'
require_relative 'game_logic'

class GamePlay
  include Texts
  include GameLogic

  def start
    directions_response = welcome
    directions_response == 'Y' ? directions : nil
    choice = choose_mode
    print_mode_choice(choice) == 'B' ? breaker_mode : maker_mode
  end

  # Codebreaker Mode
  # [x] Generate and store secret code
  # [x] User guesses four numbers
  # [ ] Compare to secret code
  # [ ] Loop through until the user either guesses the code correctly or has hit 12 guesses
  # [ ] Restart game?

  def breaker_mode
    puts 'you are in breaker mode'
    secret_code = generate_secret_code
    guess_count = 0

    # game loop
    loop do
      breaker_guess_prompt
      guess = gets.chomp.split('').map(&:to_i)
      guess_count += 1
      p "you guessed #{guess.join}"
      p "secret_code is #{secret_code}"
      p "Turn #{guess_count}"
      p "comparing #{guess} to #{secret_code}"
      compare_arrays(guess, secret_code)

      break if guess_count == 12
    end
  end

  def maker_mode
    puts 'you are in maker mode'
  end
end

## Set up initial game flow

new_game = GamePlay.new
new_game.start
