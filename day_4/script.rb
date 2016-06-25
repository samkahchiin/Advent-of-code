require_relative 'solution'

puts 'Santa Claus, we love you~! Please enter the secret key you would like to mine'
input = gets.chomp
puts 'how many zeroes does the MD5 hash have to be started with?'
num_of_zero = gets.chomp.to_i
password_digestor = PasswordDigestor.new(num_of_zero)
number = password_digestor.digest(input)
puts "The lowest possible number is #{number}"

# Answer should be 117946
