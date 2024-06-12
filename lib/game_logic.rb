# frozen_string_literal: true

module GameLogic
  RANGE = [1, 2, 3, 4, 5, 6].freeze

  # Randomly generate 4-digit code between 1–6
  def generate_secret_code
    secret_code = []

    4.times do
      random_number = RANGE.sample
      secret_code << random_number
    end
    secret_code
  end

  # Counts up to a maximum number (e.g. 12)
  def count(max)
    count = 0
    loop do
      count += 1
      puts count
      break if count == max
    end
  end

  # Displays message and collects breaker guess
  def collect_breaker_guess(message)
    puts message
    gets.chomp
  end

  # Compare two arrays for content and index
  def compare_arrays(array1, array2)
    comparison = []
    array1.each_with_index do |num, index|
      if array2.include?(num)
        if array2[index] == num
          comparison.push('B')
        elsif !comparison.include?(num)
          comparison.push('W')
        end
      else
        comparison.push('_')
      end
    end
    comparison.zip(array1)
  end

  # Display a "board" ['1', '2', '3', '4'] + ['B', 'B', '_', '_']
  def display_board(array1, array2)
    puts "Your guess: #{array1.join}"
    puts "Your hint: #{array2.chars.take(4)}"
    puts ''
  end

  # Pulls out [0] index from each array
  def extract_from_array(array)
    extracted = []
    array.each do |arr|
      extracted.push(arr[0])
    end
    puts ' '
    extracted.join
  end

  # Randomly selects between two options
  def computer_choose_options(option1, option2)
    option_array = [option1, option2]
    option_array.sample
  end

  # Generate breaker guesses [Maker Mode]
  def generate_breaker_guesses(zipped_array, correct_numbers)
    new_guess = Array.new(4)
    zipped_array.each_with_index do |(feedback, num), i|
      if feedback == 'B'
        new_guess[i] = num
      elsif feedback == 'W' && !new_guess.include?(num)
        computer_choose_options('new_guess.push(num)', 'new_guess.push(correct_numbers.sample)')
      elsif feedback == '_'
        computer_choose_options('correct_numbers.delete(num)', 'nil')
      end
    end

    new_guess.map! { |num| num.nil? ? correct_numbers.sample : num }
    new_guess.take(4)
  end

  # Collects four digits between 1–6 from user
  def user_generates_code
    puts 'Select the code.'
    puts 'Enter four digits from 1–6.'
    code = gets.chomp.chars.map(&:to_i)
    puts ' '
    until code.size == 4 && code.all? { |num| (1..6).cover?(num) }
      puts 'Code must be four digits between 1–6'
      code = user_generates_code
    end
    code
  end
end

## TESTING

class Test
  include GameLogic
end

tester = Test.new
p tester.generate_secret_code

# arr1 = [1, 2, 3, 4]
# arr2 = [1, 6, 3, 9]
# # zipped_array = [['B', 1], ['_', 2], ['B', 3], ['_', 4]]

# tester.compare_arrays(arr1, arr2)
