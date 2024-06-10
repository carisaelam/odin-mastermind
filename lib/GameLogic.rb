module GameLogic
  RANGE = [1, 2, 3, 4, 5, 6]

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
        else
          comparison.push('W')
        end
      else
        comparison.push('_')
      end
    end
    p comparison.zip(array1)
  end

  # Display a "board" ['1', '2', '3', '4'] + ['B', 'B', '_', '_']
  def display_board(array1, array2)
    puts array1.join('-')
    puts array2.join('-')
  end

  # Generate breaker guesses [Maker Mode]
  def generate_breaker_guesses(zipped_array)
    # take in zipped array with previous guesses and hints
    new_guess = []
    correct_numbers = []
    # if number is B or W, push to correct_numbers and ensure it is in the next guess somewhere
    zipped_array.each do |array|
      if array[0] == 'B' || array[0] == 'W'
        new_guess.push(array[1])
        correct_numbers.push(array[1])
      else
        new_guess.push(RANGE.sample)
      end
    end
    # shuffle array that contains all correct_numbers and random other guesses 
    p new_guess.shuffle
  end
  
end

## TESTING

class Test
  include GameLogic
end

tester = Test.new

arr1 = [1, 2, 3, 4]
arr2 = [1, 6, 3, 9]
zipped_array = [['B', 1], ['_', 2], ['B', 3], ['_', 4]]

# tester.compare_arrays(arr1, arr2)
tester.generate_breaker_guesses(zipped_array)
