require_relative 'solution'

puts 'Enter the file name where you want to calculate the nice strings'
input = gets.chomp

file = File.new(input)
helper = Helper.new(file.contents)
num_of_nice_string = helper.calculate_nice_string
puts "You have #{num_of_nice_string} of nice strings in the file"
