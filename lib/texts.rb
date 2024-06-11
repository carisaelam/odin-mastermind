module Texts
  def welcome
    puts 'Welcome to Mastermind'
    puts 'Would you like to read the directions? (Y/N)'
    choice = gets.chomp.upcase
  end

  def directions
    puts ''
    puts 'GAME DIRECTIONS'
    puts ''
    puts '1. Codemaker will create a four digit code between 1–6. Repeats are allowed.'
    puts '2. Codebreaker guesses four digits.'
    puts '3. Codemaker provides hints. Black means correct number and position. White means correct number, wrong position.'
    puts '4. Repeat up to 12 times until Codebreaker guesses the correct code.'
    puts ''
    puts 'Codebreaker wins by guessing the code. Codemaker wins if Codebreaker fails.'
    puts ''
  end

  def choose_mode
    puts ''
    puts 'Choose your mode: '
    puts "Select 'B' to BREAK the code"
    puts "Select 'M' to MAKE the code"
    puts ''
    choice = gets.chomp.upcase
    puts ''
    choice
  end

  def print_mode_choice(choice)
    puts choice == 'B' ? 'You are the Codebreaker' : 'You are the Codemaker'
    puts ''
    choice
  end

  ## Breaker Mode Prompts
  def breaker_guess_prompt(turn_number)
    puts "Turn #{turn_number} of 12"
    puts 'Guess the code!'
    puts 'Type four numbers 1–6: '
  end

  def game_over(count, code)
    p count == 13 ? "Game Over. You did not guess it in time. The code was #{code}" : "You broke the code! It was #{code.join}"
    puts ' '
  end
end

class Game
  include Texts
end

# TESTING

# tester = Game.new

# puts tester.welcome
