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
    array1.each_with_index do |num, index|
      if array2.include?(num)
        if array2[index] == num
          puts "#{num} is correct and in correct index"
        else
          puts "#{num} exists in both arrays"
        end
      else
        puts "#{num} not found in array2"
      end
    end
  end
end

## TESTING

class Test
  include GameLogic
end

tester = Test.new

# arr1 = [1, 2, 3, 4]
# arr2 = [1, 3, 1, 1]

# tester.compare_arrays(arr1, arr2)
