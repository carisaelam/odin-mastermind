require_relative 'Texts'

# Welcome
# Directions
# Select mode => redirect to correct mode

class GamePlay
  include Texts
  def start
    directions_response = welcome
    directions_response == 'Y' ? directions : nil
    choice = choose_mode
    print_mode_choice(choice) == 'B' ? breaker_mode : maker_mode
  end

  def breaker_mode
    puts 'you are in breaker mode'
  end

  def maker_mode
    puts 'you are in maker mode'
  end
end

## Set up initial game flow

new_game = GamePlay.new
new_game.start
