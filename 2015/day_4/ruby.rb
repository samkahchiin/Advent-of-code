require 'digest'

number = 1
puzzle_input = 'ckczppom'

while true do
    input = puzzle_input + number.to_s
    hash = Digest::MD5.hexdigest(input)
    break if hash[0...5] == '00000'
    number += 1
end

puts "Part 1: #{number}" 

while true do
    input = puzzle_input + number.to_s
    hash = Digest::MD5.hexdigest(input)
    break if hash[0...6] == '000000'
    number += 1
end

puts "Part 2: #{number}" 
