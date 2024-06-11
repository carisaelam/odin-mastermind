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

  def breaker_mode
    secret_code = generate_secret_code
    guess_count = 1

    # game loop
    loop do
      breaker_guess_prompt(guess_count)
      guess = gets.chomp.split('').map(&:to_i)
      guess_count += 1
      compared_array = compare_arrays(guess, secret_code)
      hint = extract_from_array(compared_array)
      display_board(guess, hint)

      break if hint == 'BBBB' || guess_count == 13
    end
    game_over(guess_count, secret_code)
    restart_prompt
  end

  # Codemaker Mode
  # [x] User generates code
  # [ ] Computer generates first guess
  # [ ] Compare to secret code
  # [ ] Loop through until the computer either guesses the code correctly or has hit 12 guesses
  # [ ] Restart game

  def maker_mode
    secret_code = user_generates_code
    p "Your secret code is: #{secret_code}"
  end
end

## Set up initial game flow

new_game = GamePlay.new
new_game.start
