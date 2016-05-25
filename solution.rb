# Part 1
instructions = File.read('input.txt')
floor = 0
instructions.split("").each_with_index do |instruction, index|
  case instruction
  when '('
    floor += 1
  when ')'
    floor -= 1
  end
end
puts "Part 1: the instructions take Santa to #{floor} floor"

floor = 0
position = 0
instructions.split("").each_with_index do |instruction, index|
  case instruction
  when '('
    floor += 1
  when ')'
    floor -= 1
  end
  if floor == -1
    position = index + 1
    break
  end
end
puts "Part 2: The position of the character that causes Santa to first enter the basement is #{position}"
