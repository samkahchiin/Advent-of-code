class SantaTracker
  def initialize file
    @instructions = File.read file
  end

  def track
    floor = 0
    position = 0
    count = 0
    @instructions.split("").each_with_index do |instruction, index|
      case instruction
      when '('
        floor += 1
      when ')'
        floor -= 1
      end
      if floor == -1 && count == 0
        position = index + 1
        count += 1
      end
    end
    puts "Part 1: the instructions take Santa to #{floor} floor"
    puts "Part 2: The position of the character that causes Santa to first enter the basement is #{position}"
  end
end

santa_tracker = SantaTracker.new 'input.txt'
santa_tracker.track
