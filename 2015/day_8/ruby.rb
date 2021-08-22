# Part 1
data = File.read('test.txt').split("\n")

char_length = data.map(&:length).sum
memory_length = data.map { |line| eval(line).length }.sum

# puts char_length - memory_length

escaped_chars_count = data.map { |line| eval(line).scan(/[^0-9a-zA-Z]/).count * 2 + 4 }
puts escaped_chars_count
