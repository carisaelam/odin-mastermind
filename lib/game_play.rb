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

  def maker_mode
    secret_code = user_generates_code
    guess_count = 1
    correct_numbers = [1, 2, 3, 4, 5, 6]

    computer_first_guess = generate_secret_code
    p "computer's first guess is #{computer_first_guess}"
    compared_array = compare_arrays(computer_first_guess, secret_code)
    guess_count += 1

    puts 'starting the loop'

    loop do
      computer_next_guess = generate_breaker_guesses(compared_array, correct_numbers)
      puts "Computer guesses: #{computer_next_guess}"
      guess_count += 1
      compared_array = compare_arrays(computer_next_guess, secret_code)

      break if computer_next_guess == secret_code || guess_count == 13
    end

    game_over(guess_count, secret_code)
    restart_prompt
  end
end

## Set up initial game flow

new_game = GamePlay.new
new_game.start
