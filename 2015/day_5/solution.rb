require 'byebug'

class File
  attr_accessor :contents

  def initialize file_name
    @contents = File.read file_name
  end

end

class Helper
  attr_accessor :string

  def initialize contents
    @contents = contents
  end

  def calculate_nice_string
    count = 0
    @contents.split.each do |string|
      @string = string
      count += 1 if string_is_nice?
    end
    count
  end

  def is_three_vowels?
    count = 0
    vowels = ['a','e','i','o','u']
    @string.each_char do |char|
      if vowels.include? char
        count += 1
      end
    end
    count > 2 ? true : false
  end

  def has_repeat_letters?
    (0..@string.length - 2).each do |index|
      return true if @string[index] == @string[index + 1]
    end
    false
  end

  def has_repeat_letters_alternatively?
    (0..@string.length - 3).each do |index|
      return true if @string[index] == @string[index + 2]
    end
    false
  end

  def has_illegal_substring?
    illegal_strings = ['ab', 'cd', 'pq', 'xy']
    illegal_strings.each do |illegal_string|
      return true if @string.include? illegal_string
    end
    false
  end

  def has_repeat_two_letters?
    (0..@string.length - 2).each do |index|
      two_letters = @string[index..index+1]
      return true if @string.scan(two_letters).count > 1
    end
    false
  end

  def string_is_nice?
    # is_three_vowels? && has_repeat_letters? && !has_illegal_substring?
    has_repeat_letters_alternatively? && has_repeat_two_letters?
  end
end
